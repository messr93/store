<?php

namespace App\Http\Controllers\BackendControllers;

use App\Category;
use App\Http\Controllers\Controller;
use App\Lang;
use Illuminate\Http\Request;
use Yajra\DataTables\DataTables;

class LangController extends Controller
{

    public function __construct(){
        changeLang('ar');

    }

    public function index()
    {
        return view('backend.lang.index', ['pageTitle' => __('backend.All langs')] );
    }

    public function allData(){

        $langs = Lang::all();

        return DataTables::of($langs)
            ->addColumn('actions', 'backend.lang.actions')
            ->editColumn('status', 'backend.includes.status')
            ->rawColumns(['status', 'actions'])
            ->make(true);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('backend.lang.create', ['pageTitle' => __('backend.Add lang')]);
    }


    public function store(Request $request)
    {

        $data = $request->validate([
            'code' => 'required|string',
            'name' => 'required|string',
            'status' => 'required|integer|min:0|max:1',
        ]);

        Lang::create($data);
        return redirect()->route('admin.lang.index')->with('success', __('backend.Lang created'));
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
        $lang = Lang::find($id);
        if(is_null($lang))
            abort(404);

        return view('backend.lang.edit', ['lang' => $lang, 'pageTitle' => __('backend.Edit lang')]);
    }

    public function update(Request $request, $id)
    {
        $lang = Lang::find($id);
        if(is_null($lang))
            abort(404);

        $data = $request->validate([
            'code' => 'required|string',
            'name' => 'required|string',
            'status' => 'required|integer|min:0|max:1',
        ]);

        $lang->update($data);
        return redirect()->route('admin.lang.index')->with('success', __('backend.Lang updated'));
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

        $lang = Lang::find($request->input('id'));
        if(is_null($lang))
            return response()->json(['message' => 'this lang not exist !'], 404);

        $lang->status = ($lang->status == 1)? 0: 1;
        $lang->save();
        return response()->json(['data' => $lang], 200);
    }

    public function delete(Request $request){

        $lang = Lang::find($request->input('id'));
        if(is_null($lang))
            return response()->json(['message' => 'this lang not exist !'], 404);

        $lang->delete();
        return response()->json(['data' => $lang], 200);
    }
}
