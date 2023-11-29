@extends('admin.layout')
@section('content')
<div class="w-full mx-auto bg-white shadow-lg rounded-md border border-gray-200">
    <header class="px-5 py-4 border-b border-gray-100 flex justify-between items-center">
        <h2 class="font-semibold text-gray-800">Đơn hàng</h2>
    </header>
    <div class="p-3">
        <div class="overflow-x-auto">
            <table class="table-auto w-full">
                <thead class="text-xs font-semibold uppercase text-gray-400 bg-gray-50">
                    <tr>
                        <th class="p-2 whitespace-nowrap">
                            <div class="font-semibold text-center">#id</div>
                        </th>
                        <th class="p-2 whitespace-nowrap">
                            <div class="font-semibold text-left">Tên sản phẩm</div>
                        </th>
                        <th class="p-2 whitespace-nowrap">
                            <div class="font-semibold text-left">Ngày đặt hàng</div>
                        </th>
                        <th class="p-2 whitespace-nowrap">
                            <div class="font-semibold text-center"></div>
                        </th>
                    </tr>
                </thead>
                <tbody id="order-admin-table" class="text-sm divide-y divide-gray-100"></tbody>
            </table>
        </div>
    </div>
</div>
@endsection
@push('scripts')
<script type="text/javascript" src="{{ asset('js/admin/order/index.js?version=1')}}"></script>
@endpush