$(function () {
    loadData();
});

function loadData() {
    getProductAdmin(-1);
}
let currentPage;
async function getProductAdmin(id, page) {
    let method = "get",
        url = "/product.data",
        params = { id, page },
        data = null;
    let res = await axiosTemplate(method, url, params, data);
    switch (res.data.status) {
        case 200:
            let eleProducts = res.data.data.data.map(
                (product) => `
                    <tr>
                        <td class="p-2 whitespace-nowrap">
                            <div class="flex items-center">
                                <div class="w-10 h-10 flex-shrink-0 mr-2 sm:mr-3"><img class="rounded-full w-full h-full" src="${
                                    product.image.split(" ")[0]
                                }" width="40" height="40" alt="Alex Shatov"></div>
                                <div class="font-medium text-gray-800 slice-text">${
                                    product.name
                                }</div>
                            </div>
                        </td>
                        <td class="p-2 whitespace-nowrap">
                            <div class="text-left slice-text">${
                                product.service_categories.name
                            }</div>
                        </td>
                        <td class="p-2 whitespace-nowrap">
                            <div class="text-left slice-text">${
                                product.product_categories.title
                            }</div>
                        </td>
                        <td class="p-2 whitespace-nowrap">
                            <div class="text-left slice-text">${
                                product.description
                            }</div>
                        </td>
                        <td class="p-2 whitespace-nowrap">
                            <div class="text-lg text-center">
                                <box-icon type='solid' name='edit' class="cursor-pointer" onclick="getDetailProductAdmin(${
                                    product.id
                                })"></box-icon>
                                <box-icon name='trash' class="cursor-pointer" data-id="${
                                    product.id
                                }" onclick="deleteProductAdmin($(this))"></box-icon>
                                </div>
                        </td>
                    </tr>
                `
            );

            $("#product-admin-table").html(eleProducts);
            displayPagination(res.data.data);
            break;
    }
}

function displayPagination(paginationData) {
    const totalPages = paginationData.last_page;
    const currentPage = paginationData.current_page;

    const paginationContainer = $("#pagination");
    paginationContainer.empty();

    // Số trang hiển thị xung quanh trang hiện tại
    const visiblePages = 3;

    // Tính toán các trang xung quanh trang hiện tại
    let startPage = Math.max(currentPage - Math.floor(visiblePages / 2), 2);
    let endPage = Math.min(startPage + visiblePages - 1, totalPages);

    paginationContainer.append(`
            <li>
                <a href="#" onclick="setCurrentPage(${
                    currentPage - 1
                })" class="py-2 px-4 border border-gray-300 rounded"> <- </a>
            </li>

            <li>
                <a href="#" onclick="setCurrentPage(1)" class="py-2 px-4 border border-gray-300 rounded">1</a>
            </li>
    `);

    if (startPage > 2) {
        paginationContainer.append(`
            <li>
                <span class="py-2 px-4 rounded">...</span>
            </li>
        `);
    }

    // Hiển thị các trang xung quanh trang hiện tại
    for (let i = startPage; i <= endPage; i++) {
        const activeClass = i === currentPage ? 'bg-blue-500 text-white' : 'border border-gray-300';
        paginationContainer.append(`
            <li>
                <a href="#" onclick="setCurrentPage(${i})" class="py-2 px-4 ${activeClass} rounded">${i}</a>
            </li>
        `);
    }

    if (endPage < totalPages - 1) {
        paginationContainer.append(`
            <li>
                <span class="py-2 px-4 rounded">...</span>
            </li>
        `);
    }

    paginationContainer.append(`
        <li>
            <a href="#" onclick="setCurrentPage(${totalPages})" class="py-2 px-4 border border-gray-300 rounded">${totalPages}</a>
        </li>

        <li>
            <a href="#" onclick="setCurrentPage(${
                currentPage + 1
            })" class="py-2 px-4 border border-gray-300 rounded"> -> </a>
        </li>
    `);
}

// Hàm để cập nhật currentPage
function setCurrentPage(page) {
    currentPage = page;
    getProductAdmin(-1, currentPage);
}

async function getDetailProductAdmin(id) {
    let method = "get",
        url = "/product.data",
        params = { id },
        data = null;
    let res = await axiosTemplate(method, url, params, data);
    switch (res.data.status) {
        case 200:
            $("#modal-update-product-admin input#update-product_id").val(id);
            $("#modal-update-product-admin input#name").val(res.data.data.name);
            $("#modal-update-product-admin input#price").val(
                res.data.data.price
            );

            $("#cate-update > span").text(
                res.data.data.service_categories.name
            );
            $("#modal-update-product-admin .category-menu div[data-id]").each(
                function () {
                    const dataId = $(this).data("id");

                    if (dataId && dataId == res.data.data.service_category_id) {
                        $(this).addClass("selected");
                    }
                }
            );

            $("#type-update > span").text(
                res.data.data.product_categories.title
            );
            $("#modal-update-product-admin .type-menu div[data-id]").each(
                function () {
                    const dataId = $(this).data("id");

                    if (dataId && dataId == res.data.data.product_category_id) {
                        $(this).addClass("selected");
                    }
                }
            );

            CKEDITOR.instances["description-update"].setData(
                res.data.data.description
            );
            //Product photography
            const graphyEle = res.data.data.product_photography.map(
                (graphy) => `
                <li data-id="${graphy.photography.id}" data-text="${graphy.photography.title}" class="graphy-item flex rounded-md bg-gray-50 border border-[#d1d1d1] p-1 justify-between items-center pr-4">
                    <div class="flex gap-2">
                        <div class="!w-10 !h-10 object-cover rounded-md graphy-item-image-group">
                            <input type="file" class="hidden graphy-item-file-input" accept="image/png, image/jpg, image/jpeg, image/webp" data-file="1">
                            <img class="!w-10 !h-10 object-cover rounded-md cursor-pointer graphy-item-image" src="${graphy.image}" alt="">
                        </div>
                        <div class="flex flex-col">
                            <label for="">${graphy.photography.title}</label>
                            <div><input type="text" value="${graphy.price}" class="text-end graphy-price">&nbsp;đ</div>
                        </div>
                    </div>
                    <div class="graphy-remove cursor-pointer">
                        <box-icon color="red" name='trash'></box-icon>
                    </div>
                </li>
            `
            );
            $("#modal-update-product-admin .graphy-list").append(graphyEle);
            $("#modal-update-product-admin .graphy-menu div[data-id]").each(
                function () {
                    const dataId = $(this).data("id");
                    res.data.data.product_photography.forEach((graphy) => {
                        if (dataId && dataId == graphy.photography.id) {
                            $(this).remove();
                        }
                    });
                }
            );

            $("#main-empty-update-product").remove();
            $("#more-empty-update-product").remove();

            const imageArr = res.data.data.image.split(" ");
            const imageNewArr = imageArr.filter((img) => img.trim() !== "");
            const mainImage = imageNewArr[0];
            const moreImage = imageNewArr.slice(1);
            //Main image
            $("#main-gallery-update-product").append(
                `<img class="block p-1 w-1/4 h-auto" src="${mainImage}" alt="Main Image">`
            );
            mainUpdateImageURL = mainImage;
            //More image
            const liEle = moreImage.map(
                (img) =>
                    `<li class="block p-1 w-1/4 h-auto"><img src="${img}" alt="More Image"></li>`
            );
            $("#more-gallery-update-product").append(liEle);

            openModalUpdateProductAdmin();
            break;
    }
}
async function deleteProductAdmin(r) {
    let method = "post",
        url = "/product.delete",
        params = null,
        data = { id: r.data("id") };
    let res = await axiosTemplate(method, url, params, data);
    switch (res.data.status) {
        case 200:
            r.parents("tr").remove();
            break;
    }
}
