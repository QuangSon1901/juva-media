<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Session;


class AdminLoginController extends Controller
{
    public function index() {
        return view('admin.login');
    }

    public function postLoginAdmin(Request $request){
        $validator = Validator::make(
            $request->all(),
            [
                'email' => 'required|string|email',
                'password' => 'required|string',
            ],
            [
                'required' => ':attribute không được để trống',
                'string' => ':attribute phải là một chuỗi',
                'email' => ':attribute sai định dạng',
            ],
            [
                'email' => 'Email',
                'password' => 'Mật khẩu',
            ]
        );

        if ($validator->fails()) {
            return [
                "status" => 403,
                'message' => $validator->errors()->first()
            ];
        }

        $credentials = $request->only('email', 'password');
        if (Auth::attempt($credentials)) {
            if(Auth::user()->role == 0)
            {
                return [
                    "status" => 200,
                    "message" => "Đăng nhập thành công!",
                ];
            }
                return [
                    "status" => 460,
                    "message" => "Bạn không phải là admin!!!",
                ];
        }

        return [
            "status" => 403,
            "message" => "Email hoặc mật khẩu không đúng!"
        ];
    }

    public function logout() {
        Session::flush();
        Auth::logout();
        return redirect('/admin-login');
    }
}
