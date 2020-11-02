<?php

namespace App\Http\Controllers;

use App\Category;
use App\Product;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Schema;

class SearchController extends Controller
{

    public function searchProducts(){
        $foreignColumns = ['user_id'];
        $products = new Product();
        foreach(request()->all() as $key=>$value){
            if(request($key) == "_token" || request($key) == "user_id" || !Schema::hasColumn('products', $key))       // if request key not column in product table OR = it's token then continue
                continue;
            if(in_array($key, $foreignColumns)){        // if key is foreign column
                $assignValue = !empty(request($key))? request($key) : '%';
            }else{
                $assignValue = !empty(request($key))? '%'.request($key).'%' : '%';
            }
            if(in_array($key, $foreignColumns) && $assignValue != '%') {        // if key is foreign column and specified not '%'
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
