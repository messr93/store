<?php

namespace App\Http\Controllers;

use App\Notification;
use Illuminate\Http\Request;

class NotificationController extends Controller
{

    public function __construct()
    {
        $this->middleware('auth');
    }

    public function markAsRead(Request $request){

        $notification = Notification::where('id', $request->id)->first();
        if(!isset($notification))
            return response()->json(['message' => 'notification not found'], 404);
        if($notification->notifiable_id !== $request->user()->id)
            return response()->json(['message' => 'this notification not belongs to you'], 401);

        $notification->update(['read_at' => now()]);
        Notification::where('created_at', '<', now()->subMonth()->toDateTimeString())->delete();       /// delete old notification (older

        return response()->json(['message' => 'notification marked as read'], 200);
    }
}
