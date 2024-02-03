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
<div id="modal-create-blog-admin" class="fixed inset-0 hidden items-center justify-center">
    <div class="absolute inset-0 bg-black opacity-50"></div>
    <div role="status" class="absolute inset-0 bg-[rgba(0,0,0,0.5)] z-20 items-center justify-center hidden" id="modal-create-blog-admin-loading">
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
                        <div class="md:col-span-3 grid gap-4 gap-y-2 text-sm grid-cols-1 md:grid-cols-5">
                            <div class="md:col-span-5">
                                <label for="title">Tiêu đề</label>
                                <input type="text" name="title" id="title" class="h-10 border mt-1 rounded px-4 w-full bg-gray-50" value="" data-empty="1" data-max-length="255" />
                            </div>

                            <div class="md:col-span-5">
                                <label for="service_id">Chủ đề</label>
                                <div class="relative group mt-1 select-group">
                                    <button class="dropdown-button relative h-10 bg-gray-50 flex border border-gray-200 rounded items-center px-4 appearance-none outline-none text-gray-800 w-full">
                                        <span class="mr-2">Chủ đề</span>
                                        <button tabindex="-1" for="show_more" class="absolute top-1/2 -translate-y-1/2 right-8 cursor-pointer outline-none focus:outline-none border-l border-gray-200 transition-all text-gray-300 hover:text-blue-600">
                                            <svg class="w-4 h-4 mx-2 fill-current" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                                <polyline points="18 15 12 9 6 15"></polyline>
                                            </svg>
                                        </button>
                                        <button onclick="addTopicBlogCreate()" tabindex="-1" for="show_more" class="w-8 h-4 flex items-center justify-center absolute top-1/2 -translate-y-1/2 right-0 cursor-pointer outline-none focus:outline-none border-l border-gray-200 transition-all text-gray-300 hover:text-blue-600">
                                            <box-icon name='plus' size="sm" color="#D1D5DB"></box-icon>
                                        </button>
                                    </button>
                                    <div class="z-20 dropdown-menu topic-menu hidden absolute right-0 mt-2 rounded-md shadow-lg bg-white ring-1 ring-black ring-opacity-5 p-1 space-y-1">
                                        <!-- Search input -->
                                        <input class="search-input block w-full px-4 py-2 text-gray-800 border rounded-md  border-gray-300 focus:outline-none" type="text" placeholder="Search items" autocomplete="off">
                                    </div>
                                </div>
                            </div>

                            <div class="md:col-span-5">
                                <label for="description">Mô tả</label>
                                <textarea name="description" id="description" class="border mt-1 rounded px-4 w-full bg-gray-50" cols="20" rows="5"></textarea>
                            </div>
                        </div>

                        <div class="md:col-span-2">
                            <label for="image-blog" class="relative">
                                <img src="" alt="" id="image-blog-thumb" onerror="imageDefaultOnLoadError($(this))">
                                <input id="image-blog" type="file" class="hidden">
                            </label>
                        </div>

                        <div class="md:col-span-5">
                            <label for="content">Nội dung</label>
                            <textarea name="content" id="content" cols="30" rows="10"></textarea>
                        </div>

                        <div class="md:col-span-5 text-right">
                            <div class="inline-flex items-end gap-2">
                                <button class="bg-gray-500 hover:bg-gray-700 text-white font-bold py-2 px-4 rounded" onclick="closeModalCreateBlogAdmin()">Thoát</button>
                                <button class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded" onclick="saveModalCreateBlogAdmin()">Lưu lại</button>
                            </div>
                        </div>

                    </div>
                </div>

                <div class="text-gray-600 lg:col-span-2">
                </div>
            </div>
        </div>
    </div>
</div>

@include('ckfinder::setup')
@push('scripts')
<script>
    $(function() {
        CKEDITOR.replace("content", {
            filebrowserBrowseUrl: "{{ route('ckfinder_browser') }}",
            filebrowserImageBrowseUrl: "{{ route('ckfinder_browser') }}?type=Images&token=123",
            filebrowserFlashBrowseUrl: "{{ route('ckfinder_browser') }}?type=Flash&token=123",
            filebrowserUploadUrl: "{{ route('ckfinder_connector') }}?command=QuickUpload&type=Files",
            filebrowserImageUploadUrl: "{{ route('ckfinder_connector') }}?command=QuickUpload&type=Images",
            filebrowserFlashUploadUrl: "{{ route('ckfinder_connector') }}?command=QuickUpload&type=Flash",
        });
    })
</script>
<script type="text/javascript" src="{{ asset('js/admin/blog/create.js?version=2')}}"></script>
@endpush