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
        $page = $request->get('page');

        if ($id == -1) {
            return [
                "status" => 200,
                "data" => Product::with('service_categories')->with('product_categories')->paginate(10)
            ];
        } else {
            return [
                "status" => 200,
                "data" => Product::with('service_categories')->with('product_categories')->with('product_photography.photography')->find($id)
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

        $image_more = $request->get('image_more');
        $main_image = $request->get('main_image');

        $graphy = $request->get('graphy');
        // $graphyFile = $request->file('graphy');

        // for ($i=0; $i < count($graphyFile); $i++) { 
        //     $upload = Cloudinary::upload($graphyFile[$i]['image']->getRealPath())->getSecurePath();

        //     if ($upload) {
        //         $graphy[$i]['image'] = $upload;
        //     }
        // }

        // $imageUrl = "";
        // for ($i=0; $i < count($images); $i++) { 
        //     $upload = Cloudinary::upload($images[$i]->getRealPath())->getSecurePath();

        //     if ($upload) {
        //         $imageUrl .= $upload . " ";
        //     }
        // }

        $createPr = Product::create([
            "name" => $name,
            "description" => $description,
            "image" => $main_image . " " . $image_more,
            "price" => $price,
            "service_category_id" => $service_category_id,
            "product_category_id" => $product_category_id,
        ]);
        $graphyPro = [];
        foreach ($graphy as $gra) {
            $graphyPro[] = [
                "price" => (int) $gra['price'],
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
    public function update(Request $request)
    {
        $product = Product::find($request->get('id'));
        $name = $request->get('name');
        $price = $request->get('price');
        $service_category_id = $request->get('service_category_id');
        $product_category_id = $request->get('product_category_id');
        $description = $request->get('description');

        $image_more = $request->get('image_more');
        $main_image = $request->get('main_image');

        $graphy = $request->get('graphy');

        $product->update([
            "name" => $name,
            "description" => $description,
            "image" => $main_image . " " . $image_more,
            "price" => $price,
            "service_category_id" => $service_category_id,
            "product_category_id" => $product_category_id,
        ]);

        $product->product_photography()->delete();

        $graphyPro = [];
        foreach ($graphy as $gra) {
            $graphyPro[] = [
                'price' => (int) $gra['price'],
                'image' => $gra['image'],
                'product_id' => $product->id,
                'photography_id' => $gra['id'],
            ];
        }
        ProductPhotography::insert($graphyPro);

        return [
            "status" => 200,
            "data" => Product::with('service_categories')->with('product_categories')->where('id', $request->get('id'))->first()
        ];
    }

    public function delete(Request $request)
    {
        $delete =  Product::where('id', $request->get('id'))->delete();

        if ($delete) {

            return [
                'status' => 200
            ];
        } else {

            return [
                'status' => 500
            ];
        }
    }

    public function addTypeCreate(Request $request)
    {
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

    public function addGraphyCreate(Request $request)
    {
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
