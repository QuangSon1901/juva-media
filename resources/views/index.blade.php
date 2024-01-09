@extends('layouts.layout')
@section('content')
<div>
    <div class="relative w-full">
        <div id="home-slider" class="slider h-[calc(100vh-168px)] w-full"></div>
    </div>
    <!-- <div>
        <div class="mt-14">
            <div class="text-center text-4xl font-bold">
                <h2>Dịch vụ nổi bật</h2>
            </div>
            <div class="w-full">
                <img class="w-full" src="{{asset('images/banner/banner1.png')}}" alt="">
            </div>
        </div>
    </div> -->
</div>
<div>
    <div class="mt-14">
        <div class="text-center text-4xl font-bold">
            <h2>Bạn cần hỗ trợ ?</h2>
        </div>

        <div class="grid md:grid-cols-2 items-start gap-x-24 max-w-6xl mx-auto py-6">
            <div class="col-span-2 ml-5 text-center">
                <span class="w-full block pt-6">
                    Juva-Media sẽ hồi đáp yêu cầu của quý khách trong vòng 24 tiếng.
                    <br>
                    Mọi yêu cầu cần xử lý gấp, xin vui lòng gọi số Hotline của Juva-Media: 0703555544 - 0397838804 để được hỗ trợ.
                </span>
            </div>

            <div id="contact-form" class="w-full ml-5 border border-neutral-400 p-4 mt-5">
                <label for="" class="flex flex-col my-6">
                    <span class="font-semibold mb-1">Họ tên</span>
                    <input type="text" id="name-field-contact" class="w-full h-9 p-2 rounded-md border outline-none" data-empty="1">
                </label>
                <label for="" class="flex flex-col my-6">
                    <span class="font-semibold mb-1">Email</span>
                    <input type="email" id="email-field-contact" class="w-full h-9 p-2 rounded-md border outline-none" data-empty="1" data-mail="1">
                </label>
                <label for="" class="flex flex-col my-6">
                    <span class="font-semibold mb-1">Tiêu đề</span>
                    <input type="text" id="title-field-contact" class="w-full h-9 p-2 rounded-md border outline-none" data-empty="1">
                </label>
                <label for="" class="flex flex-col my-6">
                    <span class="font-semibold mb-1">Nội dung</span>
                    <textarea id="content-field-contact" rows="4" cols="50" class="w-full p-2 rounded-md border outline-none" data-note="1"></textarea>
                </label>
                <button class="w-full rounded-full bg-amber-400 border-none font-bold text-center py-3" onclick="sendContact()" id="contact-button">Gửi</button>
            </div>
            <div class="w-[90%] py-14 px-10 mt-5 shadow-[0_1px_2px_2px_rgba(0,0,0,.13)]">
                <h4 class="mb-3 text-gray-500"><b>Thông tin liên hệ</b></h4>
                <ul class="">
                    <li class="flex flex-col mt-6">
                        <span class="text-sm uppercase mb-2 font-semibold">Số điện thoại:</span>
                        <span>0703555544 - 0397838804</span>
                    </li>
                    <li class="flex flex-col mt-6">
                        <span class="text-sm uppercase mb-2 font-semibold">Email:</span>
                        <span>mediajuva@gmail.com</span>
                    </li>
                    <li class="flex flex-col mt-6">
                        <span class="text-sm uppercase mb-2 font-semibold">Địa chỉ:</span>
                        <span>Lầu 1 số 75 Trường Chinh, P12, Tân Bình, TP HCM</span>
                    </li>
                    <li class="flex flex-col mt-6">
                        <span class="text-sm uppercase mb-2 font-semibold">Thời gian làm việc:</span>
                        <span>8h30 - 18h00 Từ thứ 2 đến thứ 7</span>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>
@endsection
@push('scripts')
<script>
    async function sendContact() {
        if (!checkValidateSave($('#contact-form'))) return false
        let method = "post",
            url = "/contact",
            params = null,
            data = {
                name: $("#name-field-contact").val(),
                email: $("#email-field-contact").val(),
                title: $("#title-field-contact").val(),
                message: $("#content-field-contact").val(),
            };
        let res = await axiosTemplate(method, url, params, data);
        switch (res.data.status) {
            case 200:
                Swal.fire({
                position: "center",
                icon: "success",
                title: res.data.message,
                showConfirmButton: true,
                timer: 1500,
                confirmButtonText: "OK",
            });
            $("#name-field-contact").val("")
            $("#email-field-contact").val("")
            $("#title-field-contact").val("")
            $("#content-field-contact").val("")
        }
    }
</script>
@endpush