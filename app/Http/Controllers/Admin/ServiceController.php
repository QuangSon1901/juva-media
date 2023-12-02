<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Service;
use Illuminate\Http\Request;

class ServiceController extends Controller
{
    public function index()
    {
        return view('admin.service.index');
    }

    public function data()
    {
        return [
            "status" => 200,
            "data" => Service::with('service_categories')->get()
        ];
    }

    public function create(Request $request) {
        

        $created = Service::create([
            "name" => $request->get('name'),
            'status' => 0
        ]);

        return [
            "status" => 200,
            "data" => Service::where('id', $created->id)->first()
        ];
    }

    public function update(Request $request){
        $service = Service::find($request->get('id'));

        $service->update([
            'name' => $request->get('name'),
        ]);

        if($service){
            return [
                'status' => 200,
                'message' => 'Cập nhật thành công',
                'data' => $service
            ];
        } else {
            return [
                'status' => 402,
                'message' => 'Cập nhật thất bại'
            ];
        }
    }

    public function updateStatus(Request $request){
        $service = Service::find($request->get('service_id'));

        $service->update([
            'status' => $request->get('status')
        ]);

        if($service){
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

    public function delete(Request $request){
        $delete = Service::where('id', $request->get('id'))->delete();

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
}
