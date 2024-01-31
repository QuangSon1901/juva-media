@extends('admin.layout')
@section('content')
<div class="flex flex-col min-h-full">
    <div class="pl-8 pb-2 border-b border-[#a8a2a2]">
        <div class="py-6">
            <h1 class="text-base font-medium text-[#333]">Hồ Sơ Của Tôi</h1>
            <p class="text-xs text-[#555] mt-1">Quản lý thông tin hồ sơ để bảo mật</p>
        </div>
    </div>
    <div class="flex pt-5 pb-2">
        @Auth
        <div class="flex-col gap-6 px-12 w-full" id="account-info-form">
            <label for="" class="flex flex-col mb-5">
                <span class="text-base font-medium text-[#333] mb-1">Họ tên</span>
                <input type="text" id="name-field-account" class="w-full h-9 p-2 rounded-md border outline-none" value="{{auth()->user()->name}}" data-max="50">
            </label>
            <label for="" class="flex flex-col mb-5">
                <span class="text-base font-medium text-[#333] mb-1">Email</span>
                <input type="text" id="email-field-account" class="w-full h-9 p-2 rounded-md border outline-none" value="{{auth()->user()->email}}" data-mail="1">
            </label>
            <label for="" class="flex flex-col mb-5">
                <span class="text-base font-medium text-[#333] mb-1">Số điện thoại</span>
                <input type="phone" id="phone-field-account" class="w-full h-9 p-2 rounded-md border outline-none" value="{{auth()->user()->phone}}" data-phone="1">
            </label>
            <label for="" class="flex flex-col mb-5" id="changePassField">
                <span class="text-base font-medium text-[#333] mb-1">Mật khẩu mới</span>
                <input type="password" id="password-field-account" class="w-full h-9 p-2 rounded-md border outline-none" >
            </label>
          
            <button class="w-[20%] text-base font-medium rounded-lg bg-amber-400 text-center py-2 hover:bg-amber-500" onclick="ChangePass()">Lưu</button>
        </div>
       @endauth
    </div>
</div>
@endsection
@push('scripts')
<script type="text/javascript" src="{{ asset('js/admin/account/index.js?version=2')}}"></script>
@endpush