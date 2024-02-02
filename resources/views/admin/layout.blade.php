<!doctype html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Trang chủ</title>
    @include('layouts.head')
</head>

<body>
    <div class="container mx-auto flex gap-10 py-5">
        <div class="bg-white rounded-md shadow-lg border border-gray-200 px-4 h-max">
            <h2 class="text-center bg-white py-4 rounded-md border-b-2 font-semibold text-gray-800">
                Danh mục</h2>
            <div class="bg-white rounded-md list-none text-sm ">
                <li class="py-3 border-b-2"><a href="/service" class="list-none hover:text-indigo-600">Dịch vụ</a>
                </li>
                <li class="py-3 border-b-2"><a href="/admin" class="list-none hover:text-indigo-600">Danh mục</a>
                </li>
                <li class="py-3 border-b-2"><a href="/product" class="list-none hover:text-indigo-600">Sản phẩm</a>
                </li>
                <!-- <li class="py-3 border-b-2"><a href="/order" class="list-none hover:text-indigo-600">Đơn hàng</a></li> -->
                <li class="py-3 border-b-2"><a href="/banner" class="list-none hover:text-indigo-600">Banner</a></li>
                <li class="py-3 border-b-2"><a href="/admin-blog" class="list-none hover:text-indigo-600">Blog</a></li>
                <li class="py-3"><a href="/account" class="list-none hover:text-indigo-600">Tài khoản</a></li>
            </div>
        </div>
        <div class="flex-1">
            @yield('content')
        </div>
        <div class="hidden">
            <div class="mr-2 mt-[0.3rem] h-3.5 w-8 appearance-none rounded-[0.4375rem] bg-neutral-300 before:pointer-events-none before:absolute before:h-3.5 before:w-3.5 before:rounded-full before:bg-transparent before:content-[''] after:absolute after:z-1 after:-mt-[0.1875rem] after:h-5 after:w-5 after:rounded-full after:border-none after:bg-neutral-100 after:shadow-[0_0px_3px_0_rgb(0_0_0_/_7%),_0_2px_2px_0_rgb(0_0_0_/_4%)] after:transition-[background-color_0.2s,transform_0.2s] after:content-[''] checked:bg-blue-500 checked:after:absolute checked:after:z-1 checked:after:-mt-[3px] checked:after:ml-[1.0625rem] checked:after:h-5 checked:after:w-5 checked:after:rounded-full checked:after:border-none checked:after:bg-blue-500 checked:after:shadow-[0_3px_1px_-2px_rgba(0,0,0,0.2),_0_2px_2px_0_rgba(0,0,0,0.14),_0_1px_5px_0_rgba(0,0,0,0.12)] checked:after:transition-[background-color_0.2s,transform_0.2s] checked:after:content-[''] hover:cursor-pointer focus:outline-none focus:ring-0 focus:before:scale-100 focus:before:opacity-[0.12] focus:before:shadow-[3px_-1px_0px_13px_rgba(0,0,0,0.6)] focus:before:transition-[box-shadow_0.2s,transform_0.2s] focus:after:absolute focus:after:z-1 focus:after:block focus:after:h-5 focus:after:w-5 focus:after:rounded-full focus:after:content-[''] checked:focus:border-primary checked:focus:bg-primary checked:focus:before:ml-[1.0625rem] checked:focus:before:scale-100 checked:focus:before:shadow-[3px_-1px_0px_13px_#3b71ca] checked:focus:before:transition-[box-shadow_0.2s,transform_0.2s] inline-block pl-[0.15rem] hover:cursor-pointer"></div>
        </div>
    </div>
</body>
@include('layouts.script')
<script src="{{asset('js/validate.js?version=2')}}"></script>
<script src="{{asset('js/index.js?version=2')}}"></script>
@stack('scripts')
</html>