@extends('layouts.layout')
@section('content')
<div>
    <div class="relative w-full">
        <div class="slider h-[calc(100vh-168px)] w-full">
            <div>
                <img class="w-full h-[calc(100vh-168px)]" src="https://classic.vn/wp-content/uploads/2022/11/banner-website-1200x600-1200-900-px-1200-600-px.png" alt="">
            </div>
            <div>
                <img class="w-full h-[calc(100vh-168px)]" src="https://littletreasury.com/wp-content/uploads/2016/12/Meistersinger-Web-Banner-1200-x-600.jpg" alt="">
            </div>
        </div>
    </div>
    <div>
        <div class="mt-14">
            <div class="text-center text-4xl font-bold">
                <h2>Dịch vụ nổi bật</h2>
            </div>
            <div class="w-full">
                <img class="w-full" src="{{asset('images/banner/banner1.png')}}" alt="">
            </div>
        </div>
    </div>
</div>
@endsection
@push('scripts')
<script>
    $(document).ready(function() {
        $('.slider').slick({
            dots: false,
            arrows: false,
            infinite: true,
            speed: 500,
            autoplay: true,
            autoplaySpeed: 5000,
        });
    });
</script>
@endpush