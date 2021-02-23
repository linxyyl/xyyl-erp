<?php

namespace app\admin\model\goods;

use app\common\model\BaseModel;
use think\model\concern\SoftDelete;

class Goods extends BaseModel
{

    use SoftDelete;


    // 表名
    protected $name = 'goods';

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
     * 关联商品产地
     * @return \think\model\relation\HasOne
     */
    public function place()
    {
        return $this->hasOne(GoodsPlace::class,'id','place_id')
            ->bind([
            'place_title' => 'title'
        ]);
    }

    /**
     * 关联商品品牌
     * @return \think\model\relation\HasOne
     */
    public function brand()
    {
        return $this->hasOne(GoodsBrand::class,'id','brand_id')
            ->bind([
                'brand_title' => 'title'
            ]);
    }

    /**
     * 关联商品类型
     * @return \think\model\relation\HasOne
     */
    public function type()
    {

        return $this->hasOne(GoodsType::class,'id','type_id')
            ->bind([
                'type_title' => 'title'
            ]);
    }

    /**
     * 关联商品单位
     * @return \think\model\relation\HasOne
     */
    public function unit()
    {
        return $this->hasOne(GoodsUnit::class,'id','unit_id')
            ->bind([
                'unit_title' => 'title'
            ]);
    }

    public static function getOneList()
    {
        $arr =  static::where(['status' => 2])
            ->with(['place','type','brand','unit'])
            ->withoutField([
                'createtime',
                'updatetime',
                'deletetime',
                'status',
                'image',
                'remark',
                'status_text',
                'weigh',
                'describe',
                "num",
            ])
            ->select()
            ->toArray();
        $list = [];
        foreach ($arr as $v){

            $list[$v['id']] = "{$v['place_title']}/{$v['brand_title']}/{$v['title']}/{$v['unit_title']}";
        }

        return $list;
    }
}
