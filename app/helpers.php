<?php


if(!function_exists('slugThis')){
    function slugThis($name){
        return str_replace(' ', '-', $name);
    }
}
