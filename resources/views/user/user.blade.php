@extends('layouts.layout')
@section('content')

<div class="container mx-auto grid grid-cols-[1fr,3fr] py-6">

    <div class="bg-juva-grey w-[300px] h-[420px]">
        <div class="flex items-center p-4">
            <box-icon name='user-circle' class="w-20 h-20 mr-1 round-full"></box-icon>
            <div class="flex flex-col">
                <span class="font-bold">Nguyen Quang</span>
                <a href="" class="text-gray-400 flex items-center capitalize text-base font-medium" ><box-icon type='solid' name='pencil' color="#9ca3af" class="w-4 h-4 mr-1"></box-icon>Sửa hồ sơ</a>
            </div>
        </div>
        <div class="mt-5 border-t border-[#555]">
            <ul class="nav-link-conten-user">
                <li class="flex items-center w-full hover:bg-[#A0E9FF] p-4">
                    <a href="/tai-khoan/thong-tin-ca-nhan" class="flex items-center capitalize text-sm"><box-icon name='user' class="w-5 h-5 mr-1" color="#00A9FF"></box-icon> Tài khoản của tôi</a>
                </li>
                <li class="flex items-center w-full hover:bg-[#A0E9FF] p-4">
                    <a href="/tai-khoan/don-hang" class="flex items-center capitalize text-sm"><box-icon name='clipboard' class="w-5 h-5 mr-1" color="#00A9FF"></box-icon> Đơn hàng</a>
                </li>
            </ul>
        </div>
    </div>
    <div class="ml-5 shadow-[0_1px_2px_2px_rgba(0,0,0,.13)]" id="user-dynamic-content">
        @yield('option')
    </div>

</div>


@endsection
@push('scripts')
<script type="text/javascript" src="{{ asset('js/user/index.js?version=1')}}"></script>
@endpush