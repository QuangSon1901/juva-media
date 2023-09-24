@extends('layouts.layout')
@section('content')
<div>
    <div class="container mx-auto  py-8">
        <div class="grid grid-cols-2 gap-4">
            <div class="grid grid-cols-1 gap-4">
                @foreach ($product['image'] as $image) 
                    <img class="w-100 h-auto" src="{{$image}}" alt="">
                @endforeach
            </div>
            <div>
                <h2 class="font-bold text-3xl leading-10">{{$product['name']}}</h2>
                <hr class="my-4" />
                <p>{{$product['description']}}</p>
                <hr class="my-4" />
                <div>
                    <div class="font-semibold text-lg">Chọn số lượng</div>
                    <ul class="space-y-4 py-4">
                        @foreach ($photography as $photo)
                            <li class="flex justify-between">
                                <div class="flex space-x-2">
                                    <img class="w-20 h-20 object-contain rounded-md border border-neutral-200" src="{{$photo['image']}}" alt="">
                                    <div class="flex space-x-8">
                                        <div>
                                            <p class="font-semibold">{{$photo['title']}}</p>
                                            <p>{{$photo['price_format']}} <sup class="font-semibold">đ</sup></p>
                                        </div>
                                        <div>
                                            <box-icon name='help-circle' color='#2251CC' class="w-5 h-5 cursor-pointer"></box-icon>
                                        </div>
                                    </div>
                                </div>
                                <div class="">
                                    <div class="flex items-center space-x-2 quantity-action">
                                        <div class="select-none w-5 h-5 rounded-full border border-neutral-200 flex items-center justify-center cursor-pointer" onclick="decreaseQuantity($(this))">
                                            <div>-</div>
                                        </div>
                                        <div>
                                            <input type="text" class="select-none w-12 h-8 bg-neutral-300 border border-neutral-500 text-center outline-none rounded-sm" disabled data-price="{{$photo['price']}}" data-id="{{$photo['id']}}" value="0">
                                        </div>
                                        <div class="select-none w-5 h-5 rounded-full border border-neutral-200 flex items-center justify-center cursor-pointer" onclick="increaseQuantity($(this))">
                                            <div>+</div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                        @endforeach
                    </ul>
                </div>
                <hr class="my-4" />
                <div class="sticky bottom-0 bg-white pt-10 pb-6 border-t border-neutral-200 ">
                    <div class="flex justify-between gap-10">
                        <div class="flex-1">
                            <p class="font-semibold text-lg">BẠN ĐANG CHỌN</p>
                            <p class="font-semibold line-clamp-box-1">Áo vest dáng dài nam chất liệu vải trơn - Kiểu Ghost 3D - GO8604 Để hoàn toàn hiểu rõ ưu - nhược điểm của KIỂU GHOST 3D trước khi lựa chọn, tìm hiểu thêm ở ĐÂY nhé!!!
                                GHOST 3D: sản phẩm sẽ được mặc vào Mannequin ...</p>
                        </div>
                        <div>
                            <p><span id="product-total-selected">0</span> <sup class="font-semibold">đ</sup></p>
                        </div>
                    </div>
                    <div class="mt-4">
                        <button class="w-full rounded-full bg-amber-400 border-none font-bold text-center py-3" data-id="{{$product['id']}}" onclick="addToCart($(this))">Thêm vào giỏ hàng</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
@push('scripts')
<script type="text/javascript" src="{{ asset('js/product/index.js?version=1')}}"></script>
@endpush