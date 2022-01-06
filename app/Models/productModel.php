<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class productModel extends Model
{
    use SoftDeletes;
    protected $fillable = ['kategori_id', 'nama_product', 'price', 'img', 'qty','deskripsi'];

    public function kategori()
    {
      return $this->belongsTo('App\Models\categoryModal');
    }

  public function users()
  {
    return $this->belongsTo('App\Models\userModel');
  }

  protected $table = 'product';

}
