@extends('layouts.layout')
@section('content')
<div>
    <div class="container mx-auto  py-8">
        <div class="grid grid-cols-[2fr,1fr] gap-12 cart">
            <div class="cart-list">
                <h2 class="font-bold text-xl">Giỏ hàng</h2>
                <hr class="my-4" />
                <div>
                    <ul class="space-y-4 py-4">
                        @foreach ($data_cart['data'] as $product)
                            <li class=" p-2 border border-dashed hover:border-gray-400 rounded-md product-in-cart">
                                <div class="flex justify-between">
                                    <div class="flex space-x-2">
                                        <img class="w-20 h-20 object-contain rounded-md border border-neutral-200" src="{{$product['product_image']}}" alt="">
                                        <div class="flex space-x-8">
                                            <div>
                                                <p class="font-semibold">{{$product['product_name']}}</p>
                                                <p><span class="total-product-in-cart">{{$product['product_total']}}</span> <sup class="font-semibold">đ</sup></p>
                                                <div class="flex text-sm space-x-4 text-neutral-500">
                                                    <div data-id="{{$product['product_id']}}" class="cursor-pointer">Chi tiết <box-icon class="w-[14px] h-[14px] translate-y-[1px]" color='#737373' name='expand-alt'></box-icon></div>
                                                    <!-- <div class="cursor-pointer">Chỉnh sửa <box-icon class="w-[14px] h-[14px] translate-y-[1px]" color='#737373' name='edit' type='solid'></box-icon></div> -->
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="">
                                        <div class="flex space-x-6 items-center">
                                            <div>
                                                <p data-id="{{$product['product_id']}}" class="underline text-neutral-500 cursor-pointer" onclick="removeProductCart($(this))">Xoá</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <ul class="grid grid-cols-1 gap-4 pl-10 py-4 product-photography-list">
                                    @foreach ($product['list'] as $photography)
                                    <li class="flex justify-between product-photography-item">
                                        <div class="flex space-x-2">
                                            <img class="w-10 h-10 object-contain rounded-md border border-neutral-200" src="{{$photography['photography_image']}}" alt="">
                                            <div class="flex space-x-8">
                                                <div>
                                                    <p class="text-sm font-semibold">{{$photography['photography_title']}}</p>
                                                    <p class="text-sm">{{$photography['photography_price_unit']}} <sup class="font-semibold">đ</sup></p>
                                                </div>
                                                <div>
                                                    <box-icon name='help-circle' color='#2251CC' class="w-5 h-5 cursor-pointer"></box-icon>
                                                </div>
                                            </div>
                                        </div>
                                        <div>
                                            <div class="flex items-center space-x-2 quantity-action">
                                                <div class="select-none w-5 h-5 rounded-full border border-neutral-200 flex items-center justify-center cursor-pointer" onclick="decreaseQuantityCart($(this))">
                                                    <div>-</div>
                                                </div>
                                                <div>
                                                    <input type="text" class="select-none w-12 h-8 bg-neutral-300 border border-neutral-500 text-center outline-none rounded-sm" disabled data-price="{{$photography['price']}}" data-id="{{$photography['photography_id']}}" value="{{$photography['quantity']}}">
                                                </div>
                                                <div class="select-none w-5 h-5 rounded-full border border-neutral-200 flex items-center justify-center cursor-pointer" onclick="increaseQuantityCart($(this))">
                                                    <div>+</div>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                    @endforeach
                                    
                                </ul>
                            </li>
                        @endforeach
                    </ul>
                </div>
            </div>
            <div class="form-order hidden">
                <h2 class="font-bold text-xl">Nhập thông tin gửi trả hàng</h2>
                <hr class="my-4" />
                <div class="grid grid-cols-2 gap-4" id="delivery-information-form">
                    <label for="" class="flex flex-col gap-2">
                        <p>Họ tên đầy đủ</p>
                        <div>
                            <input type="text" id="form-order-name" class="w-full h-9 p-2 rounded-md border outline-none" data-empty="1">
                        </div>
                    </label>
                    <label for="" class="flex flex-col gap-2">
                        <p>Số điện thoại</p>
                        <div>
                            <input type="phone" id="form-order-phone" class="w-full h-9 p-2 rounded-md border outline-none" data-empty="1" data-phone="1">
                        </div>
                    </label>
                    <label for="" class="flex flex-col gap-2">
                        <p>Email</p>
                        <div>
                            <input type="email" id="form-order-email" class="w-full h-9 p-2 rounded-md border outline-none" data-empty="1" data-email="1">
                        </div>
                    </label>
                    <label for="" class="flex flex-col gap-2">
                        <p>Địa chỉ cụ thể</p>
                        <div>
                            <input type="text" id="form-order-address" class="w-full h-9 p-2 rounded-md border outline-none" data-empty="1">
                        </div>
                    </label>
                </div>
            </div>
            <div>
                <h2 class="font-bold text-xl">Thông tin đơn hàng</h2>
                <hr class="my-4" />
                <div class="flex justify-between items-center">
                    <p>Tổng tiền:</p>
                    <p class="font-semibold text-xl"><span class="cart-total">{{$data_cart['total']}}</span> đ</p>
                </div>
                <hr class="my-4" />
                <div class="flex justify-between items-center">
                    <p>Thanh toán:</p>
                    <p class="font-semibold text-2xl"><span class="cart-total-all">{{$data_cart['total']}}</span> đ</p>
                </div>
                <div class="mt-4 flex flex-col gap-2">
                    <button class="w-full rounded-full bg-amber-400 border-none font-bold text-center py-3" onclick="orderFunction()">Tiến hành đặt hàng</button>
                    <button class="cart-back hidden w-full rounded-full bg-neutral-100 border-none font-bold text-center py-3" onclick="backOrderFunction()">Trở lại</button>
                </div>
                <p class="mt-4 text-xs text-center">(Xin vui lòng kiểm tra lại đơn hàng trước khi đặt)</p>
            </div>
        </div>
        <div class="w-full text-center order-success hidden">
            <div class="flex flex-col gap-4">
                <svg viewBox="0 0 24 24" class="text-green-600 w-16 h-16 mx-auto my-6">
                    <path fill="currentColor" d="M12,0A12,12,0,1,0,24,12,12.014,12.014,0,0,0,12,0Zm6.927,8.2-6.845,9.289a1.011,1.011,0,0,1-1.43.188L5.764,13.769a1,1,0,1,1,1.25-1.562l4.076,3.261,6.227-8.451A1,1,0,1,1,18.927,8.2Z">
                    </path>
                </svg>
                <p class="text-lg font-semibold">Đặt hàng thành công</p>
                <p class="text-sm">Bạn đã đặt hàng thành công, nhân viên của chúng tôi sẽ liên hệ cho bạn sớm nhất có thể</p>
                <button class="mx-auto rounded-full w-max p-4 bg-neutral-100 border-none outline-none">Xem chi tiết đơn hàng</button>
            </div>
        </div>
    </div>
</div>
@endsection
@push('scripts')
<script type="text/javascript" src="{{ asset('js/cart/index.js?version=1')}}"></script>
@endpush