<?php

namespace App\Http\Controllers\BackendControllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class DashboardController extends Controller
{

    public function index(){
        changeLang('ar');
        return view('dashboard', ['pageTitle' => __('backend.dashboard')]);
    }
}
