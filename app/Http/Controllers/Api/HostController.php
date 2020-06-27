<?php

namespace App\Http\Controllers\Api;

use App\Host;
use App\Http\Controllers\Controller;
use App\Http\Requests\HostRequest;
use App\Http\Requests\LoginRequest;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class HostController extends Controller
{
    public function Register(HostRequest $request)
    {
        $host = Host::create([
            'name' => $request->name,
            'email' => $request->email,
            'phone'=>$request->phone,
            'password' => bcrypt($request->password),

        ]);

        return [
            'status' => true,
            'message' => 'The registration was successful',
            'token' => $host->createToken('create')->accessToken
        ];
    }
    public function login(LoginRequest $request){

        $credentials=$request->only('email', 'password');
        $email=$request->email;
        $password=$request->password;
        $host=Host::where('email',$email)->where('password',$password);

        if($host){

            return [
                'status'=>true,
                'message'=>'The login is successful',

            ];

        }
        else{
            return [
                'status'=>false,
                'message'=>'Your email or password is not correct'
            ];
        }

    }

}
