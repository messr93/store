<?php

namespace App\Http\Controllers;

use App\Cart;
use App\Category;
use App\Coupon;
use App\Product;
use Illuminate\Http\Request;

class CartController extends Controller
{

    public function __construct(){
        $this->middleware('auth');
    }

    public function index()
    {

        $items = auth()->user()->cartItems;      // all items in cart for this user
        $subTotal = $this->subTotal($items);
        $minus = Coupon::calculateMinus($subTotal);
        $total = $subTotal - $minus;
        return view('frontend.pages.cart', ['items'=> $items, 'subTotal'=> $subTotal, 'total' => $total, 'minus' => $minus]);
    }

    public function create()
    {
        //
    }

    public function store(Request $request)
    {
        if ($request->has('product_id')){
            $product = Product::find($request->input('product_id'));        // if product not found
            if(empty($product))
                abort(404);
            if(Cart::where('product_id', $request->input('product_id'))->where('user_id', $request->user()->id)->first() !== null )      // if this item already in cart
                abort(400);

            Cart::create([
                'product_id' => $request->input('product_id'),
                'user_id' => $request->user()->id,
                'qty' => $request->input('qty'),
                'price' => $product->finalPrice(),              // after discount
                // save space for attributes []
            ]);

            return redirect()->route('cart.index');
        }
    }

    public function show(Cart $cart)
    {
        //
    }

    public function edit(Cart $cart)
    {
        //
    }

    public function update(Request $request, Cart $cart)
    {
        $cart->qty = $request->qty;
        $cart->save();

        $subTotal = $request->user()->cartSubTotal();                       // TODO Coupon have no effext yet
        return response()->json(['cart' => $cart, 'subTotal' => $subTotal]);
    }

    public function destroy(Cart $cart)
    {
        $cart->delete();
        return redirect()->route('cart.index');
    }


    ###########################################################################################################
    public function checkout(){     /// go to checkout page ///

        $items = auth()->user()->cartItems;      // all items in cart for this user
        $subTotal = $this->subTotal($items);
        $minus = Coupon::calculateMinus($subTotal);
        $total = $subTotal - $minus;
        return view('frontend.pages.checkout', ['items'=> $items, 'subTotal'=> $subTotal, 'total' => $total, 'minus' => $minus]);
    }


    public function subTotal($items){      // get total price of items collection //
        $total = 0;
        foreach ($items as $item)                           //get total price
            $total += $item->qty * $item->product->finalPrice();
        return $total;
    }


}
