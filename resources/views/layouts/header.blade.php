<div>
    <div class="bg-juva-grey container mx-auto">
        <ul class="flex gap-4 text-xs py-2">
            <li>
                <a href="#">Những câu hỏi thường gặp</a>
            </li>
            <li>
                <a href="#">Liên hệ</a>
            </li>
        </ul>
    </div>
    <div class="container mx-auto flex justify-between items-center">
        <a class="block" href="/">
            <img src="{{asset('images/logo/juva-rectangle.png')}}" alt="" class="h-20">
        </a>
        <div class="relative">
            <div class="h-9 px-4 pl-9 relative w-[420px] flex overflow-hidden bg-white border rounded-full border-neutral-400">
                <input type="text" placeholder="Tìm kiếm" id="search-header" class="outline-none border-none bg-transparent w-full" onchange="getProductSearch()">
                <button class="absolute top-0 left-0 h-9 w-9 text-sm flex items-center justify-center cursor-pointer">
                    <box-icon name='search' color="#aaa" class="w-5 h-5"></box-icon>
                </button>
            </div>
            <div class="absolute left-0 right-0 pt-2 z-10" id="search-popup-hint">
                <div class="bg-white w-full h-full p-4 box-shadow-custom rounded-lg overflow-hidden">
                    <div class="flex items-center gap-2 mb-2"> 
                        <box-icon name='search' color="#aaa" class="w-4 h-4"></box-icon>
                        <span class="text-sm text-gray-400">Kết quả cho ...</span>
                    </div>
                    <div class="search-popup-hint-body">

                    </div>
                </div>
            </div>
        </div>
        <div class="flex gap-6 items-center" id="header-action-user">
            @auth
            <div class="flex gap-1 items-center cursor-pointer">
                <box-icon name='user' class="w-5 h-5"></box-icon>
                <span class="text-sm">{{auth()->user()->name}}</span>
                <span class="px-3">/</span>
                <a href="/logout" class="text-sm hover:border-b-2 border-[#555]">Đăng Xuất</a>
            </div>
            @else
            <div class="flex gap-1 items-center cursor-pointer">
                <box-icon name='user' class="w-5 h-5"></box-icon>
                <span class="text-sm" onclick="openModalLogin()">Đăng nhập/Đăng ký</span>
            </div>
            @endauth
            <a href="/gio-hang" class="cursor-pointer relative">
                <box-icon name='shopping-bag' class="w-7 h-7"></box-icon>
                <span id="cart-quantity-header" class="absolute -top-1 -right-1 rounded-full bg-red-500 w-4 h-4 text-xs flex items-center justify-center text-juva-white font-semibold">{{$cart_quantity}}</span>
            </a>
        </div>
    </div>
    <div class="relative header-bottom-menu">
        <div class="container mx-auto">
            <div class="w-full pb-2">
                <ul class="flex items-center justify-center gap-10" id="header-service-list"></ul>
            </div>
        </div>
        <div class="absolute z-10 top-full right-0 left-0 bg-white p-2 hidden header-service-dropdown">
            <div class="container mx-auto">
                <div class="border-t py-2">
                    <span class="font-semibold mt-2 header-service-dropdown-label"></span>
                    <div class="mt-4">
                        <ul class="grid grid-cols-4 gap-5"></ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>