<?php

namespace App\Http\Controllers\User;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use App\Models\Cart;
use App\Models\CartProduct;
use Illuminate\Support\Facades\Mail;
use App\Mail\ContactForm;
use Illuminate\Support\Facades\Validator;

class UserController extends Controller
{
    public function getInfoUser()
    {
        $cart_quantity = 0;
        if (Auth::user()) {
            $cart = Cart::where('user_id', Auth::user()->id)->first();
            $cart_quantity = CartProduct::where('cart_id', $cart->id)->count();
        }

        $breadcrumbs = [
            [
                'title' => 'Thông tin cá nhân',
                'url' => '/tai-khoan/thong-tin-ca-nhan'
            ]
        ];
        return view('user.profile', compact('cart_quantity', 'breadcrumbs'));
    }
    public function getInfoPurchase()
    {
        $cart_quantity = 0;
        if (Auth::user()) {
            $cart = Cart::where('user_id', Auth::user()->id)->first();
            $cart_quantity = CartProduct::where('cart_id', $cart->id)->count();
        }

        $breadcrumbs = [
            [
                'title' => 'Đơn hàng',
                'url' => '/tai-khoan/don-hang'
            ]
        ];
        return view('user.purchase', compact('cart_quantity', 'breadcrumbs'));
    }

    public function sendContact(Request $request)
    {
        $validator = Validator::make(
            $request->all(),
            [
                'name' => 'required',
                'email' => 'required|email',
                'title' => 'required',
                'message' => 'required',
            ],
            [
                'required' => ':attribute không được để trống',
                'email' => ':attribute sai định dạng',
            ],
        );
        if ($validator->fails()) {
            return [
                "status" => 403,
                'message' => $validator->errors()->first()
            ];
        }
        // Send email to company
        $data = $request->all();
        $conpanyMail = 'mediajuva@gmail.com';
        Mail::to($conpanyMail)->send(new ContactForm($data));
        return [
            "status" => 200,
            "message" => 'Gửi thành công !',
        ];
    }
}
