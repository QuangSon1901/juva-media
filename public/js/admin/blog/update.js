let checkUpdateBlog = 0;

$(function () {

    $("#modal-update-blog-admin .dropdown-button").on("click", function () {
        $(this)
            .parents(".select-group")
            .find(".dropdown-menu")
            .toggleClass("hidden");
    });

    $("#modal-update-blog-admin .search-input").on("input", function () {
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

    $("#modal-update-blog-admin").on("click", ".topic-menu div", function () {
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
})


async function saveModalUpdateBlogAdmin() {
    if (checkUpdateBlog == 1) return;
    if(!checkValidateSave($('#modal-update-blog-admin'))) return false
    if (!$("#modal-update-blog-admin .topic-menu div.selected").data("id")) {
        alert('Vui lòng chọn chủ đề')
        return
    }

    if($('#blog-description-update').val() == ""){
        alert('Vui lòng nhập mô tả')
        return
    }

    if(CKEDITOR.instances["blog-content-update"].getData() == ""){
        alert('Vui lòng nhập nội dung')
        return
    }

    let data = {
        id: $('#blog-id-update').val(),
        title: $('#blog-title-update').val(),
        topic_id: $("#modal-update-blog-admin .topic-menu div.selected").data("id"),
        description: $('#blog-description-update').val(),
        content: CKEDITOR.instances["blog-content-update"].getData(),
    }

    let method = "post",
        url = "/blog-topic.update",
        params = null;
    checkUpdateBlog = 1;
    $('#modal-update-blog-admin-loading').removeClass('hidden')
    let res = await axiosTemplate(method, url, params, data);
    $('#modal-update-blog-admin-loading').addClass('hidden')
    checkUpdateBlog = 0;
    switch (res.data.status) {
        case 200:
            loadData()
            closeModalUpdateBlogAdmin();
            break;
    }
}

function openModalUpdateBlogAdmin() {
    $("#modal-update-blog-admin").removeClass("hidden");
    $("#modal-update-blog-admin").addClass("flex");
}

function closeModalUpdateBlogAdmin() {
    $("#modal-update-blog-admin").addClass("hidden");
    $("#modal-update-blog-admin").removeClass("flex");
    resetModalUpdateBlogAdmin();
    removeAllValidate()
}

function resetModalUpdateBlogAdmin() {
    $("#modal-update-blog-admin input#title").val("")
    $("#modal-update-blog-admin .topic-menu div.selected").removeClass('selected')
    $("#modal-update-blog-admin .topic-menu").parents('.select-group').find('span').text('Danh mục')
    CKEDITOR.instances['blog-content-update'].setData('')
    $('#blog-description-update').val('')
}