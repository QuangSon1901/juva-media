let checkCreateProduct = 0, mainImageURL = "";
let emptyImageMain = document.getElementById("main-empty-create-product"),
    emptyImageMore = document.getElementById("more-empty-create-product")

$(function () {
    $("#modal-create-product-admin .dropdown-button").on("click", function () {
        $(this)
            .parents(".select-group")
            .find(".dropdown-menu")
            .toggleClass("hidden");
    });

    $("#modal-create-product-admin .search-input").on("input", function () {
        const searchTerm = $(this).val().toLowerCase();
        const items = $(this).parents(".dropdown-menu").find("div");

        items.each((index, item) => {
            const text = $(item).text();
            if (text.includes(searchTerm)) {
                $(item).css("display", "block");
            } else {
                $(item).css("display", "none");
            }
        });
    });

    $('#modal-create-product-admin .upload-btn').on('click', function () {
        $(this).next('input').click()
    })

    $('#main-image-create-product').on('change',async function () {
        let gallery = document.getElementById("main-gallery-create-product")
        gallery.innerHTML = ""
        addFile(gallery, emptyImageMain, $(this).prop('files')[0], URL.createObjectURL($(this).prop('files')[0]))
        gallery.onclick = ({
            target
        }) => {
            if (target.classList.contains("delete")) {
                const ou = target.dataset.target;
                document.getElementById(ou).remove(ou);
                gallery.children.length === 0 && gallery.append(emptyImageMain)
                mainImageURL = "";
            }
        };

        let res = await uploadMediaTemplate($(this).prop('files')[0], 0);
        switch (res.data.status) {
            case 200:
                mainImageURL = res.data.data
                break;
            default: 
                alert('Upload ảnh bị lỗi, vui lòng thử lại!')
        }
        $(this).replaceWith($(this).val('').clone(true));
    })

    $('#more-image-create-product').on('change',async function () {
        let gallery = document.getElementById("more-gallery-create-product")
        jQuery.each($(this).prop('files'), async function (i, v) {
            let res = await uploadMediaTemplate($(v)[0], 0);
            addFile(gallery, emptyImageMore, $(v)[0], res.data.data)
        })
        gallery.onclick = ({
            target
        }) => {
            if (target.classList.contains("delete")) {
                const ou = target.dataset.target;
                document.getElementById(ou).remove(ou);
                gallery.children.length === 0 && gallery.append(emptyImageMore)
                mainImageURL = "";
            }
        };
        $(this).replaceWith($(this).val('').clone(true));
    })

    $("#modal-create-product-admin").on("focus", "input", function () {
        $(this).select();
    });

    $("#modal-create-product-admin").on("click", ".graphy-remove", function () {
        let graphy = $(this).parents(".graphy-item");
        $("#modal-create-product-admin .graphy-menu").append(`
            <div data-id="${graphy.data(
                "id"
            )}" class="block px-4 py-2 text-gray-700 hover:bg-gray-100 active:bg-blue-100 cursor-pointer rounded-md">${graphy.data("text")}</div>
        `);

        graphy.remove();
    });

    $("#modal-create-product-admin").on(
        "click",
        ".graphy-item-image",
        function () {
            $(this).parents(".graphy-item-image-group").find("input").click();
        }
    );

    $("#modal-create-product-admin").on(
        "change",
        ".graphy-item-file-input",
        async function () {
            $(this).parents(".graphy-item-image-group").find(".graphy-item-image").attr("src", URL.createObjectURL($(this).prop("files")[0]));

            let res = await uploadMediaTemplate($(this).prop('files')[0], 0);
            switch (res.data.status) {
                case 200:
                    $(this).parents(".graphy-item-image-group").find(".graphy-item-image").attr("src", res.data.data);
                    break;
                default: 
                    alert('Upload ảnh bị lỗi, vui lòng thử lại!')
            }
            $(this).replaceWith($(this).val('').clone(true));
        }
    );

    $("#modal-create-product-admin").on("click", ".category-menu div, .type-menu div", function () {
        $(this)
            .parents(".dropdown-menu")
            .find("div.selected")
            .removeClass("selected");
        $(this).addClass("selected");
        $(this)
            .parents(".select-group")
            .find(".dropdown-button span")
            .text($(this).text());
        $(this)
            .parents(".select-group")
            .find(".dropdown-button")
            .click();
    });

    $("#modal-create-product-admin").on("click", ".graphy-menu div", function () {
        $("#modal-create-product-admin .graphy-list").append(`
            <li data-id="${$(this).data(
                "id"
            )}" data-text="${$(this).text()}" class="graphy-item flex rounded-md bg-gray-50 border border-[#d1d1d1] p-1 justify-between items-center pr-4">
                <div class="flex gap-2">
                    <div class="!w-10 !h-10 object-cover rounded-md graphy-item-image-group">
                        <input type="file" class="hidden graphy-item-file-input" accept="image/png, image/jpg, image/jpeg, image/webp" data-file="1">
                        <img class="!w-10 !h-10 object-cover rounded-md cursor-pointer graphy-item-image" src="/images/images/9261177.png" alt="">
                    </div>
                    <div class="flex flex-col">
                        <label for="">${$(this).text()}</label>
                        <div><input type="text" value="0" class="text-end graphy-price">&nbsp;đ</div>
                    </div>
                </div>
                <div class="graphy-remove cursor-pointer">
                    <box-icon color="red" name='trash'></box-icon>
                </div>
            </li>
        `);
        $(this)
            .parents(".select-group")
            .find(".dropdown-button")
            .click();
        $(this).remove()
    });

    CKEDITOR.replace("description", {
        filebrowserBrowseUrl: "{{ route('ckfinder_browser') }}",
        filebrowserImageBrowseUrl:
            "{{ route('ckfinder_browser') }}?type=Images&token=123",
        filebrowserFlashBrowseUrl:
            "{{ route('ckfinder_browser') }}?type=Flash&token=123",
        filebrowserUploadUrl:
            "{{ route('ckfinder_connector') }}?command=QuickUpload&type=Files",
        filebrowserImageUploadUrl:
            "{{ route('ckfinder_connector') }}?command=QuickUpload&type=Images",
        filebrowserFlashUploadUrl:
            "{{ route('ckfinder_connector') }}?command=QuickUpload&type=Flash",
    });

    getDataProductAdmin();
});

async function getDataProductAdmin() {
    let method = "get",
        url = "/product.data-create",
        params = null,
        data = null;
    let res = await axiosTemplate(method, url, params, data);
    switch (res.data.status) {
        case 200:
            let eleCategory = res.data.data.category.map(
                (category) => `
                    <div data-id="${category.id}" class="block px-4 py-2 text-gray-700 hover:bg-gray-100 active:bg-blue-100 cursor-pointer rounded-md">${category.name}</div>
                `
            );

            let eleType = res.data.data.type.map(
                (type) => `
                    <div data-id="${type.id}" class="block px-4 py-2 text-gray-700 hover:bg-gray-100 active:bg-blue-100 cursor-pointer rounded-md">${type.title}</div>
                `
            );

            let eleGraphy = res.data.data.graphy.map(
                (graphy) => `
                    <div data-id="${graphy.id}" class="block px-4 py-2 text-gray-700 hover:bg-gray-100 active:bg-blue-100 cursor-pointer rounded-md">${graphy.title}</div>
                `
            );

            $(".category-menu").append(eleCategory);
            $(".type-menu").append(eleType);
            $("#modal-create-product-admin .graphy-menu").append(eleGraphy);
            $("#modal-update-product-admin .graphy-menu").append(eleGraphy);
            
            break;
    }
}

function openModalCreateProductAdmin() {
    $("#modal-create-product-admin").removeClass("hidden");
    $("#modal-create-product-admin").addClass("flex");
}

function closeModalCreateProductAdmin() {
    $("#modal-create-product-admin").addClass("hidden");
    $("#modal-create-product-admin").removeClass("flex");
    resetModalCreateProductAdmin();
    removeAllValidate()
}

function resetModalCreateProductAdmin() {
    $("#modal-create-product-admin input#name").val("")
    $("#modal-create-product-admin input#price").val(0)
    $("#modal-create-product-admin .category-menu div.selected").removeClass('selected')
    $("#modal-create-product-admin .category-menu").parents('.select-group').find('span').text('Danh mục')
    $("#modal-create-product-admin .type-menu div.selected").removeClass('selected')
    $("#modal-create-product-admin .type-menu").parents('.select-group').find('span').text('Danh mục')
    $("#modal-create-product-admin .graphy-menu div.selected").removeClass('selected')
    $("#modal-create-product-admin .graphy-menu").parents('.select-group').find('span').text('Danh mục')
    $("#modal-create-product-admin .graphy-list li").each((index, item) => {
        $("#modal-create-product-admin .graphy-menu").append(`
            <div data-id="${$(item).data('id')}" class="block px-4 py-2 text-gray-700 hover:bg-gray-100 active:bg-blue-100 cursor-pointer rounded-md">${$(item).data('text')}</div>
        `);
    })
    mainImageURL = "";

    $("#modal-create-product-admin .graphy-list").html("");
    CKEDITOR.instances['description'].setData('')

    $('#main-gallery-create-product').html(emptyImageMain.outerHTML)
    $('#more-gallery-create-product').html(emptyImageMore.outerHTML)
}

async function saveModalCreateProductAdmin() {
    if (checkCreateProduct === 1) return;
    if(!checkValidateSave($('#modal-create-product-admin'))) return false

    if (!$("#modal-create-product-admin .category-menu div.selected").data("id")) {
        alert('Vui lòng chọn danh mục')
        return
    }

    if (!$("#modal-create-product-admin .type-menu div.selected").data("id")) {
        alert('Vui lòng chọn loại sản phẩm')
        return
    }

    let graphy = $("#modal-create-product-admin .graphy-list li")
    if (graphy.length === 0) {
        alert('Vui lòng chọn góc chụp')
        return
    }

    if (mainImageURL === '') {
        alert('Vui lòng chọn ảnh chính')
        return
    }

    if ($('#more-gallery-create-product li:not(#more-empty-create-product)').length === 0) {
        alert('Vui lòng chọn ảnh phụ')
        return
    }
    if(CKEDITOR.instances["description"].getData() === ""){
        alert('Vui lòng nhập mô tả')
        return
    }
    
    graphy = graphy.map((index, item) => ({
        id: $(item).data("id"),
        title: $(item).data("text"),
        price: $(item).find(".graphy-price").val(),
        description: "",
        image: $(item).find(".graphy-item-image").attr("src"),
    }));

    let imageMore = $('#more-gallery-create-product li:not(#more-empty-create-product)').map((index, item) => $(item).find("img").attr("src")).get().join(' ')

    let data = {
        name: $("#modal-create-product-admin input#name").val(),
        price: $("#modal-create-product-admin input#price").val(),
        service_category_id: $("#modal-create-product-admin .category-menu div.selected").data("id"),
        product_category_id: $("#modal-create-product-admin .type-menu div.selected").data("id"),
        description: CKEDITOR.instances["description"].getData(),
        main_image: mainImageURL,
        image_more: imageMore,
        graphy: graphy.toArray(),
    }

    // let data = new FormData();
    // data.append("name", $("#modal-create-product-admin input#name").val());
    // data.append("price", $("#modal-create-product-admin input#price").val());
    // data.append(
    //     "service_category_id",
    //     $("#modal-create-product-admin .category-menu div.selected").data("id")
    // );
    // data.append(
    //     "product_category_id",
    //     $("#modal-create-product-admin .type-menu div.selected").data("id")
    // );
    // data.append("description", CKEDITOR.instances["description"].getData());

    // graphy.each((index, item) => {
    //     data.append(`graphy[${index}][title]`, item.title);
    //     data.append(`graphy[${index}][id]`, item.id);
    //     data.append(`graphy[${index}][description]`, item.description);
    //     data.append(`graphy[${index}][price]`, item.price);
    //     data.append(`graphy[${index}][image]`, item.image);
    // });

    // let files = Object.values(FILES).reverse();
    // $(files).each((index, item) => {
    //     data.append(`image[${index}]`, item);
    // });

    let method = "post",
        url = "/product.create",
        params = null;

    checkCreateProduct = 1;
    $('#modal-create-product-admin-loading').removeClass('hidden')
    let res = await axiosTemplate(method, url, params, data);
    $('#modal-create-product-admin-loading').addClass('hidden')
    checkCreateProduct = 0;

    switch (res.data.status) {
        case 200:
            let html = `
                <tr>
                    <td class="p-2 whitespace-nowrap">
                        <div class="flex items-center">
                            <div class="w-10 h-10 flex-shrink-0 mr-2 sm:mr-3"><img class="rounded-full w-full h-full" src="${res.data.data.image.split(" ")[0]}" width="40" height="40" alt="Alex Shatov"></div>
                            <div class="font-medium text-gray-800 slice-text">${res.data.data.name}</div>
                        </div>
                    </td>
                    <td class="p-2 whitespace-nowrap">
                        <div class="text-left slice-text">${res.data.data.service_categories.name}</div>
                    </td>
                    <td class="p-2 whitespace-nowrap">
                        <div class="text-left slice-text">${res.data.data.product_categories.title}</div>
                    </td>
                    <td class="p-2 whitespace-nowrap">
                        <div class="text-left slice-text">${res.data.data.description}</div>
                    </td>
                    <td class="p-2 whitespace-nowrap">
                        <div class="text-lg text-center">
                            <box-icon type='solid' name='edit' class="cursor-pointer" onclick="getDetailProductAdmin(${res.data.data.id})"></box-icon>
                            <box-icon name='trash' class="cursor-pointer" data-id="${res.data.data.id}" onclick="deleteProductAdmin($(this))"></box-icon>
                            </div>
                    </td>
                </tr>
                `;
            $("#product-admin-table").prepend(html);
            closeModalCreateProductAdmin();
            break;
    }
}

async function addTypeProductCreate() {
    let title = prompt("Nhập vào tên loại:", "");
    if (title == null || title == "") return;

    let method = "post",
        url = "/product.add-type-create",
        params = null,
        data = {
            title
        };
    let res = await axiosTemplate(method, url, params, data);
    switch (res.data.status) {
        case 200:
            $(".type-menu").append(`
                <div data-id="${res.data.data.id}" class="block px-4 py-2 text-gray-700 hover:bg-gray-100 active:bg-blue-100 cursor-pointer rounded-md">${res.data.data.title}</div>
            `);
            break;
    }
}

async function addGraphyProductCreate() {
    let title = prompt("Nhập vào tên góc chụp:", "");
    if (title == null || title == "") return;

    let method = "post",
        url = "/product.add-graphy-create",
        params = null,
        data = {
            title
        };
    let res = await axiosTemplate(method, url, params, data);
    switch (res.data.status) {
        case 200:
            $(".graphy-menu").append(`
                <div data-id="${res.data.data.id}" class="block px-4 py-2 text-gray-700 hover:bg-gray-100 active:bg-blue-100 cursor-pointer rounded-md">${res.data.data.title}</div>
            `);
            break;
    }

}

function addFile(target, empty, file, objectURL) {
    const imageTempl = document.getElementById("image-template")

    const isImage = file.type.match("image.*");

    if (!isImage) return;

    const clone = imageTempl.content.cloneNode(true);

    clone.querySelector("h1").textContent = file.name;
    clone.querySelector("li").id = objectURL;
    clone.querySelector(".delete").dataset.target = objectURL;
    clone.querySelector(".size").textContent =
        file.size > 1024 ?
        file.size > 1048576 ?
        Math.round(file.size / 1048576) + "mb" :
        Math.round(file.size / 1024) + "kb" :
        file.size + "b";

    isImage &&
        Object.assign(clone.querySelector("img"), {
            src: objectURL,
            alt: file.name
        });

    $(empty).remove()
    target.prepend(clone);
}