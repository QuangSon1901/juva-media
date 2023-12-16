let emptyImage2 = document.getElementById("empty-update-banner"), checkUpdateBanner = 0;

$(function () {
    $('.upload-btn-update-banner').on('click', function () {
        $(this).next('input').click()
    })

    $('#image-update-banner').on('change',async function () {
        let gallery2 = document.getElementById("gallery-update-banner")
        jQuery.each($(this).prop('files'), async function (i, v) {
            let res = await uploadMediaTemplate($(v)[0], 0);
            addFile(gallery2, emptyImage, $(v)[0], res.data.data)
        })
        gallery2.onclick = ({
            target
        }) => {
            if (target.classList.contains("delete")) {
                const ou = target.dataset.target;
                document.getElementById(ou).remove(ou);
                gallery2.children.length == 0 && gallery.append(emptyImage2)
                mainImageURL = "";
            }
        };
        $(this).replaceWith($(this).val('').clone(true));
    })
})

function openModalUpdateBannerAdmin() {
    $("#modal-update-banner-admin").removeClass("hidden");
    $("#modal-update-banner-admin").addClass("flex");
}

function closeModalUpdateBannerAdmin() {
    $("#modal-update-banner-admin").addClass("hidden");
    $("#modal-update-banner-admin").removeClass("flex");
    resetModaUpdateBannerAdmin();
}

function resetModaUpdateBannerAdmin() { 
    $('#gallery-update-banner').html(emptyImage2.outerHTML)
}
async function saveModalUpdateBannerAdmin() {
    if (checkUpdateBanner == 1) return;
    // if ($('#gallery-update-banner li:not(#empty-update-banner)').length == 0) {
    //     alert('Vui lòng chọn ảnh')
    //     return
    // }

    // let images = $('#gallery-update-banner li:not(#empty-update-banner)').map((index, item) => $(item).find("img").attr("src")).get()
    let method = "post",
        url = "/banner.update",
        params = null,
        data = { 
            id: $("#modal-update-banner-admin input#id-banner").val(),
            image: $('#gallery-update-banner img').attr('src'),
            url:  $('#modal-update-banner-admin input#url-banner').val()
        };

    checkUpdateBanner = 1;
    $('#modal-update-banner-loading').removeClass('hidden')
    let res = await axiosTemplate(method, url, params, data);
    $('#modal-update-banner-loading').addClass('hidden')
    checkUpdateBanner = 0;
    switch (res.data.status) {
        case 200:
            loadData()
            closeModalUpdateBannerAdmin();
            break;
    }
}



function addFile2(target, empty, file, objectURL) {
    const imageTempl2 = document.getElementById("image-template-update")

    const isImage = file.type.match("image.*");

    if (!isImage) return;

    const clone = imageTempl2.content.cloneNode(true);

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