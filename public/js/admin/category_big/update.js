let checkUpdateCategoryBig = 0;
$(function () {
    getServicesAdmin("#dropdown-menu-update", "#dropdown-menu-update-button");
});
function openModalUpdateCategoryBigAdmin() {
    initializeDropdown(
        "dropdown-menu-update-button",
        "dropdown-menu-update",
        "search-input-update"
    );
    $("#modal-update-category-big-admin").removeClass("hidden");
    $("#modal-update-category-big-admin").addClass("flex");
}

function closeModalUpdateCategoryBigAdmin() {
    $("#modal-update-category-big-admin").addClass("hidden");
    $("#modal-update-category-big-admin").removeClass("flex");
    removeAllValidate();
}

async function saveModalUpdateCategoryBigAdmin() {
    if (checkUpdateCategoryBig == 1) return;
    let data = new FormData();
    data.append("id",$("#modal-update-category-big-admin input#update-id").data("id"));
    data.append("file", $('#gallery-update img').attr('src'));
    data.append("name", $("#modal-update-category-big-admin input#name").val());
    data.append("description",$("#modal-update-category-big-admin input#description").val());
    data.append("service_id",$("#modal-update-category-big-admin #dropdown-menu-update div.selected").data("id"));
    let method = "post",
        url = "/category-big.update",
        params = null;

    checkUpdateCategoryBig = 1;
    $("#modal-update-category-big-admin-loading").removeClass("hidden");
    let res = await axiosTemplate(method, url, params, data);
    $("#modal-update-category-big-admin-loading").addClass("hidden");
    checkCreateCategoryBig = 0;
    switch (res.data.status) {
        case 200:
            closeModalUpdateCategoryBigAdmin();
            getCategoryBigAdmin(-1);
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
            break;
        case 404:
            Swal.fire({
                position: "center",
                icon: "error",
                title: res.data.message,
                showConfirmButton: true,
                timer: 1500,
                confirmButtonText: "OK",
            });
            break;
    }
}
