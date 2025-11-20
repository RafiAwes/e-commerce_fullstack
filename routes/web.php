<?php

use Inertia\Inertia;
use App\Jobs\TestRedisJob;
use Laravel\Fortify\Features;
use Illuminate\Support\Facades\Route;


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

Route::get('/test-redis-queue', function () {
    TestRedisJob::dispatch();
    return 'job dispatched';
});

require __DIR__.'/settings.php';
