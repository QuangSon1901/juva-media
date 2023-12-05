let emptyImage = document.getElementById("empty-create-banner"), checkCreateBanner = 0;

$(function () {
    $('.upload-btn').on('click', function () {
        $(this).next('input').click()
    })

    $('#image-create-banner').on('change',async function () {
        let gallery = document.getElementById("gallery-create-banner")
        jQuery.each($(this).prop('files'), async function (i, v) {
            let res = await uploadMediaTemplate($(v)[0], 0);
            addFile(gallery, emptyImage, $(v)[0], res.data.data)
        })
        gallery.onclick = ({
            target
        }) => {
            if (target.classList.contains("delete")) {
                const ou = target.dataset.target;
                document.getElementById(ou).remove(ou);
                gallery.children.length == 0 && gallery.append(emptyImage)
                mainImageURL = "";
            }
        };
        $(this).replaceWith($(this).val('').clone(true));
    })
})

function openModalCreateBannerAdmin() {
    $("#modal-create-banner-admin").removeClass("hidden");
    $("#modal-create-banner-admin").addClass("flex");
}

async function saveModalCreateBannerAdmin() {
    if (checkCreateBanner == 1) return;
    if ($('#gallery-create-banner li:not(#empty-create-banner)').length == 0) {
        alert('Vui lòng chọn ảnh')
        return
    }

    let images = $('#gallery-create-banner li:not(#empty-create-banner)').map((index, item) => $(item).find("img").attr("src")).get()
    let method = "post",
        url = "/banner.create",
        params = null,
        data = { images };

    checkCreateBanner = 1;
    $('#modal-create-service-banner-loading').removeClass('hidden')
    let res = await axiosTemplate(method, url, params, data);
    $('#modal-create-service-banner-loading').addClass('hidden')
    checkCreateBanner = 0;
    switch (res.data.status) {
        case 200:
            loadData()
            closeModalCreateBannerAdmin();
            break;
    }
}

function closeModalCreateBannerAdmin() {
    $("#modal-create-banner-admin").addClass("hidden");
    $("#modal-create-banner-admin").removeClass("flex");
    resetModalCreateBannerAdmin();
}

function resetModalCreateBannerAdmin() { 
    $('#gallery-create-banner').html(emptyImage.outerHTML)
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