let checkCreateBlog = 0;

$(function () {

    $("#modal-create-blog-admin .dropdown-button").on("click", function () {
        $(this)
            .parents(".select-group")
            .find(".dropdown-menu")
            .toggleClass("hidden");
    });

    $("#modal-create-blog-admin .search-input").on("input", function () {
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

    $("#modal-create-blog-admin").on("click", ".topic-menu div", function () {
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
    getDataTopicBlogAdmin();
})

async function getDataTopicBlogAdmin() {
    let method = "get",
        url = "/blog-topic.data-create",
        params = null,
        data = null;
    let res = await axiosTemplate(method, url, params, data);
    switch (res.data.status) {
        case 200:
            let eleTopic = res.data.data.topic.map(
                (topic) => `
                    <div data-id="${topic.id}" class="block px-4 py-2 text-gray-700 hover:bg-gray-100 active:bg-blue-100 cursor-pointer rounded-md">${topic.name}</div>
                `
            );
            $(".topic-menu").append(eleTopic);
            break;
    }
}

async function addTopicBlogCreate() {
    let name = prompt("Nhập vào tên chủ đề:", "");
    if (name == null || name == "") return;

    let method = "post",
        url = "/blog-topic.add-topic-create",
        params = null,
        data = {
            name
        };
    let res = await axiosTemplate(method, url, params, data);
    switch (res.data.status) {
        case 200:
            $(".topic-menu").append(`
                <div data-id="${res.data.data.id}" class="block px-4 py-2 text-gray-700 hover:bg-gray-100 active:bg-blue-100 cursor-pointer rounded-md">${res.data.data.name}</div>
            `);
            break;
    }
}

async function saveModalCreateBlogAdmin() {
    if (checkCreateBlog == 1) return;
    if(!checkValidateSave($('#modal-create-blog-admin'))) return false
    if (!$("#modal-create-blog-admin .topic-menu div.selected").data("id")) {
        alert('Vui lòng chọn chủ đề')
        return
    }

    if($('#description').val() == ""){
        alert('Vui lòng nhập mô tả')
        return
    }

    if(CKEDITOR.instances["content"].getData() == ""){
        alert('Vui lòng nhập nội dung')
        return
    }

    let data = {
        title: $('#title').val(),
        topic_id: $("#modal-create-blog-admin .topic-menu div.selected").data("id"),
        description: $('#description').val(),
        content: CKEDITOR.instances["content"].getData(),
    }

    let method = "post",
        url = "/blog-topic.create",
        params = null;
    checkCreateBlog = 1;
    $('#modal-create-blog-admin-loading').removeClass('hidden')
    let res = await axiosTemplate(method, url, params, data);
    $('#modal-create-blog-admin-loading').addClass('hidden')
    checkCreateBlog = 0;
    switch (res.data.status) {
        case 200:
            loadData()
            closeModalCreateBlogAdmin();
            break;
    }
}

function openModalCreateBlogAdmin() {
    $("#modal-create-blog-admin").removeClass("hidden");
    $("#modal-create-blog-admin").addClass("flex");
}

function closeModalCreateBlogAdmin() {
    $("#modal-create-blog-admin").addClass("hidden");
    $("#modal-create-blog-admin").removeClass("flex");
    resetModalCreateBlogAdmin();
    removeAllValidate()
}

function resetModalCreateBlogAdmin() {
    $("#modal-create-blog-admin input#title").val("")
    $("#modal-create-blog-admin .topic-menu div.selected").removeClass('selected')
    $("#modal-create-blog-admin .topic-menu").parents('.select-group').find('span').text('Danh mục')
    CKEDITOR.instances['content'].setData('')
    $('#description').val('')
}