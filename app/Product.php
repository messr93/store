<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    protected $table = 'products';
    protected $fillable = ['user_id', 'category', 'name', 'slug', 'status', 'photo', 'details', 'price', 'discount', 'rating', 'description', 'created_at', 'updated_at'];
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
    public function relatedPhotos(){
        return $this->hasMany(ProductPhoto::class);
    }
    public function orders(){
        return $this->belongsToMany(Order::class, 'order_products', 'product_id', 'order_id');
    }

    ############################################### Accessors & Mutators  ###############################################

    //

    ############################################### Other functions  ###############################################
    public function getRouteKeyName(){
        return 'slug';
    }

    public function finalPrice(){
        return round(($this->price - (($this->price*$this->discount)/100)), 2);   // final price after discount
    }



}
