<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Supplier extends Model
{
    protected $fillable = [
        'name',
        'description',
        'contact_name',
        'contact_email',
        'contact_phone',
        'address',
        'city',
        'state',
        'zip_code',
        'country',
    ];

    public function products()
    {
        return $this->hasMany(Product::class);
    }

    public function orders()
    {
        return $this->hasMany(Order::class);
    }

    public function stockMovements()
    {
        return $this->hasMany(Stock_movement::class);
    }
}
