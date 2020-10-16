<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    //protected $table = 'products';
    //protected $fillable = ['user_id', 'category_slug', 'name', 'slug', 'photo', 'details', 'price', 'discount', 'rating', 'description'];





    ############################################### Relations  ###############################################
    public function user(){
        return $this->belongsto(User::class);
    }
    public function categ(){
        return $this->belongsTo(Category::class, 'category', 'slug');
    }
    public function reviews(){
        return $this->hasMany(ProductReview::class);
    }

    ############################################### Other functions  ###############################################
    public function getRouteKeyName(){
        return 'slug';
    }

    public function finalPrice(){
        return ($this->price - (($this->price*$this->discount)/100));   // final price after discount
    }

}
