<?php
$data = [
    [
        'uid' => 1,
        'group_id' => 1,
    ],
    [
        'uid' => 2,
        'group_id' => 2,
    ],
];

foreach ($data as $v) {
    $model = new \app\admin\model\AuthGroupAccess();
    $model->save($v);
}