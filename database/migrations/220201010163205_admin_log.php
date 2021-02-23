<?php

use think\migration\Migrator;
use think\migration\db\Column;
use Phinx\Db\Adapter\MysqlAdapter;

class AdminLog extends Migrator
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
        $table = $this->table('admin_log', ['engine' => 'InnoDB', 'collation' => 'utf8_general_ci', 'comment' => '管理员日志表' ,'id' => 'id','signed' => true ,'primary_key' => ['id']]);
        $table->addColumn('admin_id', 'integer', ['limit' => MysqlAdapter::INT_REGULAR,'null' => false,'default' => 0,'signed' => false,'comment' => '管理员ID',])
			->addColumn('username', 'string', ['limit' => 30,'null' => false,'default' => '','signed' => true,'comment' => '管理员名字',])
			->addColumn('url', 'string', ['limit' => 1500,'null' => false,'default' => '','signed' => true,'comment' => '操作页面',])
			->addColumn('title', 'string', ['limit' => 100,'null' => false,'default' => '','signed' => true,'comment' => '日志标题',])
			->addColumn('content', 'text', ['limit' => MysqlAdapter::TEXT_REGULAR,'null' => false,'signed' => true,'comment' => '内容',])
			->addColumn('ip', 'string', ['limit' => 50,'null' => false,'default' => '','signed' => true,'comment' => 'IP',])
			->addColumn('useragent', 'string', ['limit' => 255,'null' => false,'default' => '','signed' => true,'comment' => 'User-Agent',])
			->addColumn('createtime', 'integer', ['limit' => MysqlAdapter::INT_REGULAR,'null' => true,'signed' => true,'comment' => '操作时间',])
			->addIndex(['username'], ['name' => 'name'])
            ->create();
    }
}
