<?php

namespace app\admin\controller\stock;

use app\admin\model\goods\Goods;
use app\common\controller\Backend;

/**
 * 仓库列表
 *
 * @icon fa fa-circle-o
 */
class Stock extends Backend
{
    /**
     * Stock模型对象
     * @var \app\admin\model\stock\Stock
     */
    protected $model = null;

    public function _initialize()
    {
        parent::_initialize();
        $this->model = new \app\admin\model\stock\Stock;
        $this->view->assign("statusList", $this->model->getStatusList());
    }

    /**
     * 查看
     */
    public function index()
    {
        //当前是否为关联查询
        $this->relationSearch = false;
        $this->relationSearch = true;
        $this->searchFields = "address";
        //设置过滤方法
        $this->request->filter(['strip_tags', 'trim']);
        if ($this->request->isAjax()) {
            //如果发送的来源是Selectpage，则转发到Selectpage
            if ($this->request->request('keyField')) {
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
                $row->visible([
                    'id',
                    'title',
                    'address',
                    'weigh',
                    'createtime',
                    'updatetime',
                    'status',
                    'remark'
                ]);
            }
            $result = array("total" => $total, "rows" => $list);

            return json($result);
        }
        return $this->view->fetch();
    }

    /**
     * 商品初始化
     */
    public function stockInit()
    {
        $stock_id = input('stock_id');
        $stock = $this->model->find($stock_id);
        if($this->request->post()){
            // 仓库商品初始化
            $goods_list = input('goods_list');
            $stock->goodsInit($goods_list);
            $this->success();
        }
        $this->view->assign('stock',$stock);
        $this->view->assign('goods_list',Goods::getOneList());
        return $this->view->fetch();
    }

    public function getList()
    {
        return json(\app\admin\model\stock\Stock::getOneList());
    }
}
