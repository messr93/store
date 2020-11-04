<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    protected $table = 'orders';
    protected $fillable = [
      'order_number', 'user_id', 'status', 'total', 'coupon_applied', 'total', 'item_count', 'paid', 'payment_method', 'shipping_full_name', 'city', 'region', 'address',
        'zip_code', 'phone', 'email', 'notes'
    ];

    ############################################### Relations  ###############################################

    public function products(){
        return $this->belongsToMany(Product::class, 'order_products', 'order_id', 'product_id')->withPivot('qty');
    }
}
