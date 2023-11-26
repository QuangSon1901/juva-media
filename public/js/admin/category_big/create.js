let checkCreateCategoryBig = 0;
$(function () {
    getServicesAdmin('#dropdown-menu-create', '#dropdown-menu-create-button')
});
function openModalCreateCategoryBigAdmin() {
    initializeDropdown('dropdown-menu-create-button', 'dropdown-menu-create', 'search-input-create')
    let gallery = document.getElementById("gallery-create"),
    empty = document.getElementById("empty");
    empty.classList.remove("hidden");
    gallery.append(empty)
    $("#modal-create-category-big-admin").removeClass("hidden");
    $("#modal-create-category-big-admin").addClass("flex");

}

function closeModalCreateCategoryBigAdmin() {
    $("#modal-create-category-big-admin").addClass("hidden");
    $("#modal-create-category-big-admin").removeClass("flex");
    resetModalCreateCategoryBigAdmin()
    removeAllValidate()
}

function resetModalCreateCategoryBigAdmin() {
    $("#modal-create-category-big-admin input#name").val("")
    $("#modal-create-category-big-admin #dropdown-menu-create div.selected").removeClass('selected')
    $("#modal-create-category-big-admin #dropdown-menu-create").parents('.select-group').find('span').text('Loại danh mục')
    $("#modal-create-category-big-admin input#description").val("")

    let gallery = document.getElementById("gallery-create"),
    empty = document.getElementById("empty");
    while (gallery.children.length > 0) {
        gallery.lastChild.remove();
    }

    FILES = {};
    empty.classList.remove("hidden");
    gallery.append(empty);
    $("#hidden-input").replaceWith($("#hidden-input").val('').clone(true));
}

async function saveModalCreateCategoryBigAdmin() {
    if (checkCreateCategoryBig === 1) return;
    if(!checkValidateSave($('#modal-create-category-big-admin'))) return false
    let data = new FormData();
    data.append("file", Object.values(FILES)[0]);
    data.append("name", $("input#name").val());
    data.append("description", $("input#description").val());
    data.append("service_id", $("#dropdown-menu-create div.selected").data("id"));
    let method = "post",
        url = "/category-big.create",
        params = null;

    checkCreateCategoryBig = 1;
    $('#modal-create-category-big-admin-loading').removeClass('hidden')
    let res = await axiosTemplate(method, url, params, data);
    $('#modal-create-category-big-admin-loading').addClass('hidden')
    checkCreateCategoryBig = 0;
    switch (res.data.status) {
        case 200:
            let html = `
                    <tr>
                        <td class="p-2 whitespace-nowrap">
                            <div class="flex items-center">
                                <div class="image-column w-10 h-10 flex-shrink-0 mr-2 sm:mr-3"><img class="rounded-full w-full h-full" src="${res.data.data.image}" width="40" height="40" alt="Alex Shatov"></div>
                                <div class="name-column font-medium text-gray-800">${res.data.data.name}</div>
                            </div>
                        </td>
                        <td class="p-2 whitespace-nowrap">
                            <div class="services-column text-left">${res.data.data.services.name}</div>
                        </td>
                        <td class="p-2 whitespace-nowrap">
                            <div class="description-column text-left">${res.data.data.description}</div>
                        </td>
                        <td class="p-2 whitespace-nowrap">
                            <div class="text-lg text-center">
                            <box-icon type='solid' name='edit' class="cursor-pointer" onclick="getCategoryBigAdminToModel(${res.data.data.id})"></box-icon>
                            <box-icon name='trash' class="cursor-pointer" data-id="${res.data.data.id}" onclick="deleteCategoryBigAdmin($(this))"></box-icon>
                            </div>
                        </td>
                    </tr>
                `;
            $("#category-big-admin-table").prepend(html);
            closeModalCreateCategoryBigAdmin();
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
