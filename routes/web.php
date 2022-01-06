<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

// Route::get('/', function () {
//     return view('welcome');
// });

Route::get('/admin', 'admin\adminController@loginform');

Route::group(['middleware' => 'auth'], function(){
    Route::group(['middleware' => 'role'], function(){
    
        Route::post('/signin','admin\adminController@login')->name('signin');
        Route::get('/dash','admin\adminController@homeadmin')->name('home_admin');
        Route::get('logout', 'admin\adminController@logout')->name('logout');
    
        Route::match(['GET', 'POST'],'/product','admin\productController@index')->name('product');
        Route::post('/addProduct','admin\productController@addProduct')->name('addProduct');
        Route::get('/kategori','admin\productController@kategori')->name('kategori');
        Route::post('/addKat','admin\productController@addKategori')->name('addKategori');
        
    });

    Route::group(['middleware' => 'rolee:user'], function(){
    
    });
});

Route::get('/productSidebar/{id}','frontController@productSidebar')->name('productSidebar');
Route::get('/', 'frontController@frontend')->name('frontend');
Route::get('/sig-in','AuthController@sigin')->name('sigin');
Route::post('/sig-in','AuthController@auth')->name('auth');



Auth::routes();

Route::get('/home', 'admin\adminController@homeadmin')->name('home');
