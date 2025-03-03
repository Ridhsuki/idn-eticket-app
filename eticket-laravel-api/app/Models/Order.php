<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    /** @use HasFactory<\Database\Factories\OrderFactory> */
    use HasFactory;

    protected $fillable = [
        'total_price',
        'total_item',
        'payment_method',
        'transaction_time',
    ];

    public function orderItem() {
        return $this->hasMany(OrderItem::class);
    }
}
