<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class AuthController extends Controller
{
    public function sigin()
    {
        return view('member/signin');
    }

    public function auth(Request $request)
    {
        $credentials = $request->only('email', 'password');

        //dd('berhasil');
        if (Auth::attempt($credentials)) {
            // Authentication passed...
            return redirect()->intended('frontend');
        }
    }
}
