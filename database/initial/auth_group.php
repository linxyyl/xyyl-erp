<?php
$data = [
    [
        'id' => 1,
        'pid' => 0,
        'name' => 'Admin group',
        'rules' => '*',
        'status' => 'normal',
    ],
    [
        'id' => 2,
        'pid' => 1,
        'name' => 'Super group',
        'rules' => '1,6,7,8,9,10,11,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,40,41,42,43,44,45,46,47,48,49,50,2,5',
        'status' => 'normal',
    ],
];

foreach ($data as $v) {
    $model = new \app\admin\model\AuthGroup;
    $model->save($v);
}