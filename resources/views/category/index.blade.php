@extends('layouts.layout')
@section('content')

<div>
    <div class="container mx-auto grid grid-cols-[1fr,3fr] py-6">
        <div class="">
            <ul class="space-y-4">
                <li class="font-semibold uppercase">
                    Danh mục
                </li>
                @foreach ($categories as $cate)
                    <li class="pl-2 cursor-pointer" data-id="{{$cate['id']}}">
                        {{$cate['title']}}
                    </li>
                @endforeach
            </ul>
        </div>
        <div>
            <div class="flex justify-between">
                <p>Có {{$info_page['total']}} kết quả</p>
                <p>Trang <span class="font-semibold">1</span> / <span>1</span></p>
            </div>
            <div>
                <ul class="grid grid-cols-4 gap-4 py-6">
                    @foreach ($products as $product)
                        <li>
                            <a href="/san-pham/{{$product['slug']}}" class="block text-center space-y-2 p-4 border border-transparent hover:border-black rounded-2xl border-dashed">
                                <div>
                                    <img class="w-[235px] h-[235px] object-contain" src="{{$product['image'][0]}}" alt="">
                                </div>  
                                <h4 class="line-clamp-box font-semibold">{{$product['name']}}</h4>                          
                                <p class="pt-4">{{$product['price']}} <sup>đ</sup></p>
                            </a>
                        </li>
                    @endforeach
                </ul>
            </div>
        </div>
    </div>
</div>
@endsection