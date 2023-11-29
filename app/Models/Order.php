<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    use HasFactory;

    protected $table = 'orders';

    protected $fillable = [
        'name',
        'phone',
        'email',
        'address',
        'user_id',
        'status',
        'create_at',
        'update_at',
    ];
    public function orderProducts()
    {
        return $this->hasMany(OrderProduct::class);
    }
}
