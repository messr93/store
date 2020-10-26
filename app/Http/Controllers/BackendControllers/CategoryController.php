<?php

namespace App\Http\Controllers\BackendControllers;

use App\Category;
use App\Http\Controllers\Controller;
use App\Traits\HandleImages;
use Illuminate\Http\Request;
use Yajra\DataTables\DataTables;

class CategoryController extends Controller
{
    use HandleImages;

    public function __construct(){
        changeLang('ar');

    }

    public function index()
    {
        return view('backend.category.index', ['pageTitle' => __('backend.All categories')] );
    }

    public function allData(){

        $categories = Category::all();
        return DataTables::of($categories)
            ->addColumn('actions', 'backend.category.actions')
            ->editColumn('photo', '<img src="{{ url(\'uploads/category/110x110\')}}/{{$photo}}" style="height: 75px; width: 75px" class="mx-auto d-block">')
            ->editColumn('status', function(Category $category){
                return ($category->status == 1)? '<span class="text-success">'.__('backend.Active').'</span>': '<span class="text-warning">'.__('backend.unActive').'</span>';
            })
            ->rawColumns(['photo', 'actions', 'status'])
            ->make(true);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $mainCategories = Category::where('parent', 0)->get();
        return view('backend.category.create', ['mainCategories' => $mainCategories, 'pageTitle' => __('backend.Add category')]);
    }

    public function store(Request $request)
    {

        $data = $request->validate([
           'name' => 'required|string',
           'description' => 'required|string',
           'status' => 'required|integer|min:0|max:1',
           'parent' => 'required|integer',
           'photo' => 'required|image|dimensions:min_width=1200,min_height=700',
        ]);
        $data['slug'] = slugThis($request->input('name'));
        if($request->hasFile('photo')){
            $photo = $request->file('photo');
            $photoName = 'category_'.time().'.'.$photo->getClientOriginalExtension();
            $this->uploadCategoryImage($photo, $photoName);
            $data['photo'] = $photoName;
        }

        Category::create($data);
        return redirect()->route('admin.category.index')->with('success', __('backend.Category created'));

    }


    public function show($id)
    {
        //
    }


    public function edit($id)
    {
        $category = Category::find($id);
        if(is_null($category))
            abort(404);

        $mainCategories = Category::where('parent', 0)->where('id', '!=', $category->id)->get();
        return view('backend.category.edit', ['category' => $category, 'mainCategories' => $mainCategories, 'pageTitle' => __('backend.Edit category')]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {

        $category = Category::find($id);
        if(is_null($category))
            abort(404);

        $data = $request->validate([
            'name' => 'required|string',
            'description' => 'required|string',
            'status' => 'required|integer|min:0|max:1',
            'parent' => 'required|integer',
            'photo' => 'image|dimensions:min_width=1200,min_height=700',
        ]);

        $data['slug'] = slugThis($request->input('name'));
        if($request->hasFile('photo')){
            $photo = $request->file('photo');
            $photoName = 'category_'.time().'.'.$photo->getClientOriginalExtension();
            $this->uploadCategoryImage($photo, $photoName);
            $data['photo'] = $photoName;

            $this->deleteCategoryImages($category);         // delete old photo if it's not default_img
        }

        $category->update($data);
        return redirect()->back()->with('success', __('backend.Category updated'));

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

        $category = Category::find($request->input('id'));
        if(is_null($category))
            return response()->json(['message' => 'this category not exist !'], 404);

        $category->status = ($category->status == 1)? 0: 1;
        $category->save();
        return response()->json(['data' => $category], 200);
    }

    public function delete(Request $request){

        $category = Category::find($request->input('id'));
        if(is_null($category))
            return response()->json(['message' => 'this category not exist !'], 404);

        $this->deleteCategoryImages($category);
        $category->delete();
        return response()->json(['data' => $category], 200);
    }


}
