<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    protected $table = 'products';
    protected $fillable = ['user_id', 'category', 'name', 'slug', 'photo', 'details', 'price', 'discount', 'rating', 'description', 'created_at', 'updated_at'];
    public $timestamps = true;



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
    public function orders(){
        return $this->belongsToMany(Order::class, 'order_products', 'product_id', 'order_id');
    }
    public function relatedPhotos(){
        return $this->hasMany(ProductPhoto::class);
    }


    ############################################### Other functions  ###############################################
    public function getRouteKeyName(){
        return 'slug';
    }

    public function finalPrice(){
        return ($this->price - (($this->price*$this->discount)/100));   // final price after discount
    }

}
