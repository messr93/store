<?php

use Illuminate\Support\Facades\Route;
/*
|--------------------------------------------------------------------------
| Admin Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::redirect('/', 'admin/dashboard');

Route::get('dashboard', 'DashboardController@index')->name('dashboard');

Route::resource('user', 'UserController');
Route::get('all-data-user', 'UserController@allData')->name('user.allData');
Route::post('change-status-user', 'UserController@changeStatus')->name('user.changeStatus');
Route::post('delete-user', 'UserController@delete')->name('user.delete');

Route::resource('category', 'CategoryController');
Route::get('all-data-category', 'CategoryController@allData')->name('category.allData');
Route::post('change-status-category', 'CategoryController@changeStatus')->name('category.changeStatus');
Route::post('delete-category', 'CategoryController@delete')->name('category.delete');

Route::resource('product', 'ProductController');
Route::get('all-data-product', 'ProductController@allData')->name('product.allData');
Route::post('change-status-product', 'ProductController@changeStatus')->name('product.changeStatus');
Route::post('delete-product', 'ProductController@delete')->name('product.delete');

Route::resource('slider', 'SliderController');
Route::get('all-data-slider', 'SliderController@allData')->name('slider.allData');
Route::post('change-status-slider', 'SliderController@changeStatus')->name('slider.changeStatus');
Route::post('delete-slider', 'SliderController@delete')->name('slider.delete');

Route::resource('lang', 'LangController');
Route::get('all-data-lang', 'LangController@allData')->name('lang.allData');
Route::post('change-status-lang', 'LangController@changeStatus')->name('lang.changeStatus');
Route::post('delete-lang', 'LangController@delete')->name('lang.delete');

Route::resource('appointment', 'AppointmentController');
Route::get('all-data-appointment', 'AppointmentController@allData')->name('appointment.allData');
Route::post('change-status-appointment', 'AppointmentController@changeStatus')->name('appointment.changeStatus');
Route::post('delete-appointment', 'AppointmentController@delete')->name('appointment.delete');

Route::get('testo', function(){

    return session()->all();
});
