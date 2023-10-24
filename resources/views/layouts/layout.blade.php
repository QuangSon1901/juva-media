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
    <div>
        @include('layouts.header')
        @if (Request::path() !== '/' && Request::path() == '/logout')
            @include('layouts.breadcrumb')
        @endif
        @yield('content')
        @include('layouts.footer')
        @include('auth.login')
    </div>
</body>
@include('layouts.script')
<script src="{{asset('js/index.js?version=1')}}"></script>
@stack('scripts')
</html>