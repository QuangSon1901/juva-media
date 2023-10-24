<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Models\Cart;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Validator;

class AuthController extends Controller
{
    /**
     * Write code on Method
     *
     * @return response()
     */
    public function postLogin(Request $request)
    {
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
            return [
                "status" => 200,
                "message" => "Đăng nhập thành công!",
                "data" => Auth::user()
            ];
        }
  
        return [
            "status" => 403,
            "message" => "Email hoặc mật khẩu không đúng!"
        ];
    }
      
    /**
     * Write code on Method
     *
     * @return response()
     */
    public function postRegistration(Request $request)
    {  
        $validator = Validator::make(
            $request->all(),
            [
                'name' => 'required|string',
                'phone' => 'required|min:10|max:10',
                'email' => 'required|string|unique:users,email|email',
                'password' => 'required|string|confirmed',
            ],
            [
                'required' => ':attribute không được để trống',
                'string' => ':attribute phải là một chuỗi',
                'integer' => ':attribute phải là số',
                'min' => ':attribute chỉ được 10 số',
                'max' => ':attribute chỉ được là 10 số',
                'unique' => ':attribute đã tồn tại',
                'email' => ':attribute sai định dạng',
                'confirmed' => ':attribute xác nhận mật khẩu chưa chính xác',
            ],
            [
                'name' => 'Họ tên',
                'phone' => 'Số điện thoại',
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
           
        $data = $request->all();
        $check = $this->create($data);
        if ($check) {
            Auth::attempt($request->only(['email', 'password']));
            Cart::create([
                'user_id' => $check->id
            ]);
            return [
                "status" => 200,
                "message" => "Đăng ký thành công!",
                "data" => Auth::user()
            ];
        }
        
        return [
            "status" => 401,
            "message" => "Đăng ký thất bại"
        ];
    }
    
    
    /**
     * Write code on Method
     *
     * @return response()
     */
    public function create(array $data)
    {
      return User::create([
        'name' => $data['name'],
        'email' => $data['email'],
        'phone' => $data['phone'],
        'password' => Hash::make($data['password'])
      ]);
    }
    
    /**
     * Write code on Method
     *
     * @return response()
     */
    public function logout() {
        Session::flush();
        Auth::logout();
        $cart_quantity = 0;
        return redirect('/');
    }
}
