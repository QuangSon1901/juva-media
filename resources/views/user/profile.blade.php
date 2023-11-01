@extends('user.user')
@section('option')
<div class="flex flex-col min-h-full">
    <div class="pl-8 pb-2 border-b border-[#efefef]">
        <div class="py-6">
            <h1 class="text-base font-medium text-[#333]">Hồ Sơ Của Tôi</h1>
            <p class="text-xs text-[#555] mt-1">Quản lý thông tin hồ sơ để bảo mật</p>
        </div>
    </div>
    <div class="flex pt-5 pb-2">
        @Auth
        <div class="flex-col gap-6 px-12 w-full" id="proflie-info-form">
            <label for="" class="flex flex-col mb-5">
                <span class="text-base font-medium text-[#333] mb-1">Họ tên</span>
                <input type="text" id="name-field-profile" class="w-full h-9 p-2 rounded-md border outline-none" value="{{auth()->user()->name}}" data-max="50">
            </label>
            <label for="" class="flex flex-col mb-5">
                <span class="text-base font-medium text-[#333] mb-1">Email</span>
                <input type="text" id="email-field-profile" class="w-full h-9 p-2 rounded-md border outline-none" value="{{auth()->user()->email}}" data-mail="1">
            </label>
            <label for="" class="flex flex-col mb-5">
                <span class="text-base font-medium text-[#333] mb-1">Số điện thoại</span>
                <input type="phone" id="phone-field-profile" class="w-full h-9 p-2 rounded-md border outline-none" value="{{auth()->user()->phone}}" data-phone="1">
            </label>
            <label for="" class="flex-col mb-5 hidden" id="changePassField">
                <span class="text-base font-medium text-[#333] mb-1">Mật khẩu mới</span>
                <input type="password" id="password-field-profile" class="w-full h-9 p-2 rounded-md border outline-none" data-min="6" data-max="50">
            </label>
            <div class="flex w-full items-center justify-between mt-3">
                <button class="w-[20%] text-base font-medium rounded-lg bg-amber-400 text-center py-2 hover:bg-amber-500" onclick="updateProfile()">Lưu</button>
                <button class="w-auto text-base font-medium rounded-lg bg-amber-400 text-center p-2  hover:bg-amber-500" onclick="changePassword()">Đổi mật khẩu</button>
            </div>
        </div>
        @endauth
    </div>
</div>
@endsection