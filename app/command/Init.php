<?php
declare (strict_types=1);

namespace app\command;

use think\console\Command;
use think\console\Input;
use think\console\Output;
use think\facade\Console;

class Init extends Command
{
    protected function configure()
    {
        // 指令配置
        $this->setName('init')->setDescription('the init command');
    }

    protected function execute(Input $input, Output $output)
    {
        $output->info("正在初始化框架,请确保数据库无其他数据 如果要继续请输入 [yes] 并按下回车键");
        $line = fgets(defined('STDIN') ? STDIN : fopen('php://stdin', 'r'));
        if (trim($line) != 'yes') {
            exit('操作已经取消');
        }
        $output->info('迁移数据表信息开始');
        Console::call('migrate:run');
        $output->info('数据表信息迁移结束');
        $output->info('初始数据写入');

        $file_arr = scandir(root_path() . '/database/initial');
        unset($file_arr[0]);
        unset($file_arr[1]);

        $num = count($file_arr);
        $dog = 0;
        // 引入初始化数据
        foreach ($file_arr as $file){
            require root_path() . '/database/initial/'.$file;
            $dog += 1;
            echo "\r";
            echo "进度 : {$dog} / {$num}";
        }
        echo  "\n";

        $output->writeln('框架初始化成功!');
    }
}
