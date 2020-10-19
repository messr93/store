<?php

namespace App\Http\Controllers;

use App\Cart;
use App\Category;
use App\Product;
use App\ProductPhoto;
use App\Traits\HandleImages;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;
use Intervention\Image\Facades\Image;


class ProductController extends Controller
{

    use HandleImages;

    public function __construct()
    {
        $this->middleware('role:vendor')->except(['show']);
    }

    public function index()
    {
        //
    }


    public function create()
    {
        $user = auth()->user();
        $categories = Category::select('id', 'name', 'slug')->where('parent', 0)->get();
        return view('frontend.product.create', ['user' => $user, 'categories' => $categories, 'activeLink' => 'create-product', 'pageTitle' => 'Add new Product']);
    }


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

        return redirect()->route('profile.myProducts')->with('success', 'Product added successfully');

    }


    public function show(Product $product)
    {
        $categories = Category::get()->sortByDesc(function($q){return $q->products()->count();})->take(11);     /// most 11 categories having products
        $inCart = false;        // assume this product not in cart already, chang my mind :D
        if(auth()->check())
            $inCart = Cart::where('user_id', auth()->user()->id)->where('product_id', $product->id)->first();
        return view('frontend.product.show', ['product' => $product, 'categories' => $categories, 'inCart' => $inCart]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Product  $product
     * @return \Illuminate\Http\Response
     */
    public function edit(Product $product)
    {
        $user = auth()->user();
        if (($user->id !== $product->user_id ) || !($user->hasRole('admin')))
            abort(401);

        $categories = Category::select('id', 'name', 'slug')->where('parent', 0)->get();
        return view('frontend.product.edit', ['user' => $user, 'categories' => $categories, 'product' => $product,
            'activeLink' => 'my-products', 'pageTitle' => 'Edit product']);
    }

    public function update(Request $request, Product $product)
    {
        $user = auth()->user();
        if (($user->id !== $product->user_id ) || !($user->hasRole('admin')))
            abort(401);

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
            $this->deleteCoverImage($product->photo);   // delete old cover photo
        }

        $product->update($data);

        if($request->hasFile('related_photo')){                 // upload and record related photos
            foreach($request->file('related_photo') as $index=>$relatedPhoto){
                $photoName = "product_related_$index".time().".".$relatedPhoto->getClientOriginalExtension();
                Image::make($relatedPhoto)->resize(600, 600)->save(base_path('uploads/product/related/600x600/'.$photoName));
                ProductPhoto::create(['product_id' => $product->id, 'photo' => $photoName]);
            }

        }

        if($request->input('deleted_related_photos') !== "empty"){      // some related old photos deleted, lets handle this:D
            $deleted_related_photos = explode(',', $request->input('deleted_related_photos'));
            foreach($deleted_related_photos as $related_photo_id){
                $relatedPhoto = ProductPhoto::find($related_photo_id);
                Storage::disk('product')->delete('related/600x600/'.$relatedPhoto->photo);
                $relatedPhoto->delete();                 //delete old photos
            }

        }

        return redirect()->route('profile.myProducts')->with('success', 'Product updated successfully');

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Product  $product
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request, Product $product)
    {
        $user = $request->user();
        if (($user->id !== $product->user_id ) || !($user->hasRole('admin')))
            abort(401);
        if($product->orders->count() > 0)
            return redirect()->back()->with('error', 'Sry this product associated with orders, contact with Admin');

        $this->deleteAllProductImages($product);
        $product->delete();
        return redirect()->back()->with('success', 'Product deleted successfully');

    }

    public function deleteForVendor(Request $request)               // TODO make this soft delete for vendor
    {
        if($request->has('product_id'))
            $product = Product::findOrFail($request->input('product_id'));
        $user = $request->user();
        if (($user->id !== $product->user_id )|| !($user->hasRole('admin')))
            abort(401);
        if($product->orders->count() > 0)
            return redirect()->back()->with('error', 'Sry this product associated with orders, contact with Admin');

        $this->deleteAllProductImages($product);
        $product->delete();
        return redirect()->back()->with('success', 'Product deleted successfully');

    }


    /////////////////////////////////////////////////////// Validation //////////////////////////////////////

    protected function getCreateValidateRules($request){
        $rules = [
            'name' => 'required|string|unique:products,name',
            'category' => 'required',
            'price' => 'required|numeric',
            'photo' => 'required|image|dimensions:min_width=1200,min_height=700',
            'description' => 'required|string',
        ];
        if($request->filled('discount'))                // if had discount
            $rules['discount'] = 'numeric';
        if($request->hasFile('related_photo')){                                  // if any related photos added
            for($i = 0; $i < count($request->file('related_photo')); $i++){
                $rules['related_photo.'.$i] = 'image|dimensions:min_width=600,min_height=600';
            }
        }
        return $rules;
    }

    protected function getUpdateValidateRules($request, $product){
        $rules = [
            'category' => 'required',
            'price' => 'required|numeric',
            'description' => 'required|string',
        ];
        if($request->name !== $product->name)
            $rules['name'] = 'required|string|unique:products,name';
        if($request->filled('discount'))            // if had discount
            $rules['discount'] = 'numeric';
        if($request->hasFile('photo'))              // if updated cover photo
            $rules['photo'] ='required|image|dimensions:min_width=1200,min_height=700';
        if($request->hasFile('related_photo')){                                 // if any related photos added
            for($i = 0; $i < count($request->file('related_photo')); $i++){
                $rules['related_photo.'.$i] = 'image|dimensions:min_width=600,min_height=600';
            }
        }
        return $rules;
    }


}
