<?php

namespace app\common\model;

/**
 * 短信验证码
 */
class Sms extends BaseModel
{
    // 开启自动写入时间戳字段
    protected $autoWriteTimestamp = 'int';
    // 定义时间戳字段名
    protected $createTime = 'createtime';
    protected $updateTime = false;
    // 追加属性
    protected $append = [
    ];

    /**
     * 记录
     */
    public static function record($phone,$code)
    {
        $model = Sms::where(['phone'=>$code])->find();

        $info = [
            'event' => 'reg',
            'mobile' => $phone,
            'code' => $code,
            'times' => 1,
            'ip' => $_SERVER['SERVER_ADDR'],
        ];

        if(empty($model)){
            $model = new static();
        }

        $model->save($info);

    }
}
