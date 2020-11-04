<?php

namespace App\Http\Controllers\BackendControllers;

use App\Http\Controllers\Controller;
use App\User;
use Illuminate\Http\Request;

class DashboardController extends Controller
{

    public function index(){
        //changeLang('ar');
        $membersCount = User::count();

        return view('dashboard', ['membersCount' => $membersCount, 'pageTitle' => __('backend.dashboard')]);
    }
}
