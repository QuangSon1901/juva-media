<?php

namespace App\Models;

use Cviebrock\EloquentSluggable\Sluggable;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Blog extends Model
{
    use HasFactory, Sluggable;

    protected $table = 'blogs';

    protected $fillable = [
        'title',
        'description',
        'content',
        'image',
        'slug',
        'user_id',
        'topic_id',
        'status',
        'create_at',
        'update_at',
    ];

    public function sluggable(): array
    {
        return [
            'slug' => [
                'source' => 'title'
            ]
        ];
    }

    public function topic()
    {
        return $this->belongsTo(Topic::class, 'topic_id');
    }
}
