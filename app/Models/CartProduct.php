<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CartProduct extends Model
{
    use HasFactory;

    protected $table = 'cart_products';

    protected $fillable = [
        'cart_id',
        'product_id',
        'create_at',
        'update_at',
    ];

    public function cart()
    {
        return $this->belongsTo(Cart::class, 'cart_id');
    }

    public function product()
    {
        return $this->belongsTo(Product::class, 'product_id');
    }

    public function cart_product_photography()
    {
        return $this->hasMany(CartProductPhotography::class);
    }
}
