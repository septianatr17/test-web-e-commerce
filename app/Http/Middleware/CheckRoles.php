<?php

namespace App\Http\Middleware;

use Closure;
use App\Models\Role;
class CheckRoles
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next, string $rolee)
    {
        $roles = Role::all();

        foreach ($roles as $roleFromDb) {
            if($rolee == $roleFromDb->name && auth()->user()->role_id !=$roleFromDb->id)
            {
                return abort(403);
            }
        }
        return $next($request);
    }
}
