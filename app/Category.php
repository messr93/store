<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
    //


    public function getRouteKeyName(){
        return 'slug';
    }

    ############################################### Relations  ###############################################
    public function products(){
        return $this->hasMany(Product::class, 'category', 'slug');
    }

    ############################################### other functions  ###############################################
    public function scopeTopCategories($q){
        return $q->get()->sortByDesc(function($q){return $q->products()->count();})->take(11);
    }
}
