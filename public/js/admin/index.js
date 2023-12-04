$(function () {
    loadData();
});

function loadData() {
    getCategoryBigAdmin(-1);
}

async function getCategoryBigAdmin(service_id) {
    let method = "get",
        url = "/get-categories-of-service",
        params = { service_id },
        data = null;
    let res = await axiosTemplate(method, url, params, data);
    switch (res.data.status) {
        case 200:
            let eleServiceCategories = res.data.data.map(
                (service) => `
                    <tr>
                        <td class="p-2 whitespace-nowrap">
                            <div class="flex items-center">
                                <div class="w-10 h-10 flex-shrink-0 mr-2 sm:mr-3"><img class="rounded-full w-full h-full" src="${service.image}" width="40" height="40" alt="Alex Shatov"></div>
                                <div class="slice-text font-medium text-gray-800">${service.name}</div>
                            </div>
                        </td>
                        <td class="p-2 whitespace-nowrap">
                            <div class="text-left slice-text">${service.services.name}</div>
                        </td>
                        <td class="p-2 whitespace-nowrap">
                            <div class="text-left slice-text">${service.description}</div>
                        </td>
                        <td class="p-2 whitespace-nowrap">
                            <div class="text-lg text-center">
                                <box-icon type='solid' name='edit' class="cursor-pointer" onclick="getCategoryBigAdminToModel(${service.id})"></box-icon>
                                <box-icon name='trash' class="cursor-pointer" data-id="${service.id}" onclick="deleteCategoryBigAdmin($(this))"></box-icon>
                                </div>
                        </td>
                    </tr>
                `
            );

            $("#category-big-admin-table").html(eleServiceCategories);
            break;
    }
}

async function getServicesAdmin(targetDropdown, targetDropdownButton) {
    let method = "get",
        url = "/get-services",
        params = null,
        data = null;
    let res = await axiosTemplate(method, url, params, data);
    switch (res.data.status) {
        case 200:
            let eleServives = res.data.data.map(
                (service) => `
                    <div data-id="${service.id}" class="block px-4 py-2 text-gray-700 hover:bg-gray-100 active:bg-blue-100 cursor-pointer rounded-md">${service.name}</div>
                `
            );

            $(targetDropdown).append(eleServives);
            $(`${targetDropdown} div`).on("click", function () {
                $(`${targetDropdown} div.selected`).removeClass("selected");
                $(this).addClass("selected");
                $(`${targetDropdownButton} > span`).text($(this).text());
            });
            break;
    }
}

async function getCategoryBigAdminToModel(service_category_id) {
    let method = "get",
        url = "/get-detail-service-category",
        params = { service_category_id },
        data = null;
    let res = await axiosTemplate(method, url, params, data);
    switch (res.data.status) {
        case 200:
            openModalUpdateCategoryBigAdmin();

            $("#modal-update-category-big-admin input#update-id").data("id", res.data.data.id);
            $("#modal-update-category-big-admin input#name").val(res.data.data.name);
            $("#modal-update-category-big-admin input#description").val(res.data.data.description);
            $("#dropdown-menu-update-button > span").text(res.data.data.services.name);
            $("#dropdown-menu-update div[data-id]").each(function() {
                const dataId = $(this).data("id");
                
                if (dataId && dataId === res.data.data.service_id) {
                    $(this).addClass("selected");
                }
            });
            const gallery = document.getElementById("gallery-update");
            const file = res.data.data.image;
            addFile(gallery, file);
            break;
    }
}

async function deleteCategoryBigAdmin(r) {
    let method = "post",
        url = "/category-big.delete",
        params = null,
        data = { id: r.data("id") };
    let res = await axiosTemplate(method, url, params, data);
    switch (res.data.status) {
        case 200:
            r.parents("tr").remove();
            break;
    }
}

//Dropdown Handle
function initializeDropdown(dropdownButtonId, dropdownMenuId, searchInputId) {
    const dropdownButton = document.getElementById(dropdownButtonId);
    const dropdownMenu = document.getElementById(dropdownMenuId);
    const searchInput = document.getElementById(searchInputId);
    let isOpen = false; // Set to true to open the dropdown by default

    // Function to toggle the dropdown state
    function toggleDropdown() {
        isOpen = !isOpen;
        dropdownMenu.classList.toggle("hidden", !isOpen);
    }

    dropdownButton.addEventListener("click", () => {
        toggleDropdown();
    });

    dropdownMenu.addEventListener("click", (event) => {
        // Check if the clicked element has the "selected" class
        const selectedDiv = event.target.closest("div.selected");
        if (selectedDiv) {
            toggleDropdown();
        }
    });
    // Add event listener to filter items based on input
    searchInput.addEventListener("input", () => {
        const searchTerm = searchInput.value.toLowerCase();
        const items = dropdownMenu.querySelectorAll("div");

        items.forEach((item) => {
            const text = item.textContent.toLowerCase();
            if (text.includes(searchTerm)) {
                item.style.display = "block";
            } else {
                item.style.display = "none";
            }
        });
    });
}

//Upload File
const imageTempl = document.getElementById("image-template"),
    empty = document.getElementById("empty");

// use to store pre selected files
let FILES = {};

// check if file is of type image and prepend the initialied
// template to the target element
function addFile(target, file) {
    let objectURL;

    if (typeof file === "string") {
        // Trường hợp file là URL từ database
        objectURL = file;
    } else {
        // Trường hợp file là một file mới từ máy người dùng
        const isImage = file.type.match("image.*");
        if (!isImage) return;
        objectURL = URL.createObjectURL(file);
    }
    while (target.children.length > 0) {
        target.lastChild.remove();
    }
    FILES = {};
    empty.classList.remove("hidden");
    target.append(empty);

    $("#hidden-input").replaceWith($("#hidden-input").val("").clone(true));

    const clone = imageTempl.content.cloneNode(true);

    if (typeof file === "string") {
        // Trường hợp file là URL từ database
        clone.querySelector("h1").textContent = "Tên tệp từ URL";
        Object.assign(clone.querySelector("img"), {
                src: objectURL,
                alt: file.name,
            });
    } else {
        // Trường hợp file là một file mới từ máy người dùng
        clone.querySelector("h1").textContent = file.name;
        clone.querySelector(".size").textContent =
            file.size > 1024
                ? file.size > 1048576
                    ? Math.round(file.size / 1048576) + "mb"
                    : Math.round(file.size / 1024) + "kb"
                : file.size + "b";

        const isImage = file.type.match("image.*");
        isImage &&
            Object.assign(clone.querySelector("img"), {
                src: objectURL,
                alt: file.name,
            });
    }

    clone.querySelector("li").id = objectURL;
    clone.querySelector(".delete").dataset.target = objectURL;

    empty.classList.add("hidden");
    target.prepend(clone);
   
    FILES[objectURL] = file;    
}
const galleryCreate = document.getElementById("gallery-create"),
      galleryUpdate = document.getElementById("gallery-update"),
    overlay = document.getElementById("overlay");

// Sử dụng hàm addFile với tham số formType
const createButton = document.getElementById("create-button");
const updateButton = document.getElementById("update-button");

const createHiddenInput = document.getElementById("create-hidden-input");
const updateHiddenInput = document.getElementById("update-hidden-input");

createButton.onclick = () => {
    hiddenInputClick(createHiddenInput, galleryCreate);
};

updateButton.onclick = () => {
    hiddenInputClick(updateHiddenInput, galleryUpdate);
};

function hiddenInputClick(hiddenInput, gallery) {
    hiddenInput.click();
    hiddenInput.onchange = (e) => {
        for (const file of e.target.files) {
            addFile(gallery, file);
        }
    };
}

// use to check if a file is being dragged
const hasFiles = ({ dataTransfer: { types = [] } }) =>
    types.indexOf("Files") > -1;

// use to drag dragenter and dragleave events.
// this is to know if the outermost parent is dragged over
// without issues due to drag events on its children
let counter = 0;

// reset counter and append file to gallery when file is dropped
function dropHandler(ev) {
    ev.preventDefault();
    for (const file of ev.dataTransfer.files) {
        addFile(gallery, file);
        overlay.classList.remove("draggedover");
        counter = 0;
    }
}

// only react to actual files being dragged
function dragEnterHandler(e) {
    e.preventDefault();
    if (!hasFiles(e)) {
        return;
    }
    ++counter && overlay.classList.add("draggedover");
}

function dragLeaveHandler(e) {
    1 > --counter && overlay.classList.remove("draggedover");
}

function dragOverHandler(e) {
    if (hasFiles(e)) {
        e.preventDefault();
    }
}

// event delegation to caputre delete events
// fron the waste buckets in the file preview cards
galleryCreate.onclick = ({ target }) => {
    if (target.classList.contains("delete")) {
        const ou = target.dataset.target;
        document.getElementById(ou).remove(ou);
        galleryCreate.children.length === 1 && empty.classList.remove("hidden");
        delete FILES[ou];
    }
};
