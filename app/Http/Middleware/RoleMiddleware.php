<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class RoleMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next, ...$roles): Response
    {
        $user = $request->user();
        if (!$user || !in_array($user->role, $roles)) {
            return redirect()->route('unauthorized')
                ->with('error', 'You are not authorized to access this page.');
        } elseif (!$user) {
            return redirect()->route('login')
                ->with('error', 'Please login to access this page.');
        }
        return $next($request);
    }
}
