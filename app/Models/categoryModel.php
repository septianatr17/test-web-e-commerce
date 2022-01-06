<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class categoryModel extends Model
{
    protected $fillable = ['category_name'];

    public function jumlah($id)
    {
        $category = category::where('id_cat', $id)->count();
        return $category;
    }

    protected $table = 'category';
}
