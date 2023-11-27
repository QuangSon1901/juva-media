$(function () {
    $("#login-btn-change").on("click", () => {
        $("#register-form-modal").removeClass("active");
        $("#login-form-modal").addClass("active");
    });

    $("#register-btn-change").on("click", () => {
        $("#register-form-modal").addClass("active");
        $("#login-form-modal").removeClass("active");
    });
});

function openModalLogin() {
    $("#loginModal").css("display", "flex");
    setTimeout(()=>{
        $("#model").removeClass('-translate-y-full')
    },100)
    $("body").css("overflow", "hidden");
}

function closeModalLogin() {
    $("#model").addClass('-translate-y-full')
    setTimeout(()=>{
        $("#loginModal").css("display", "none");
    },200)
    $("body").css("overflow", "auto");
    $("#register-form-modal").removeClass("active");
    $("#login-form-modal").addClass("active");
    removeAllValidate()
}

async function loginSubmit() {
    if(!checkValidateSave($('#login-form-modal'))) return false
    let method = "post",
        url = "/post-login",
        params = null,
        data = {
            email: $("#email-field-login").val(),
            password: $("#password-field-login").val(),
            cart: localStorage.getItem('cart')
        };
    let res = await axiosTemplate(method, url, params, data);
    switch (res.data.status) {
        case 200:
            Swal.fire({
                position: "center",
                icon: "success",
                title: res.data.message,
                showConfirmButton: true,
                timer: 1500,
                confirmButtonText: "OK",
            }).then(closeModalLogin());
            $("#header-action-user div:first-child").remove();
            $("#header-action-user").prepend(`
                    <div class="group">
                        <div class="flex gap-1 items-center cursor-pointer relative">
                            <box-icon name='user' class="w-5 h-5"></box-icon>
                            <span class="text-sm">${res.data.data.name}</span>
                        </div>
                        <div class="flex flex-col bg-juva-grey absolute border border-neutral-400 rounded-lg py-2 mt-2 top-[5.8rem] opacity-0 visible z-0 group-hover:visible group-hover:opacity-100 group-hover:mt-0 group-hover:z-20 transition-all duration-500">
                            <div class="w-3 h-3 left-[18px] top-[-6.2px] absolute bg-juva-grey rotate-45 border-t border-l border-neutral-400"></div>
                            <a href="/tai-khoan/thong-tin-ca-nhan" class="flex items-center px-4 py-2 hover:bg-blue-300"><box-icon name='user-circle' class="w-5 h-5 mr-1"></box-icon> Thông tin cá nhân</a>
                            <a href="/tai-khoan/don-hang" class="flex items-center px-4 py-2 hover:bg-blue-300"><box-icon name='check-circle' class="w-5 h-5 mr-1"></box-icon>Đơn hàng</a>
                            <a href="/logout" class="flex items-center px-4 py-2 hover:bg-blue-300"><box-icon name='log-out-circle' class="w-5 h-5 mr-1"></box-icon>Đăng xuất</a>
                        </div>
                    </div>
                `);
            $('#cart-quantity-header').parent().remove()
            $("#header-action-user").append(`
                    <a class="cursor-pointer relative"  href="/gio-hang">
                        <box-icon name='shopping-bag' class="w-7 h-7"></box-icon>
                        <span id="cart-quantity-header" class="absolute -top-1 -right-1 rounded-full bg-red-500 w-4 h-4 text-xs flex items-center justify-center text-juva-white font-semibold">${res.data.cart_quantity}</span>
                    </a>
            `)
            localStorage.removeItem('cart')
            window.location.reload()

            break;
        case 403:
            Swal.fire({
                position: "center",
                icon: "warning",
                title: res.data.message,
                showConfirmButton: true,
                timer: 1500,
                confirmButtonText: "OK",
            });
            break;
    }
}

async function registerSubmit() {
    if(!checkValidateSave($('#register-form-modal'))) return false
    let method = "post",
        url = "/post-registration",
        params = null,
        data = {
            email: $("#email-field-register").val(),
            phone: $("#phone-field-register").val(),
            name: $("#name-field-register").val(),
            password: $("#password-field-register").val(),
            password_confirmation: $("#reenter-password-field-register").val(),
            cart: localStorage.getItem('cart')
        };
    let res = await axiosTemplate(method, url, params, data);
    switch (res.data.status) {
        case 200:
            Swal.fire({
                position: "center",
                icon: "success",
                title: res.data.message,
                showConfirmButton: true,
                timer: 1500,
                confirmButtonText: "OK",
            }).then(closeModalLogin());
            $("#header-action-user div:first-child").remove();
            $("#header-action-user").prepend(`
                    <div class="group">
                        <div class="flex gap-1 items-center cursor-pointer relative">
                            <box-icon name='user' class="w-5 h-5"></box-icon>
                            <span class="text-sm">${res.data.data.name}</span>
                        </div>
                        <div class="flex flex-col bg-juva-grey absolute border border-neutral-400 rounded-lg py-2 mt-2 top-[5.8rem] opacity-0 visible z-0 group-hover:visible group-hover:opacity-100 group-hover:mt-0 group-hover:z-20 transition-all duration-500">
                            <div class="w-3 h-3 left-[18px] top-[-6.2px] absolute bg-juva-grey rotate-45 border-t border-l border-neutral-400"></div>
                            <a href="/tai-khoan/thong-tin-ca-nhan" class="flex items-center px-4 py-2 hover:bg-blue-300"><box-icon name='user-circle' class="w-5 h-5 mr-1"></box-icon> Thông tin cá nhân</a>
                            <a href="/tai-khoan/don-hang" class="flex items-center px-4 py-2 hover:bg-blue-300"><box-icon name='check-circle' class="w-5 h-5 mr-1"></box-icon>Đơn hàng</a>
                            <a href="/logout" class="flex items-center px-4 py-2 hover:bg-blue-300"><box-icon name='log-out-circle' class="w-5 h-5 mr-1"></box-icon>Đăng xuất</a>
                        </div>
                    </div>
                `);
            $('#cart-quantity-header').parent().remove()
            $("#header-action-user").append(`
                    <a class="cursor-pointer relative"  href="/gio-hang">
                        <box-icon name='shopping-bag' class="w-7 h-7"></box-icon>
                        <span id="cart-quantity-header" class="absolute -top-1 -right-1 rounded-full bg-red-500 w-4 h-4 text-xs flex items-center justify-center text-juva-white font-semibold">0</span>
                    </a>
            `)
            localStorage.removeItem('cart')
            window.location.reload()
            break;
        case 401:
            Swal.fire({
                position: "center",
                icon: "warning",
                title: res.data.message,
                showConfirmButton: true,
                timer: 1500,
                confirmButtonText: "OK",
            });
            break;
        case 403:
            Swal.fire({
                position: "center",
                icon: "warning",
                title: res.data.message,
                showConfirmButton: true,
                timer: 1500,
                confirmButtonText: "OK",
            });
            break;
    }
}
