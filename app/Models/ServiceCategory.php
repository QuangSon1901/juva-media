<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ServiceCategory extends Model
{
    use HasFactory;

    protected $table = 'service_categories';

    protected $fillable = [
        'name',
        'description',
        'image',
        'slug',
        'service_id',
        'create_at',
        'update_at',
    ];

    public function services()
    {
        return $this->belongsTo(Service::class, 'service_id');
    }
}
