<?php

namespace App\Http\Controllers\Service;

use App\Http\Controllers\Controller;
use App\Models\Cart;
use App\Models\CartProduct;
use App\Models\Product;
use App\Models\Service;
use App\Models\ServiceCategory;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class ServiceController extends Controller
{
    public function index($slug)
    {
        $service_category = ServiceCategory::with('services')->where('slug', $slug)->first();
        $get_products = Product::with('product_categories')->where('service_category_id', $service_category->id)->get();
        $info_page = [
            'total' => count($get_products)
        ];
        $categories = [];
        $products = [];
        foreach ($get_products as $product) {
            $products[] = [
                'id' => $product->id,
                'name' => $product->name,
                'description' => $product->description,
                'image' => explode(' ', trim($product->image)),
                'price' => $this->numberFormat($product->price),
                'slug' => $product->slug,
            ];

            $obj = array_column($categories, null, 'id')[$product->product_categories->id] ?? false;
            if (!$obj) {
                $categories[] = [
                    'id' => $product->product_categories->id,
                    'title' => $product->product_categories->title,
                ];
            }
        }

        $breadcrumbs = [
            [
                'title' => $service_category->services->name,
                'url' => '/'
            ],
            [
                'title' => $service_category->name,
                'url' => '/dich-vu/' . $service_category->slug
            ]
        ];

        $cart_quantity = 0;
        if (Auth::user()) {
            $cart = Cart::where('user_id', Auth::user()->id)->first();
            $cart_quantity = CartProduct::where('cart_id', $cart->id)->count();
        }
        return view('category/index', compact('products', 'categories', 'info_page', 'breadcrumbs', 'cart_quantity'));
    }

    public function filter($slug, Request $request) {
        $cate = $request->get('cate');
        $service_category = ServiceCategory::with('services')->where('slug', $slug)->first();
        $get_products = Product::query();
        $get_products->with('product_categories');
        if ($cate != 0) {
            $get_products->where('product_category_id', $cate);
        }
        $products = $get_products->where('service_category_id', $service_category->id)->get();
        $info_page = [
            'total' => count($products)
        ];
        $results = []; 
        foreach ($products as $product) {
            $results[] = [
                'id' => $product->id,
                'name' => $product->name,
                'description' => $product->description,
                'image' => explode(' ', trim($product->image)),
                'price' => $this->numberFormat($product->price),
                'slug' => $product->slug,
            ];
        }

        return [
            "status" => 200,
            "data" => $results,
            "info_page" => $info_page
        ];
    }

    public function getServices()
    {
        return [
            "status" => 200,
            "data" => Service::all()
        ];
    }

    public function getCategoriesOfService(Request $request)
    {
        $serviceId = $request->get('service_id');
        if ($serviceId == -1) return [
            "status" => 200,
            "data" => ServiceCategory::with('services')->get()
        ];


        return [
            "status" => 200,
            "data" => ServiceCategory::where('service_id', $serviceId)->get()
        ];
    }
}
