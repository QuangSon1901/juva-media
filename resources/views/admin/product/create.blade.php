<style>
    .hasImage:hover section {
        background-color: rgba(5, 5, 5, 0.4);
    }

    .hasImage:hover button:hover {
        background: rgba(5, 5, 5, 0.45);
    }

    #overlay p,
    i {
        opacity: 0;
    }

    #overlay.draggedover {
        background-color: rgba(255, 255, 255, 0.7);
    }

    #overlay.draggedover p,
    #overlay.draggedover i {
        opacity: 1;
    }

    .group:hover .group-hover\:text-blue-800 {
        color: #2b6cb0;
    }
</style>
<div id="modal-create-product-admin" class="fixed inset-0 hidden items-center justify-center">
    <div class="absolute inset-0 bg-black opacity-50"></div>
    <div role="status" class="absolute inset-0 bg-[rgba(0,0,0,0.5)] z-20 flex items-center justify-center hidden" id="modal-create-product-admin-loading">
        <svg aria-hidden="true" class="w-8 h-8 mr-2 text-gray-200 animate-spin dark:text-gray-600 fill-blue-600" viewBox="0 0 100 101" fill="none" xmlns="http://www.w3.org/2000/svg">
            <path d="M100 50.5908C100 78.2051 77.6142 100.591 50 100.591C22.3858 100.591 0 78.2051 0 50.5908C0 22.9766 22.3858 0.59082 50 0.59082C77.6142 0.59082 100 22.9766 100 50.5908ZM9.08144 50.5908C9.08144 73.1895 27.4013 91.5094 50 91.5094C72.5987 91.5094 90.9186 73.1895 90.9186 50.5908C90.9186 27.9921 72.5987 9.67226 50 9.67226C27.4013 9.67226 9.08144 27.9921 9.08144 50.5908Z" fill="currentColor" />
            <path d="M93.9676 39.0409C96.393 38.4038 97.8624 35.9116 97.0079 33.5539C95.2932 28.8227 92.871 24.3692 89.8167 20.348C85.8452 15.1192 80.8826 10.7238 75.2124 7.41289C69.5422 4.10194 63.2754 1.94025 56.7698 1.05124C51.7666 0.367541 46.6976 0.446843 41.7345 1.27873C39.2613 1.69328 37.813 4.19778 38.4501 6.62326C39.0873 9.04874 41.5694 10.4717 44.0505 10.1071C47.8511 9.54855 51.7191 9.52689 55.5402 10.0491C60.8642 10.7766 65.9928 12.5457 70.6331 15.2552C75.2735 17.9648 79.3347 21.5619 82.5849 25.841C84.9175 28.9121 86.7997 32.2913 88.1811 35.8758C89.083 38.2158 91.5421 39.6781 93.9676 39.0409Z" fill="currentFill" />
        </svg>
        <span class="sr-only">Loading...</span>
    </div>
    <div class="z-10 container mx-auto">
        <div class="bg-white rounded shadow-lg p-4 px-4 md:p-8 mb-6 max-h-[80vh] overflow-y-auto">
            <div class="grid gap-y-2 text-sm grid-cols-1">
                <div class="bg-white shadow-xl rounded-md p-4">
                    <div class="grid gap-4 gap-y-2 text-sm grid-cols-1 md:grid-cols-5">
                        <div class="md:col-span-5">
                            <label for="name">Tên sản phẩm</label>
                            <input type="text" name="name" id="name" class="h-10 border mt-1 rounded px-4 w-full bg-gray-50" value="" data-empty="1" data-max-length="50"/>
                        </div>

                        <div class="md:col-span-2">
                            <label for="service_id">Danh mục</label>
                            <div class="relative group mt-1 select-group">
                                <button class="dropdown-button relative h-10 bg-gray-50 flex border border-gray-200 rounded items-center px-4 appearance-none outline-none text-gray-800 w-full">
                                    <span class="mr-2">Danh mục</span>
                                    <button tabindex="-1" for="show_more" class="absolute top-1/2 -translate-y-1/2 right-0 cursor-pointer outline-none focus:outline-none border-l border-gray-200 transition-all text-gray-300 hover:text-blue-600">
                                        <svg class="w-4 h-4 mx-2 fill-current" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                            <polyline points="18 15 12 9 6 15"></polyline>
                                        </svg>
                                    </button>
                                </button>
                                <div class="z-20 dropdown-menu category-menu hidden absolute right-0 mt-2 rounded-md shadow-lg bg-white ring-1 ring-black ring-opacity-5 p-1 space-y-1">
                                    <!-- Search input -->
                                    <input class="search-input block w-full px-4 py-2 text-gray-800 border rounded-md  border-gray-300 focus:outline-none" type="text" placeholder="Search items" autocomplete="off">
                                </div>
                            </div>
                        </div>

                        <div class="md:col-span-2">
                            <label for="service_id">Loại</label>
                            <div class="relative group mt-1 select-group">
                                <button class="dropdown-button relative h-10 bg-gray-50 flex border border-gray-200 rounded items-center px-4 appearance-none outline-none text-gray-800 w-full">
                                    <span class="mr-2">Loại</span>
                                    <button tabindex="-1" for="show_more" class="absolute top-1/2 -translate-y-1/2 right-8 cursor-pointer outline-none focus:outline-none border-l border-gray-200 transition-all text-gray-300 hover:text-blue-600">
                                        <svg class="w-4 h-4 mx-2 fill-current" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                            <polyline points="18 15 12 9 6 15"></polyline>
                                        </svg>
                                    </button>
                                    <button onclick="addTypeProductCreate()" tabindex="-1" for="show_more" class="w-8 h-4 flex items-center justify-center absolute top-1/2 -translate-y-1/2 right-0 cursor-pointer outline-none focus:outline-none border-l border-gray-200 transition-all text-gray-300 hover:text-blue-600">
                                        <box-icon name='plus' size="sm" color="#D1D5DB"></box-icon>
                                    </button>
                                </button>
                                <div class="z-20 dropdown-menu type-menu hidden absolute right-0 mt-2 rounded-md shadow-lg bg-white ring-1 ring-black ring-opacity-5 p-1 space-y-1">
                                    <!-- Search input -->
                                    <input class="search-input block w-full px-4 py-2 text-gray-800 border rounded-md  border-gray-300 focus:outline-none" type="text" placeholder="Search items" autocomplete="off">
                                </div>
                            </div>
                        </div>

                        <div class="md:col-span-1">
                            <label for="price">Giá thành chung</label>
                            <input type="text" name="price" id="price" class="h-10 border mt-1 rounded px-4 w-full bg-gray-50" value="0" data-empty="1"/>
                        </div>

                        <div class="md:col-span-5">
                            <label for="description">Góc chụp</label>
                            <div class="grid grid-cols-1">
                                <div class="space-y-2">
                                    <div>
                                        <div class="relative group mt-1 select-group">
                                            <button class="dropdown-button relative h-10 bg-gray-50 flex border border-gray-200 rounded items-center px-4 appearance-none outline-none text-gray-800 w-full">
                                                <span class="mr-2">Chọn góc chụp</span>
                                                <button tabindex="-1" for="show_more" class="absolute top-1/2 -translate-y-1/2 right-8 cursor-pointer outline-none focus:outline-none border-l border-gray-200 transition-all text-gray-300 hover:text-blue-600">
                                                    <svg class="w-4 h-4 mx-2 fill-current" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                                        <polyline points="18 15 12 9 6 15"></polyline>
                                                    </svg>
                                                </button>
                                                <button onclick="addGraphyProductCreate()" tabindex="-1" for="show_more" class="w-8 h-4 flex items-center justify-center absolute top-1/2 -translate-y-1/2 right-0 cursor-pointer outline-none focus:outline-none border-l border-gray-200 transition-all text-gray-300 hover:text-blue-600">
                                                    <box-icon name='plus' size="sm" color="#D1D5DB"></box-icon>
                                                </button>
                                            </button>
                                            <div class="z-20 dropdown-menu graphy-menu hidden absolute right-0 mt-2 rounded-md shadow-lg bg-white ring-1 ring-black ring-opacity-5 p-1 space-y-1">
                                                <!-- Search input -->
                                                <input class="search-input block w-full px-4 py-2 text-gray-800 border rounded-md  border-gray-300 focus:outline-none" type="text" placeholder="Search items" autocomplete="off">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="w-full min-h-[100px] border border-[#d1d1d1] rounded-[4px]">
                                        <ul class="p-2 space-y-2 graphy-list"></ul>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="md:col-span-5">
                            <label for="description">Mô tả</label>
                            <textarea name="description" id="description" cols="30" rows="10"></textarea>
                        </div>

                        <div class="md:col-span-5">
                            <label>Ảnh chính</label>
                            <article aria-label="File Upload Modal" class="relative flex flex-col bg-white rounded-md">
                                <div id="overlay" class="w-full h-full absolute top-0 left-0 pointer-events-none z-50 flex flex-col items-center justify-center rounded-md">
                                    <i>
                                        <svg class="fill-current w-12 h-12 mb-3 text-blue-700" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
                                            <path d="M19.479 10.092c-.212-3.951-3.473-7.092-7.479-7.092-4.005 0-7.267 3.141-7.479 7.092-2.57.463-4.521 2.706-4.521 5.408 0 3.037 2.463 5.5 5.5 5.5h13c3.037 0 5.5-2.463 5.5-5.5 0-2.702-1.951-4.945-4.521-5.408zm-7.479-1.092l4 4h-3v4h-2v-4h-3l4-4z" />
                                        </svg>
                                    </i>
                                    <p class="text-lg text-blue-700">Thả tập tin để tải lên</p>
                                </div>

                                <section class="h-full overflow-auto p-8 w-full space-y-2">
                                    <header class="w-full border-dashed border-2 border-gray-400 py-12 px-4 flex flex-col justify-center items-center">
                                        <p class="mb-3 font-semibold text-gray-900 flex flex-wrap justify-center">
                                            <span>Kéo và thả vào ảnh của bạn</span>
                                        </p>
                                        <button class="upload-btn mt-2 rounded-sm px-3 py-1 bg-gray-200 hover:bg-gray-300 focus:shadow-outline focus:outline-none">
                                            Tải ảnh
                                        </button>
                                        <input id="main-image-create-product" type="file" class="hidden" accept="image/png, image/jpg, image/jpeg, image/webp" data-file="1"/>
                                    </header>

                                    <ul id="main-gallery-create-product" class="flex flex-1 flex-wrap -m-1">
                                        <li id="main-empty-create-product" class="h-full w-full text-center flex flex-col items-center justify-center">
                                            <img class="mx-auto w-32" src="https://user-images.githubusercontent.com/507615/54591670-ac0a0180-4a65-11e9-846c-e55ffce0fe7b.png" alt="no data" />
                                            <span class="text-small text-gray-500">Chưa có ảnh được chọn</span>
                                        </li>
                                    </ul>
                                </section>
                            </article>
                        </div>

                        <div class="md:col-span-5">
                            <label>Ảnh phụ</label>
                            <article aria-label="File Upload Modal" class="relative flex flex-col bg-white rounded-md">
                                <div id="overlay" class="w-full h-full absolute top-0 left-0 pointer-events-none z-50 flex flex-col items-center justify-center rounded-md">
                                    <i>
                                        <svg class="fill-current w-12 h-12 mb-3 text-blue-700" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
                                            <path d="M19.479 10.092c-.212-3.951-3.473-7.092-7.479-7.092-4.005 0-7.267 3.141-7.479 7.092-2.57.463-4.521 2.706-4.521 5.408 0 3.037 2.463 5.5 5.5 5.5h13c3.037 0 5.5-2.463 5.5-5.5 0-2.702-1.951-4.945-4.521-5.408zm-7.479-1.092l4 4h-3v4h-2v-4h-3l4-4z" />
                                        </svg>
                                    </i>
                                    <p class="text-lg text-blue-700">Thả tập tin để tải lên</p>
                                </div>

                                <section class="h-full overflow-auto p-8 w-full space-y-2">
                                    <header class="w-full border-dashed border-2 border-gray-400 py-12 px-4 flex flex-col justify-center items-center">
                                        <p class="mb-3 font-semibold text-gray-900 flex flex-wrap justify-center">
                                            <span>Kéo và thả vào ảnh của bạn</span>
                                        </p>
                                        <button class="upload-btn mt-2 rounded-sm px-3 py-1 bg-gray-200 hover:bg-gray-300 focus:shadow-outline focus:outline-none">
                                            Tải ảnh
                                        </button>
                                        <input id="more-image-create-product" type="file" multiple class="hidden" accept="image/png, image/jpg, image/jpeg, image/webp" data-file="1"/>
                                    </header>

                                    <ul id="more-gallery-create-product" class="flex flex-1 flex-wrap -m-1">
                                        <li id="more-empty-create-product" class="h-full w-full text-center flex flex-col items-center justify-center">
                                            <img class="mx-auto w-32" src="https://user-images.githubusercontent.com/507615/54591670-ac0a0180-4a65-11e9-846c-e55ffce0fe7b.png" alt="no data" />
                                            <span class="text-small text-gray-500">Chưa có ảnh được chọn</span>
                                        </li>
                                    </ul>
                                </section>
                            </article>
                        </div>

                        <div class="md:col-span-5 text-right">
                            <div class="inline-flex items-end gap-2">
                                <button class="bg-gray-500 hover:bg-gray-700 text-white font-bold py-2 px-4 rounded" onclick="closeModalCreateProductAdmin()">Thoát</button>
                                <button class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded" onclick="saveModalCreateProductAdmin()">Lưu lại</button>
                            </div>
                        </div>

                    </div>
                </div>

                <div class="text-gray-600 lg:col-span-2">
                    <!-- <article aria-label="File Upload Modal" class="relative h-full flex flex-col bg-white shadow-xl rounded-md" ondrop="dropHandler(event);" ondragover="dragOverHandler(event);" ondragleave="dragLeaveHandler(event);" ondragenter="dragEnterHandler(event);">
                        <div id="overlay" class="w-full h-full absolute top-0 left-0 pointer-events-none z-50 flex flex-col items-center justify-center rounded-md">
                            <i>
                                <svg class="fill-current w-12 h-12 mb-3 text-blue-700" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
                                    <path d="M19.479 10.092c-.212-3.951-3.473-7.092-7.479-7.092-4.005 0-7.267 3.141-7.479 7.092-2.57.463-4.521 2.706-4.521 5.408 0 3.037 2.463 5.5 5.5 5.5h13c3.037 0 5.5-2.463 5.5-5.5 0-2.702-1.951-4.945-4.521-5.408zm-7.479-1.092l4 4h-3v4h-2v-4h-3l4-4z" />
                                </svg>
                            </i>
                            <p class="text-lg text-blue-700">Thả tập tin để tải lên</p>
                        </div>

                        <section class="h-full overflow-auto p-8 w-full space-y-2">
                            <header class="w-full border-dashed border-2 border-gray-400 py-12 px-4 flex flex-col justify-center items-center">
                                <p class="mb-3 font-semibold text-gray-900 flex flex-wrap justify-center">
                                    <span>Kéo và thả vào ảnh của bạn</span>
                                </p>
                                <input id="hidden-input" type="file" multiple class="hidden" accept="image/png, image/jpg, image/jpeg, image/webp" data-file="1"/>
                                <button id="button" class="mt-2 rounded-sm px-3 py-1 bg-gray-200 hover:bg-gray-300 focus:shadow-outline focus:outline-none">
                                    Tải ảnh
                                </button>
                            </header>

                            <ul id="gallery" class="flex flex-1 flex-wrap -m-1">
                                <li id="empty" class="h-full w-full text-center flex flex-col items-center justify-center">
                                    <img class="mx-auto w-32" src="https://user-images.githubusercontent.com/507615/54591670-ac0a0180-4a65-11e9-846c-e55ffce0fe7b.png" alt="no data" />
                                    <span class="text-small text-gray-500">Chưa có ảnh được chọn</span>
                                </li>
                            </ul>
                        </section>
                    </article> -->
                </div>
            </div>
        </div>
    </div>
</div>
<template id="image-template">
    <li class="block p-1 w-1/4 h-auto">
        <article tabindex="0" class="group hasImage w-full h-full rounded-md focus:outline-none focus:shadow-outline bg-gray-100 cursor-pointer relative text-transparent hover:text-white shadow-sm">
            <img alt="upload preview" class="img-preview w-full h-full sticky object-cover rounded-md bg-fixed" />

            <section class="flex flex-col rounded-md text-xs break-words w-full h-full z-20 absolute top-0 py-2 px-3">
                <h1 class="flex-1"></h1>
                <div class="flex">
                    <span class="p-1">
                        <i>
                            <svg class="fill-current w-4 h-4 ml-auto pt-" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
                                <path d="M5 8.5c0-.828.672-1.5 1.5-1.5s1.5.672 1.5 1.5c0 .829-.672 1.5-1.5 1.5s-1.5-.671-1.5-1.5zm9 .5l-2.519 4-2.481-1.96-4 5.96h14l-5-8zm8-4v14h-20v-14h20zm2-2h-24v18h24v-18z" />
                            </svg>
                        </i>
                    </span>

                    <p class="p-1 size text-xs"></p>
                    <button class="delete ml-auto focus:outline-none hover:bg-gray-300 p-1 rounded-md">
                        <svg class="pointer-events-none fill-current w-4 h-4 ml-auto" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
                            <path class="pointer-events-none" d="M3 6l3 18h12l3-18h-18zm19-4v2h-20v-2h5.711c.9 0 1.631-1.099 1.631-2h5.316c0 .901.73 2 1.631 2h5.711z" />
                        </svg>
                    </button>
                </div>
            </section>
        </article>
    </li>
</template>
<!-- <script>
    const imageTempl = document.getElementById("image-template"),
        empty = document.getElementById("empty");

    // use to store pre selected files
    let FILES = {};

    // check if file is of type image and prepend the initialied
    // template to the target element
    function addFile(target, file) {
        const isImage = file.type.match("image.*"),
            objectURL = URL.createObjectURL(file);

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

        empty.classList.add("hidden");
        target.prepend(clone);

        FILES[objectURL] = file;
    }

    const gallery = document.getElementById("gallery"),
        overlay = document.getElementById("overlay");

    // click the hidden input of type file if the visible button is clicked
    // and capture the selected files
    const hidden = document.getElementById("hidden-input");
    document.getElementById("button").onclick = () => hidden.click();
    hidden.onchange = (e) => {
        for (const file of e.target.files) {
            addFile(gallery, file);
        }
    };

    // use to check if a file is being dragged
    const hasFiles = ({
            dataTransfer: {
                types = []
            }
        }) =>
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
    gallery.onclick = ({
        target
    }) => {
        if (target.classList.contains("delete")) {
            const ou = target.dataset.target;
            document.getElementById(ou).remove(ou);
            gallery.children.length === 1 && empty.classList.remove("hidden");
            delete FILES[ou];
        }
    };
</script> -->

@include('ckfinder::setup')
@push('scripts')
<script type="text/javascript" src="{{ asset('js/admin/product/create.js')}}"></script>
@endpush