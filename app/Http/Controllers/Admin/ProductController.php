<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Product;
use Illuminate\Http\Request;

class ProductController extends Controller
{
    public function index() {
        return view('admin.product.index');
    }

    public function data(Request $request) {
        $id = $request->get('id');
        if ($id == -1) return [
            "status" => 200,
            "data" => Product::with('service_categories')->with('product_categories')->get()
        ];
    }
}
