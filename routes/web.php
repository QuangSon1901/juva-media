<?php

use App\Http\Controllers\Auth\AuthController;
use App\Http\Controllers\Cart\CartController;
use App\Http\Controllers\Category\CategoryController;
use App\Http\Controllers\Home\IndexController;
use App\Http\Controllers\Product\ProductController;
use App\Http\Controllers\Service\ServiceController;
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

// -------------------------------- Router ----------------------------------------------->
/**
 * Trans: Auth
 */
Route::post('/post-login', [AuthController::class, 'postLogin'])->name('login.post'); 
Route::post('/post-registration', [AuthController::class, 'postRegistration'])->name('register.post'); 
Route::get('/logout', [AuthController::class, 'logout'])->name('logout');


/**
 * Trans: Trang chủ
 */
Route::group(['as' => 'home.', 'middleware' => []], function () {
    // Home
    Route::resource('/', IndexController::class);


    // Product
    Route::get('/san-pham/{slug}', [ProductController::class, 'index']);

    // Cart
    Route::resource('/gio-hang', CartController::class);
    Route::post('/add-to-cart', [CartController::class, 'addToCart']);
    Route::post('/remove-product-in-cart', [CartController::class, 'removeProduct']);
    Route::post('/change-quantity-in-cart', [CartController::class, 'updateQuantity']);

    // Service
    Route::get('/dich-vu/{slug}', [ServiceController::class, 'index']);
    Route::get('/get-services', [ServiceController::class, 'getServices']);
    Route::get('/get-categories-of-service', [ServiceController::class, 'getCategoriesOfService']);
});