<?php

namespace App\Http\Controllers;

use App\Cart;
use App\Category;
use App\Coupon;
use App\Notifications\ItemBuyed;
use App\Order;
use App\OrderProduct;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Notification;
use Illuminate\Support\Facades\Validator;

class OrderController extends Controller
{

    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index()
    {

        $orders = auth()->user()->orders;
        if($orders->count() < 1)
            return response()->json(['message' => 'You have no orders yet'], 404);
        return response()->json(['orders' => $orders], 200);
    }


    public function create()
    {
        //
    }


    public function store(Request $request)
    {

        $request->validate($this->getValidateRules());      // validation

        $data = $request->except(['_token']);
        $user = $request->user();
        $cartItems = Cart::where('user_id', $user->id)->get();          //getting data

        if($cartItems->count() < 1)
            abort(404);

        $total = $user->cartSubTotal();
        $total = $total-Coupon::calculateMinus($total);
        if(session()->has('coupon')){                   // if any coupon in session apply it, then remove
            $data['coupon_applied'] = 1;
            session()->forget('coupon');        // delete the coupon
        }

        $data['order_number'] = uniqid('Order_'.$total);        //initialize order
        $data['user_id'] = $user->id;
        $data['total'] = $total;
        $data['item_count'] = $cartItems->count();

        $order = Order::create($data);          // create the order record
        foreach($cartItems as $item){         // create OrderProducts records
            OrderProduct::create([
                'order_id' => $order->id,
                'product_id' => $item->product_id,
                'qty' => $item->qty,
                'price' => $item->price,
            ]);
            Notification::send($item->product->user, new ItemBuyed($item->product, $user->id));    // send notification to vendor that some user wanna buy his item.
            $item->delete();                // remove items from cart
        }

        if($data['payment_method'] == 'cash_on_delivery'){    /// cash on delivery, go monitor your order DONE

            return redirect()->route('profile.myOrders')->with('success', 'Your order recorded');
        }else{
            session()->put('unpaid_order_id', $order->id);
            $checkoutId = "";
            $checkoutId =  $this->getCheckoutId($total);          // id form payment gateway, going to js

            if(!$checkoutId)
                return redirect()->route('profile.myOrders')->with('error', 'Something wrong with payment, pls try here again');    // in case, payment gateway never return token
            return view('frontend.pages.payment', ['checkoutId' => $checkoutId]);    // go next page prove payment
        }
    }


    ################################################ in case of payment VISA/MASTERCARD ########

    public function finishOrder(){          // receive payment status here

        $status = $this->getPaymentStatus(request('id'));
        if(isset($status['id'])){

            if(session('unpaid_order_id')){
                Order::where('id', session()->pull('unpaid_order_id'))->update(['paid' => 1, 'payment_id' => $status['id'], 'status' => 'processing']);
            }
            return redirect()->route('profile.myOrders')->with('success', 'Your order recorded');      //order done go monitor it
        }else{
            return redirect()->route('profile.myOrders')->with('error', 'Something wrong with payment, pls try here again');    // in case, payment gateway never return token
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Order  $order
     * @return \Illuminate\Http\Response
     */
    public function show(Order $order)
    {
        return $order;
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Order  $order
     * @return \Illuminate\Http\Response
     */
    public function edit(Order $order)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Order  $order
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Order $order)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Order  $order
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request, Order $order)
    {
        $user = $request->user();
        if (($user->id !== $order->user_id )|| !($user->hasRole('admin')))
            abort(401);

        if($order->status == "pending"){
            $order->delete();
            return response()->json(['order' => $order], 200);
        }else{
            //  TODO notify admin that user want delete( soft delete) && change status code
        }

    }





    ################################################## payment related methods ##################################################
    public function getCheckoutId($total){

        $url = "https://test.oppwa.com/v1/checkouts";
        $data = "entityId=8a8294174b7ecb28014b9699220015ca" .
            "&amount=$total" .
            "&currency=EUR" .
            "&paymentType=DB";
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_HTTPHEADER, array(
            'Authorization:Bearer OGE4Mjk0MTc0YjdlY2IyODAxNGI5Njk5MjIwMDE1Y2N8c3k2S0pzVDg='));
        curl_setopt($ch, CURLOPT_POST, 1);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);// this should be set to true in production
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        $responseData = curl_exec($ch);
        if(curl_errno($ch)) {
            return curl_error($ch);
        }
        curl_close($ch);
        return json_decode($responseData, true)['id'];
    }

    public function getPaymentStatus($id){
        $url = "https://test.oppwa.com/v1/checkouts/".$id."/payment";
        $url .= "?entityId=8a8294174b7ecb28014b9699220015ca";

        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_HTTPHEADER, array(
            'Authorization:Bearer OGE4Mjk0MTc0YjdlY2IyODAxNGI5Njk5MjIwMDE1Y2N8c3k2S0pzVDg='));
        curl_setopt($ch, CURLOPT_CUSTOMREQUEST, 'GET');
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);// this should be set to true in production
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        $responseData = curl_exec($ch);
        if(curl_errno($ch)) {
            return curl_error($ch);
        }
        curl_close($ch);

        return json_decode($responseData, true);
    }

    ################################################## Validation methods ##################################################
    public function getValidateRules(){
        return [
            'shipping_full_name' => 'required|string',
            'city' => 'required|string',
            'region' => 'required|string',
            'address' => 'required|string',
            'zip_code' => 'required|integer',
            'phone' => 'required',
            'email' => 'required|email',
            'payment_method' => 'required',
        ];
    }

}
