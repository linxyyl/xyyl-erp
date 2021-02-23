<?php

namespace app\admin\controller\goods;

use app\common\controller\Backend;

/**
 * 商品单位
 *
 * @icon fa fa-circle-o
 */
class GoodsUnit extends Backend
{
    
    /**
     * GoodsUnit模型对象
     * @var \app\admin\model\goods\GoodsUnit
     */
    protected $model = null;

    public function _initialize()
    {
        parent::_initialize();
        $this->model = new \app\admin\model\goods\GoodsUnit;
        $this->view->assign("statusList", $this->model->getStatusList());
    }


    /**
     * 查看
     */
    public function index()
    {
        //当前是否为关联查询
        $this->relationSearch = false;
        //设置过滤方法
        $this->request->filter(['strip_tags', 'trim']);
        if ($this->request->isAjax())
        {
            //如果发送的来源是Selectpage，则转发到Selectpage
            if ($this->request->request('keyField'))
            {
                return $this->selectpage();
            }
            list($where, $sort, $order, $offset, $limit) = $this->buildparams();
            $total = $this->model

                ->where($where)
                ->order($sort, $order)
                ->count();

            $list = $this->model

                ->where($where)
                ->order($sort, $order)
                ->limit($offset, $limit)
                ->select();

            foreach ($list as $row) {
                $row->visible(['id','title','describe','createtime','updatetime','status','remark']);

            }
            $result = array("total" => $total, "rows" => $list);

            return json($result);
        }
        return $this->view->fetch();
    }

}
