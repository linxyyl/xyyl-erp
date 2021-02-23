<?php
$data = [
    [
        'id' => 1,
        'type' => 'fun',
        'title' => '执行控制器方法',
        'content' => 'appapicontrollerDemo@test',
        'schedule' => '* * * * *',
        'sleep' => 0,
        'maximums' => 0,
        'executes' => 0,
        'begintime' => time(),
        'endtime' => 3786883200,
        'executetime' => time(),
        'weigh' => 3,
        'status' => 'normal',
    ]
];

foreach ($data as $v){
    $model = new \app\common\model\Crontab;
    $model->save($v);
}