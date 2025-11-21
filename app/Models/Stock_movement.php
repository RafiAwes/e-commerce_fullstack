<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Stock_movement extends Model
{
    protected $guarded = [];

    protected $fillable = [
        'product_id',
        'movement_type',
        'quantity',
        'description',
    ];

    public function product()
    {
        return $this->belongsTo(Product::class);
    }

    public function suppliers()
    {
        return $this->belongsTo(Supplier::class);
    }
}
