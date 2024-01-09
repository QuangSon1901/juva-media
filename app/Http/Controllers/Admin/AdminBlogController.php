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
}
