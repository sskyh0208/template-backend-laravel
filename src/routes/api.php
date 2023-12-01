<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Http;

use App\Http\Controllers\ApiController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------

|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::get('/test', [ApiController::class, 'testDatabase']);

Route::get('/fastapi', function () {
    $apiUrl = env('API_URL'); // 環境変数 'API_URL' からURLを取得
    $response = Http::get($apiUrl); // HTTP GETリクエストを送信

    return $response->body(); // レスポンスの内容を返す
});