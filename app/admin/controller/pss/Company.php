<?php

namespace app\admin\controller\pss;

use app\common\controller\Backend;

/**
 * 客户管理
 *
 * @icon fa fa-address-book
 */
class Company extends Backend
{
    /**
     * Company模型对象
     * @var \app\admin\model\pss\Company
     */
    protected $model = null;

    public function _initialize()
    {
        parent::_initialize();
        $this->model = new \app\admin\model\pss\Company;
        $this->view->assign("statusList", $this->model->getStatusList());
    }
}
