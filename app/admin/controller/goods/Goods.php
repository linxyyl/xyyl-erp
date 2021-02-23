<?php

namespace app\admin\controller\goods;

use app\common\controller\Backend;
use think\Model;

/**
 * 商品列表
 *
 * @icon fa fa-circle-o
 */
class Goods extends Backend
{

    /**
     * Goods模型对象
     * @var \app\admin\model\goods\Goods
     */
    protected $model = null;
    protected $goodsInfo = [];


    public function _initialize()
    {
        parent::_initialize();
        $this->model = new \app\admin\model\goods\Goods;

        $this->goodsInfo['GoodsBrandList'] = \app\admin\model\goods\GoodsBrand::getOneList();
        $this->goodsInfo['GoodsTypeList'] = \app\admin\model\goods\GoodsType::getOneList();
        $this->goodsInfo['GoodsPlaceList'] = \app\admin\model\goods\GoodsPlace::getOneList();
        $this->goodsInfo['GoodsUnitList'] = \app\admin\model\goods\GoodsUnit::getOneList();

        $this->view->assign("GoodsBrandList", $this->goodsInfo['GoodsBrandList']);
        $this->view->assign("GoodsTypeList", $this->goodsInfo['GoodsTypeList']);
        $this->view->assign("GoodsPlaceList", $this->goodsInfo['GoodsPlaceList']);
        $this->view->assign("GoodsUnitList", $this->goodsInfo['GoodsUnitList']);
        $this->view->assign("statusList", $this->model->getStatusList());
    }

    /**
     * 查看
     */
    public function index()
    {
        $this->assignconfig("GoodsBrandList", $this->goodsInfo['GoodsBrandList']);
        $this->assignconfig("GoodsTypeList", $this->goodsInfo['GoodsTypeList']);
        $this->assignconfig("GoodsPlaceList", $this->goodsInfo['GoodsPlaceList']);
        $this->assignconfig("GoodsUnitList", $this->goodsInfo['GoodsUnitList']);
        //设置过滤方法
        $this->request->filter(['strip_tags']);

        if ($this->request->isAjax()) {
            //如果发送的来源是Selectpage，则转发到Selectpage
            if ($this->request->request('keyField')) {
                return $this->selectpage();
            }
            [$where, $sort, $order, $offset, $limit] = $this->buildparams();
            $total = $this->model
                ->where($where)
                ->order($sort, $order)
                ->count();

            $list = $this->model
                ->where($where)
                ->order($sort, $order)
                ->limit($offset, $limit)
                ->select();

            $list = $list->toArray();
            $result = ['total' => $total, 'rows' => $list];

            return json($result);
        }

        return $this->view->fetch();
    }

}
