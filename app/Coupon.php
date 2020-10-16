<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Coupon extends Model
{
    //





    ######################################## Other functions #####################################

    public static function calculateMinus($subTotal){
        $minus = 0;
        if(session('coupon')){
            if(session('coupon.type') == "fixed_value"){
                $minus = session('coupon.value');
            }else if(session('coupon.type') == "percent"){
                $minus = (session('coupon.value')*$subTotal)/100;
            }
        }
        return ($minus <= $subTotal)? $minus: $subTotal;           // if minus Greater than total, then return total (no negative here)
    }
}
