<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Cviebrock\EloquentSluggable\Sluggable;

class Topic extends Model
{
    use HasFactory, Sluggable;

    protected $table = 'topics';

    protected $fillable = [
        'name',
        'status',
        'slug',
        'create_at',
        'update_at',
    ];

    public function sluggable(): array
    {
        return [
            'slug' => [
                'source' => 'name'
            ]
        ];
    }

    public function blogs()
    {
        return $this->hasMany(Blog::class);
    }
}
