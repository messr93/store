<?php

namespace App\Http\Controllers;

use App\Product;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

class ProfileController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }
//////////////////////////
    public function index()
    {
        $user = auth()->user();
        return view('frontend.profile.profile-info', ['user' => $user , 'activeLink' => 'profile-info', 'pageTitle' => 'My products']);
    }

    /////////////////////////////////
    public function updateInfo(Request $request){
        $data = $request->validate([
            'name' => 'required|string',
            'gender' => 'required|string',
        ]);
        auth()->user()->update($data);
        return redirect()->back()->with('success', 'Your info has been updated');
    }

    public function changePasswordView(){
        $user = auth()->user();
        return view('frontend.profile.change-password', ['user' => $user, 'activeLink' => 'change-password', 'pageTitle' => 'My products']);
    }

///////////////////////
    public function changePassword(Request $request){           // TODO Handle social users

        $request->validate([
           'current_password' => ['required', 'string', 'min:8'],
           'new_password' => ['required', 'string', 'min:8', 'confirmed', 'different:current_password'],
        ]);

        $user = $request->user();
        $currentPassword= $request->input('current_password');

        if(!Hash::check($currentPassword, $user->password))
            return redirect()->back()->withErrors(['current_password' => 'This password is incorrect']);

        $user->password = bcrypt($request->input('new_password'));
        return redirect()->back()->with('success', 'Password has been changed successfully');
    }
////////////////////////////

    public function shippingDetailsView(){

        $user = auth()->user();
        return view('frontend.profile.shipping-details', ['user'=> $user, 'activeLink' => 'shipping-details', 'pageTitle' => 'Shipping details']);
    }
////////////////////////////////////

    public function myProducts(){
        $user = auth()->user();
        $products = Product::where('user_id', $user->id)->latest()->paginate(10);
        return view('frontend.profile.my-products', ['user' => $user, 'products' => $products, 'activeLink' => 'my-products', 'pageTitle' => 'My products']);
    }

    public function myOrders(){
        $user = auth()->user();
        return view('frontend.profile.my-orders', ['user' => $user, 'activeLink' => 'my-orders', 'pageTitle' => 'My Orders']);
    }


}
