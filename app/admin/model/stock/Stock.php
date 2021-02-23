<?php

namespace app\admin\model\stock;

use app\common\model\BaseModel;
use think\model\concern\SoftDelete;

/**
 * 仓库列表
 * Class Stock
 * @package app\admin\model\stock
 */
class Stock extends BaseModel
{
    use SoftDelete;
    // 表名
    protected $name = 'stock';

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

    /**
     * @param Model $row
     */
    protected static function onAfterInsert($row)
    {
        $pk = $row->getPk();
        $row->where($pk, $row[$pk])->update(['weigh' => $row[$pk]]);
    }


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

    /**
     * 关联商品
     */
    public function goods()
    {
        return $this->hasMany(StockGoods::class,'stock_id','id');
    }

    /**
     * 仓库商品初始化
     * @param $goods_list
     */
    public function goodsInit($goods_list)
    {
        // 清除仓库商品
        StockGoods::where('stock_id', $this->id)->delete();
        // 为仓库添加商品
        foreach ($goods_list as $v) {
            $goodsModel = new StockGoods();
            $goodsModel->stock_id = $this->id;
            $goodsModel->goods_id = $v;
            $goodsModel->save();
        }
    }

    // 获取仓库单数组
    public static function getOneList()
    {
        return static::where(['status' => 2])->column('title','id');
    }
}
