let checkUpdateService = 0;

function openModalUpdateServiceAdmin() {
    $("#modal-update-service-admin").removeClass("hidden");
    $("#modal-update-service-admin").addClass("flex");

}

function closeModalUpdateServiceAdmin() {
    $("#modal-update-service-admin").addClass("hidden");
    $("#modal-update-service-admin").removeClass("flex");
    removeAllValidate()
}

async function saveModalUpdateServiceAdmin() {
    if (checkUpdateService === 1) return;
    if(!checkValidateSave($('#modal-update-service-admin'))) return false
    let data = new FormData();
    data.append("id",$("#modal-update-service-admin input#update-id").data("id"));
    data.append("name", $("#modal-update-service-admin input#name").val());
    let method = "post",
        url = "/service.update",
        params = null;

        checkUpdateService = 1;
    $('#modal-update-service-admin-loading').removeClass('hidden')
    let res = await axiosTemplate(method, url, params, data);
    $('#modal-update-service-admin-loading').addClass('hidden')
    checkUpdateService = 0;
    switch (res.data.status) {
        case 200:
            closeModalUpdateServiceAdmin();
            getServiceAdmin();
            break;
        case 403:
            Swal.fire({
                position: "center",
                icon: "error",
                title: res.data.message,
                showConfirmButton: true,
                timer: 1500,
                confirmButtonText: "OK",
            });
    }
}