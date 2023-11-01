<div style="padding: 10px; margin-bottom: 5px">
    <div>ĐẶT HÀNG THÀNH CÔNG</div>
    <div>CẢM ƠN QUÝ QUÝ KHÁCH ĐÃ CHỌN DỊCH VỤ CỦA JUVA-MEDIA</div>
    <div style="display:flex; align-items: center; justify-content: center;">
        <p class="font-bold">Hotline hỗ trợ:</p>
        <p>0703555544 - 0397838804</p>
    </div>
</div>
<div style="padding: 10px; margin-bottom: 5px">
    <h3>Thông tin khách hàng</h3>
    <table border="1" cellspacing="0" cellpadding="10" style="width:100%; margin-bottom:10px">
        <thead>
            <tr align="left">
                <th >Mã đơn hàng</th>
                <th>Họ tên</th>
                <th>email</th>
                <th>Số điện thoại</th>
                <th>Địa chỉ</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>{{$order->id}}</td>
                <td>{{$order->name}}</td>
                <td>{{$order->email}}</td>
                <td>{{$order->phone}}</td>
                <td>{{$order->address}}</td>
            </tr>
        </tbody>
    </table>

    <h3>Thông tin sản phẩm</h3>
    <table border="1" cellspacing="0" cellpadding="10" style="width:100%">
        <thead>
            <tr align="left">
                <th>#STT</th>
                <th>Họ tên</th>
                <th>email</th>
                <th>Số điện thoại</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>11111</td>
                <td>aaaa</td>
                <td>a@gmail.com</td>
                <td>+091001000</td>
            </tr>
        </tbody>
    </table>
</div>