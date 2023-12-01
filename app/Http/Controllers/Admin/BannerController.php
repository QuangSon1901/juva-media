<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Banner;
use Illuminate\Http\Request;

class BannerController extends Controller
{
    public function index() {
        return view('admin.banner.index');
    }

    public function data() {
        return [
            "status" => 200,
            "data" => Banner::all()
        ];
    }

    public function dataIndex() {
        return [
            "status" => 200,
            "data" => Banner::where('status', 1)->get()
        ];
    }

    public function create(Request $request) {
        $images = $request->get('images');
        $banners = [];
        foreach ($images as $image) {
            $banners[] = [
                "image" => $image,
                "status" => 1
            ];
        }

        if (count($banners) > 0) {
            Banner::insert($banners);

            return [
                "status" => 200,
            ];
        }

        return [
            "status" => 400,
        ];
    }

    public function delete(Request $request){
        $delete = Banner::where('id', $request->get('id'))->delete();

        if($delete){
            return [
                'status' => 200,
                'message' => 'Xóa thành công'
            ];
        } else {
            return [
                'status' => 402,
                'message' => 'Xóa thất bại'
            ];
        }
    }

    public function updateStatus(Request $request){
        $banner = Banner::find($request->get('banner_id'));

        $banner->update([
            'status' => $request->get('status')
        ]);

        if($banner){
            return [
                'status' => 200,
                'message' => 'Cập nhật thành công'
            ];
        } else {
            return [
                'status' => 402,
                'message' => 'Cập nhật thất bại'
            ];
        }
    }
}
