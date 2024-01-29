let services = [];

$(function () {
    $(document).on("click", (event) => {
        if (
            $(".header-bottom-menu .header-service-dropdown").hasClass(
                "block"
            ) &&
            !$(event.target).closest(".header-bottom-menu").length
        ) {
            $(".header-service-dropdown").removeClass("block");
            $(".header-service-dropdown").addClass("hidden");
        }
    });

    $(document).on("focus", "#search-header", function () {
        if ($("#search-header").val().trim().length <= 0) return;
        $("#search-popup-hint").addClass("active");
    });

    $(document).on("blur", "#search-header", function () {
        $("#search-popup-hint").removeClass("active");
    });

    $(document).on("input", "#search-header", function () {
        getProductSearch()
    });

    loadData();
    loadCartCount();
    
});

function loadData() {
    getServices();
    getBanners();
}

function loadCartCount() {
    let cartDataString = localStorage.getItem("cart");
    
    let cartData = [];

    if (cartDataString) {
         cartData = JSON.parse(cartDataString);
    }
    $("#cart-quantity-header").text(cartData.length);
}

async function getProductSearch() {
    let searchText = $("#search-header").val().trim();
    if (searchText.length <= 0) return;
    if (!$("#search-popup-hint").hasClass("active")) {
        $("#search-popup-hint").addClass("active");
    }
    let method = "get",
        url = "/search",
        params = {
            search: searchText,
        },
        data = null;
    let res = await axiosTemplate(method, url, params, data);
    switch (res.data.status) {
        case 200:
            if (res.data.data.length > 0) {
                let html = "";
                $.each(res.data.data, function (index, item) {
                    let product = "";
                    $.each(item["items"], function (index2, item2) {
                        product += `
                                <li class="w-full">
                                    <a href="/san-pham/${
                                        item2.slug
                                    }" class="flex items-center gap-3 w-full">
                                        <img class="w-10 h-10 rounded-full" src="${
                                            item2.image.split(" ")[0]
                                        }" alt="">
                                        <p>${item2.name}</p>
                                    </a>
                                </li>
                            `;
                    });
                    html += `
                            <div>
                                <p class="font-semibold py-2">${item.service_categories.name}</p>
                                <ul class="flex flex-col gap-2 py-2 border-t">
                                    ${product}
                                </ul>
                            </div>
                        `;
                });
                $(".search-popup-hint-body").html(html);
            } else {
                $(".search-popup-hint-body").html(`
                        <div class="flex items-center justify-center">
                            <img class="w-40 h-20" src="https://bizweb.dktcdn.net/100/401/953/themes/785928/assets/empty_cart.png?1614590460628" />
                        </div>
                    `);
            }
            break;
    }
}

async function getServices() {
    let method = "get",
        url = "/get-services",
        params = null,
        data = null;
    let res = await axiosTemplate(method, url, params, data);
    switch (res.data.status) {
        case 200:
            let eleServices = res.data.data.map(
                (service) => `
                    <li class="header-service-item cursor-pointer select-none" onclick="openDropdownService($(this),${service.id})">
                        <a data-id=${service.id} class="block px-2 py-3 rounded-lg hover:bg-juva-grey header-service-item">${service.name}</a>
                    </li>
                `
            );
            eleServices.push(`<li class="header-service-item cursor-pointer select-none">
                <a href="/blog" class="block px-2 py-3 rounded-lg hover:bg-juva-grey header-service-item">Blog</a>
            </li>`);

            // Hiển thị danh sách dịch vụ trong #header-service-list
            $("#header-service-list").html(eleServices);
            services.push(res.data.data)
            break;
    }
}

async function getBanners() {
    let method = "get",
        url = "/banner.data-index",
        params = null,
        data = null;
    let res = await axiosTemplate(method, url, params, data);
    switch (res.data.status) {
        case 200:
            let eleServices = res.data.data.map(
                (banner) => `
                    <div>
                        <a href="${banner.url !== null ? banner.url : '#'}"><img class="w-full h-[calc(100vh-168px)]" src="${banner.image}" alt=""></a>
                    </div>
                `
            );

            let banners = res.data.banner_section.map(
                (banner) => `
                    <a href="${banner.url !== null ? banner.url : '#'}" tabindex="0"><img class="aspect-[2/1] object-cover bg-gray-600 w-full" src="${banner.image}" alt=""></a>
                `
            );

            $("#home-slider").html(eleServices);
            $("#home-banner").html(banners);
            $('.slider').slick({
                dots: false,
                arrows: false,
                infinite: true,
                speed: 500,
                autoplay: true,
                autoplaySpeed: 5000,
            });
            break;
    }
    
}

function getCategoryBig(categories) {
    let eleServiceCategories = categories.map(
        (serviceCate) => `
                    <li>
                        <a href="/dich-vu/${serviceCate.slug}" style="gap: 12px" class="flex gap-3 cursor-pointer items-center p-[2px] rounded-sm hover:bg-juva-grey">
                            <img class="w-20 h-20 rounded-sm" src="${serviceCate.image}" alt="">
                            <div class="flex flex-col">
                                <span class="font-semibold">${serviceCate.name}</span>
                                <p>${serviceCate.description}</p>
                            </div>
                        </a>
                    </li>
                `
    );

    $(".header-service-dropdown ul").html(eleServiceCategories);
}
function openDropdownService(r,service_id) {
    // Tìm dịch vụ tương ứng với serviceId
    const selectedService = services[0].find(service => service.id === service_id);
    $(".header-service-dropdown").addClass("block");
    $(".header-service-dropdown").removeClass("hidden");
    $(".header-service-dropdown .header-service-dropdown-label").text(
        r.find("a").text()
    );
    getCategoryBig(selectedService.service_categories);
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

function uploadMediaTemplate(file, type, thumb = null, size = null) {
    /**
     * Type
     * 0-ảnh
     * 1-video
     * 2-audio
     * 3-file
     */
    if (![0, 1, 2, 3].includes(type)) {
        console.log('Media type không hợp lệ !')
        return false;
    }
    if (type === 1 && !thumb) {
        console.log('Video phải có thumb !')
        return false;
    }
    if (!size) size = file.size;
    let data = new FormData();
    data.append("file", file);
    data.append("type", type);
    data.append("size", size);
    data.append("thumb", thumb);
    let method = 'post',
        url = 'upload-media-template',
        params = null;
    return axiosFileTemplate(method, url, params, data);
}

async function axiosFileTemplate(method, url, params, data) {
    try {
        let res = await axios({
            method: method, url: url, params: params, data: data, headers: {
                'content-type': 'multipart/form-data'
            }
        });
        console.log(res);
        if (res.data[0] === '500') {
            return false;
        } else {
            return res;
        }
    } catch (e) {
        console.log(e + ' AxiosTemplate' + '\n' + 'url: ' + url);
        return e;
    }
}

function formatNumber(num) {
    return num.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,");
}

function formatNumberLimit(num) {
    return num.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,");
}

function removeformatNumber(num) {
    num = String(num);
    return Number(num.replace(/[^0-9.-]+/g, ""));
}

function formatFromTimeTemplate(time) {
    try {
        const dateCurrent = new Date();
        const date = new Date(time);
        const daysDiff = Math.floor((dateCurrent - date) / (1000 * 60 * 60 * 24));
        const hoursDiff = Math.floor((dateCurrent - date) / (1000 * 60 * 60));
        const minutesDiff = Math.floor((dateCurrent - date) / (1000 * 60));

        if (daysDiff > 9) {
            return date.toLocaleDateString('vi-VN', { day: 'numeric', month: 'numeric' })
        } else if (daysDiff > 0) {
            return daysDiff + ' ngày';
        } else if (hoursDiff > 0) {
            return hoursDiff + ' giờ';
        } else if (minutesDiff > 0) {
            return minutesDiff + ' phút';
        } else {
            return 'Vài giây';
        }
    } catch (error) {
        console.error(error, time);
    }
}
