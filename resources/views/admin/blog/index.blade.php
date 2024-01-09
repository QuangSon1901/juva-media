@extends('admin.layout')
@section('content')
<div class="w-full mx-auto bg-white shadow-lg rounded-md border border-gray-200">
    <header class="px-5 py-4 border-b border-gray-100 flex justify-between items-center">
        <h2 class="font-semibold text-gray-800">Blog</h2>
        <button class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded" onclick="openModalCreateBlogAdmin()">Thêm mới</button>
    </header>
    <div class="p-3">
        <div class="overflow-x-auto">
            <table class="table-auto w-full">
                <thead class="text-xs font-semibold uppercase text-gray-400 bg-gray-50">
                    <tr>
                        <th class="p-2 whitespace-nowrap">
                            <div class="font-semibold text-left">Tiêu đề</div>
                        </th>
                        <th class="p-2 whitespace-nowrap">
                            <div class="font-semibold text-left">Chủ đề</div>
                        </th>
                        <th class="p-2 whitespace-nowrap">
                            <div class="font-semibold text-left">Trạng thái</div>
                        </th>
                        <th class="p-2 whitespace-nowrap">
                            <div class="font-semibold text-center"></div>
                        </th>
                    </tr>
                </thead>
                <tbody id="blog-admin-table" class="text-sm divide-y divide-gray-100"></tbody>
            </table>
        </div>
    </div>
</div>
@include('admin.blog.create')
@include('admin.blog.update')


@endsection
@push('scripts')
<script type="text/javascript" src="{{ asset('js/admin/blog/index.js?version=1')}}"></script>

@endpush