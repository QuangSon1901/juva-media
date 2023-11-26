<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Photography;
use App\Models\Product;
use App\Models\ProductCategory;
use App\Models\ProductPhotography;
use App\Models\ServiceCategory;
use CloudinaryLabs\CloudinaryLaravel\Facades\Cloudinary;
use Illuminate\Http\Request;

class ProductController extends Controller
{
    public function index()
    {
        return view('admin.product.index');
    }

    public function data(Request $request)
    {
        $id = $request->get('id');
        if ($id == -1){
            return [
                "status" => 200,
                "data" => Product::with('service_categories')->with('product_categories')->get()
            ];
        } else {
            return [
                "status" => 200,
                "data" => Product::with('service_categories')->with('product_categories')->find($id)
            ];
        }

        return [
            "status" => 403,
            "message" => 'Không tìm thấy sản phẩm !'
        ];
    }

    public function dataCreate(Request $request)
    {
        return [
            "status" => 200,
            "data" => [
                "category" => ServiceCategory::all(),
                "type" => ProductCategory::all(),
                "graphy" => Photography::all()
            ]
        ];
    }

    public function create(Request $request)
    {
        $name = $request->get('name');
        $price = $request->get('price');
        $service_category_id = $request->get('service_category_id');
        $product_category_id = $request->get('product_category_id');
        $description = $request->get('description');

        $images = $request->file('image');

        $graphy = $request->get('graphy');
        $graphyFile = $request->file('graphy');

        for ($i=0; $i < count($graphyFile); $i++) { 
            $upload = Cloudinary::upload($graphyFile[$i]['image']->getRealPath())->getSecurePath();

            if ($upload) {
                $graphy[$i]['image'] = $upload;
            }
        }

        $imageUrl = "";
        for ($i=0; $i < count($images); $i++) { 
            $upload = Cloudinary::upload($images[$i]->getRealPath())->getSecurePath();

            if ($upload) {
                $imageUrl .= $upload . " ";
            }
        }

        $createPr = Product::create([
            "name" => $name,
            "description" => $description,
            "image" => $imageUrl,
            "price" => $price,
            "service_category_id" => $service_category_id,
            "product_category_id" => $product_category_id,
        ]);

        $graphyPro = [];
        foreach ($graphy as $gra) {
            $graphyPro[] = [
                "price" => $gra['price'],
                "image" => $gra['image'],
                "product_id" => $createPr->id,
                "photography_id" => $gra['id'],
            ];
        }

        if ($createPr) {
            ProductPhotography::insert($graphyPro);
        }

        
        return [
            "status" => 200,
            "data" => Product::with('service_categories')->with('product_categories')->where('id', $createPr->id)->first()
        ];
    }

    public function addTypeCreate(Request $request) {
        $created = ProductCategory::create([
            "title" => $request->get('title')
        ]);

        if ($created) {
            return [
                "status" => 200,
                "data" => $created
            ];
        }

        return [
            "status" => 500
        ];
    }

    public function addGraphyCreate(Request $request) {
        $created = Photography::create([
            "title" => $request->get('title'),
            "description" => ""
        ]);

        if ($created) {
            return [
                "status" => 200,
                "data" => $created
            ];
        }

        return [
            "status" => 500
        ];
    }
}
