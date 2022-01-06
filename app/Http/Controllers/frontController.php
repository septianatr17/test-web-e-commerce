<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\CategoryModel;
use App\Models\productModel;
use DB;

class frontController extends Controller
{
   

    public function frontend()
    {
        $Category = DB::table('category')->get(); 

        $product = DB::select(DB::raw('SELECT c.category,p.product_name,p.price,p.img,p.qty,p.deskripsi,p.created_at,p.updated_at 
        FROM `product` p LEFT join category c ON c.id_cat=p.category_id WHERE p.`deleted_at` is null'));


        return view('home_utama',['product' => $product , 'category' => $Category] );

    }

    public function productSidebar($id)
    {
        try {
            $Category = DB::table('category')->get(); 

            $product = DB::select(DB::raw('SELECT c.category,p.product_name,p.price,p.img,p.qty,p.deskripsi,p.created_at,p.updated_at 
        FROM `product` p LEFT join category c ON c.id_cat=p.category_id WHERE p.`deleted_at` is null  and p.category_id=:category_id'),
        array('category_id'  => $id));
            return view('member.product_sidebar',['product' => $product , 'category' => $Category] );
        } catch (Exception $e) {
            //throw $th;
        }
       
    }
}
