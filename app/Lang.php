<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Lang extends Model
{
    protected $table = 'langs';
    protected $fillable = ['code', 'name', 'status'];
    public $timestamps =  true;
}
