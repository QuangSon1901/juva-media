<div class="bg-black py-2 text-white">
    <div class="container mx-auto">
        <nav class="flex" aria-label="Breadcrumb">
            <ol class="hidden lg:inline-flex items-center space-x-1">
                <li class="inline-flex items-center">
                    <a href="/" class="inline-flex items-center text-xs font-light space-x-1">
                        <box-icon name='home-alt-2' color='#fff' class="w-4 -translate-y-[1px] mr-1 bx:color"></box-icon>
                        Trang chủ
                    </a>
                </li>
                @foreach ($breadcrumbs as $breadcrumb)
                    <li>
                        <div class="flex items-center space-x-1">
                            <box-icon name='chevron-right' color='#fff' class="w-4 -translate-y-0"></box-icon>
                            <a href="{{$breadcrumb['url']}}" class="text-xs font-light  ">{{$breadcrumb['title']}}</a>
                        </div>
                    </li>
                @endforeach
            </ol>

            <ol class="inline-flex lg:hidden items-center space-x-1">
                <li>
                    <div class="flex items-center space-x-1">
                        <a href="{{end($breadcrumbs)['url']}}" class="text-xs font-light" style="overflow-wrap: anywhere;">{{end($breadcrumbs)['title']}}</a>
                    </div>
                </li>
            </ol>
        </nav>

    </div>
</div>