$(function () {
    loadData();
});

function loadData() {
    getCategoryBigAdmin(-1);
}

async function getCategoryBigAdmin(service_id) {
    let method = "get",
        url = "/get-categories-of-service",
        params = { service_id },
        data = null;
    let res = await axiosTemplate(method, url, params, data);
    switch (res.data.status) {
        case 200:
            let eleServiceCategories = res.data.data.map(
                (service) => `
                    <tr>
                        <td class="p-2 whitespace-nowrap">
                            <div class="flex items-center">
                                <div class="w-10 h-10 flex-shrink-0 mr-2 sm:mr-3"><img class="rounded-full w-full h-full" src="${service.image}" width="40" height="40" alt="Alex Shatov"></div>
                                <div class="slice-text font-medium text-gray-800">${service.name}</div>
                            </div>
                        </td>
                        <td class="p-2 whitespace-nowrap">
                            <div class="text-left slice-text">${service.services.name}</div>
                        </td>
                        <td class="p-2 whitespace-nowrap">
                            <div class="text-left slice-text">${service.description}</div>
                        </td>
                        <td class="p-2 whitespace-nowrap">
                            <div class="text-lg text-center">
                                <box-icon type='solid' name='edit' class="cursor-pointer"></box-icon>
                                <box-icon name='trash' class="cursor-pointer" data-id="${service.id}" onclick="deleteCategoryBigAdmin($(this))"></box-icon>
                                </div>
                        </td>
                    </tr>
                `
            );

            $("#category-big-admin-table").html(eleServiceCategories);
            break;
    }
}

async function deleteCategoryBigAdmin(r) {
    let method = "post",
        url = "/category-big.delete",
        params = null,
        data = { id: r.data('id') };
    let res = await axiosTemplate(method, url, params, data);
    switch (res.data.status) {
        case 200:
            r.parents('tr').remove()
            break;
    }
}