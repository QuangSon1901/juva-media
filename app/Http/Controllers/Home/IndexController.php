<?php

namespace App\Http\Controllers\Home;

use App\Http\Controllers\Controller;
use App\Models\Cart;
use App\Models\CartProduct;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class IndexController extends Controller
{
    public function index() {
        $cart_quantity = 0;
        if (Auth::user()) {
            $cart = Cart::where('user_id', Auth::user()->id)->first();
            $cart_quantity = CartProduct::where('cart_id', $cart->id)->count();
        }
        
        return view('index', compact('cart_quantity'));
    }
}
