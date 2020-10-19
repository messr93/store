<?php

namespace App;

use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Spatie\Permission\Traits\HasRoles;

class User extends Authenticatable
{
    use Notifiable, HasRoles;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'email', 'password',
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    ############################################### Relations  ###############################################
    public function products(){
        return $this->hasMany(Product::class);
    }

    public function cartItems(){
        return $this->hasMany(Cart::class);
    }

    public function cartProducts(){
        return $this->belongsToMany(Product::class, 'carts', 'user_id', 'product_id');
    }

    public function orders(){
        return $this->hasMany(Order::class);
    }


    ############################################### Other functions  ###############################################
    public function cartSubTotal(){
        return $this->cartItems->transform(function($item){return $item->price*$item->qty; })->sum();
    }
}
