$(function () {
    $(document).on("click", (event) => {
        if ($('.header-bottom-menu .header-service-dropdown').hasClass('block') && !$(event.target).closest(".header-bottom-menu").length) {
            $(".header-service-dropdown").removeClass("block");
            $(".header-service-dropdown").addClass("hidden");
        }
    });
    loadData();
});

function loadData() {
    getServices();
}

async function getServices() {
    let method = "get",
        url = "/get-services",
        params = null,
        data = null;
    let res = await axiosTemplate(method, url, params, data);
    switch (res.data.status) {
        case 200:
            let eleServives = res.data.data.map(
                (service) => `
                    <li class="header-service-item cursor-pointer select-none" onclick="openDropdownService($(this), ${service.id})">
                        <a data-id=${service.id} class="block px-2 py-3 rounded-lg hover:bg-juva-grey header-service-item">${service.name}</a>
                    </li>
                `
            );

            $("#header-service-list").html(eleServives);
            break;
    }
}

async function getCategoryBig(service_id) {
    let method = "get",
        url = "/get-categories-of-service",
        params = { service_id },
        data = null;
    let res = await axiosTemplate(method, url, params, data);
    switch (res.data.status) {
        case 200:
            let eleServiceCategories = res.data.data.map(
                (service) => `
                    <li>
                        <a href="/dich-vu/${service.slug}" class="flex gap-3 cursor-pointer items-center p-[2px] rounded-sm hover:bg-juva-grey">
                            <img class="w-20 h-20 rounded-sm" src="${service.image}" alt="">
                            <div class="flex flex-col">
                                <span class="font-semibold">${service.name}</span>
                                <p>${service.description}</p>
                            </div>
                        </a>
                    </li>
                `
            );

            $(".header-service-dropdown ul").html(eleServiceCategories);
            break;
    }
}

function openDropdownService(r, service_id) {
    $(".header-service-dropdown").addClass("block");
    $(".header-service-dropdown").removeClass("hidden");
    $(".header-service-dropdown .header-service-dropdown-label").text(
        r.find("a").text()
    );
    getCategoryBig(service_id);
}

async function axiosTemplate(method, url, params, data, element) {
    let x1 = moment();
    $(document).find(".active-row-focus").removeClass("active-row-focus");
    try {
        let res = await axios({
            method: method,
            url: url,
            params: params,
            data: data,
        });
        console.log(res);
        let x2 = moment();
        let time = (x2 - x1) / 1000;
        console.log("Thời gian Axios: " + time + "s");
        if (res.data.status === 401) {
            return res;
        } else if (res.data.status >= 500) {
            return res;
        } else if (res.data.status > 400) {
            return res;
        } else {
            return res;
        }
    } catch (e) {
        // $('.height-template-loading').remove()
        // $('.' + classItem).remove();
        let x2 = moment();
        console.log("Kết thúc request:" + x2);
        console.log("Thời gian request:" + x2 - x1 + " ms");
        console.log(e + " AxiosTemplate" + "\n" + "url: " + url);
        return false;
    }
}

function formatNumber(num) {
    return num.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,');
}

function formatNumberLimit(num) {
    return num.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,');
}

function removeformatNumber(num) {
    num = String(num);
    return Number(num.replace(/[^0-9.-]+/g, ""));
}