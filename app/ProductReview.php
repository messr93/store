<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ProductReview extends Model
{
    //

    ############################################### Relations  ###############################################
    public function product(){
        return $this->belongsTo(Product::class);
    }

    ############################################### Other functions  ###############################################
    public function owner(){
        return User::find($this->user_id)->name;
    }
}
