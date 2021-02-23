<?php

use think\migration\Migrator;
use think\migration\db\Column;
use Phinx\Db\Adapter\MysqlAdapter;

class User extends Migrator
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
        $table = $this->table('user', ['engine' => 'InnoDB', 'collation' => 'utf8_general_ci', 'comment' => '会员表' ,'id' => 'id','signed' => true ,'primary_key' => ['id']]);
        $table->addColumn('group_id', 'integer', ['limit' => MysqlAdapter::INT_REGULAR,'null' => false,'default' => 0,'signed' => false,'comment' => '组别ID',])
			->addColumn('username', 'string', ['limit' => 32,'null' => false,'default' => '','signed' => true,'comment' => '用户名',])
			->addColumn('nickname', 'string', ['limit' => 50,'null' => false,'default' => '','signed' => true,'comment' => '昵称',])
			->addColumn('password', 'string', ['limit' => 32,'null' => false,'default' => '','signed' => true,'comment' => '密码',])
			->addColumn('salt', 'string', ['limit' => 30,'null' => false,'default' => '','signed' => true,'comment' => '密码盐',])
			->addColumn('email', 'string', ['limit' => 100,'null' => false,'default' => '','signed' => true,'comment' => '电子邮箱',])
			->addColumn('mobile', 'string', ['limit' => 11,'null' => false,'default' => '','signed' => true,'comment' => '手机号',])
			->addColumn('avatar', 'string', ['limit' => 255,'null' => false,'default' => '','signed' => true,'comment' => '头像',])
			->addColumn('level', 'boolean', ['null' => false,'default' => 0,'signed' => false,'comment' => '等级',])
			->addColumn('gender', 'boolean', ['null' => false,'default' => 0,'signed' => false,'comment' => '性别',])
			->addColumn('birthday', 'date', ['null' => true,'signed' => true,'comment' => '生日',])
			->addColumn('bio', 'string', ['limit' => 100,'null' => false,'default' => '','signed' => true,'comment' => '格言',])
			->addColumn('money', 'decimal', ['precision' => 10,'scale' => 2,'null' => false,'default' => 0,'signed' => false,'comment' => '余额',])
			->addColumn('score', 'integer', ['limit' => MysqlAdapter::INT_REGULAR,'null' => false,'default' => 0,'signed' => false,'comment' => '积分',])
			->addColumn('successions', 'integer', ['limit' => MysqlAdapter::INT_REGULAR,'null' => false,'default' => 1,'signed' => false,'comment' => '连续登录天数',])
			->addColumn('maxsuccessions', 'integer', ['limit' => MysqlAdapter::INT_REGULAR,'null' => false,'default' => 1,'signed' => false,'comment' => '最大连续登录天数',])
			->addColumn('prevtime', 'integer', ['limit' => MysqlAdapter::INT_REGULAR,'null' => false,'default' => null,'signed' => true,'comment' => '上次登录时间',])
			->addColumn('logintime', 'integer', ['limit' => MysqlAdapter::INT_REGULAR,'null' => false,'default' => 0,'signed' => true,'comment' => '登录时间',])
			->addColumn('loginip', 'string', ['limit' => 50,'null' => false,'default' => '','signed' => true,'comment' => '登录IP',])
			->addColumn('loginfailure', 'boolean', ['null' => false,'default' => 0,'signed' => false,'comment' => '失败次数',])
			->addColumn('joinip', 'string', ['limit' => 50,'null' => false,'default' => '','signed' => true,'comment' => '加入IP',])
			->addColumn('jointime', 'integer', ['limit' => MysqlAdapter::INT_REGULAR,'null' => false,'default' => null,'signed' => true,'comment' => '加入时间',])
			->addColumn('createtime', 'integer', ['limit' => MysqlAdapter::INT_REGULAR,'null' => false,'default' => null,'signed' => true,'comment' => '创建时间',])
			->addColumn('updatetime', 'integer', ['limit' => MysqlAdapter::INT_REGULAR,'null' => false,'default' => null,'signed' => true,'comment' => '更新时间',])
			->addColumn('token', 'string', ['limit' => 50,'null' => false,'default' => '','signed' => true,'comment' => 'Token',])
			->addColumn('status', 'string', ['limit' => 30,'null' => false,'default' => '','signed' => true,'comment' => '状态',])
			->addColumn('verification', 'string', ['limit' => 255,'null' => false,'default' => '','signed' => true,'comment' => '验证',])
			->addIndex(['email'], ['name' => 'email'])
			->addIndex(['username'], ['name' => 'username'])
			->addIndex(['mobile'], ['name' => 'mobile'])
            ->create();
    }
}
