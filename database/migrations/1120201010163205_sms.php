<?php

use think\migration\Migrator;
use think\migration\db\Column;
use Phinx\Db\Adapter\MysqlAdapter;

class Sms extends Migrator
{
    /**
     * Change Method.
     *
     * Write your reversible migrations using this method.
     *
     * More information on writing migrations is available here:
     * http://docs.phinx.org/en/latest/migrations.html#the-abstractmigration-class
     *
     * The following commands can be used in this method and Phinx will
     * automatically reverse them when rolling back:
     *
     *    createTable
     *    renameTable
     *    addColumn
     *    renameColumn
     *    addIndex
     *    addForeignKey
     *
     * Remember to call "create()" or "update()" and NOT "save()" when working
     * with the Table class.
     */
    public function change()
    {
        $table = $this->table('sms', ['engine' => 'InnoDB', 'collation' => 'utf8_general_ci', 'comment' => '短信验证码表' ,'id' => 'id','signed' => true ,'primary_key' => ['id']]);
        $table->addColumn('event', 'string', ['limit' => 30,'null' => false,'default' => '','signed' => true,'comment' => '事件',])
			->addColumn('mobile', 'string', ['limit' => 20,'null' => false,'default' => '','signed' => true,'comment' => '手机号',])
			->addColumn('code', 'string', ['limit' => 10,'null' => false,'default' => '','signed' => true,'comment' => '验证码',])
			->addColumn('times', 'integer', ['limit' => MysqlAdapter::INT_REGULAR,'null' => false,'default' => 0,'signed' => false,'comment' => '验证次数',])
			->addColumn('ip', 'string', ['limit' => 30,'null' => false,'default' => '','signed' => true,'comment' => 'IP',])
			->addColumn('createtime', 'integer', ['limit' => MysqlAdapter::INT_REGULAR,'null' => true,'signed' => false,'comment' => '创建时间',])
            ->create();
    }
}
