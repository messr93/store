<?php
namespace App\Traits;

use App\Product;
use Illuminate\Support\Facades\Storage;
use Intervention\Image\Facades\Image;

Trait  HandleImages{

    function uploadProductCoverImage($photo, $photoName){

        Image::make($photo)->resize(1200, 700)->save(base_path('uploads/product/cover/1200x700/'.$photoName));
        Image::make($photo)->resize(255, 255)->save(base_path('uploads/product/cover/255x255/'.$photoName));
        Image::make($photo)->resize(110, 110)->save(base_path('uploads/product/cover/110x110/'.$photoName));
        //Image::make($photo)->resize(131, 26)->save(base_path('uploads/product/cover/custom/'.$photoName));
    }

    function deleteCoverImage($photoName){

        Storage::disk('product')->delete('cover/1200x700/'.$photoName);
        Storage::disk('product')->delete('cover/250x250/'.$photoName);
        Storage::disk('product')->delete('cover/110x110/'.$photoName);
    }


    function deleteAllProductImages(Product $product){

        Storage::disk('product')->delete('cover/1200x700/'.$product->photo);
        Storage::disk('product')->delete('cover/255x255/'.$product->photo);
        Storage::disk('product')->delete('cover/110x110/'.$product->photo);

        if($product->relatedPhotos->count() > 0){
            foreach($product->relatedPhotos as $productPhoto){
                Storage::disk('product')->delete('related/600x600/'.$productPhoto->photo);
                $productPhoto->delete();
            }
        }

    }


}


