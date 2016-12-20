<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Role;
use App\User;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Symfony\Component\HttpFoundation\Request;

class LoginController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Login Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles authenticating users for the application and
    | redirecting them to your home screen. The controller uses a trait
    | to conveniently provide its functionality to your applications.
    |
    */

    use AuthenticatesUsers;

    /**
     * Where to redirect users after login.
     *
     * @var string
     */
    protected $redirectTo = '/home';


    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('guest', ['except' => 'logout']);
    }

    /*
     * To use nic_no as the username
     */
    public function username()
    {
        return 'nic_no';
    }

    //autheticates users
//    public  function  login(Request $request){
//        $nic = $request->input('nic_no');
//        $givenPassword = $request->input('password');
//
//        // @TODO - handle exception for non users
//        $userData = DB::select('select * from users where nic_no =:nic',['nic' => $nic])[0];
//
//        if (Hash::check($givenPassword, $userData->password))
//        {
//            $user = new User();
//            $user->nic_no = $userData->nic_no;
//            $user->email = $userData->email;
//            $user->user_type = $userData->user_type;
//
//            $request->session()->regenerate();
//            Auth::login($user);
//            $request->session()->regenerate();
//        }
//        echo $user->getAuthIdentifierName();
//        echo $user->getAuthIdentifier();
//        //return view('home');
//    }

}
