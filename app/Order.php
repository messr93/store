<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    protected $table = 'orders';
    protected $fillable = [
      'order_number', 'user_id', 'status', 'total', 'total', 'item_count', 'paid', 'payment_method', 'shipping_full_name', 'city', 'region', 'address',
        'zip_code', 'phone', 'email', 'notes'
    ];
}
