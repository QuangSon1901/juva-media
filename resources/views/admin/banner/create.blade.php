<div id="modal-create-banner-admin" class="fixed inset-0 hidden items-center justify-center">
    <div class="absolute inset-0 bg-black opacity-50"></div>
    <div role="status" class="absolute inset-0 bg-[rgba(0,0,0,0.5)] z-20 flex items-center justify-center hidden" id="modal-create-service-banner-loading">
        <svg aria-hidden="true" class="w-8 h-8 mr-2 text-gray-200 animate-spin dark:text-gray-600 fill-blue-600" viewBox="0 0 100 101" fill="none" xmlns="http://www.w3.org/2000/svg">
            <path d="M100 50.5908C100 78.2051 77.6142 100.591 50 100.591C22.3858 100.591 0 78.2051 0 50.5908C0 22.9766 22.3858 0.59082 50 0.59082C77.6142 0.59082 100 22.9766 100 50.5908ZM9.08144 50.5908C9.08144 73.1895 27.4013 91.5094 50 91.5094C72.5987 91.5094 90.9186 73.1895 90.9186 50.5908C90.9186 27.9921 72.5987 9.67226 50 9.67226C27.4013 9.67226 9.08144 27.9921 9.08144 50.5908Z" fill="currentColor" />
            <path d="M93.9676 39.0409C96.393 38.4038 97.8624 35.9116 97.0079 33.5539C95.2932 28.8227 92.871 24.3692 89.8167 20.348C85.8452 15.1192 80.8826 10.7238 75.2124 7.41289C69.5422 4.10194 63.2754 1.94025 56.7698 1.05124C51.7666 0.367541 46.6976 0.446843 41.7345 1.27873C39.2613 1.69328 37.813 4.19778 38.4501 6.62326C39.0873 9.04874 41.5694 10.4717 44.0505 10.1071C47.8511 9.54855 51.7191 9.52689 55.5402 10.0491C60.8642 10.7766 65.9928 12.5457 70.6331 15.2552C75.2735 17.9648 79.3347 21.5619 82.5849 25.841C84.9175 28.9121 86.7997 32.2913 88.1811 35.8758C89.083 38.2158 91.5421 39.6781 93.9676 39.0409Z" fill="currentFill" />
        </svg>
        <span class="sr-only">Loading...</span>
    </div>
    <div class="z-10 container mx-auto">
        <div class="bg-white rounded shadow-lg p-4 px-4 md:p-8 mb-6">
            <div class="grid gap-4 gap-y-2 text-sm grid-cols-1">
                <div class="text-gray-600 lg:col-span-2">
                    <article aria-label="File Upload Modal" class="relative h-full flex flex-col bg-white">
                        <section class="h-full overflow-auto p-8 w-full flex gap-2">
                            <header class="w-1/4 border-dashed border-2 border-gray-400 py-12 px-4 flex flex-col justify-center items-center">
                                <p class="mb-3 font-semibold text-gray-900 flex flex-wrap justify-center">
                                    <span>Kéo và thả vào ảnh của bạn</span>
                                </p>
                                <button class="upload-btn mt-2 rounded-sm px-3 py-1 bg-gray-200 hover:bg-gray-300 focus:shadow-outline focus:outline-none">
                                    Tải ảnh
                                </button>
                                <input id="image-create-banner" type="file" multiple class="hidden" accept="image/png, image/jpg, image/jpeg, image/webp" data-file="1" data-min-file="1"/>
                            </header>

                            <div class="flex-1">
                                <ul id="gallery-create-banner" class="flex flex-1 flex-wrap -m-1">
                                    <li id="empty-create-banner" class="h-full w-full text-center flex flex-col items-center justify-center">
                                        <img class="mx-auto w-32" src="https://user-images.githubusercontent.com/507615/54591670-ac0a0180-4a65-11e9-846c-e55ffce0fe7b.png" alt="no data" />
                                        <span class="text-small text-gray-500">Chưa có ảnh được chọn</span>
                                    </li>
                                </ul>
                            </div>
                        </section>
                    </article>
                </div>
            </div>
            <div class="md:col-span-5 text-right pt-3">
                <div class="inline-flex items-end gap-2">
                    <button class="bg-gray-500 hover:bg-gray-700 text-white font-bold py-2 px-4 rounded" onclick="closeModalCreateBannerAdmin()">Thoát</button>
                    <button class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded" onclick="saveModalCreateBannerAdmin()">Lưu lại</button>
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
@push('scripts')
<script type="text/javascript" src="{{ asset('js/admin/banner/create.js?version=1')}}"></script>
@endpush