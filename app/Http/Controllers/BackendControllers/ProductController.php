<?php

namespace App\Http\Controllers\BackendControllers;

use App\Category;
use App\Http\Controllers\Controller;
use App\Product;
use App\ProductPhoto;
use App\Traits\HandleImages;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;
use Intervention\Image\Facades\Image;
use Yajra\DataTables\DataTables;

class ProductController extends Controller
{
    use HandleImages;

    public function __construct()
    {
        changeLang('ar');
    }

    public function index()
    {
        return view('backend.product.index', ['pageTitle' => __('backend.All products')]);
    }

    public function allData(){
        $products = Product::all();
        return DataTables::of($products)
            ->addColumn('actions', 'backend.product.actions')
            ->editColumn('photo', '<img src="{{ url(\'uploads/product/cover/110x110\')}}/{{$photo}}" style="height: 75px; width: 75px" class="mx-auto d-block">')
            ->editColumn('status', function(Product $product){
                return ($product->status == 1)? '<span class="text-success">'.__('backend.Active').'</span>': '<span class="text-warning">'.__('backend.unActive').'</span>';
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
        return view('backend.product.create', ['mainCategories' => $mainCategories, 'pageTitle' => __('backend.Add product')]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {

        $request->validate($this->getCreateValidateRules($request));

        $data = $request->except(['_token', 'related_photo', 'photo']);
        $data['user_id'] = $request->user()->id;
        $data['slug'] = slugThis($data['name']);
        $data['created_at'] = now();
        $data['photo'] = 'default_img.jpg';

        if($request->hasFile('photo')){
            $photo = $request->file('photo');
            $photoName = "product_cover_".time().".".$photo->getClientOriginalExtension();

            $this->uploadProductCoverImage($photo, $photoName);
            $data['photo'] = $photoName;
        }

        $newProductId = DB::table('products')->insertGetId($data);

        if($request->hasFile('related_photo')){
            foreach ($request->file('related_photo') as $index=>$relatedPhoto){

                $photoName = "product_related_$index".time().".".$relatedPhoto->getClientOriginalExtension();
                Image::make($relatedPhoto)->resize(600, 600)->save(base_path('uploads/product/related/600x600/'.$photoName));
                ProductPhoto::create(['product_id' => $newProductId, 'photo' => $photoName]);
            }
        }

        return redirect()->route('admin.product.index')->with('success', __('backend.Product created'));
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
        $product = Product::find($id);
        if(is_null($product))
            abort(404);

        $mainCategories = Category::where('parent', 0)->get();
        return view('backend.product.edit', ['product' => $product, 'mainCategories' => $mainCategories, 'pageTitle' => __('backend.Edit product')]);
    }

    public function update(Request $request, $id)
    {
        $product = Product::find($id);
        if(is_null($product))
            abort(404);

        $request->validate($this->getUpdateValidateRules($request, $product));
        $data = $request->except(['_token', '_method', 'related_photo', 'photo']);

        $data['slug'] = slugThis($data['name']);
        $data['updated_at'] = now();
        $data['photo'] = $product->photo;

        if($request->hasFile('photo')){         // if cover photo replaces
            $photo = $request->file('photo');
            $photoName = "product_cover_".time().".".$photo->getClientOriginalExtension();

            $this->uploadProductCoverImage($photo, $photoName);         // upload new cover photo
            $data['photo'] = $photoName;
            $this->deleteProductCoverImage($product);   // delete old cover photo
        }

        $product->update($data);

        if($request->hasFile('related_photo')){                 // upload and record related photos
            foreach($request->file('related_photo') as $index=>$relatedPhoto){
                $photoName = "product_related_$index".time().".".$relatedPhoto->getClientOriginalExtension();
                Image::make($relatedPhoto)->resize(600, 600)->save(base_path('uploads/product/related/600x600/'.$photoName));
                ProductPhoto::create(['product_id' => $product->id, 'photo' => $photoName]);
            }

        }

        if($request->input('deleted_related_photos') !== "empty"){      // some related old photos deleted, lets handle this:)
            $deleted_related_photos = explode(',', $request->input('deleted_related_photos'));
            foreach($deleted_related_photos as $related_photo_id){
                $relatedPhoto = ProductPhoto::find($related_photo_id);
                Storage::disk('product')->delete('related/600x600/'.$relatedPhoto->photo);
                $relatedPhoto->delete();                 //delete old photos
            }
        }

        return redirect()->back()->with('success', __('backend.Product updated'));
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

        $product = Product::find($request->input('id'));
        if(is_null($product))
            return response()->json(['message' => 'this product not exist !'], 404);

        $product->status = ($product->status == 1)? 0: 1;
        $product->save();
        return response()->json(['data' => $product], 200);
    }

    public function delete(Request $request){

        $product = Product::find($request->input('id'));
        if(is_null($product))
            return response()->json(['message' => 'this category not exist !'], 404);

        $this->deleteAllProductImages($product);
        $product->delete();
        return response()->json(['data' => $product], 200);
    }



    /////////////////////////////////////////////////////// Validation //////////////////////////////////////

    protected function getCreateValidateRules($request){
        $rules = [
            'category' => 'required',
            'name' => 'required|string|unique:products,name',
            'details' => 'string',
            'price' => 'required|numeric',
            'discount' => 'integer',
            'photo' => 'required|image|dimensions:min_width=1200,min_height=700',
            'description' => 'required|string',
            'status' => 'required|integer|min:0|max:1',
        ];
        if($request->hasFile('related_photo')){                                  // if any related photos added
            for($i = 0; $i < count($request->file('related_photo')); $i++){
                $rules['related_photo.'.$i] = 'image|dimensions:min_width=600,min_height=600';
            }
        }
        return $rules;
    }

    protected function getUpdateValidateRules($request, $product){
        $rules = [
            'details' => 'string',
            'category' => 'required',
            'price' => 'required|numeric',
            'discount' => 'integer',
            'description' => 'required|string',
            'status' => 'required|integer|min:0|max:1',
            'photo' => 'image|dimensions:min_width=1200,min_height=700',

        ];
        if($request->name !== $product->name)
            $rules['name'] = 'required|string|unique:products,name';         // cause it's unique

        if($request->hasFile('related_photo')){                                 // if any related photos added
            for($i = 0; $i < count($request->file('related_photo')); $i++){
                $rules['related_photo.'.$i] = 'image|dimensions:min_width=600,min_height=600';
            }
        }
        return $rules;
    }
}
