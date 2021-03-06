<?php

namespace app\admin\model\pss;

use app\admin\model\stock\StockGoods;
use app\common\model\BaseModel;
use linxyyl\mating\Mating;
use think\model\concern\SoftDelete;

class Purchase extends BaseModel
{
    use SoftDelete;

    // 表名
    protected $name = 'purchase';
    
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
        return ['1' => __('Status 1'), '2' => __('Status 2'), '3' => __('Status 3'), '4' => __('Status 4'), '5' => __('Status 5'), '6' => __('Status 6'), '7' => __('Status 7'), '8' => __('Status 8'), '9' => __('Status 9')];
    }


    public function getStatusTextAttr($value, $data)
    {
        $value = $value ? $value : (isset($data['status']) ? $data['status'] : '');
        $list = $this->getStatusList();
        return isset($list[$value]) ? $list[$value] : '';
    }

    /**
     * 新增前事件
     * @param $model
     */
    public static function onBeforeInsert($model)
    {
        $model->code = 'CG' . date('ymdHis', time()) . Mating::numberString(8);
        $model->order_token = 'cg' . Mating::superString(126);
        $model->admin_id = session('admin')['id'];
    }

    /**
     * 写入前事件
     * @param $model
     */
    public static function onBeforeWrite($model)
    {
        // 写入goods_id
        $model->goods_id = StockGoods::where('id',$model->stock_goods_id)->value('goods_id');
        $model->amount_price = $model->goods_price * $model->goods_number + $model->other_price + $model->transport_price;
    }
}
