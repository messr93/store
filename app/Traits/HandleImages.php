<?php
namespace App\Traits;

use App\Category;
use App\Product;
use App\Slider;
use App\User;
use Illuminate\Support\Facades\Storage;
use Intervention\Image\Facades\Image;

Trait  HandleImages{

    ######################################################### User #######################################################
    function uploadUserImage($photo, $photoName){
        Image::make($photo)->resize(600, 350)->save(base_path('uploads/user/600x350/'.$photoName));
        Image::make($photo)->resize(110, 110)->save(base_path('uploads/user/110x110/'.$photoName));
    }

    function deleteUserImages(User $user){
        if($user->photo !== "default_img.jpg"){
            Storage::disk('user')->delete('600x350/'.$user->photo);
            Storage::disk('user')->delete('110x110/'.$user->photo);
        }
    }

    ######################################################### Category #######################################################
    function uploadCategoryImage($photo, $photoName){
        Image::make($photo)->resize(1200, 700)->save(base_path('uploads/category/1200x700/'.$photoName));
        Image::make($photo)->resize(600, 600)->save(base_path('uploads/category/600x600/'.$photoName));
        Image::make($photo)->resize(110, 110)->save(base_path('uploads/category/110x110/'.$photoName));
        //Image::make($photo)->resize(600, 600)->save(base_path('uploads/category/110x110/'.$photoName));
    }

    function deleteCategoryImages(Category $category){
        if($category->photo !== "default_img.jpg"){
            Storage::disk('category')->delete('1200x700/'.$category->photo);
            Storage::disk('category')->delete('600x600/'.$category->photo);
            Storage::disk('category')->delete('110x110/'.$category->photo);
        }
    }

    ######################################################### Product #######################################################
    function uploadProductCoverImage($photo, $photoName){
        Image::make($photo)->resize(1200, 700)->save(base_path('uploads/product/cover/1200x700/'.$photoName));
        Image::make($photo)->resize(255, 255)->save(base_path('uploads/product/cover/255x255/'.$photoName));
        Image::make($photo)->resize(110, 110)->save(base_path('uploads/product/cover/110x110/'.$photoName));
        //Image::make($photo)->resize(600, 600)->save(base_path('uploads/product/cover/custom/'.$photoName));
    }

    function deleteProductCoverImage(Product $product){
        if($product->photo !== "default_img.jpg"){              // delete old cover only if it's not the default
            Storage::disk('product')->delete('cover/1200x700/'.$product->photo);
            Storage::disk('product')->delete('cover/255x255/'.$product->photo);
            Storage::disk('product')->delete('cover/110x110/'.$product->photo);
        }
    }


    function deleteAllProductImages(Product $product){
        if($product->photo !== "default_img.jpg"){              // delete old cover only if it's not the default
            Storage::disk('product')->delete('cover/1200x700/'.$product->photo);
            Storage::disk('product')->delete('cover/255x255/'.$product->photo);
            Storage::disk('product')->delete('cover/110x110/'.$product->photo);
        }
        if($product->relatedPhotos->count() > 0){
            foreach($product->relatedPhotos as $productPhoto){
                Storage::disk('product')->delete('related/600x600/'.$productPhoto->photo);
                $productPhoto->delete();
            }
        }
    }

    ######################################################### Slider #######################################################
    function uploadSliderImage($photo, $photoName){
        Image::make($photo)->resize(1200, 700)->save(base_path('uploads/slider/1200x700/'.$photoName));
        Image::make($photo)->resize(600, 350)->save(base_path('uploads/slider/600x350/'.$photoName));
        Image::make($photo)->resize(110, 110)->save(base_path('uploads/slider/110x110/'.$photoName));
        //Image::make($photo)->resize(600, 600)->save(base_path('uploads/category/110x110/'.$photoName));
    }

    function deleteSliderImages(Slider $slider){
        if($slider->photo !== "default_img.jpg"){
            Storage::disk('slider')->delete('1200x700/'.$slider->photo);
            Storage::disk('slider')->delete('600x350/'.$slider->photo);
            Storage::disk('slider')->delete('110x110/'.$slider->photo);
        }
    }


}


