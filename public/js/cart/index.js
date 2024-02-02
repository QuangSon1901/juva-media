let tabCart = 0;

$(function () {
    getItemsCart();
});

async function getItemsCart() {
    let cartDataString = localStorage.getItem("cart");
    
    let cartData = [];

    if (cartDataString) {
         cartData = JSON.parse(cartDataString);
    }
    
    let method = "post",
        url = "/get-items-cart",
        params = null,
        data = {
            cart: cartData,
        };

    let res = await axiosTemplate(method, url, params, data);
    switch (res.data.status) {
        case 200:
            let eleServiceCategories = res.data.data.data.map(
                (product) => `
                <li class=" p-2 border border-dashed hover:border-gray-400 rounded-md product-in-cart">
                <div class="flex justify-between">
                    <div class="flex space-x-2">
                        <img class="w-20 h-20 object-contain rounded-md border border-neutral-200" src="${
                            product.product_image
                        }" alt="">
                        <div class="flex space-x-8">
                            <div>
                                <p class="font-semibold">${
                                    product.product_name
                                }</p>
                                <p><span class="total-product-in-cart">${
                                    product.product_total
                                }</span> <sup class="font-semibold">đ</sup></p>
                                <div class="flex text-sm space-x-4 text-neutral-500">
                                    <div data-id="${
                                        product.product_id
                                    }" class="cursor-pointer"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="">
                        <div class="flex space-x-6 items-center">
                            <div>
                                <p data-id="${
                                    product.product_id
                                }" class="underline text-neutral-500 cursor-pointer" onclick="removeProductCart($(this))">Xoá</p>
                            </div>
                        </div>
                    </div>
                </div>
                <ul class="grid grid-cols-1 gap-4 pl-10 py-4 product-photography-list">
                ${product.list.map(
                    (photography) => `
                    <li class="flex justify-between product-photography-item">
                        <div class="flex space-x-2">
                            <img class="w-10 h-10 object-contain rounded-md border border-neutral-200" src="${photography.photography_image}" alt="">
                            <div class="flex space-x-8">
                                <div>
                                    <p class="text-sm font-semibold">${photography.photography_title}</p>
                                    <p class="text-sm">${photography.photography_price_unit} <sup class="font-semibold">đ</sup></p>
                                </div>
                            </div>
                        </div>
                        <div>
                            <div class="flex items-center space-x-2 quantity-action" data-id="${product.product_id}">
                                <div class="select-none w-5 h-5 rounded-full border border-neutral-200 flex items-center justify-center cursor-pointer"  onclick="decreaseQuantityCart($(this))">
                                    <div>-</div>
                                </div>
                                <div>
                                    <input type="text" class="select-none w-12 h-8 bg-neutral-300 border border-neutral-500 text-center outline-none rounded-sm" disabled data-price="${photography.price}" data-id="${photography.photography_id}" value="${photography.quantity}">
                                </div>
                                <div class="select-none w-5 h-5 rounded-full border border-neutral-200 flex items-center justify-center cursor-pointer"  onclick="increaseQuantityCart($(this))">
                                    <div>+</div>
                                </div>
                            </div>
                        </div>
                    </li> `
                ).join('')}
                </ul>
            </li>
                `
            );
            $(".cart-total").text(res.data.data.total);
            $(".cart-total-all").text(res.data.data.total);
            $("#cart-items").html(eleServiceCategories);
            break;
    }
}

async function increaseQuantityCart(r) {
    let inputEle = r.parents(".quantity-action").find("input");
    inputEle.val(Number(inputEle.val()) + 1);
    updateQuantityCart(inputEle.data("id"), Number(inputEle.val()), r, 0);
}

function decreaseQuantityCart(r) {
    let inputEle = r.parents(".quantity-action").find("input");
    if (Number(inputEle.val()) > 0) {
        inputEle.val(Number(inputEle.val()) - 1);
        updateQuantityCart(inputEle.data("id"), Number(inputEle.val()), r, 1);
    }
}

async function updateQuantityCart(photography_id, quantity, r, type) {
    let inputEle = r.parents(".quantity-action").find("input");
    let cartData = JSON.parse(localStorage.getItem("cart")) || [];
    let totalCartOld = removeformatNumber(
        r.parents(".cart").find(".cart-total-all").text()
    );
    let totalCartNew =
        type === 0
            ? Number(totalCartOld) + Number(inputEle.data("price"))
            : Number(totalCartOld) - Number(inputEle.data("price"));

    r.parents(".cart").find(".cart-total-all").text(formatNumber(totalCartNew));
    r.parents(".cart").find(".cart-total").text(formatNumber(totalCartNew));

    if (quantity <= 0) {
        if (
            r
                .parents(".product-photography-list")
                .find(".product-photography-item").length <= 1
        ) {
            r.parents(".product-in-cart").remove();
            $("#cart-quantity-header").text(
                Number($("#cart-quantity-header").text()) - 1
            );
            removeProductFromCart(r.parents(".quantity-action").data("id"));
        } else {
            r.parents(".product-photography-item").remove();
            removePhotoFromCart(photography_id);
        }
    } else {
        let totalProductOld = removeformatNumber(
            r.parents(".product-in-cart").find(".total-product-in-cart").text()
        );
        let totalProductNew =
            type === 0
                ? Number(totalProductOld) + Number(inputEle.data("price"))
                : Number(totalProductOld) - Number(inputEle.data("price"));

        r.parents(".product-in-cart")
            .find(".total-product-in-cart")
            .text(formatNumber(totalProductNew));

        let cartItem = cartData.find((item) =>
            item.photos.some((photo) => photo.id === photography_id)
        );
        if (cartItem) {
            cartItem.photos.forEach((photo) => {
                if (photo.id === photography_id) {
                    photo.quantity = quantity;
                }
            });
        }

        localStorage.setItem("cart", JSON.stringify(cartData));
    }

    // Kiểm tra xem có ít nhất một sản phẩm nào đó có photos.quantity khác 0 hay không
    let checkQuantityAll = cartData.some((item) =>
        item.photos.every((photo) => photo.quantity === 0)
    );
    if (checkQuantityAll) {
        removeProductFromCart(r.parents(".quantity-action").data("id"));
    }

    let method = "post",
        url = "/change-quantity-in-cart",
        params = null,
        data = {
            photography_id,
            quantity,
        };

    await axiosTemplate(method, url, params, data);
}
//Xóa photo khi có quanty bằng 0
function removePhotoFromCart(photography_id) {
    let cartData = JSON.parse(localStorage.getItem("cart")) || [];

    // Duyệt qua từng phần tử trong giỏ hàng để tìm và loại bỏ photos.id có quantity === 0
    cartData.forEach((item) => {
        item.photos = item.photos.filter(
            (photo) => photo.id !== photography_id
        );
    });

    cartData = cartData.filter((item) => item.photos.length > 0);
    localStorage.setItem("cart", JSON.stringify(cartData));
}
//Xóa product khi tất cả quantity bằng 0
function removeProductFromCart(product_id) {
    let cartData = JSON.parse(localStorage.getItem("cart")) || [];

    let updatedCartData = cartData.filter(
        (item) => item.product_id !== product_id
    );

    localStorage.setItem("cart", JSON.stringify(updatedCartData));
}

async function removeProductCart(r) {
    let totalProduct = removeformatNumber(
        r.parents(".product-in-cart").find(".total-product-in-cart").text()
    );
    let totalCartOld = removeformatNumber(
        r.parents(".cart").find(".cart-total-all").text()
    );
    let totalCartNew = Number(totalCartOld) - Number(totalProduct);

    r.parents(".cart").find(".cart-total-all").text(formatNumber(totalCartNew));
    r.parents(".cart").find(".cart-total").text(formatNumber(totalCartNew));

    r.parents(".product-in-cart").remove();
    $("#cart-quantity-header").text(
        Number($("#cart-quantity-header").text()) - 1
    );

    let method = "post",
        url = "/remove-product-in-cart",
        params = null,
        data = {
            product_id: r.data("id"),
        };

    await axiosTemplate(method, url, params, data);

    let cartData = JSON.parse(localStorage.getItem("cart")) || [];
    let cartItem = cartData.filter((item) => item.product_id != r.data("id"));

    localStorage.setItem("cart", JSON.stringify(cartItem));
}

async function orderFunction() {
    if (tabCart == 0) {
        $(".cart-list").addClass("hidden");
        $(".form-order").removeClass("hidden");
        $(".cart-back").removeClass("hidden");
        tabCart = 1;
        return;
    }
    if (!checkValidateSave($("#delivery-information-form"))) return false;
    let cartData = JSON.parse(localStorage.getItem("cart")) || [];
    let method = "post",
        url = "/order",
        params = null,
        data = {
            name: $("#form-order-name").val().trim(),
            phone: $("#form-order-phone").val().trim(),
            email: $("#form-order-email").val().trim(),
            address: $("#form-order-address").val().trim(),
            cart: cartData,
        };

    let res = await axiosTemplate(method, url, params, data);
    switch (res.data.status) {
        case 200:
            if (!res.data.isAuth) {
                $(".cart").addClass("hidden");
                $(".order-success").removeClass("hidden");
                const updatedCartJson = JSON.stringify([]);
                localStorage.setItem("cart", updatedCartJson);
                loadCartCount();
            }
            $(".cart").addClass("hidden");
            $(".order-success").removeClass("hidden");
            $("#cart-quantity-header").text(0);
            break;
    }
}

function backOrderFunction() {
    $(".cart-list").removeClass("hidden");
    $(".form-order").addClass("hidden");
    $(".cart-back").addClass("hidden");
    tabCart = 0;
}
