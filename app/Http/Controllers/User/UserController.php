<?php

namespace App\Http\Controllers\User;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use App\Models\Cart;
use App\Models\CartProduct;


class UserController extends Controller
{
    public function getInfoUser(){
        $cart_quantity = 0;
        if (Auth::user()) {
            $cart = Cart::where('user_id', Auth::user()->id)->first();
            $cart_quantity = CartProduct::where('cart_id', $cart->id)->count();
        }
        return view('user.profile', compact('cart_quantity'));
    }
    public function getInfoPurchase(){
        $cart_quantity = 0;
        if (Auth::user()) {
            $cart = Cart::where('user_id', Auth::user()->id)->first();
            $cart_quantity = CartProduct::where('cart_id', $cart->id)->count();
        }
        return view('user.purchase', compact('cart_quantity'));
    }
}
