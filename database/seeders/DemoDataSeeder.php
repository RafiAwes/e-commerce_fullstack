<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\User;
use App\Models\Category;
use App\Models\Product;
use App\Models\Role;
use App\Models\Supplier;

class DemoDataSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        // Create roles
        $adminRole = Role::firstOrCreate(['name' => 'admin', 'description' => 'Administrator role']);
        $userRole = Role::firstOrCreate(['name' => 'user', 'description' => 'Regular user role']);

        // Create users with roles
        User::factory(5)
            ->withRole('admin')
            ->create();

        User::factory(20)
            ->withRole('user')
            ->create();

        // Create categories
        Category::factory(10)->create();

        // Create suppliers
        Supplier::factory(5)->create();

        // Create products
        Product::factory(50)->create();
    }
}