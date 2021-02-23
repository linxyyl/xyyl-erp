<?php
/**
 * *
 *  * ============================================================================
 *  * Created by PhpStorm.
 *  * User: Ice
 *  * 邮箱: ice@sbing.vip
 *  * 网址: https://sbing.vip
 *  * Date: 2019/9/19 下午3:33
 *  * ============================================================================.
 */

namespace app\admin\controller;

use app\admin\model\goods\Goods;
use app\admin\model\order\Order;
use app\admin\model\pss\Sell;
use app\admin\model\stock\StockGoods;
use app\common\controller\Backend;
use think\facade\Config;

/**
 * 控制台.
 *
 * @icon fa fa-dashboard
 * @remark 用于展示当前系统中的统计数据、统计报表及重要实时数据
 */
class Dashboard extends Backend
{
    /**
     * 查看.
     */
    public function index()
    {
        $seventtime = \fast\Date::unixtime('day', -365);

        // 最多拿一年的数据
        $paylist = $createlist = [];
        for ($i = 0; $i < 13; $i++) {

            $day = date('Y-m', $seventtime + ($i * 86400 * 30));

            // 月销售金额
            //$createlist[$day] = mt_rand(20, 200);
            $createlist[$day] = Sell::whereMonth('updatetime', $day)->sum('amount_price');

            // 月订单总数
            $paylist[$day] = Order::whereMonth('createtime', $day)->count();
        }


        // dd($createlist);

        $hooks = config('addons.hooks');
        $uploadmode = isset($hooks['upload_config_init']) && $hooks['upload_config_init'] ? implode(',',
            $hooks['upload_config_init']) : 'local';
        $config = Config::get('composer');
        $addonVersion = isset($config['version']) ? $config['version'] : __('Unknown');

        $number = \app\common\model\Config::get(['name' => 'request_number']);

        $this->view->assign([
            //'totalviews'       => $number->value, // 总访问数
            //'totaluser'        => 0, // 会员人数
            //'totalorderamount' => 0, // 总金额
            'totalorder' => Order::count(), //订单总数
            'totalgoods' => Goods::count(), // 商品总数
            'totalsell' => Sell::sum('amount_price'), // 销售总金额
            'totalinventory' => StockGoods::sum('number'), // 库存总数
            'createlist' => $createlist,
            'addonversion' => $addonVersion,
            'uploadmode' => $uploadmode,

            // 图表数据
            'paylist' => $paylist,
        ]);

        return $this->view->fetch();
    }
}
