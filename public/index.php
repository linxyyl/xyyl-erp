<?php

// [ 应用入口文件 ]
namespace think;

//是否composer
if (! file_exists('../vendor')) {
    exit('根目录缺少vendor,请先composer install');
}


require __DIR__.'/../vendor/autoload.php';
// 执行HTTP应用并响应
$http = (new App())->http;

$response = $http->run();

$response->send();

$http->end($response);
