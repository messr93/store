<?php

use App\Product;
use App\User;
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
////////////

Route::group(['middleware' => ['role:customer']], function(){

    Route::resource('order', 'OrderController');
    Route::get('my-orders', 'ProfileController@myOrders')->name('profile.myOrders');
    Route::get('finish-order', 'OrderController@finishOrder')->name('order.finishOrder');

    Route::resource('cart', 'CartController');
    Route::get('checkout', 'CartController@checkout')->name('cart.checkout');

    Route::post('apply-coupon', 'CouponController@applyCoupon')->name('coupon.apply');

    Route::get('shipping-details', 'ProfileController@shippingDetailsView')->name('profile.shippingDetailsView');

});

Route::group(['middleware' => ['role:vendor']], function(){

    Route::get('my-products', 'ProfileController@myProducts')->name('profile.myProducts');
    Route::delete('delete-product-for-vendor', 'ProductController@deleteForVendor')->name('product.deleteForVendor');
});
///////////

Route::post('search/products', 'SearchController@searchProducts')->name('search.products');
#####

Route::get('profile', 'ProfileController@index')->name('profile.index');
Route::post('update-profile-info', 'ProfileController@updateInfo')->name('profile.updateInfo');
Route::get('change-password', 'ProfileController@changePasswordView')->name('profile.changePasswordView');
Route::post('change-password', 'ProfileController@changePassword')->name('profile.changePassword');

Route::post('notification/mark-as-read', 'NotificationController@markAsRead')->name('notification.markAsRead');

Route::get('changeLocale/{lang}', 'BackendControllers\LangController@changeLocale')->name('lang.changeLocale');

