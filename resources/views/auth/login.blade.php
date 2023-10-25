<div id="loginModal" style="display: none; background-color: rgba(0, 0, 0, .5);" class="fixed inset-0 items-center justify-center">
    <div class="relative w-full max-w-2xl max-h-full ">
        <!-- Modal content -->
        <div class="relative bg-white rounded-lg shadow ">
            <!-- Modal header -->
            <div class="flex items-start justify-between p-4">
                <div>
                    <h3 class="text-xl font-semibold">
                        Đăng nhập
                    </h3>
                </div>
                <button type="button" onclick="closeModalLogin()" class="text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm w-8 h-8 ml-auto inline-flex justify-center items-center dark:hover:bg-gray-600 dark:hover:text-white" data-modal-hide="defaultModal">
                    <svg class="w-3 h-3" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 14 14">
                        <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m1 1 6 6m0 0 6 6M7 7l6-6M7 7l-6 6" />
                    </svg>
                    <span class="sr-only">Close modal</span>
                </button>
            </div>
            <div>
                <div class="grid grid-cols-2 gap-5 p-4">
                    <div>
                        <img class="rounded-lg" src="https://assets.tronhouse.vn/59185068-4c44-404a-a5b6-493d1d50d13d/derived/p_l/tron-house-chuyen-nghiep.jpg" alt="">
                    </div>
                    <div class="hidden flex-col gap-6 [&.active]:flex active" id="login-form-modal">
                        <label for="" class="flex flex-col">
                            <span class="font-semibold mb-1">Email</span>
                            <input type="email" id="email-field-login"  class="w-full h-9 p-2 rounded-md border outline-none" data-empty="1" data-mail="1">
                        </label>
                        <label for="" class="flex flex-col">
                            <span class="font-semibold mb-1">Mật khẩu</span>
                            <input type="password" id="password-field-login" class="w-full h-9 p-2 rounded-md border outline-none" data-empty="1">
                        </label>
                        <button class="w-full rounded-full bg-amber-400 border-none font-bold text-center py-3" onclick="loginSubmit()" id="login-button">Đăng nhập</button>
                        <div class="flex justify-between">
                            <a class="font-semibold underline cursor-pointer" id="register-btn-change">Đăng ký</a>
                            <a class="font-semibold underline cursor-pointer">Quên mật khẩu?</a>
                        </div>
                    </div>
                    <div class="hidden flex-col gap-6 [&.active]:flex" id="register-form-modal">
                        <label for="" class="flex flex-col">
                            <span class="font-semibold mb-1">Email</span>
                            <input type="text" id="email-field-register" class="w-full h-9 p-2 rounded-md border outline-none">
                        </label>
                        <label for="" class="flex flex-col">
                            <span class="font-semibold mb-1">Số điện thoại</span>
                            <input type="phone" id="phone-field-register" class="w-full h-9 p-2 rounded-md border outline-none">
                        </label>
                        <label for="" class="flex flex-col">
                            <span class="font-semibold mb-1">Họ tên</span>
                            <input type="text" id="name-field-register" class="w-full h-9 p-2 rounded-md border outline-none">
                        </label>
                        <label for="" class="flex flex-col">
                            <span class="font-semibold mb-1">Mật khẩu</span>
                            <input type="password" id="password-field-register" class="w-full h-9 p-2 rounded-md border outline-none">
                        </label>
                        <label for="" class="flex flex-col">
                            <span class="font-semibold mb-1">Nhập lại mật khẩu</span>
                            <input type="password" id="reenter-password-field-register" class="w-full h-9 p-2 rounded-md border outline-none">
                        </label>
                        <button class="w-full rounded-full bg-amber-400 border-none font-bold text-center py-3" onclick="registerSubmit()">Đăng ký</button>
                        <div class="flex justify-between">
                            <a class="font-semibold underline cursor-pointer" id="login-btn-change">Đăng nhập</a>
                            <div></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@push('scripts')
<script type="text/javascript" src="{{ asset('js/auth/login.js?version=1')}}"></script>
@endpush