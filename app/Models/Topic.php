<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Topic extends Model
{
    use HasFactory;

    protected $table = 'topics';

    protected $fillable = [
        'name',
        'status',
        'create_at',
        'update_at',
    ];

    public function blogs()
    {
        return $this->hasMany(Blog::class);
    }
}
