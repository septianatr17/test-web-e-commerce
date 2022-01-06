<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class userModel extends Model
{
    protected $fillable = [
        'nama','role','username','password','pekerjaan','tgl_lahir','status'
    ];

    protected $hidden = [
        'password'
    ];
    
    protected $table ='user';
}
