@extends('layouts.layout')
@section('content')
<div>
    <div class="container mx-auto py-8">
        <main class="grow">
            <main class="pt-6 pb-8 bg-white lg:pb-16 ">
                <div class="flex justify-between lg:px-4 mx-auto max-w-8xl gap-8">
                    <div class="w-full max-w-3xl mx-auto">
                        <div class="divide-y divide-gray-200">
                            <article class="w-full max-w-2xl mx-auto format format-sm sm:format-base lg:format-lg format-blue">
                                <header class="mb-4 not-format">
                                    <h1 class="mb-2 text-3xl font-extrabold leading-tight text-gray-900 lg:mb-6 lg:text-4xl">{{$post_data->title}}</h1>
                                    <div class="flex flex-wrap mb-4"><a class="bg-blue-100 text-blue-800 text-sm font-medium mr-2 px-2.5 py-0.5 rounded hover:bg-blue-200  mb-2" href="/blog?topic={{$post_data->topic->slug}}">#{{$post_data->topic->name}}</a></div>
                                    <!-- <div class="text-base">
                                        <address class="inline">Published by <a rel="author" class="text-gray-900 no-underline hover:underline" href="/blog/author/zoltan/">Zoltán Szőgyényi</a></address> <time pubdate="true" datetime="2023-02-23T10:01:43.000+00:00"><time datetime="1677146503000">10 months ago</time></time>
                                    </div> -->
                                </header>
                                <div class="flex items-center justify-between">
                                    <aside aria-label="Share social media">
                                        <a href="https://twitter.com/intent/tweet?text={{$post_data->title}} - JuvaMedia Blog https://juvamedia.vn/blog/{{$post_data->slug}}" class="inline-flex items-center px-3 py-2 mr-2 text-xs font-medium text-gray-900 no-underline bg-white border border-gray-200 rounded-lg focus:outline-none hover:bg-gray-100 hover:text-primary-700 focus:z-10 focus:ring-4 focus:ring-gray-200 "><svg class="w-4 h-4 mr-2" fill="currentColor" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
                                                <path d="M459.37 151.716c.325 4.548.325 9.097.325 13.645 0 138.72-105.583 298.558-298.558 298.558-59.452 0-114.68-17.219-161.137-47.106 8.447.974 16.568 1.299 25.34 1.299 49.055 0 94.213-16.568 130.274-44.832-46.132-.975-84.792-31.188-98.112-72.772 6.498.974 12.995 1.624 19.818 1.624 9.421 0 18.843-1.3 27.614-3.573-48.081-9.747-84.143-51.98-84.143-102.985v-1.299c13.969 7.797 30.214 12.67 47.431 13.319-28.264-18.843-46.781-51.005-46.781-87.391 0-19.492 5.197-37.36 14.294-52.954 51.655 63.675 129.3 105.258 216.365 109.807-1.624-7.797-2.599-15.918-2.599-24.04 0-57.828 46.782-104.934 104.934-104.934 30.213 0 57.502 12.67 76.67 33.137 23.715-4.548 46.456-13.32 66.599-25.34-7.798 24.366-24.366 44.833-46.132 57.827 21.117-2.273 41.584-8.122 60.426-16.243-14.292 20.791-32.161 39.308-52.628 54.253z"></path>
                                            </svg> Tweet
                                        </a>
                                        <a href="https://www.facebook.com/sharer/sharer.php?u=https://juvamedia.vn/blog/{{$post_data->slug}}" class="inline-flex items-center px-3 py-2 mr-2 text-xs font-medium text-gray-900 no-underline bg-white border border-gray-200 rounded-lg focus:outline-none hover:bg-gray-100 hover:text-primary-700 focus:z-10 focus:ring-4 focus:ring-gray-200 "><svg class="w-4 h-4 mr-2" fill="currentColor" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
                                                <path d="M504 256C504 119 393 8 256 8S8 119 8 256c0 123.78 90.69 226.38 209.25 245V327.69h-63V256h63v-54.64c0-62.15 37-96.48 93.67-96.48 27.14 0 55.52 4.84 55.52 4.84v61h-31.28c-30.8 0-40.41 19.12-40.41 38.73V256h68.78l-11 71.69h-57.78V501C413.31 482.38 504 379.78 504 256z"></path>
                                            </svg> Share
                                        </a>
                                            <!-- <button type="button" class="inline-flex items-center px-3 py-2 text-xs font-medium text-gray-900 no-underline bg-white border border-gray-200 rounded-lg focus:outline-none hover:bg-gray-100 hover:text-primary-700 focus:z-10 focus:ring-4 focus:ring-gray-200 "><svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" aria-hidden="true" class="w-4 h-4 mr-2">
                                                <path stroke-linecap="round" stroke-linejoin="round" d="M8 16H6a2 2 0 01-2-2V6a2 2 0 012-2h8a2 2 0 012 2v2m-6 12h8a2 2 0 002-2v-8a2 2 0 00-2-2h-8a2 2 0 00-2 2v8a2 2 0 002 2z"></path>
                                            </svg>Copy URL</button> -->
                                    </aside>
                                </div>
                                <div class="py-2">
                                    {{$post_data->description}}
                                </div>
                                <div class="py-2">
                                    {!! $post_data->content !!}
                                </div>
                            </article>
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
<script type="text/javascript" src="{{ asset('js/blogger/blog.js?version=1')}}"></script>
@endpush