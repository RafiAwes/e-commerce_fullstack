<?php

namespace App\Models;

use App\Models\Order;
use App\Models\Product;
use App\Models\Stock_movement;
use Illuminate\Database\Eloquent\Model;

class Supplier extends Model
{
    protected $fillable = [
        'name' => 'required|max:255',
        'description' => 'nullable',
        'contact_name' => 'nullable|max:255',
        'contact_email' => 'nullable|email',
        'contact_phone' => 'nullable|phone',
        'address' => 'nullable',
        'city' => 'nullable|max:255',
        'state' => 'nullable|max:255',
        'zip_code' => 'nullable|zip_code',
        'country' => 'nullable|max:255',
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
