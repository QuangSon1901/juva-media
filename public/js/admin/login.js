async function loginAdminSubmit() {
    if (!checkValidateSave($("#login-form-admin"))) return false;
    let method = "post",
        url = "/post-login-admin",
        params = null,
        data = {
            email: $("#email-field-login-admin").val(),
            password: $("#password-field-login-admin").val(),
        };
    let res = await axiosTemplate(method, url, params, data);
    switch (res.data.status) {
        case 200:
            Swal.fire({
                position: "center",
                icon: "success",
                title: res.data.message,
                showConfirmButton: true,
                timer: 2000,
                confirmButtonText: "OK",
            });
            window.location.href = "/admin";
            break;
        case 201:
            Swal.fire({
                position: "center",
                icon: "success",
                title: res.data.message,
                showConfirmButton: true,
                timer: 2000,
                confirmButtonText: "OK",
            });
            window.location.href = "/";
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
