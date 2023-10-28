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
}

async function loginSubmit() {
    if(!checkValidateSave($('#login-form-modal'))) return false
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
                <div class="flex gap-1 items-center cursor-pointer">
                <box-icon name='user' class="w-5 h-5"></box-icon>
                <span class="text-sm">${res.data.data.name}</span>
            </div>
                `);
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
                    <div class="flex gap-1 items-center cursor-pointer">
                        <box-icon name='user' class="w-5 h-5"></box-icon>
                        <span class="text-sm">${res.data.data.name}</span>
                    </div>
                `);
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
    }
}
