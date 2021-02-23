<?php

namespace app\admin\model\order;

use app\common\model\BaseModel;
use think\model\concern\SoftDelete;

class Order extends BaseModel
{

    use SoftDelete;

    

    // 表名
    protected $name = 'order';
    
    // 自动写入时间戳字段
    protected $autoWriteTimestamp = 'int';

    // 定义时间戳字段名
    protected $createTime = 'createtime';
    protected $updateTime = 'updatetime';
    protected $deleteTime = 'deletetime';

    // 追加属性
    protected $append = [
        'group_text',
        'type_text',
        'status_text'
    ];
    

    
    public function getGroupList()
    {
        return ['1' => __('Group 1'), '2' => __('Group 2'), '3' => __('Group 3'), '4' => __('Group 4')];
    }

    public function getTypeList()
    {
        return ['1' => __('Type 1'), '2' => __('Type 2')];
    }

    public function getStatusList()
    {
        return ['1' => __('Status 1'), '2' => __('Status 2'), '3' => __('Status 3')];
    }


    public function getGroupTextAttr($value, $data)
    {
        $value = $value ? $value : (isset($data['group']) ? $data['group'] : '');
        $list = $this->getGroupList();
        return isset($list[$value]) ? $list[$value] : '';
    }


    public function getTypeTextAttr($value, $data)
    {
        $value = $value ? $value : (isset($data['type']) ? $data['type'] : '');
        $list = $this->getTypeList();
        return isset($list[$value]) ? $list[$value] : '';
    }


    public function getStatusTextAttr($value, $data)
    {
        $value = $value ? $value : (isset($data['status']) ? $data['status'] : '');
        $list = $this->getStatusList();
        return isset($list[$value]) ? $list[$value] : '';
    }

}
