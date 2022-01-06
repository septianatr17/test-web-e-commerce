<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use DB;
use App\Models\userModel;
use Session;
use Illuminate\Support\Facades\Auth;

class adminController extends Controller
{
    public function loginform()
    {

        return view('admin/login_admin');
    }

    public function homeadmin()
    {
        return view('home_admin');
    }

    public function login(Request $request)
    {
        $validation = \Validator::make($request->all(),[
            'username' => 'required|max:100',
            'password' 
            => 'required',
        ])->validate();

        $username = $request->get('username');
        $password = $request->get('password');

        $results = DB::select( DB::raw("SELECT status,role from user  where username = :username and password =:pass "), 
            array('username' => $username,'pass' => $password));

        foreach($results as $data)
        {
            $data= $data;
        }

        if ($data->status == 1 && $data->role == 'admin') {
            
            $tt =  $request->session()->put('authenticated', TRUE);

            //var_dump($tt);die();
            return redirect('/dash');
        }else{
            return redirect('admin')->with('status', 'Username atau Password Salah');
        }
       

       
    }

    public function logout(Request $request)
    {
        $request->session()->flush();
        return redirect('admin');
    }
}
