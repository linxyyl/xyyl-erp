<?php

use Phinx\Db\Adapter\MysqlAdapter;
use think\migration\Migrator;

class Admin extends Migrator
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
        $table = $this->table('admin', ['engine' => 'InnoDB', 'collation' => 'utf8_general_ci', 'comment' => '管理员表', 'id' => 'id', 'signed' => true, 'primary_key' => ['id']]);
        $table->addColumn('username', 'string', ['limit' => 20, 'null' => false, 'default' => '', 'signed' => true, 'comment' => '用户名',])
            ->addColumn('nickname', 'string', ['limit' => 50, 'null' => false, 'default' => '', 'signed' => true, 'comment' => '昵称',])
            ->addColumn('password', 'string', ['limit' => 32, 'null' => false, 'default' => '', 'signed' => true, 'comment' => '密码',])
            ->addColumn('salt', 'string', ['limit' => 30, 'null' => false, 'default' => '', 'signed' => true, 'comment' => '密码盐',])
            ->addColumn('avatar', 'string', ['limit' => 255, 'null' => false, 'default' => '', 'signed' => true, 'comment' => '头像',])
            ->addColumn('email', 'string', ['limit' => 100, 'null' => false, 'default' => '', 'signed' => true, 'comment' => '电子邮箱',])
            ->addColumn('loginfailure', 'boolean', ['null' => false, 'default' => 0, 'signed' => false, 'comment' => '失败次数',])
            ->addColumn('logintime', 'integer', ['limit' => MysqlAdapter::INT_REGULAR, 'null' => true, 'signed' => true, 'comment' => '登录时间',])
            ->addColumn('loginip', 'string', ['limit' => 50, 'null' => true, 'signed' => true, 'comment' => '登录IP',])
            ->addColumn('createtime', 'integer', ['limit' => MysqlAdapter::INT_REGULAR, 'null' => true, 'signed' => true, 'comment' => '创建时间',])
            ->addColumn('updatetime', 'integer', ['limit' => MysqlAdapter::INT_REGULAR, 'null' => true, 'signed' => true, 'comment' => '更新时间',])
            ->addColumn('token', 'string', ['limit' => 59, 'null' => false, 'default' => '', 'signed' => true, 'comment' => 'Session标识',])
            ->addColumn('status', 'string', ['limit' => 30, 'null' => false, 'default' => 'normal', 'signed' => true, 'comment' => '状态',])
            ->addIndex(['username'], ['unique' => true, 'name' => 'username'])
            ->create();

 /*       $singleRow = [
            [
                "id" => 1,
                "username" => "root",
                "nickname" => "开发者",
                "password" => "df54dbe0a07a5499bdc2f27fc7566d12",
                "salt" => "d4e439",
                "avatar" => "/assets/img/title.png",
                "email" => "linxyyl@163.com",
                "loginfailure" => 0,
                "logintime" => 1603163519,
                "loginip" => "127.0.0.1",
                "createtime" => 1492186163,
                "updatetime" => 1603163519,
                "token" => "56c2bc87-1fd0-4c2e-9011-b48069cb5a87",
                "status" => "normal",
            ],
            [
                "id" => 2,
                "username" => "admin",
                "nickname" => "admin",
                "password" => "21ac50fa870647692df49f542301097a",
                "salt" => "m0anVN",
                "avatar" => "/assets/img/admin.jpg",
                "email" => "admin@admin.com",
                "loginfailure" => 0,
                "logintime" => 1602231751,
                "loginip" => "127.0.0.1",
                "createtime" => 1600613795,
                "updatetime" => 1602231751,
                "token" => "751b71df-5f88-4456-805f-ec20e8b15079",
                "status" => "normal",
            ],
        ];

        $table = $this->table('admin');
        $table->insert($singleRow);
        $table->saveData();*/

    }
}
