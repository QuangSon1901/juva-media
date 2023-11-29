<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Order;
use Illuminate\Http\Request;

class OrderController extends Controller
{
    public function index()
    {
        return view('admin.order.index');
    }

    public function data(Request $request)
    {
        $id = $request->get('order_id');
        if ($id == -1){
        return [
            'status' => 200,
            'data' => Order::with(['orderProducts.product', 'orderProducts.photos', 'orderProducts.photos.productPhotography'])->get()
        ];
        }
    }
}
