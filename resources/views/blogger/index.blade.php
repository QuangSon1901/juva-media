@extends('layouts.layout')
@section('content')
<div>
    <div class="container mx-auto py-8">
        <main class="grow">
            <main class="pt-6 pb-8 bg-white lg:pb-16 ">
                <div class="flex justify-between px-4 mx-auto max-w-8xl">
                    <div class="w-full max-w-3xl mx-auto">
                        <div class="flex items-center justify-between py-4 border-t border-b border-gray-200 not-format"><span class="text-sm font-bold text-gray-900 lg:mb-0" id="total-post-count"></span></div>
                        <div class="divide-y divide-gray-200" id="blog-post-article">
                        </div>
                    </div>
                    <aside class="hidden lg:block lg:w-80" aria-labelledby="sidebar-label">
                        <div class="sticky top-36">
                            <div class="h-9 px-4 pl-9 relative w-full flex overflow-hidden bg-white border rounded-full border-neutral-400">
                                <input type="text" placeholder="Tìm kiếm bài viết" id="search-blog" class="outline-none border-none bg-transparent w-full">
                                <button class="absolute top-0 left-0 h-9 w-9 text-sm flex items-center justify-center cursor-pointer">
                                    <box-icon name='search' color="#aaa" class="w-5 h-5"></box-icon>
                                </button>
                            </div>
                            <div class="p-6 pb-4 mt-6 mb-6 font-medium text-gray-500 bg-white border border-gray-200 rounded-lg">
                                <h4 class="mb-4 font-bold text-gray-900 uppercase ">Chủ đề được đề xuất</h4>
                                <div class="flex flex-wrap" id="topic-post-tag"></div>
                            </div>
                        </div>
                    </aside>
                </div>
            </main>
        </main>
    </div>
</div>
@endsection
@push('scripts')
<script type="text/javascript" src="{{ asset('js/blogger/index.js?version=1')}}"></script>
@endpush