<?php

namespace App\Http\Controllers\Blogger;

use App\Http\Controllers\Controller;
use App\Models\Blog;
use App\Models\Cart;
use App\Models\CartProduct;
use App\Models\Topic;
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
        $post_data = Blog::with('topic')->where('slug', $slug)->first();
        $breadcrumbs = [
            [
                'title' => 'Blog',
                'url' => '/blog'
            ],
            [
                'title' => $post_data->title,
                'url' => '#'
            ]
        ];
        $cart_quantity = 0;
        if (Auth::user()) {
            $cart = Cart::where('user_id', Auth::user()->id)->first();
            $cart_quantity = CartProduct::where('cart_id', $cart->id)->count();
        }

        return view('blogger.blog', compact('breadcrumbs', 'cart_quantity', 'post_data'));
    }

    public function topicData() {
        return [
            "status" => 200,
            "data" => [
                "topic" => Topic::withCount('blogs')->orderByDesc('blogs_count')->limit(10)->get(),
            ]
        ];
    }

    public function blogData(Request $request) {
        $topic = $request->get('topic') ?? '';
        $keysearch = $request->get('search') ?? '';
        $blog = Blog::query();
        $blog->with('topic');
        if ($topic != '') {
            $blog->whereHas('topic', function ($query) use ($topic) {
                return $query->where('slug', $topic);
            });
        }
        if ($keysearch != '') {
            $blog->where('title', 'LIKE', '%' . $keysearch . '%');
        }
        
        $blog->orderByDesc('created_at')->limit(20);
        $blog = $blog->get();
        return [
            "status" => 200,
            "data" => [
                "blogs" => $blog,
                "blog_quantity" => count($blog)
            ]
        ];
    }
}
