$(function () {
    $('#search-blog').on('keyup', function(e) {
        if (e.keyCode === 13)
        window.location.href = `/blog?search=${$(this).val()}`
    })

    loadData()
})

function loadData() {
    getServices();
    getTopicData()
    getBlogData()

    let urlParams = new URLSearchParams(window.location.search);
    let myParam = urlParams.get('search');
    if (myParam) $('#search-blog').val(myParam);
}

async function getTopicData() {
    let method = "get",
    url = "/blog.topic-data",
    params = null,
    data = null;

    let res = await axiosTemplate(method, url, params, data);
    switch (res.data.status) {
        case 200:
            let tag = res.data.data.topic.map((item) => `<a class="bg-blue-100 text-blue-800 text-sm font-medium mr-2 px-2.5 py-0.5 rounded  hover:bg-blue-200  mb-2" href="/blog?topic=${item.slug}">${item.name}</a>`)
            $('#topic-post-tag').html(tag);
            break;
    }
}


async function getBlogData() {
    let urlParams = new URLSearchParams(window.location.search);
    let topic = urlParams.get('topic');
    let search = urlParams.get('search');

    let method = "get",
    url = "/blog.blog-data",
    params = {
        topic: topic ? topic : '',
        search: search ? search : ''
    },
    data = null;

    let res = await axiosTemplate(method, url, params, data);
    switch (res.data.status) {
        case 200:
            let posts = res.data.data.blogs.map((item) => `<article class="py-6 grid grid-cols-3 gap-4">
                    <div class="col-span-3 lg:col-span-1"><img src="${item.image}" class="aspect-[1] object-cover rounded-sm" alt=""></div>
                    <div class="col-span-3 lg:col-span-2">
                        <div class="flex items-center justify-between mb-3 text-gray-500">
                            <div><a class="bg-blue-100 text-blue-800 text-sm font-medium mr-2 px-2.5 py-0.5 rounded hover:bg-blue-200 mb-2" href="/blog?topic=${item.topic.slug}">${item.topic.name}</a></div><span class="text-sm"><time datetime="1677146503000">${formatFromTimeTemplate(item.created_at)}</time></span>
                        </div>
                        <h2 class="mb-2 text-2xl font-bold tracking-tight text-gray-900 hover:underline overflow-hidden text-ellipsis" style="display: -webkit-box;-webkit-line-clamp: 2;-webkit-box-orient: vertical;"><a href="/blog/${item.slug}">${item.title}</a></h2>
                        <p class="mb-5 text-gray-500 overflow-hidden text-ellipsis" style="display: -webkit-box;-webkit-line-clamp: 3;-webkit-box-orient: vertical;">${item.description}</p>
                        <div class="flex items-center justify-between"><a class="flex items-center space-x-2" href="#">
                                <img class="rounded-full w-7 h-7" src="https://juvamedia.vn/images/logo/ico.jpg" alt=""><span class="font-medium">JuvaMedia</span></a><a class="inline-flex items-center font-medium text-blue-600 hover:underline" href="/blog/${item.slug}">Đọc thêm<svg class="w-4 h-4 ml-2" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd" d="M10.293 3.293a1 1 0 011.414 0l6 6a1 1 0 010 1.414l-6 6a1 1 0 01-1.414-1.414L14.586 11H3a1 1 0 110-2h11.586l-4.293-4.293a1 1 0 010-1.414z" clip-rule="evenodd"></path>
                                </svg></a></div>
                    </div>
                </article>`)
            $('#blog-post-article').html(posts);
            $('#total-post-count').html(`Có ${res.data.data.blog_quantity} bài post`)
            break;
    }
}