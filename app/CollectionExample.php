<?php


namespace App;


class CollectionExample
{
    public function example(){

        $data = Product::get();

        return $data->sum('price');


    }

}
