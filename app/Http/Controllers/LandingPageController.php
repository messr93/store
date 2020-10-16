<?php

namespace App\Http\Controllers;

use App\Category;
use App\Product;
use Illuminate\Http\Request;
use stdClass;

class LandingPageController extends Controller
{

    public function index()
    {


        $saleProducts = Product::orderBy('discount', 'desc')->limit(10)->get();                                 // 10 products ordered by sale %
        $categories = Category::topCategories();     // 11 categories sort by products count
        $featuredProducts = Product::with(['categ' => function($q){ $q->select('slug', 'id');}])        // random 8 products, belongs to $categories(whereHas)
            ->whereHas('categ', function($q)use($categories){ return $q->whereIn('id', $categories->pluck('id')->toArray());})
            ->inRandomOrder()->limit(8)->get();     // 8 random
        $latestProducts = Product::orderBy('created_at', 'desc')->limit(12)->get()->chunk(3);
        $topRatedProducts = Product::orderBy('rating', 'desc')->limit(12)->get()->chunk(3);
        return view('landing-page', ['featuredProducts' => $featuredProducts, 'topRatedProducts' => $topRatedProducts,
            'saleProducts' => $saleProducts, 'latestProducts' => $latestProducts, 'categories' => $categories]);
    }

}





/*$products = Product::all();
foreach($products as $product){
    $product->slug = str_replace(' ', '-', $product->name);
    $product->save();
}

$products = Product::all();
foreach($products as $product){
    $product->name = substr($product->name, 0, -1);
    $product->slug = substr($product->slug, 0, -1);
    $product->save();
}

return 'done';*/



