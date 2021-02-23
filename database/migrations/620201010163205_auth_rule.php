<?php

use think\migration\Migrator;
use think\migration\db\Column;
use Phinx\Db\Adapter\MysqlAdapter;

class AuthRule extends Migrator
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
        $table = $this->table('auth_rule', ['engine' => 'InnoDB', 'collation' => 'utf8_general_ci', 'comment' => '节点表' ,'id' => 'id','signed' => true ,'primary_key' => ['id']]);
        $table->addColumn('type', 'enum', ['values' => ['menu','file']])
			->addColumn('pid', 'integer', ['limit' => MysqlAdapter::INT_REGULAR,'null' => false,'default' => 0,'signed' => false,'comment' => '父ID',])
			->addColumn('name', 'string', ['limit' => 100,'null' => false,'default' => '','signed' => true,'comment' => '规则名称',])
			->addColumn('route', 'string', ['limit' => 255,'null' => true,'signed' => true,'comment' => '路由规则',])
			->addColumn('title', 'string', ['limit' => 50,'null' => false,'default' => '','signed' => true,'comment' => '规则名称',])
			->addColumn('icon', 'string', ['limit' => 50,'null' => false,'default' => '','signed' => true,'comment' => '图标',])
			->addColumn('condition', 'string', ['limit' => 255,'null' => false,'default' => '','signed' => true,'comment' => '条件',])
			->addColumn('remark', 'string', ['limit' => 255,'null' => false,'default' => '','signed' => true,'comment' => '备注',])
			->addColumn('ismenu', 'boolean', ['null' => false,'default' => 0,'signed' => false,'comment' => '是否为菜单',])
			->addColumn('createtime', 'integer', ['limit' => MysqlAdapter::INT_REGULAR,'null' => true,'signed' => true,'comment' => '创建时间',])
			->addColumn('updatetime', 'integer', ['limit' => MysqlAdapter::INT_REGULAR,'null' => true,'signed' => true,'comment' => '更新时间',])
			->addColumn('weigh', 'integer', ['limit' => MysqlAdapter::INT_REGULAR,'null' => false,'default' => 0,'signed' => true,'comment' => '权重',])
			->addColumn('status', 'string', ['limit' => 30,'null' => false,'default' => '','signed' => true,'comment' => '状态',])
			->addIndex(['pid'], ['name' => 'pid'])
			->addIndex(['name'], ['unique' => true,'name' => 'name'])
			->addIndex(['weigh'], ['name' => 'weigh'])
            ->create();
    }
}
