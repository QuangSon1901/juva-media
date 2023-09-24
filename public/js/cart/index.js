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
        } else {
            r.parents(".product-photography-item").remove();
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

async function removeProductCart(r) {
    let totalProduct = removeformatNumber(
        r.parents(".product-in-cart").find(".total-product-in-cart").text()
    );
    let totalCartOld = removeformatNumber(
        r.parents(".cart").find(".cart-total-all").text()
    );
    let totalCartNew = Number(totalCartOld) - Number(totalProduct)

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
}
