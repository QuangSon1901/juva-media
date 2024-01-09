<?php

namespace App\Http\Controllers\Blogger;

use App\Http\Controllers\Controller;
use App\Models\Blog;
use App\Models\Cart;
use App\Models\CartProduct;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class BloggerController extends Controller
{
    public function index(Request $request) {
        $breadcrumbs = [
            [
                'title' => 'Blog',
                'url' => '#'
            ]
        ];
        $cart_quantity = 0;
        if (Auth::user()) {
            $cart = Cart::where('user_id', Auth::user()->id)->first();
            $cart_quantity = CartProduct::where('cart_id', $cart->id)->count();
        }
        return view('blogger.index', compact('breadcrumbs', 'cart_quantity'));
    }

    public function blog($slug) {
        $breadcrumbs = [
            [
                'title' => 'Blog',
                'url' => '/blog'
            ],
            [
                'title' => 'blog name',
                'url' => '#'
            ]
        ];
        $cart_quantity = 0;
        if (Auth::user()) {
            $cart = Cart::where('user_id', Auth::user()->id)->first();
            $cart_quantity = CartProduct::where('cart_id', $cart->id)->count();
        }
        return view('blogger.blog', compact('breadcrumbs', 'cart_quantity'));
    }

    public function getDetailBlog(Request $request) {
        $id = $request->get('id');

        return [
            "status" => 200,
            "data" => Blog::with('topic')->find($id)
        ];
    }
}
