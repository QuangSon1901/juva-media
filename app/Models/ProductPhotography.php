<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ProductPhotography extends Model
{
    use HasFactory;

    protected $table = 'product_photography';

    protected $fillable = [
        'image',
        'price',
        'product_id',
        'photography_id',
        'create_at',
        'update_at',
    ];

    public function products()
    {
        return $this->belongsTo(Product::class, 'product_id');
    }

    public function photography()
    {
        return $this->belongsTo(Photography::class, 'photography_id');
    }
}
