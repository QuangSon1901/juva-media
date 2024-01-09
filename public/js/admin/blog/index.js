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
                            <div class="text-left slice-text">${blogs.status}</div>
                        </td>
                        <td class="p-2 whitespace-nowrap">
                            <div class="text-lg text-center">
                                <box-icon type='solid' name='edit' class="cursor-pointer" onclick="getDetailProductAdmin(${blogs.id})"></box-icon>
                                <box-icon name='trash' class="cursor-pointer" data-id="${blogs.id}" onclick="deleteProductAdmin($(this))"></box-icon>
                            </div>
                        </td>
                    </tr>
                `
            );
            $("#blog-admin-table").html(eleBlogs);
            break;
    }
}