<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use CloudinaryLabs\CloudinaryLaravel\Facades\Cloudinary;

class UploadNodeController extends Controller
{
    public function uploadMedia(Request $request) {
        $file = $request->file('file');
        $upload = Cloudinary::upload($file->getRealPath())->getSecurePath();

        return [
            "status" => 200,
            "data" => $upload
        ];
    }
}
