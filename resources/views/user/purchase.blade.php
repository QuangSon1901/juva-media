@extends('user.user')
@section('option')
<div class="flex flex-col items-center justify-center min-h-full w-full">
    <div class="flex flex-col items-center justify-center">
        <img class="h-[100px] w-[100px] bg-no-repeat bg-contain" src="{{asset('images/images/none_order.png')}}" alt="">
        <p>Chưa có đơn hàng</p>
    </div>
</div>
@endsection