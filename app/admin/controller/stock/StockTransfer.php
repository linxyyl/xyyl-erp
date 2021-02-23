<?php

namespace app\admin\controller\stock;

use app\admin\model\goods\Goods;
use app\admin\model\order\Order;
use app\admin\model\stock\StockGoods;
use app\common\controller\Backend;

/**
 * 仓库调拨管理
 *
 * @fa fa-exchange
 */
class StockTransfer extends Backend
{

    /**
     * StockTransfer模型对象
     * @var \app\admin\model\stock\StockTransfer
     */
    protected $model = null;
    protected $stockInfo = [];


    public function _initialize()
    {
        parent::_initialize();
        $this->model = new \app\admin\model\stock\StockTransfer;
        // 分配仓库信息
        $this->stockInfo['stockList'] = \app\admin\model\stock\Stock::getOneList();
        $this->view->assign("stockList", $this->stockInfo['stockList']);
        $this->view->assign("statusList", $this->model->getStatusList());
    }

    /**
     * 查看
     */
    public function index()
    {
        $this->assignconfig('stockList', $this->stockInfo['stockList']);
        // 分配商品信息
        $this->assignconfig('goodsList', Goods::getOneList());
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
                $row->visible(['id',
                    'admin_id',
                    'admin_name',
                    'out_stock_id',
                    'get_stock_id',
                    'goods_id',
                    'stock_goods_id',
                    'code',
                    'status',
                    'createtime',
                    'number',
                    'remark']);

            }
            $result = array("total" => $total, "rows" => $list);

            return json($result);
        }
        return $this->view->fetch();
    }

    /**
     * 提交审核
     */
    public function submitVerify()
    {
        $id = input('id');
        $model = $this->model->find($id);
        $model->status = 2;
        $model->save();
        $this->success('提交审核操作成功');
    }

    /**
     * 确认审核
     */
    public function confirmVerify()
    {
        $id = input('id');
        $model = $this->model->find($id);
        $model->status = 3;
        $model->save();
        $this->success('确认审核操作成功');
    }

    /**
     * 审核驳回
     */
    public function rejectVerify()
    {
        $id = input('id');
        $model = $this->model->find($id);
        $model->status = 4;
        $model->save();
        $this->success('审核取消操作成功');
    }

    /**
     * 复审
     */
    public function againVerify()
    {
        $id = input('id');
        $model = $this->model->find($id);
        // 改为待入库状态
        $model->status = 5;
        $model->save();
        $this->success('审核取消操作成功');
    }

    /**
     * 取消入库
     */
    public function cancelPut()
    {
        $id = input('id');
        $model = $this->model->find($id);
        $model->status = 7;
        $model->save();
        $this->success('取消入库成功');
    }

    /**
     * 确认入库
     */
    public function confirmPut()
    {
        $id = input('id');
        $model = $this->model->find($id);
        $model->status = 6;
        $model->save();
        // 1. 调出仓库商品数量减少
        $goods = StockGoods::where('stock_id', $model->out_stock_id)
            ->where('goods_id',$model->goods_id)
            ->find();

        if ($model->number > $goods->number) {
            $this->error('调出仓库商品数量不足,无法调拨!');
        }

        $goods->number = $goods->number - $model->number;
        $goods->save();
        // 生成公共订单信息
        $order = new Order();
        $order->group = 2;
        $order->type = 1;
        $order->number = $model->code;
        $order->order_token = $model->order_token;
        $order->save();

        // 2. 调入仓库商品数量增加
        $goods = StockGoods::where('stock_id', $model->get_stock_id)
            ->where('goods_id',$model->goods_id)
            ->find();

        if (empty($goods)) {
            // 如果为空创建
            $goods = new StockGoods();
            $goods->stock_id = $model->get_stock_id;
            $goods->goods_id = $model->goods_id;
            $goods->number = $model->number;
            $goods->save();
        } else {
            $goods->number = $goods->number + $model->number;
            $goods->save();
        }

        // 生成公共订单信息
        $order = new Order();
        $order->group = 2;
        $order->type = 2;
        $order->number = $model->code;
        $order->order_token = $model->order_token;
        $order->save();
        $this->success('确认审核操作成功');
    }

}
