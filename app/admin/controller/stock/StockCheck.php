<?php

namespace app\admin\controller\stock;

use app\admin\model\goods\Goods;
use app\admin\model\order\Order;
use app\common\controller\Backend;

/**
 * 仓库盘点管理
 *
 * @fa fa-calculator
 */
class StockCheck extends Backend
{

    /**
     * StockCheck模型对象
     * @var \app\admin\model\stock\StockCheck
     */
    protected $model = null;
    protected $stockInfo = [];

    public function _initialize()
    {
        parent::_initialize();
        $this->model = new \app\admin\model\stock\StockCheck;
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
                ->with('stock')
                ->where($where)
                ->order($sort, $order)
                ->count();

            $list = $this->model
                ->with('stock')
                ->where($where)
                ->order($sort, $order)
                ->limit($offset, $limit)
                ->select();

            foreach ($list as $row) {
                $row->visible([
                    'id',
                    'admin_id',
                    'admin_name',
                    'goods_id',
                    'code',
                    'number',
                    'stock_title',
                    'stock_id',
                    'status',
                    'createtime',
                    'deletetime',
                    'remark'
                ]);

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
        $this->success('复审通过操作成功');
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
        //1. 仓库商品数量确认
        $goods = \app\admin\model\stock\StockGoods::find($model->stock_goods_id);
        $goods->number = $model->number;
        $goods->save();
        //2. 生成公共订单信息
        $order = new Order();
        $order->group = 1;
        $order->type = 2;
        $order->number = $model->code;
        $order->order_token = $model->order_token;
        $order->save();

        $this->success('确认审核操作成功');
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
}
