<?php

use think\migration\Migrator;
use think\migration\db\Column;
use Phinx\Db\Adapter\MysqlAdapter;

class UserRule extends Migrator
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
        $table = $this->table('user_rule', ['engine' => 'InnoDB', 'collation' => 'utf8_general_ci', 'comment' => '会员规则表' ,'id' => 'id','signed' => true ,'primary_key' => ['id']]);
        $table->addColumn('pid', 'integer', ['limit' => MysqlAdapter::INT_REGULAR,'null' => true,'signed' => true,'comment' => '父ID',])
			->addColumn('name', 'string', ['limit' => 50,'null' => true,'signed' => true,'comment' => '名称',])
			->addColumn('title', 'string', ['limit' => 50,'null' => true,'signed' => true,'comment' => '标题',])
			->addColumn('remark', 'string', ['limit' => 100,'null' => true,'signed' => true,'comment' => '备注',])
			->addColumn('ismenu', 'boolean', ['null' => true,'signed' => true,'comment' => '是否菜单',])
			->addColumn('createtime', 'integer', ['limit' => MysqlAdapter::INT_REGULAR,'null' => true,'signed' => true,'comment' => '创建时间',])
			->addColumn('updatetime', 'integer', ['limit' => MysqlAdapter::INT_REGULAR,'null' => true,'signed' => true,'comment' => '更新时间',])
			->addColumn('weigh', 'integer', ['limit' => MysqlAdapter::INT_REGULAR,'null' => true,'signed' => true,'comment' => '权重',])
			->addColumn('status', 'enum', ['values' => ['normal','hidden']])
            ->create();
    }
}
