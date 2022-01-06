<?php

namespace App\models;

use Illuminate\Database\Eloquent\Model;

class Role extends Model
{
    protected $fillabe = [
        'name' , 'redirect_to'
    ];

    protected $table = 'roles';
}
