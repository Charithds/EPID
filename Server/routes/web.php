<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| This file is where you may define all of the routes that are handled
| by your application. Just tell Laravel the URIs it should respond
| to using a Closure or controller method. Build something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});


Route::get('/home', 'HomeController@index');
Route::post('/login',['uses'=>'Auth\LoginController@login','as' => 'login']);
Route::get('/login', function (){
    return view('auth.login');
});

Route::get('/owner/users', 'UserController@index');
Route::get('/admin/posts', 'PostController@index');

