<?php

namespace app\index\controller;

use app\common\controller\Frontend;
use think\db\Mongo;
use think\facade\Db;

class Index extends Frontend
{
    protected $noNeedLogin = '*';
    protected $noNeedRight = '*';
    //protected $layout = 'default';
    protected $layout = false;

    public function index()
    {
        /* @var $data think\db\Mongo */
        //Mongo::class;
/*        $data = \think\facade\Db::connect('mongodb')
            ->table('user')
            ->where('name','小张')
            ->select()
            ->toArray();
        //dump($data);
        return $this->view->fetch();*/

      /*  $data = Db::connect('mongodb')->table('yfcms');
        $data->save([
            'name' => '小牛',
        ]);*/
        return $this->view->fetch();

    }

    public function getTime()
    {
        if(request()->isPost()){
            return date('yy-m-d H:i:s',time());
        }else{
            return json('请使用post请求');
        }
    }
}
