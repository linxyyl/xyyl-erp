<?php

namespace app\admin\model\stock;

use app\admin\model\goods\Goods;
use app\common\model\BaseModel;

/**
 * 仓库商品表
 * Class StockGoods
 * @package app\admin\model\stock
 */
class StockGoods extends BaseModel
{
    // 表名
    protected $name = 'stock_goods';
    
    // 自动写入时间戳字段
    protected $autoWriteTimestamp = 'int';

    // 定义时间戳字段名
    protected $createTime = 'createtime';
    protected $updateTime = 'updatetime';
    protected $deleteTime = false;

    // 追加属性
    protected $append = [

    ];

    // 关联商品
    public function goods()
    {
        return $this->hasOne(Goods::class,'id','goods_id')->bind([
            'goods_title' => 'title',
            'place_title',
            'brand_title',
            'type_title',
            'unit_title',
        ]);
    }
}
