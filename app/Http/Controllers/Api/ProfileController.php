<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Profile;
use Illuminate\Http\Request;

class ProfileController extends Controller
{
    public function saveProfile(Request $request)
    {
        $request->validate([
            'user_id' => 'required|exists:users,id',
            'first_name' => 'required|min:2',
            'last_name' => 'required|min:2',
            'street' => 'required|min:2',
            'phone' => 'required',
            'country' => 'required|min:2',
            'email' => 'required|email',
            'zip' => 'required',
            'state' => 'required',
            'city' => 'required'
        ]);
        $userId = $request->user_id;
        $profile = Profile::where('user_id', $userId)->get()->first();
        if (!empty($profile)) {
            $profile->update($request->all());
        } else {
            $profile = Profile::create($request->all());
        }
        return $profile;
    }

    public function getProfile($id)
    {
        return Profile::where('user_id', $id)->get()->first();

    }
}
