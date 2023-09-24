<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Service extends Model
{
    use HasFactory;

    protected $table = 'services';

    protected $fillable = [
        'name',
        'create_at',
        'update_at',
    ];

    public function service_categories()
    {
        return $this->hasMany(ServiceCategory::class);
    }
}
