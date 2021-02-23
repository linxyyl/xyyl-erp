<?php

namespace app\admin\controller\stock;

use app\admin\model\goods\Goods;
use app\common\controller\Backend;

/**
 * 仓库商品库存管理
 *
 * @icon fa fa-circle-o
 */
class StockGoods extends Backend
{

    /**
     * StockGoods模型对象
     * @var \app\admin\model\stock\StockGoods
     */
    protected $model = null;
    protected $stockInfo = [];


    public function _initialize()
    {
        parent::_initialize();

        // 分配仓库信息
        $this->stockInfo['stockList'] = \app\admin\model\stock\Stock::getOneList();

        $this->model = new \app\admin\model\stock\StockGoods;
    }

    /**
     * 查看
     */
    public function index()
    {
        // 分配仓库信息
        $this->assignconfig('stockList',$this->stockInfo['stockList']);
        // 分配商品信息
        $this->assignconfig('goodsList',Goods::getOneList());


        //当前是否为关联查询
        $this->relationSearch = false;
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
                $row->visible(['id', 'number', 'stock_id', 'goods_id', 'createtime', 'updatetime']);

            }
            $result = array("total" => $total, "rows" => $list);

            return json($result);
        }
        return $this->view->fetch();
    }
}
