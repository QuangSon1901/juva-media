let checkCreateCategoryBig = 0;

$(function () {
    getServicesAdmin();
});

async function getServicesAdmin() {
    let method = "get",
        url = "/get-services",
        params = null,
        data = null;
    let res = await axiosTemplate(method, url, params, data);
    switch (res.data.status) {
        case 200:
            let eleServives = res.data.data.map(
                (service) => `
                    <div data-id="${service.id}" class="block px-4 py-2 text-gray-700 hover:bg-gray-100 active:bg-blue-100 cursor-pointer rounded-md">${service.name}</div>
                `
            );

            $("#dropdown-menu").append(eleServives);
            $("#dropdown-menu div").on("click", function () {
                $("#dropdown-menu div.selected").removeClass("selected");
                $(this).addClass("selected");
                $("#dropdown-button > span").text($(this).text());
                toggleDropdown();
            });
            break;
    }
}

function openModalCreateCategoryBigAdmin() {
    $("#modal-create-category-big-admin").removeClass("hidden");
    $("#modal-create-category-big-admin").addClass("flex");
}

function closeModalCreateCategoryBigAdmin() {
    $("#modal-create-category-big-admin").addClass("hidden");
    $("#modal-create-category-big-admin").removeClass("flex");
    resetModalCreateCategoryBigAdmin()
}

function resetModalCreateCategoryBigAdmin() {
    $("#modal-create-category-big-admin input#name").val("")
    $("#modal-create-category-big-admin #dropdown-menu div.selected").removeClass('selected')
    $("#modal-create-category-big-admin #dropdown-menu").parents('.select-group').find('span').text('Loại danh mục')
    $("#modal-create-category-big-admin input#description").val("")

    let gallery = document.getElementById("gallery"),
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
    let data = new FormData();
    data.append("file", Object.values(FILES)[0]);
    data.append("name", $("input#name").val());
    data.append("description", $("input#description").val());
    data.append("service_id", $("#dropdown-menu div.selected").data("id"));
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
                                <div class="w-10 h-10 flex-shrink-0 mr-2 sm:mr-3"><img class="rounded-full w-full h-full" src="${res.data.data.image}" width="40" height="40" alt="Alex Shatov"></div>
                                <div class="font-medium text-gray-800">${res.data.data.name}</div>
                            </div>
                        </td>
                        <td class="p-2 whitespace-nowrap">
                            <div class="text-left">${res.data.data.services.name}</div>
                        </td>
                        <td class="p-2 whitespace-nowrap">
                            <div class="text-left">${res.data.data.description}</div>
                        </td>
                        <td class="p-2 whitespace-nowrap">
                            <div class="text-lg text-center">
                                <box-icon type='solid' name='edit' class="cursor-pointer"></box-icon>
                                <box-icon name='trash' name='delete' class="cursor-pointer" ></box-icon>
                            </div>
                        </td>
                    </tr>
                `;
            $("#category-big-admin-table").prepend(html);
            closeModalCreateCategoryBigAdmin();
            break;
    }
}
