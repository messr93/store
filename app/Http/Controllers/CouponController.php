<?php

namespace App\Http\Controllers;

use App\Coupon;
use Illuminate\Http\Request;

class CouponController extends Controller
{

    public function __construct()
    {
        $this->middleware('auth');
    }

    public function applyCoupon(Request $request){
        $coupon = Coupon::where('code', $request->input('code'))->where('consumed', 0)->first();
        if(is_null($coupon))        // coupon not here or consumed
            return response()->json(['message' => 'Sry This coupon not valid'], 404);

        session()->put('coupon', ['user_id' => $request->user()->id, 'coupon_id' => $coupon->id, 'type' => $coupon->type, 'value' => $coupon->value]);
        $coupon->consumed = 1;
        $coupon->save();
        return response()->json(['message' => 'Coupon applied successfully, use it in thi session :)', 'coupon' => session('coupon')], 200);
    }
}
