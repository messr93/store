<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', 'LandingPageController@index');

Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');
###

Route::resource('category', 'CategoryController');
Route::resource('product', 'ProductController');
##

Route::resource('shop', 'ShopController');
###

Route::resource('cart', 'CartController');
Route::get('cart-total', 'CartController@getTotal')->name('cart.total');
Route::get('checkout', 'CartController@checkout')->name('cart.checkout');
###

Route::post('apply-coupon', 'CouponController@applyCoupon')->name('coupon.apply');
###

Route::resource('order', 'OrderController');
Route::get('my-orders', 'OrderController@allData')->name('order.allData');
Route::get('finish-order', 'OrderController@finishOrder')->name('order.finishOrder');
###
Route::get('search/products', 'SearchController@searchProducts')->name('search.products');

