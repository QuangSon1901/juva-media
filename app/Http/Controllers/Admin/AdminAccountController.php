<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use App\Http\Controllers\Admin\User;

class AdminAccountController extends Controller
{
    public function index(){
        return view('admin.account.index');
    }

    public function update(Request $request){
        $user = Auth::user();

        // Kiểm tra thời gian giữa các lần thay đổi mật khẩu
        if ($user->last_password_change) {

            $daysSinceLastChange = now()->diffInDays($user->last_password_changed_at);
            
            if ($daysSinceLastChange < 30) {
                return [
                    'status' => 403,
                    'message' => 'Bạn chỉ được thay đổi mật khẩu một lần mỗi 30 ngày.'
                ];
            }
        }

        // Tiến hành thay đổi mật khẩu
        $user->password = Hash::make($request->get('newPassword'));
        $user->last_password_change = now();
        $user->save();

        return [
            'status' => 200,
            'message' => 'Mật khẩu đã được thay đổi thành công.'
        ];
    }
}
