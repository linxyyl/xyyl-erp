<?php

use think\migration\Migrator;
use think\migration\db\Column;
use Phinx\Db\Adapter\MysqlAdapter;

class Attachment extends Migrator
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
        $table = $this->table('attachment', ['engine' => 'InnoDB', 'collation' => 'utf8_general_ci', 'comment' => '附件表' ,'id' => 'id','signed' => true ,'primary_key' => ['id']]);
        $table->addColumn('admin_id', 'integer', ['limit' => MysqlAdapter::INT_REGULAR,'null' => false,'default' => 0,'signed' => false,'comment' => '管理员ID',])
			->addColumn('user_id', 'integer', ['limit' => MysqlAdapter::INT_REGULAR,'null' => false,'default' => 0,'signed' => false,'comment' => '会员ID',])
			->addColumn('url', 'string', ['limit' => 255,'null' => false,'default' => '','signed' => true,'comment' => '物理路径',])
			->addColumn('imagewidth', 'string', ['limit' => 30,'null' => false,'default' => '','signed' => true,'comment' => '宽度',])
			->addColumn('imageheight', 'string', ['limit' => 30,'null' => false,'default' => '','signed' => true,'comment' => '高度',])
			->addColumn('imagetype', 'string', ['limit' => 30,'null' => false,'default' => '','signed' => true,'comment' => '图片类型',])
			->addColumn('imageframes', 'integer', ['limit' => MysqlAdapter::INT_REGULAR,'null' => false,'default' => 0,'signed' => false,'comment' => '图片帧数',])
			->addColumn('filesize', 'integer', ['limit' => MysqlAdapter::INT_REGULAR,'null' => false,'default' => 0,'signed' => false,'comment' => '文件大小',])
			->addColumn('mimetype', 'string', ['limit' => 100,'null' => false,'default' => '','signed' => true,'comment' => 'mime类型',])
			->addColumn('extparam', 'string', ['limit' => 255,'null' => false,'default' => '','signed' => true,'comment' => '透传数据',])
			->addColumn('createtime', 'integer', ['limit' => MysqlAdapter::INT_REGULAR,'null' => true,'signed' => true,'comment' => '创建日期',])
			->addColumn('updatetime', 'integer', ['limit' => MysqlAdapter::INT_REGULAR,'null' => true,'signed' => true,'comment' => '更新时间',])
			->addColumn('uploadtime', 'integer', ['limit' => MysqlAdapter::INT_REGULAR,'null' => true,'signed' => true,'comment' => '上传时间',])
			->addColumn('storage', 'string', ['limit' => 100,'null' => false,'default' => 'local','signed' => true,'comment' => '存储位置',])
			->addColumn('sha1', 'string', ['limit' => 40,'null' => false,'default' => '','signed' => true,'comment' => '文件 sha1编码',])
            ->create();
    }
}
