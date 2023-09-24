<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CartProductPhotography extends Model
{
    use HasFactory;

    protected $table = 'cart_product_photography';

    protected $fillable = [
        'quantity',
        'cart_product_id',
        'product_photography_id',
        'create_at',
        'update_at',
    ];

    public function cart_products()
    {
        return $this->belongsTo(CartProduct::class, 'cart_product_id');
    }

    public function product_photography()
    {
        return $this->belongsTo(ProductPhotography::class, 'product_photography_id');
    }
}
