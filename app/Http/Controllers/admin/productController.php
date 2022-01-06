<?php

namespace App\Http\Controllers\admin;

use Illuminate\Http\Request;
use Illuminate\Support\Str;
use App\Http\Controllers\Controller;
use DB;
use App\Models\userModel;
use App\Models\CategoryModel;
use App\Models\productModel;


class productController extends Controller
{
    public function index(){
        $Category = DB::table('category')->get(); 
        $product = DB::select(DB::raw('SELECT c.category,p.product_name,p.price,p.img,p.qty,p.deskripsi,p.created_at,p.updated_at 
        FROM `product` p LEFT join category c ON c.id_cat=p.category_id WHERE p.`deleted_at` is null'));

        return view('admin/product', ['getKategori' => $Category , 'product' => $product]);
    }

    public function addProduct(Request $request)
    {
        $valid= \Validator::make($request->all(), [
            'img' => 'required|image|mimes:jpeg,png,jpg|max:100000'
        ]);   
        
        
        try {
            //dd($valid);die();
            $category       = $request->get('category');
            $nama_product   = $request->get('nama_product');
            $qty            = $request->get('qty');
            $price          = $request->get('price');
            $deskripsi      = $request->get('deskripsi');
            $image          = $request->file('img');
            $img            = str_replace(' ', '_',$image->getClientOriginalName());  
            $uploadSuc      =  $image->move(public_path('storage/product'), $img);  

            $id = DB::select( DB::raw("SELECT id_cat FROM `category` WHERE `category` = :category"), 
            array(
              'category' => $category
             ));
            foreach($id as $id){
                $id = $id;
            }
             
            //dd($id->id_cat);die();
            $results = DB::insert(DB::raw("INSERT INTO `product`(`category_id`, `product_name`, `price`, `img`, `qty`,`deskripsi` ,`created_at`, `updated_at`) 
                 VALUES (:category,:nama_product,:price,:img,:qty,:deskripsi,now(),now())"),
            array(
                'category'        => $id->id_cat,
                'nama_product'    => $nama_product,
                'price'           => $price,
                'qty'             => $qty,
                'deskripsi'       => $deskripsi,
                'img'             => $img
            ));

            return redirect('product');



        } catch (Exception $e) {
            return redirect('product');
        }
       
    }

    public function kategori(){
        $Category = DB::table('category')->get(); 
        return view('admin/kategori', ['getKategori' => $Category]);
    }

    public function addKategori(Request $request ){
        $nama_kat   = $request->get('nama_kat');

        try {
            
            $results = DB::insert(DB::raw("INSERT INTO `category`( `category`, `created_at`, `updated_at`) VALUES (:category,now(),now())"),
            array(
                'category'        => $nama_kat
            ));
            return response()->json($results);     
        } catch (Exception $e) {
            return response()->json([
                'status' => '112',
                'message' => $e.getMessage(),
            ], 200);
        }
          
    }

   
}
