<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\ServiceCategory;
use CloudinaryLabs\CloudinaryLaravel\Facades\Cloudinary;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class AdminController extends Controller
{
    public function index() {
        return view('admin.admin');
    }

    public function create(Request $request) {
        $validator = Validator::make(
            $request->all(),
            [
                'file' => 'required',
                'name' => 'required',
                'description' => 'required',
            ],
            [
                'required' => ':attribute không được để trống',
            ]
        );

        if ($validator->fails()) {
            return [
                "status" => 403,
                'message' => $validator->errors()->first()
            ];
        }

        $uploadCloudinary = Cloudinary::upload($request->file('file')->getRealPath())->getSecurePath();

        $created = ServiceCategory::create([
            "name" => $request->get('name'),
            "description" => $request->get('description'),
            "image" => $uploadCloudinary,
            "service_id" => $request->get('service_id'),
        ]);

        return [
            "status" => 200,
            "data" => ServiceCategory::with('services')->where('id', $created->id)->first()
        ];
    }

    public function delete(Request $request) {
        $deleted = ServiceCategory::where('id', $request->get("id"))->delete();
        if ($deleted) {
            return [
                "status" => 200,
            ];
        }

        return [
            "status" => 500,
        ];
    }

    public function update(Request $request) {
        $validator = Validator::make(
            $request->all(),
            [
                'file' => 'required',
                'name' => 'required',
                'description' => 'required',
            ],
            [
                'required' => ':attribute không được để trống',
            ]
        );

        if ($validator->fails()) {
            return [
                "status" => 403,
                'message' => $validator->errors()->first()
            ];
        }


        // if ($request->hasFile('file')) {
        //     $uploadCloudinary = Cloudinary::upload($request->file('file')->getRealPath())->getSecurePath();
        // }
        $serviceCategory = ServiceCategory::find($request->id);
        $serviceCategory->update([
            "name" => $request->get('name'),
            "description" => $request->get('description'),
            "image" => $request->get('file'),
            "service_id" => $request->get('service_id'),
        ]);
        if($serviceCategory){
            return [
                "status" => 200,
                "data" => ServiceCategory::with('services')->where('id', $request->id)->first()
            ];
        }else{
            return [
                "status" => 402,
                'message' => 'Cập nhật thất bại'
            ];
        }
    }
}
