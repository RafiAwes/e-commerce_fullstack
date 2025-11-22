<?php

use App\Jobs\TestRedisJob;
use Illuminate\Support\Facades\Route;
use Inertia\Inertia;
use Laravel\Fortify\Features;
use App\Http\Controllers\Admin\adminController;
use App\Http\Controllers\Customer\customerController;

Route::get('/', function () {
    return Inertia::render('welcome', [
        'canRegister' => Features::enabled(Features::registration()),
    ]);
})->name('home');

Route::middleware(['auth', 'verified'])->group(function () {
    Route::get('dashboard', function () {
        return Inertia::render('dashboard');
    })->name('dashboard');
});

Route::middleware(['auth', 'verified', 'role:admin'])->group(function () {
    Route::get('/admin/dashboard/');
});

Route::get('/test-redis-queue', function () {
    TestRedisJob::dispatch();
    return 'job dispatched';
});

require __DIR__.'/settings.php';