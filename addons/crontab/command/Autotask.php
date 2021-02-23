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

namespace addons\crontab\command;

use app\common\model\Crontab;
use Cron\CronExpression;
use fast\Http;
use think\db\Query;
use think\Exception;
use think\console\Input;
use think\console\Output;
use think\console\Command;
use think\facade\Db;
use think\facade\Log;

class Autotask extends Command
{
    protected function configure()
    {
        $this
            ->setName('autotask')
            ->setDescription('run autotask');
    }

    protected function execute(Input $input, Output $output)
    {
        $r = $this->doTask();
        $output->info($r);
    }
    /**
     * 执行定时任务
     */
    public function doTask()
    {
        ignore_user_abort(true);
        error_reporting(0);
        set_time_limit(0);

        $time = time();
        $logDir = app()->getRootPath().'/runtime/crontab/';
        if (! is_dir($logDir)) {
            mkdir($logDir, 0755);
        }
        //筛选未过期且未完成的任务
        $crontabList = Crontab::where('status', '=', 'normal')->order('weigh desc,id desc')->select();
        $execTime = time();
        foreach ($crontabList as $crontab) {
            $update = [];
            $execute = false;
            if ($time < $crontab['begintime']) {
                //任务未开始
                continue;
            }
            if ($crontab['maximums'] && $crontab['executes'] > $crontab['maximums']) {
                //任务已超过最大执行次数
                $update['status'] = 'completed';
            } else {
                if ($crontab['endtime'] > 0 && $time > $crontab['endtime']) {
                    //任务已过期
                    $update['status'] = 'expired';
                } else {
                    //重复执行
                    //如果未到执行时间则继续循环
                    $cron = CronExpression::factory($crontab['schedule']);
                    if (! $cron->isDue(date("YmdHi", $execTime)) || date("YmdHi", $execTime) === date("YmdHi",
                            $crontab['executetime'])) {
                        continue;
                    }
                    $execute = true;
                }
            }

            // 如果允许执行
            if ($execute) {
                $update['executetime'] = $time;
                $update['executes'] = $crontab['executes'] + 1;
                $update['status'] = ($crontab['maximums'] > 0 && $update['executes'] >= $crontab['maximums']) ? 'completed' : 'normal';
            }

            // 如果需要更新状态
            if (! $update) {
                continue;
            }
            // 更新状态
            $crontab->save($update);

            // 将执行放在后面是为了避免超时导致多次执行
            if (! $execute) {
                continue;
            }
            try {
                if ($crontab['type'] == 'url') {
                    if (substr($crontab['content'], 0, 1) == "/") {
                        // 本地项目URL
                        //exec('nohup php '.app()->getRootPath().'public/index.php '.$crontab['content'].' >> '.$logDir.date("Y-m-d").'.log 2>&1 &');
                    } else {
                        // 远程异步调用URL
                        Http::sendAsyncRequest($crontab['content']);
                    }
                }elseif ($crontab['type'] == 'fun') {
                    if(strpos($crontab['content'], '::')){
                        //静态方法
                        @list($class,$method) = explode('::',$crontab['content']);
                        if(!empty($class) && !empty($method)){
                            $class::$method();
                        }
                    }elseif (strpos($crontab['content'], '@')){
                        //非静态方法
                        @list($class,$method) = explode('@',$crontab['content']);
                        if(!empty($class) && !empty($method)){
                            if(strpos($class, 'controller')) {
                                app()->request->setAction($method);
                                (new $class(app()))->$method();
                            }else{
                                (new $class())->$method();
                            }
                        }
                    }
                } else {
                    if ($crontab['type'] == 'sql') {
                        //这里需要强制重连数据库,使用已有的连接会报2014错误
                        /** @var Query $connect */
                        $connect = Db::connect('mysql', true);
                        $connect->execute("select 1");
                        // 执行SQL
                        $connect->execute($crontab['content']);
                        //$connect->getPdo()->exec($crontab['content']);
                    } else {
                        if ($crontab['type'] == 'shell') {
                            // 执行Shell
                            exec($crontab['content'].' >> '.$logDir.date("Y-m-d").'.log 2>&1 &');
                        }
                    }
                }
            } catch (Exception $e) {
                Log::record($e->getMessage());
            }
        }
        return 'Execute completed!';
    }
}
