<?php

namespace app\admin\controller\pss;

use app\common\controller\Backend;

/**
 * 供应商管理
 *
 * @icon fa fa-home
 */
class Supplier extends Backend
{
    /**
     * Supplier模型对象
     * @var \app\admin\model\pss\Supplier
     */
    protected $model = null;

    public function _initialize()
    {
        parent::_initialize();
        $this->model = new \app\admin\model\pss\Supplier;
        $this->view->assign("statusList", $this->model->getStatusList());
    }
}
