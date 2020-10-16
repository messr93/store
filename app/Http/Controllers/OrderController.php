<?php

namespace App\Http\Controllers;

use App\Cart;
use App\Category;
use App\Order;
use App\OrderProduct;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class OrderController extends Controller
{

    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index()
    {

        return view('frontend.pages.orders');
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {

        $request->validate($this->getValidateRules());      // validation

        $user = $request->user();
        $total = $user->cartSubTotal();
        $cartItems = Cart::where('user_id', $user->id)->get();          //getting data

        $data = $request->except(['_token']);
        $data['order_number'] = uniqid('Order_'.$total);        //initialize order
        $data['user_id'] = $user->id;
        $data['total'] = $total;                                        // TODO apply coupon here
        $data['item_count'] = $cartItems->count();

        $order = Order::create($data);          // create the order record
        foreach($cartItems as $item){         // create OrderProducts records
            OrderProduct::create([
                'order_id' => $order->id,
                'product_id' => $item->product_id,
                'qty' => $item->qty,
                'price' => $item->price,
            ]);
            $item->delete();                // remove items from cart
        }

        if($data['payment_method'] == 'cash_on_delivery'){    /// cash on delivery, go monitor your order
            return view('frontend.pages.orders')->with('success', 'Your order recorded');
        }else{
            $checkoutId =  $this->getCheckoutId($total);          // id form payment gateway, going to js
            session()->put('unpaid_order_id', $order->id);
            return view('frontend.pages.payment', ['checkoutId' => $checkoutId]);       // go next page prove payment
        }

    }

    ###### in case of payment VISA/MASTERCARD ########
    public function finishOrder(){          // receive payment status here

        $status = $this->getPaymentStatus(request('id'));
        if(isset($status['id'])){        //
            if(session('unpaid_order_id')){
                Order::where('id', session()->pull('unpaid_order_id'))->update(['paid' => 1, 'payment_id' => $status['id']]);
            }

            return view('frontend.pages.orders')->with('success', 'Your order recorded');      //order done go monitor it

        }else{
            return 'nope';
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
        //
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
    public function destroy(Order $order)
    {
        //
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
