<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class OrderProductPhotography extends Model
{
    use HasFactory;

    protected $table = 'order_product_photography';

    protected $fillable = [
        'quantity',
        'order_product_id',
        'product_photography_id',
        'create_at',
        'update_at',
    ];
    public function productPhotography()
    {
        return $this->belongsTo(ProductPhotography::class, 'product_photography_id');
    }
}
