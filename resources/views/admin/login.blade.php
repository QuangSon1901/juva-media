<!doctype html>
<html lang="en" class="light">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>AdminLogin</title>
    @include('layouts.head')
</head>

<body>
    <section class="h-screen flex items-center justify-center">
        <div class=" bg-white rounded-lg shadow h-[500px]">
        
            <div class="flex items-center justify-center p-4">
                <div>
                    <h3 class="text-2xl font-semibold">
                        Đăng nhập Admin
                    </h3>
                </div>
            </div>
            <div>
                <input type="hidden" name="text-red-500 border-red-500 w-[150px] w-2/5 h-4/5 left-[0.3rem] bg-blue-600">

                <div class="grid grid-cols-2 gap-5 p-4">
                    <div>
                        <img class="rounded-lg max-h-[400px]" src="https://assets.tronhouse.vn/59185068-4c44-404a-a5b6-493d1d50d13d/derived/p_l/tron-house-chuyen-nghiep.jpg" alt="">
                    </div>
                    <div class="hidden flex-col gap-6 [&.active]:flex active" id="login-form-admin">
                        <label for="" class="flex flex-col">
                            <span class="font-semibold mb-1 after:content-['*'] after:ml-0.5 after:text-red-500">Email</span>
                            <input type="email" id="email-field-login-admin" class="w-full h-9 p-2 rounded-md border outline-none" data-empty="1" data-mail="1">
                        </label>
                        <label for="" class="flex flex-col">
                            <span class="font-semibold mb-1 after:content-['*'] after:ml-0.5 after:text-red-500">Mật khẩu</span>
                            <input type="password" id="password-field-login-admin" class="w-full h-9 p-2 rounded-md border outline-none" data-empty="1" data-min-length="6" data-max-length="50">
                        </label>
                        <button class="w-full rounded-full bg-amber-400 border-none font-bold text-center py-3" onclick="loginAdminSubmit()" id="login-button">Đăng nhập</button>
                    </div>
                </div>
            </div>
        </div>
    </section>

</body>
@include('layouts.script')
<script src="{{asset('js/validate.js?version=2')}}"></script>
<script src="{{asset('js/index.js?version=2')}}"></script>
<script src="{{asset('js/admin/login.js?version=2')}}"></script>
</html>