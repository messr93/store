<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Category extends Model
{

    protected $table = 'categories';
    protected $fillable = ['name', 'slug', 'description', 'status', 'photo', 'parent'];

    public $timestamps = true;


    public function getRouteKeyName(){
        return 'slug';
    }

    ############################################### Relations  ###############################################
    public function products(){
        return $this->hasMany(Product::class, 'category', 'slug');
    }

    public function subCategories(){
        return $this->hasMany(Category::class, 'parent', 'id');
    }

    public function mainCategory(){
        return $this->belongsTo(Category::class, 'parent', 'id');
    }

    ############################################### other functions  ###############################################
    public function scopeTopCategories($q){
        return $q->get()->sortByDesc(function($q){return $q->products()->count();})->take(11);
    }
}
