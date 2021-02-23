<?php
$data = [
    [
        'id' => 1,
        'username' => 'root',
        'nickname' => '开发者',
        'password' => 'df54dbe0a07a5499bdc2f27fc7566d12',
        'salt' => 'd4e439',
        'avatar' => '/assets/img/title.png',
        'email' => 'linxyyl@163.com',
        'loginfailure' => 0,
        'logintime' => time(),
        'loginip' => '127.0.0.1',
        'token' => 'd202923f-6974-4a0a-82aa-282820f4977a',
        'status' => 'normal',
    ],

    [
        'id' => 2,
        'username' => 'admin',
        'nickname' => 'admin',
        'password' => '21ac50fa870647692df49f542301097a',
        'salt' => 'm0anVN',
        'avatar' => '/assets/img/admin.jpg',
        'email' => 'admin@admin.com',
        'loginfailure' => 0,
        'logintime' => time(),
        'loginip' => '127.0.0.1',
        'token' => '3f30e00c-e488-457f-97ac-0465b8d35d16',
        'status' => 'normal',
    ],
];

foreach ($data as $v){
    $model = new \app\admin\model\Admin;
    $model->save($v);
}
