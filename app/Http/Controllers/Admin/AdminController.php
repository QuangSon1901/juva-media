<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\ServiceCategory;
use CloudinaryLabs\CloudinaryLaravel\Facades\Cloudinary;
use Illuminate\Http\Request;

class AdminController extends Controller
{
    public function index() {
        return view('admin.admin');
    }

    public function create(Request $request) {

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
}
