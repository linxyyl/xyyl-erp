<?php

use think\migration\Migrator;
use think\migration\db\Column;
use Phinx\Db\Adapter\MysqlAdapter;

class Config extends Migrator
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
        $table = $this->table('config', ['engine' => 'InnoDB', 'collation' => 'utf8_general_ci', 'comment' => '系统配置' ,'id' => 'id','signed' => true ,'primary_key' => ['id']]);
        $table->addColumn('name', 'string', ['limit' => 30,'null' => false,'default' => '','signed' => true,'comment' => '变量名',])
			->addColumn('group', 'string', ['limit' => 30,'null' => false,'default' => '','signed' => true,'comment' => '分组',])
			->addColumn('title', 'string', ['limit' => 100,'null' => false,'default' => '','signed' => true,'comment' => '变量标题',])
			->addColumn('tip', 'string', ['limit' => 100,'null' => false,'default' => '','signed' => true,'comment' => '变量描述',])
			->addColumn('type', 'string', ['limit' => 30,'null' => false,'default' => '','signed' => true,'comment' => '类型:string,text,int,bool,array,datetime,date,file',])
			->addColumn('value', 'text', ['limit' => MysqlAdapter::TEXT_REGULAR,'null' => false,'signed' => true,'comment' => '变量值',])
			->addColumn('content', 'text', ['limit' => MysqlAdapter::TEXT_REGULAR,'null' => false,'signed' => true,'comment' => '变量字典数据',])
			->addColumn('rule', 'string', ['limit' => 100,'null' => false,'default' => '','signed' => true,'comment' => '验证规则',])
			->addColumn('extend', 'string', ['limit' => 255,'null' => false,'default' => '','signed' => true,'comment' => '扩展属性',])
			->addIndex(['name'], ['unique' => true,'name' => 'name'])
            ->create();
    }
}
