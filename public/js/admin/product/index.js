$(function () {
    loadData();
});

function loadData() {
    getProductAdmin(-1);
}

async function getProductAdmin(id) {
    let method = "get",
        url = "/product.data",
        params = { id },
        data = null;
    let res = await axiosTemplate(method, url, params, data);
    switch (res.data.status) {
        case 200:
            let eleProducts = res.data.data.map(
                (product) => `
                    <tr>
                        <td class="p-2 whitespace-nowrap">
                            <div class="flex items-center">
                                <div class="w-10 h-10 flex-shrink-0 mr-2 sm:mr-3"><img class="rounded-full w-full h-full" src="${product.image.split(" ")[0]}" width="40" height="40" alt="Alex Shatov"></div>
                                <div class="font-medium text-gray-800 slice-text">${product.name}</div>
                            </div>
                        </td>
                        <td class="p-2 whitespace-nowrap">
                            <div class="text-left slice-text">${product.service_categories.name}</div>
                        </td>
                        <td class="p-2 whitespace-nowrap">
                            <div class="text-left slice-text">${product.product_categories.title}</div>
                        </td>
                        <td class="p-2 whitespace-nowrap">
                            <div class="text-left slice-text">${product.description}</div>
                        </td>
                        <td class="p-2 whitespace-nowrap">
                            <div class="text-lg text-center">
                                <box-icon type='solid' name='edit' class="cursor-pointer" onclick="getDetailProductAdmin(${product.id})"></box-icon>
                                <box-icon name='trash' class="cursor-pointer" data-id="${product.id}" onclick="deleteCategoryBigAdmin($(this))"></box-icon>
                                </div>
                        </td>
                    </tr>
                `
            );

            $("#product-admin-table").html(eleProducts);
            break;
    }
}
async function getDetailProductAdmin(id) {
    let method = "get",
        url = "/product.data",
        params = { id },
        data = null;
    let res = await axiosTemplate(method, url, params, data);
    switch (res.data.status) {
        case 200:
            $("#modal-update-category-big-admin input#update-id").data("id", res.data.data.id);
            openModalUpdateProductAdmin()
            break;
    }
}
