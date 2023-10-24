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
    $("body").css("overflow", "hidden");
}

function closeModalLogin() {
    $("#loginModal").css("display", "none");
    $("body").css("overflow", "auto");
    $("#register-form-modal").removeClass("active");
    $("#login-form-modal").addClass("active");
}

async function loginSubmit() {
    let method = "post",
        url = "/post-login",
        params = null,
        data = {
            email: $("#email-field-login").val(),
            password: $("#password-field-login").val(),
        };
    let res = await axiosTemplate(method, url, params, data);
    switch (res.data.status) {
        case 200:
            closeModalLogin();
            console.log(res.data);
            $("#header-action-user div:first-child").remove();
            $("#header-action-user").prepend(`
                <div class="flex gap-1 items-center cursor-pointer">
                <box-icon name='user' class="w-5 h-5"></box-icon>
                <span class="text-sm">${res.data.data.name}</span>
                <span class="px-3">/</span>
                <a href="/logout" class="text-sm hover:border-b-2 border-[#555]">Đăng Xuất</a>
            </div>
                `);
            break;
    }
}

async function registerSubmit() {
    let method = "post",
        url = "/post-registration",
        params = null,
        data = {
            email: $("#email-field-register").val(),
            phone: $("#phone-field-register").val(),
            name: $("#name-field-register").val(),
            password: $("#password-field-register").val(),
            password_confirmation: $("#reenter-password-field-register").val(),
        };
    let res = await axiosTemplate(method, url, params, data);
    switch (res.data.status) {
        case 200:
            closeModalLogin();
            $("#header-action-user div:first-child").remove();
            $("#header-action-user").prepend(`
                    <div class="flex gap-1 items-center cursor-pointer">
                        <box-icon name='user' class="w-5 h-5"></box-icon>
                        <span class="text-sm">${res.data.data.name}</span>
                    </div>
                `);
            break;
    }
}
