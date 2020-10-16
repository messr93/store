<?php

namespace App\Http\Controllers;

use App\Category;
use App\Product;
use App\Shop;
use Illuminate\Http\Request;

class ShopController extends Controller
{

    public function index()
    {
        $Products = Product::paginate(12);
        $count = Product::count();
        $categories = Category::topCategories();     /// most 11 categories having products
        return view('frontend.pages.shop', ['categories' => $categories, 'products' => $Products, 'count' => $count]);
    }


    public function create()
    {
        //
    }

    public function store(Request $request)
    {
        //
    }



    public function show(Shop $shop)
    {

        //
    }

    public function edit(Shop $shop)
    {
        //
    }


    public function update(Request $request, Shop $shop)
    {
        //
    }


    public function destroy(Shop $shop)
    {
        //
    }
}




/*///// if coming from detected category /////
if(request()->has('category')){
    $Products = Product::whereHas('category', function($q){$q->where('slug', request('category'));})->paginate(12);
    $count = Product::whereHas('category', function($q){$q->where('slug', request('category'));})->count();
}else{ //// from shop without category detected ////*/
