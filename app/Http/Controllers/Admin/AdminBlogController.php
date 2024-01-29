<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Blog;
use App\Models\Topic;
use Illuminate\Http\Request;

class AdminBlogController extends Controller
{
    public function index() {
        return view('admin.blog.index');
    }

    public function data() {
        return [
            "status" => 200,
            "data" => Blog::with('topic')->get()
        ];
    }

    public function dataCreate() {
        return [
            "status" => 200,
            "data" => [
                "topic" => Topic::all(),
            ]
        ];
    }

    public function addTopicCreate(Request $request) {
        $created = Topic::create([
            "name" => $request->get('name')
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

    public function create(Request $request) {
        $title = $request->get('title');
        $topic_id = $request->get('topic_id');
        $description = $request->get('description');
        $content = $request->get('content');

        $createPr = Blog::create([
            "title" => $title,
            "description" => $description,
            "content" => $content,
            "topic_id" => $topic_id,
            "status" => 1
        ]);

        return [
            "status" => 200,
            "data" => $createPr
        ];
    }

    public function update(Request $request){
        $id = $request->get('id');
        $title = $request->get('title');
        $topic_id = $request->get('topic_id');
        $description = $request->get('description');
        $content = $request->get('content');

        $blog = Blog::find($id);

        if(!$blog){
            return [
                "status" => 400,
            ];
        }

        $blog->update([
            "title" => $title,
            "description" => $description,
            "content" => $content,
            "topic_id" => $topic_id,
        ]);

        return [
            "status" => 200,
        ];
        
    }

    public function delete(Request $request){
        $delete = Blog::where('id', $request->get('id'))->delete();

        if($delete){
            return [
                'status' => 200,
                'message' => 'Xóa thành công'
            ];
        }

        return [
            'status' => 402,
            'message' => 'Xóa thất bại'
        ];
        
    }
    
    public function updateStatus(Request $request){
        $blog = Blog::find($request->get('blog_id'));

        $blog->update([
            'status' => $request->get('status')
        ]);

        if($blog){
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

    public function getDetailBlog(Request $request) {
        $id = $request->get('id');

        return [
            "status" => 200,
            "data" => Blog::with('topic')->find($id)
        ];
    }
}
