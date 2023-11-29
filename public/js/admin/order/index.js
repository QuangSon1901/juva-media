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
            let eleOrder = res.data.data.map((order) =>` 
            <tr>
                <td class="p-2 whitespace-nowrap">
                ${order.order_products.map((orderProduct) => {
                        return `
                            <div class="flex items-center">
                                <div class="w-10 h-10 flex-shrink-0 mr-2 sm:mr-3">
                                    <img class="rounded-full w-full h-full" src="${orderProduct.product.image.split(" ")[0]}" width="40" height="40" alt="Product Image">
                                </div>
                                <div class="font-medium text-gray-800 slice-text">${orderProduct.product.name}</div>
                            </div>
                        `;
                }).join('')}
                </td>
               
                <td class="p-2 whitespace-nowrap">
                    <div class="text-lg text-center">
                        <box-icon type='solid' name='edit' class="cursor-pointer" "></box-icon>
                        <box-icon name='trash' class="cursor-pointer" "></box-icon>
                        </div>
                </td>
            </tr>
            `);

            $("#order-admin-table").html(eleOrder);
            break;
    }
}
