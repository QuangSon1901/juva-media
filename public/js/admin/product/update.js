let checkUpdateProduct = 0, mainUpdateImageURL = "";
let emptyImageMain2 = document.getElementById("main-empty-update-product"),
    emptyImageMore2 = document.getElementById("more-empty-update-product")

$(function () {
    $("#modal-update-product-admin .dropdown-button").on("click", function () {
        $(this)
            .parents(".select-group")
            .find(".dropdown-menu")
            .toggleClass("hidden");
    });

    $("#modal-update-product-admin .search-input").on("input", function () {
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

    $('#modal-update-product-admin .upload-btn').on('click', function () {
        $(this).next('input').click()
    })
    $('#main-image-update-product').on('change',async function () {
        let gallery = document.getElementById("main-gallery-update-product")
        gallery.innerHTML = ""
        addFile(gallery, emptyImageMain2, $(this).prop('files')[0], URL.createObjectURL($(this).prop('files')[0]))
        gallery.onclick = ({
            target
        }) => {
            if (target.classList.contains("delete")) {
                const ou = target.dataset.target;
                document.getElementById(ou).remove(ou);
                gallery.children.length == 0 && gallery.append(emptyImageMain2)
                mainUpdateImageURL = "";
            }
        };

        let res = await uploadMediaTemplate($(this).prop('files')[0], 0);
        switch (res.data.status) {
            case 200:
                mainUpdateImageURL = res.data.data
                break;
            default: 
                alert('Upload ảnh bị lỗi, vui lòng thử lại!')
        }
        $(this).replaceWith($(this).val('').clone(true));
    })

    $('#more-image-update-product').on('change',async function () {
        let gallery = document.getElementById("more-gallery-update-product")
        jQuery.each($(this).prop('files'), async function (i, v) {
            let res = await uploadMediaTemplate($(v)[0], 0);
            addFile(gallery, emptyImageMore2, $(v)[0], res.data.data)
        })
        gallery.onclick = ({
            target
        }) => {
            if (target.classList.contains("delete")) {
                const ou = target.dataset.target;
                document.getElementById(ou).remove(ou);
                gallery.children.length == 0 && gallery.append(emptyImageMain2)
                mainUpdateImageURL = "";
            }
        };
        $(this).replaceWith($(this).val('').clone(true));
    })

    $("#modal-update-product-admin").on("focus", "input", function () {
        $(this).select();
    });

    $("#modal-update-product-admin").on("click", ".graphy-remove", function () {
        let graphy2 = $(this).parents(".graphy-item");
        $("#modal-update-product-admin .graphy-menu").append(`
            <div data-id="${graphy2.data(
                "id"
            )}" class="block px-4 py-2 text-gray-700 hover:bg-gray-100 active:bg-blue-100 cursor-pointer rounded-md">${graphy2.data("text")}</div>
        `);

        graphy2.remove();
    });

    $("#modal-update-product-admin").on(
        "click",
        ".graphy-item-image",
        function () {
            $(this).parents(".graphy-item-image-group").find("input").click();
        }
    );

    $("#modal-update-product-admin").on(
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

    $("#modal-update-product-admin").on("click", ".category-menu div, .type-menu div", function () {
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

    $("#modal-update-product-admin").on("click", ".graphy-menu div", function () {
        $("#modal-update-product-admin .graphy-list").append(`
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

    CKEDITOR.replace("description-update", {
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

});



function openModalUpdateProductAdmin() {
    $("#modal-update-product-admin").removeClass("hidden");
    $("#modal-update-product-admin").addClass("flex");
}

function closeModalUpdateProductAdmin() {
    $("#modal-update-product-admin").addClass("hidden");
    $("#modal-update-product-admin").removeClass("flex");
    resetModalUpdateProductAdmin();
    removeAllValidate()
}

function resetModalUpdateProductAdmin() {
    $("#modal-update-product-admin input#name").val("")
    $("#modal-update-product-admin input#price").val(0)
    $("#modal-update-product-admin .category-menu div.selected").removeClass('selected')
    $("#modal-update-product-admin .category-menu").parents('.select-group').find('span').text('Danh mục')
    $("#modal-update-product-admin .type-menu div.selected").removeClass('selected')
    $("#modal-update-product-admin .type-menu").parents('.select-group').find('span').text('Danh mục')
    $("#modal-update-product-admin .graphy-menu div.selected").removeClass('selected')
    $("#modal-update-product-admin .graphy-menu").parents('.select-group').find('span').text('Danh mục')
    $("#modal-update-product-admin .graphy-list li").each((index, item) => {
        $("#modal-update-product-admin .graphy-menu").append(`
            <div data-id="${$(item).data('id')}" class="block px-4 py-2 text-gray-700 hover:bg-gray-100 active:bg-blue-100 cursor-pointer rounded-md">${$(item).data('text')}</div>
        `);
    })
    mainUpdateImageURL = "";

    $("#modal-update-product-admin .graphy-list").empty();
    CKEDITOR.instances['description'].setData('')

    $('#main-gallery-update-product').html(emptyImageMain2.outerHTML)
    $('#more-gallery-update-product').html(emptyImageMore2.outerHTML)
}

async function saveModalUpdateProductAdmin() {
    if (checkUpdateProduct == 1) return;
    if(!checkValidateSave($('#modal-update-product-admin'))) return false

    if (!$("#modal-update-product-admin .category-menu div.selected").data("id")) {
        alert('Vui lòng chọn danh mục')
        return
    }

    if (!$("#modal-update-product-admin .type-menu div.selected").data("id")) {
        alert('Vui lòng chọn loại sản phẩm')
        return
    }

    let graphy = $("#modal-update-product-admin .graphy-list li")
    
    if (graphy.length == 0) {
        alert('Vui lòng chọn góc chụp')
        return
    }

    if (mainUpdateImageURL == '') {
        alert('Vui lòng chọn ảnh chính')
        return
    }

    if ($('#more-gallery-update-product li:not(#more-empty-update-product)').length == 0) {
        alert('Vui lòng chọn ảnh phụ')
        return
    }
    
    graphy = graphy.map((index, item) => ({
        id: $(item).data("id"),
        title: $(item).data("text"),
        price: $(item).find(".graphy-price").val(),
        description: "",
        image: $(item).find(".graphy-item-image").attr("src"),
    }));
    let imageMore = $('#more-gallery-update-product li:not(#more-empty-update-product)').map((index, item) => $(item).find("img").attr("src")).get().join(' ')
    let data = {
        id: $("#modal-update-product-admin input#update-product_id").val(),
        name: $("#modal-update-product-admin input#name").val(),
        price: $("#modal-update-product-admin input#price").val(),
        service_category_id: $("#modal-update-product-admin .category-menu div.selected").data("id"),
        product_category_id: $("#modal-update-product-admin .type-menu div.selected").data("id"),
        description: CKEDITOR.instances["description-update"].getData(),
        main_image: mainUpdateImageURL,
        image_more: imageMore,
        graphy: graphy.toArray(),
    }

    

    let method = "post",
        url = "/product.update",
        params = null;

    checkUpdateProduct = 1;
    $('#modal-update-product-admin-loading').removeClass('hidden')
    let res = await axiosTemplate(method, url, params, data);
    $('#modal-update-product-admin-loading').addClass('hidden')
    checkUpdateProduct = 0;

    switch (res.data.status) {
        case 200:
            getProductAdmin(-1);
            closeModalUpdateProductAdmin();
            break;
    }
}

function addFile(target, empty, file, objectURL) {
    const imageTempl = document.getElementById("image-template-update")

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