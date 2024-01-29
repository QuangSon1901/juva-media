<?php

namespace App\Http\Controllers\Product;

use App\Http\Controllers\Controller;
use App\Models\Cart;
use App\Models\CartProduct;
use App\Models\Product;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class ProductController extends Controller
{
    public function index($slug) {
        $get_product = Product::where('slug', $slug)->first();
        $product = [
            'id' => $get_product->id,
            'name' => $get_product->name,
            'description' => $get_product->description,
            'image' => explode(' ', trim($get_product->image)),
            'price' => $this->numberFormat($get_product->price),
            'slug' => $get_product->slug,
        ];

        $photography = [];
        foreach ($get_product->product_photography as $product_photography) {
            $photography[] = [
                'id' => $this->numberFormat($product_photography->id),
                'price_format' => $this->numberFormat($product_photography->price),
                'price' => $product_photography->price,
                'image' => $this->numberFormat($product_photography->image),
                'title' => $this->numberFormat($product_photography->photography->title),
                'description' => $this->numberFormat($product_photography->photography->description),
            ];
        }

        $breadcrumbs = [
            [
                'title' => $get_product->service_categories->services->name,
                'url' => '/'
            ],
            [
                'title' => $get_product->service_categories->name,
                'url' => '/dich-vu/' . $get_product->service_categories->slug
            ],
            [
                'title' => $get_product->name,
                'url' => '/san-pham/' . $get_product->slug
            ]
        ];
        $cart_quantity = 0;
        if (Auth::user()) {
            $cart = Cart::where('user_id', Auth::user()->id)->first();
            $cart_quantity = CartProduct::where('cart_id', $cart->id)->count();
        }
        return view('product.index', compact('product', 'photography', 'breadcrumbs', 'cart_quantity'));
    }

    public function search(Request $request) {
        $searchTerm = $request->input('search');

        $products = Product::where('name', 'LIKE', '%' . $searchTerm . '%')
            ->limit(10)
            ->get();

        $groupedData = [];

        foreach ($products as $item) {
            $serviceCategoryId = $item['service_categories']['id'];
        
            if (!isset($groupedData[$serviceCategoryId])) {
                $groupedData[$serviceCategoryId] = [
                    'service_categories' => $item['service_categories'],
                    'items' => [],
                ];
            }
        
            $groupedData[$serviceCategoryId]['items'][] = $item;
        }

        return [
            "status" => 200,
            "data" => collect($groupedData)->values()
        ];
    }
}
