<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    use HasFactory;

    protected $table = 'products';

    protected $fillable = [
        'name',
        'description',
        'image',
        'price',
        'slug',
        'service_category_id',
        'product_category_id',
        'create_at',
        'update_at',
    ];

    public function service_categories()
    {
        return $this->belongsTo(ServiceCategory::class, 'service_category_id');
    }

    public function product_categories()
    {
        return $this->belongsTo(ProductCategory::class, 'product_category_id');
    }

    public function product_photography()
    {
        return $this->hasMany(ProductPhotography::class);
    }
}
