<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::get('bookables', 'Api\BookableController@index');
Route::get('bookables/{bookable}', 'Api\BookableController@show');
Route::post('bookables', 'Api\BookableController@store');

Route::get('/bookables/{bookable}/availability', 'Api\BookingAvailabilityController')->name('bookables.availability');

Route::get('/bookables/{bookable}/reviews', 'Api\BookableReviewController')->name('bookables.reviews');

Route::get('/bookables/{bookable}/price', 'Api\BookablePriceController');

Route::get('reviews/{review}','Api\ReviewController@show');
Route::post('reviews','Api\ReviewController@store');
Route::get('/booking-by-review/{review_key}','Api\BookingByReviewController');
Route::get('/booking-experience/{id}','Api\BookingExperienceController');

Route::post('checkout','Api\CheckoutController');
Route::post('profile','Api\ProfileController@saveProfile');
Route::get('profile/{id}','Api\ProfileController@getProfile');

Route::post('register','Api\HostController@register');
Route::post('login','Api\HostController@login');