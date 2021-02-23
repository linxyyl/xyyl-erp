<?php

namespace app\admin\model\goods;

use app\common\model\BaseModel;
use think\model\concern\SoftDelete;

/**
 * 商品类型
 * Class GoodsType
 * @package app\admin\model\goods
 */
class GoodsType extends BaseModel
{
    use SoftDelete;

    // 表名
    protected $name = 'goods_type';
    // 自动写入时间戳字段
    protected $autoWriteTimestamp = 'int';
    // 定义时间戳字段名
    protected $createTime = 'createtime';
    protected $updateTime = 'updatetime';
    protected $deleteTime = 'deletetime';

    // 追加属性
    protected $append = [
        'status_text'
    ];

    public function getStatusList()
    {
        return ['1' => __('Status 1'), '2' => __('Status 2'), '3' => __('Status 3')];
    }

    public function getStatusTextAttr($value, $data)
    {
        $value = $value ? $value : (isset($data['status']) ? $data['status'] : '');
        $list = $this->getStatusList();
        return isset($list[$value]) ? $list[$value] : '';
    }

    public static function getOneList()
    {
        return static::where(['status' => 2])->column('title', 'id');
    }
}
