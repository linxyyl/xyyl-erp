<?php

use think\migration\Migrator;
use think\migration\db\Column;
use Phinx\Db\Adapter\MysqlAdapter;

class UserMoneyLog extends Migrator
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
        $table = $this->table('user_money_log', ['engine' => 'InnoDB', 'collation' => 'utf8_general_ci', 'comment' => '会员余额变动表' ,'id' => 'id','signed' => true ,'primary_key' => ['id']]);
        $table->addColumn('user_id', 'integer', ['limit' => MysqlAdapter::INT_REGULAR,'null' => false,'default' => 0,'signed' => false,'comment' => '会员ID',])
			->addColumn('money', 'decimal', ['precision' => 10,'scale' => 2,'null' => false,'default' => 0,'signed' => true,'comment' => '变更余额',])
			->addColumn('before', 'decimal', ['precision' => 10,'scale' => 2,'null' => false,'default' => 0,'signed' => true,'comment' => '变更前余额',])
			->addColumn('after', 'decimal', ['precision' => 10,'scale' => 2,'null' => false,'default' => 0,'signed' => true,'comment' => '变更后余额',])
			->addColumn('memo', 'string', ['limit' => 255,'null' => false,'default' => '','signed' => true,'comment' => '备注',])
			->addColumn('createtime', 'integer', ['limit' => MysqlAdapter::INT_REGULAR,'null' => true,'signed' => true,'comment' => '创建时间',])
            ->create();
    }
}
