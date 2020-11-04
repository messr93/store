<?php

namespace App\Http\Controllers\BackendControllers;

use App\Http\Controllers\Controller;
use App\Traits\HandleImages;
use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Support\Facades\Hash;
use Spatie\Permission\Models\Role;
use Yajra\DataTables\DataTables;

class UserController extends Controller
{

    use HandleImages;

    public function __construct()
    {
        //changeLang('ar');
    }

    public function index()
    {

        return view('backend.user.index', ['pageTitle' => __('backend.All users')]);
    }

    public function allData(){

        $users = User::select('id', 'name', 'photo', 'status')->get()
            ->transform(function($user){
                $newUser = [];
                $newUser['id'] = $user->id;
                $newUser['name'] = $user->name;
                $newUser['photo'] = $user->photo;
                $newUser['status'] = $user->status;
                $newUser['roles'] = '';
                foreach($user->roles->pluck('name')->toArray() as $index=>$role){
                    $newUser['roles'] .= '<span class="badge badge-pill text-white" style="background-color: #7061A5">'.__("backend.".$role).'</span> ';
                }

                return $newUser;
            });

        return DataTables::of($users)
            ->addColumn('actions', 'backend.user.actions')
            ->editColumn('photo', '<img src="{{ url(\'uploads/user/110x110\')}}/{{$photo}}" style="height: 75px; width: 85px" class="mx-auto d-block">')
            ->editColumn('status', 'backend.includes.status')
            ->rawColumns(['photo', 'actions', 'status', 'roles'])
            ->make(true);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
       $roles = Role::get()->filter(function($role){ return $role->name !== "customer"; })->pluck('name')->toArray();
        return view('backend.user.create', ['roles' => $roles, 'pageTitle' => __('backend.Add user')]);
    }

    public function store(Request $request)
    {
        $data = $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'required|email|max:255|unique:users,email',
            'password' => 'required|string|min:8|confirmed',
            'gender' => 'required|string',
            'status' => 'required|integer|min:0|max:1',
            'photo' => 'required|image|dimensions:min_width=600,min_height=350'
        ]);
        $data['password'] = bcrypt($request->input('password'));

        if($request->hasFile('photo')){
            $photo = $request->file('photo');
            $photoName = 'user_'.time().'.'.$photo->getClientOriginalExtension();
            $this->uploadUserImage($photo, $photoName);
            $data['photo'] = $photoName;
        }
        $user = User::create($data);

        $user->assignRole(explode(',', $request->userNewRoles));
        return redirect()->route('admin.user.index')->with('success', __('backend.User created'));
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    public function edit($id)
    {
        $user = User::find($id);
        if(is_null($user))
            abort(404);

        $userRoles = $user->roles->pluck('name')->toArray();
        $allOtherRoles = Role::get()->filter(function($role) use ($user) {
            return !$user->hasRole($role->name);
        })->pluck('name')->toArray();                     // All roles just names

        return view('backend.user.edit', ['user' => $user, 'allOtherRoles' => $allOtherRoles, 'userRoles' =>$userRoles, 'pageTitle' => __('backend.Edit user')]);
    }
    function update(Request $request, $id)
    {

        $user = User::find($id);
        if(is_null($user))
            abort(404);
        $data = $request->validate($this->getUptadeValidationRules($request));

        if(!is_null($request->input('password')))
            $data['password'] = bcrypt($request->input('password'));

        if($request->hasFile('photo')){
            $photo = $request->file('photo');
            $photoName = 'user_'.time().'.'.$photo->getClientOriginalExtension();
            $this->uploadUserImage($photo, $photoName);
            $data['photo'] = $photoName;
            $this->deleteUserImages($user);
        }
        $user->update($data);

        if($request->userNewRoles !== "empty")      // if roles changed
            $user->syncRoles(explode(',', $request->userNewRoles));         // remove old roles and assign new

        return redirect()->route('admin.user.index')->with('success', __('backend.User updated'));
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }

    /////////////////////////////////////////////////
    public function changeStatus(Request $request){

        $user = User::find($request->input('id'));
        if(is_null($user))
            return response()->json(['message' => 'this user not exist !'], 404);

        $user->status = ($user->status == 1)? 0: 1;
        $user->save();
        return response()->json(['data' => $user], 200);
    }

    public function delete(Request $request){

        $user = User::find($request->input('id'));
        if(is_null($user))
            return response()->json(['message' => 'this category not exist !'], 404);

        $user->delete();
        $this->deleteUserImages($user);
        return response()->json(['data' => $user], 200);
    }

    ///////////////////////////////////////////////// Validation ////////////////////////////////////////////
    protected function getUptadeValidationRules(Request $request){
        $rules = [
            'name' => 'required|string|max:255',
            'email' => 'required|email|max:255',
            'gender' => 'required|string',
            'status' => 'required|integer|min:0|max:1',
            'photo' => 'image|dimensions:min_width=600,min_height=350'
        ];
        if(!is_null($request->input('password')))
            $rules['password'] = 'string|min:8|confirmed';
        return $rules;
    }

}
