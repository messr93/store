<?php

namespace App\Http\Controllers;

use App\Category;
use App\Product;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Schema;

class SearchController extends Controller
{

    public function searchProducts($category = null){
        $ignoreColumns = ['user_id', 'min_price', 'max_price'];
        $strictColumns = [];                // search for exact value
        $products = new Product();
        if(!is_null(request('category_selected')))         // search coming from selected category
            $products = $products->where('category', request('category_selected'));
        if(!is_null(request('min_price')))
            $products = $products->where('price', '>', request('min_price')*100);       // price stored*100  integer form
        if(!is_null(request('max_price')))
            $products = $products->where('price', '<', request('max_price')*100);       // price stored*100  integer form

        foreach(request()->all() as $key=>$value){
            if(request($key) == "_token" || in_array($key, $ignoreColumns) || !Schema::hasColumn('products', $key))       // if request key not column in product table OR = it's token then continue
                continue;
            if(in_array($key, $strictColumns)) {        // if key is foreign column
                $assignValue = !empty(request($key)) ? request($key) : '%';
            }else{
                $assignValue = !empty(request($key))? '%'.request($key).'%' : '%';
            }
            if(in_array($key, $strictColumns) && $assignValue != '%') {        // if key is strict column and specified not '%'switch($key)
                $products = $products->where($key, $assignValue);
            }else{
                $products = $products->where($key, 'like', $assignValue);
            }
        }

        $count = $products->count();
        $products = $products->paginate(12);
        $categories = Category::get()->sortBy(function($q){return $q->products()->count();})->take(11);
        return view('frontend.pages.shop', ['categories' => $categories, 'products' => $products, 'count' => $count]);
    }

}
