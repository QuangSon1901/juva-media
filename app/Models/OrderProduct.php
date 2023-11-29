<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class OrderProduct extends Model
{
    use HasFactory;

    protected $table = 'order_products';

    protected $fillable = [
        'order_id',
        'product_id',
        'create_at',
        'update_at',
    ];
    public function product()
    {
        return $this->belongsTo(Product::class, 'product_id');
    }
    public function photos()
    {
        return $this->hasMany(OrderProductPhotography::class);
    }
}
