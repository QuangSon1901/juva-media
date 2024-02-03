// const { result } = require("lodash");
let dataPhotoSelected = [];
function increaseQuantity(r) {
    let inputEle = r.parents(".quantity-action").find("input");
    inputEle.val(Number(inputEle.val()) + 1);

    let photoCheck = dataPhotoSelected.find(
        (item) => item.id == inputEle.data("id")
    );
    if (!photoCheck) {
        dataPhotoSelected.push({
            id: inputEle.data("id"),
            price: inputEle.data("price"),
            quantity: Number(inputEle.val()),
        });
    } else {
        photoCheck.quantity = Number(inputEle.val());
        let index = dataPhotoSelected.indexOf(photoCheck);
        if (index !== -1) {
            dataPhotoSelected[index] = photoCheck;
        }
    }
    totalPhotoSelected();
}

function decreaseQuantity(r) {
    let inputEle = r.parents(".quantity-action").find("input");
    let photoCheck = dataPhotoSelected.find(
        (item) => item.id == inputEle.data("id")
    );
    if (Number(inputEle.val()) > 0) {
        inputEle.val(Number(inputEle.val()) - 1);
        photoCheck.quantity = Number(inputEle.val());
        let index = dataPhotoSelected.indexOf(photoCheck);
        if (index !== -1) {
            dataPhotoSelected[index] = photoCheck;
        }
        totalPhotoSelected();

        if (Number(inputEle.val()) == 0) {
            if (index !== -1) {
                dataPhotoSelected.splice(index, 1);
            }
        }
    }
}

function totalPhotoSelected() {
    let total = dataPhotoSelected.reduce(
        (pre, curr) => (pre += curr.price * curr.quantity),
        0
    );
    $("#product-total-selected").text(formatNumber(total));
}

async function addToCart(r) {
    if (dataPhotoSelected.length <= 0) {
        Swal.fire({
            position: "center",
            icon: "warning",
            title: "Xin chọn số lượng sản phẩm",
            showConfirmButton: true,
            timer: 1500,
            confirmButtonText: "OK",
        });
        return false;
    }
    let method = "post",
        url = "/add-to-cart",
        params = null,
        data = {
            product_id: r.data("id"),
            data_photo_selected: dataPhotoSelected,
        };
    let res = await axiosTemplate(method, url, params, data);
    switch (res.data.status) {
        case 200:
            Swal.fire({
                position: "center",
                icon: "success",
                title: res.data.message,
                showConfirmButton: true,
                timer: 1500,
                confirmButtonText: "OK",
            });

            if (!res.data.isAuth) {
                const existingCart = JSON.parse(localStorage.getItem("cart")) || [];
            
                const newProducts = res.data.cart;
                newProducts.forEach(newProduct => {
                    const existingProduct = existingCart.find(product => product.product_id === newProduct.product_id);
            
                    if (!existingProduct) {
                        existingCart.push(newProduct);
                    } 
                });
                // Lưu giỏ hàng mới vào localStorage
                const updatedCartJson = JSON.stringify(existingCart);
                localStorage.setItem("cart", updatedCartJson);
            }

            $("#cart-quantity-header").text(res.data.quantity_cart);
            // loadCartCount()
            break;
    }
}

