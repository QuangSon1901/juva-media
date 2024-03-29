<?php

use App\Http\Controllers\Admin\AdminAccountController;
use App\Http\Controllers\Admin\AdminBlogController;
use App\Http\Controllers\Admin\AdminController;
use App\Http\Controllers\Admin\AdminLoginController;
use App\Http\Controllers\Admin\BannerController;
use App\Http\Controllers\Admin\OrderController as AdminOrderController;
use App\Http\Controllers\Admin\ProductController as AdminProductController;
use App\Http\Controllers\Admin\ServiceController as AdminServiceController;
use App\Http\Controllers\Auth\AuthController;
use App\Http\Controllers\Blogger\BloggerController;
use App\Http\Controllers\Cart\CartController;
use App\Http\Controllers\Home\IndexController;
use App\Http\Controllers\Order\OrderController;
use App\Http\Controllers\Product\ProductController;
use App\Http\Controllers\Service\ServiceController;
use App\Http\Controllers\UploadNodeController;
use App\Http\Controllers\User\UserController;
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
Route::post('/contact', [UserController::class, 'sendContact']); 
//Login Admin
Route::get('/admin-login', [AdminLoginController::class, 'index'])->name('adminLogin');
Route::post('/post-login-admin', [AdminLoginController::class, 'postLoginAdmin']); 
Route::get('/logout-admin', [AdminLoginController::class, 'logout'])->name('logout');


/**
 * Trans: Trang chủ
 */
Route::group(['as' => 'home.', 'middleware' => []], function () {
    // Home
    Route::resource('/', IndexController::class);
    Route::get('/banner.data-index', [BannerController::class, 'dataIndex']);

    // Blogger
    // Route::resource('/blog', BloggerController::class);
    Route::get('/blog', [BloggerController::class, 'index']);
    Route::get('/blog/{slug}', [BloggerController::class, 'blog']);
    Route::get('/blog.topic-data', [BloggerController::class, 'topicData']);
    Route::get('/blog.blog-data', [BloggerController::class, 'blogData']);

    // Product
    Route::get('/san-pham/{slug}', [ProductController::class, 'index']);
    Route::get('/search', [ProductController::class, 'search']);

    // Cart
    Route::resource('/gio-hang', CartController::class);
    Route::post('/get-items-cart', [CartController::class, 'getItemsCart']);
    Route::post('/add-to-cart', [CartController::class, 'addToCart']);
    Route::post('/remove-product-in-cart', [CartController::class, 'removeProduct']);
    Route::post('/change-quantity-in-cart', [CartController::class, 'updateQuantity']);

    // Service
    Route::get('/dich-vu/{slug}', [ServiceController::class, 'index']);
    Route::get('/filter/{slug}', [ServiceController::class, 'filter']);
    Route::get('/get-services', [ServiceController::class, 'getServices']);
    Route::get('/get-categories-of-service', [ServiceController::class, 'getCategoriesOfService']);
    Route::get('/get-detail-service-category', [ServiceController::class, 'getDetailServiceCategory']);
    Route::get('/get-detail-service', [ServiceController::class, 'getDetailService']);

    // Order
    Route::post('/order', [OrderController::class, 'order']);

    // Profile
    Route::group(['prefix' => 'tai-khoan','as' => 'account.', 'middleware' => []], function () {
        Route::get('/thong-tin-ca-nhan', [UserController::class, 'getInfoUser']);
        Route::get('/don-hang', [UserController::class, 'getInfoPurchase']);
    });
    Route::post('/update-info-user', [UserController::class, 'addToCart']);

});

/**
 * Trans: Admin
 */
Route::group(['as' => 'admin.', 'middleware' => ['adminCheck']], function () {
    // Admin
    Route::resource('/admin', AdminController::class);
    Route::post('/category-big.create', [AdminController::class, 'create']);
    Route::post('/category-big.delete', [AdminController::class, 'delete']);
    Route::post('/category-big.update', [AdminController::class, 'update']);

    // Admin
    Route::resource('/admin-blog', AdminBlogController::class);

    // Product
    Route::resource('/product', AdminProductController::class);
    Route::get('/product.data', [AdminProductController::class, 'data']);
    Route::get('/product.data-create', [AdminProductController::class, 'dataCreate']);
    Route::post('/product.add-type-create', [AdminProductController::class, 'addTypeCreate']);
    Route::post('/product.add-graphy-create', [AdminProductController::class, 'addGraphyCreate']);
    Route::post('/product.create', [AdminProductController::class, 'create']);
    Route::post('/product.update', [AdminProductController::class, 'update']);
    Route::post('/product.delete', [AdminProductController::class, 'delete']);

    // Blog
    Route::get('/blog-topic.data-create', [AdminBlogController::class, 'dataCreate']);
    Route::post('/blog-topic.add-topic-create', [AdminBlogController::class, 'addTopicCreate']);
    Route::post('/blog-topic.create', [AdminBlogController::class, 'create']);
    Route::get('/blog-topic.data', [AdminBlogController::class, 'data']);
    Route::post('/blog-topic.update', [AdminBlogController::class, 'update']);
    Route::post('/blog-topic.delete', [AdminBlogController::class, 'delete']);
    Route::post('/blog-topic.update-status', [AdminBlogController::class, 'updateStatus']);
    Route::get('/blog-topic.detail', [AdminBlogController::class, 'getDetailBlog']);

    // Service
    Route::resource('/service', AdminServiceController::class);
    Route::get('/service.data', [AdminServiceController::class, 'data']);
    Route::post('/service.update-status', [AdminServiceController::class, 'updateStatus']);
    Route::post('/service.create', [AdminServiceController::class, 'create']);
    Route::post('/service.update', [AdminServiceController::class, 'update']);
    Route::post('/service.delete', [AdminServiceController::class, 'delete']);

    // Order
    Route::resource('/order', AdminOrderController::class);
    Route::get('/order.data', [AdminOrderController::class, 'data']);

    Route::post('/upload-media-template', [UploadNodeController::class, 'uploadMedia']);

    //Banner
    Route::resource('/banner', BannerController::class);
    Route::get('/banner.data', [BannerController::class, 'data']);
    Route::post('/banner.create', [BannerController::class, 'create']);
    Route::post('/banner.update', [BannerController::class, 'update']);
    Route::post('/banner.delete', [BannerController::class, 'delete']);
    Route::post('/banner.update-status', [BannerController::class, 'updateStatus']);

    //Account
    Route::resource('/account', AdminAccountController::class);
    Route::post('/account.update', [AdminAccountController::class, 'update']);

});

Route::any('/ckfinder/connector', '\CKSource\CKFinderBridge\Controller\CKFinderController@requestAction')
    ->name('ckfinder_connector');

Route::any('/ckfinder/browser', '\CKSource\CKFinderBridge\Controller\CKFinderController@browserAction')
    ->name('ckfinder_browser');