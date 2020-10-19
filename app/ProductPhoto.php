<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ProductPhoto extends Model
{
    protected $table = 'product_photos';
    protected $fillable = ['product_id', 'photo'];

    ########################################### Relations ############################3
    public function product(){
        return $this->belongsTo(Product::class);
    }
}
