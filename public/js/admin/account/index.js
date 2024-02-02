async function ChangePass() {
    let method = "post",
        url = "/account.update",
        params = null,
        data = { 
            name: $("#account-info-form input#name-field-account").val(),
            email: $('#account-info-form input#email-field-account').val(),
            phone:  $('#account-info-form input#phone-field-account').val(),
            newPassword:  $('#account-info-form input#password-field-account').val(),
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
            $('#account-info-form input#password-field-account').val('')
            break;
        case 403:
            Swal.fire({
                position: "center",
                icon: "warning",
                title: res.data.message,
                showConfirmButton: true,
                timer: 2000,
                confirmButtonText: "OK",
            });
            break;
    }
}