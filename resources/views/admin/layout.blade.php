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
                <li class="py-3 border-b-2"><a href="/admin" class="list-none hover:text-indigo-600">Danh mục</a>
                </li>
                <li class="py-3 border-b-2"><a href="/product" class="list-none hover:text-indigo-600">Sản phẩm</a>
                </li>
                <li class="py-3"><a href="#" class="list-none hover:text-indigo-600">Đơn hàng</a></li>
            </div>
        </div>
        <div class="flex-1">
            @yield('content')
        </div>
    </div>
</body>
@include('layouts.script')
<script src="{{asset('js/validate.js?version=1')}}"></script>
<script src="{{asset('js/index.js?version=1')}}"></script>
@stack('scripts')
</html>