$(function () {
    loadData();
});

function loadData() {
    getOrderAdmin(-1);
}

async function getOrderAdmin(order_id) {
    let method = "get",
        url = "/order.data",
        params = { order_id },
        data = null;
    let res = await axiosTemplate(method, url, params, data);
    switch (res.data.status) {
        case 200:
            console.log(res.data.data);
            let eleOrder = res.data.data.map(
                (order) => `
                    <tr>
                        <td class="p-2 whitespace-nowrap">
                            <div class="flex items-center">
                                <div class="w-10 h-10 flex-shrink-0 mr-2 sm:mr-3"><img class="rounded-full w-full h-full" src="${order.order_products['id']}" width="40" height="40" alt="Alex Shatov"></div>
                                <div class="slice-text font-medium text-gray-800">${order.order_products['id']}</div>
                            </div>
                        </td>
                        <td class="p-2 whitespace-nowrap">
                            <div class="text-left slice-text">${order.created_at}</div>
                        </td>
                        <td class="p-2 whitespace-nowrap">
                            <div class="text-lg text-center">
                                <box-icon type='solid' name='edit' class="cursor-pointer" onclick=""></box-icon>
                                <box-icon name='trash' class="cursor-pointer" data-id="${order.id}" onclick="deleteCategoryBigAdmin($(this))"></box-icon>
                                </div>
                        </td>
                    </tr>
                `
            );

            $("#order-admin-table").html(eleOrder);
            break;
    }
}