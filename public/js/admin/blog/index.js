$(function () {
    loadData();
});

function loadData() {
    getBlogsAdmin();
}

async function getBlogsAdmin() {
    let method = "get",
        url = "/blog-topic.data",
        params = null,
        data = null;
    let res = await axiosTemplate(method, url, params, data);
    switch (res.data.status) {
        case 200:
            let eleBlogs = res.data.data.map(
                (blogs) => `
                    <tr>
                        <td class="p-2 whitespace-nowrap">
                            <div class="text-left slice-text">${blogs.title}</div>
                        </td>
                        <td class="p-2 whitespace-nowrap">
                            <div class="text-left slice-text">${blogs.topic.name}</div>
                        </td>
                        <td class="p-2 whitespace-nowrap">    
                            <input class="mr-2 mt-[0.3rem] h-3.5 w-8 appearance-none rounded-[0.4375rem] bg-neutral-300 before:pointer-events-none before:absolute before:h-3.5 before:w-3.5 before:rounded-full before:bg-transparent before:content-[''] after:absolute after:z-1 after:-mt-[0.1875rem] after:h-5 after:w-5 after:rounded-full after:border-none after:bg-neutral-100 after:shadow-[0_0px_3px_0_rgb(0_0_0_/_7%),_0_2px_2px_0_rgb(0_0_0_/_4%)] after:transition-[background-color_0.2s,transform_0.2s] after:content-[''] checked:bg-blue-500 checked:after:absolute checked:after:z-1 checked:after:-mt-[3px] checked:after:ml-[1.0625rem] checked:after:h-5 checked:after:w-5 checked:after:rounded-full checked:after:border-none checked:after:bg-blue-500 checked:after:shadow-[0_3px_1px_-2px_rgba(0,0,0,0.2),_0_2px_2px_0_rgba(0,0,0,0.14),_0_1px_5px_0_rgba(0,0,0,0.12)] checked:after:transition-[background-color_0.2s,transform_0.2s] checked:after:content-[''] hover:cursor-pointer focus:outline-none focus:ring-0 focus:before:scale-100 focus:before:opacity-[0.12] focus:before:shadow-[3px_-1px_0px_13px_rgba(0,0,0,0.6)] focus:before:transition-[box-shadow_0.2s,transform_0.2s] focus:after:absolute focus:after:z-1 focus:after:block focus:after:h-5 focus:after:w-5 focus:after:rounded-full focus:after:content-[''] checked:focus:border-primary checked:focus:bg-primary checked:focus:before:ml-[1.0625rem] checked:focus:before:scale-100 checked:focus:before:shadow-[3px_-1px_0px_13px_#3b71ca] checked:focus:before:transition-[box-shadow_0.2s,transform_0.2s]" 
                                    type="checkbox" 
                                    role="switch" 
                                    id="toggleSwitchStatus_${blogs.id}" 
                                    ${blogs.status == 1 ? 'checked' : ''}
                                    onchange="updateBlogStatus(${blogs.id}, this.checked)"/>
                            <label class="inline-block pl-[0.15rem] hover:cursor-pointer" for="toggleSwitchStatus_${blogs.id}"></label>
                        </td>
                        <td class="p-2 whitespace-nowrap">
                            <div class="text-lg text-center">
                                <box-icon type='solid' name='edit' class="cursor-pointer" onclick="getDetailBlogAdmin(${blogs.id})"></box-icon>
                                <box-icon name='trash' class="cursor-pointer" data-id="${blogs.id}" onclick="deleteBlogAdmin($(this))"></box-icon>
                            </div>
                        </td>
                    </tr>
                `
            );
            $("#blog-admin-table").html(eleBlogs);
            break;
    }
}

async function deleteBlogAdmin(r) {
    let method = "post",
        url = "/blog-topic.delete",
        params = null,
        data = { id: r.data("id") };
    let res = await axiosTemplate(method, url, params, data);
    switch (res.data.status) {
        case 200:
            r.parents("tr").remove();
            break;
    }
}

async function getDetailBlogAdmin(id) {
    let method = "get",
        url = "/blog-topic.detail",
        params = { id },
        data = null;
    let res = await axiosTemplate(method, url, params, data);
    switch (res.data.status) {
        case 200:
            $("#modal-update-blog-admin input#blog-id-update").val(res.data.data.id);
            $("#modal-update-blog-admin input#blog-title-update").val(res.data.data.title);
            $("#modal-update-blog-admin .dropdown-button > span").text(res.data.data.topic.name);
            $("#modal-update-blog-admin .topic-menu div[data-id]").each(function() {
                const dataId = $(this).data("id");
                
                if (dataId && dataId == res.data.data.topic_id) {
                    $(this).addClass("selected");
                }
            });
            $("#modal-update-blog-admin #blog-description-update").val(res.data.data.description);
            CKEDITOR.instances["blog-content-update"].setData(res.data.data.content)

            
            openModalUpdateBlogAdmin();
            break;
    }
}

async function updateBlogStatus(id, isChecked) {
    const status = isChecked ? 1 : 0;

    let method = "post",
        url = "/blog-topic.update-status",
        params = null,
        data = {
            'blog_id': id,
            'status': status
        };
    let res = await axiosTemplate(method, url, params, data);
    switch (res.data.status) {
        case 200:
            break
            
    }
}