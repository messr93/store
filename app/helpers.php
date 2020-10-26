<?php


if(!function_exists('slugThis')){                                       //slugThis
    function slugThis($name){
        return str_replace(' ', '-', $name);
    }
}

if(!function_exists('activeLangs')){                                    //activeLangs
    function activeLangs(){
        if(!session('activeLangs'))
            session()->put('activeLangs', \App\Lang::where('status', 1)->pluck('code')->toArray());
        return session('activeLangs')? session('activeLangs'): ['en'];
    }
}

if(!function_exists('changeLang')){                                    //changeLang
    function changeLang($newLang){
        if(in_array($newLang, activeLangs())){
            session()->put('newLang', $newLang);
            app()->setLocale($newLang);
        }
    }
}

if(!function_exists('currentLang')){                                //currentLang
    function currentLang(){
        return session('newLang', 'en');
    }
}

if(!function_exists('langDir')){                                //langDir
    function langDir(){
        return (currentLang() == 'ar')? 'rtl': 'ltr';
    }
}
