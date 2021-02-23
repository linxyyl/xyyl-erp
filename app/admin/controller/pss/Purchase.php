<?php

namespace app\admin\controller\pss;

use app\admin\model\goods\Goods;
use app\admin\model\order\Order;
use app\admin\model\stock\Stock;
use app\common\controller\Backend;

/**
 * 采购管理
 *
 * @icon fa fa-cart-arrow-down
 */
class Purchase extends Backend
{

    /**
     * Purchase模型对象
     * @var \app\admin\model\pss\Purchase
     */
    protected $model = null;
    protected $info = [];


    public function _initialize()
    {
        parent::_initialize();
        $this->model = new \app\admin\model\pss\Purchase;

        $this->info['supplierList'] = \app\admin\model\pss\Supplier::getOneList();
        $this->info['stockList'] = Stock::getOneList();
        $this->info['goodsList'] = Goods::getOneList();
        $this->view->assign("supplierList",  $this->info['supplierList']);
        $this->view->assign("stockList",  $this->info['stockList']);
        $this->view->assign("goodsList",  $this->info['goodsList']);
        $this->assignconfig('supplierList', $this->info['supplierList']);
        $this->assignconfig('stockList', $this->info['stockList']);
        $this->assignconfig('goodsList', $this->info['goodsList']);
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
                    'id', 'admin_id','admin_name', 'supplier_id', 'stock_id', 'stock_goods_id', 'goods_id', 'goods_number',
                    'goods_price', 'other_price', 'transport_price', 'amount_price', 'status', 'createtime', 'remark', 'code'
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
        $this->success('审核驳回操作成功');
    }

    /**
     * 复审
     */
    public function againVerify()
    {
        $id = input('id');
        $model = $this->model->find($id);
        $model->status = 5;
        $model->save();
        $this->success('确认复审操作成功');
    }

    /**
     * 确认支付
     */
    public function confirmPay()
    {
        $id = input('id');
        $model = $this->model->find($id);
        $model->status = 6;
        $model->save();
        $this->success('确认支付操作成功');
    }

    /**
     * 支付取消
     */
    public function cancelPay()
    {
        $id = input('id');
        $model = $this->model->find($id);
        $model->status = 7;
        $model->save();
        $this->success('支付取消操作成功');
    }

    /**
     * 确认入库
     */
    public function confirmPut()
    {
        $id = input('id');
        $model = $this->model->find($id);
        $model->status = 8;
        $model->save();
        //1. 销售仓库商品数量增加
        $goods = \app\admin\model\stock\StockGoods::find($model->stock_goods_id);
        $goods->number = $goods->number + $model->goods_number;
        $goods->save();

        //2. 生成公共订单信息
        $order = new Order();
        $order->group = 4;
        $order->type = 2;
        $order->number = $model->code;
        $order->order_token = $model->order_token;
        $order->save();

        $this->success('确认入库操作成功');
    }

    /**
     * 取消入库
     */
    public function cancelPut()
    {
        $id = input('id');
        $model = $this->model->find($id);
        $model->status = 9;
        $model->save();
        $this->success('取消入库成功');
    }

}
