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