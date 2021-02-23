<?php

namespace app\admin\model\stock;

use app\admin\model\goods\Goods;
use app\common\model\BaseModel;
use linxyyl\mating\Mating;
use think\model\concern\ModelEvent;
use think\model\concern\SoftDelete;

/**
 * 盘点模型
 * Class StockCheck
 * @package app\admin\model\stock
 */
class StockCheck extends BaseModel
{
    use SoftDelete;

    // 表名
    protected $name = 'stock_check';

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
        return [
            '1' => __('Status 1'),
            '2' => __('Status 2'),
            '3' => __('Status 3'),
            '4' => __('Status 4'),
            '5' => __('Status 5'),
            '6' => __('Status 6'),
            '7' => __('Status 7')
        ];
    }

    public function getStatusTextAttr($value, $data)
    {
        $value = $value ? $value : (isset($data['status']) ? $data['status'] : '');
        $list = $this->getStatusList();
        return isset($list[$value]) ? $list[$value] : '';
    }

    public function stock()
    {
        return $this->hasOne(Stock::class, 'id', 'stock_id')->bind([
            'stock_title' => 'title'
        ]);
    }

    // 关联商品信息
    public function goods()
    {
        /*return $this->hasOneThrough(Goods::class,
            StockGoods::class,
            'id', // 远程关联表主键
            'id',  // 中间模型与当前模型关联字段
            'goods_id', // 当前模型关联字段
            'goods_id' // 中间模型与远程模型关联
        );*/
    }

    /**
     * 新增前事件
     * @param $model
     */
    public static function onBeforeInsert($model)
    {
        $model->code = 'PD' . date('ymdHis', time()) . Mating::numberString(8);
        $model->order_token = 'pd' . Mating::superString(126);
        $model->admin_id = session('admin')['id'];
        // 写入goods_id
        //$model->goods_id = StockGoods::where('id',$model->stock_goods_id)->value('goods_id');
    }

    /**
     * 写入前事件
     * @param $model
     */
    public static function onBeforeWrite($model)
    {
        // 写入goods_id
        $model->goods_id = StockGoods::where('id', $model->stock_goods_id)->value('goods_id');
    }

    /**
     * 新增后事件
     * @param \think\Model $model
     */
    public static function onAfterInsert($model)
    {
        // 生成订单
    }
}
