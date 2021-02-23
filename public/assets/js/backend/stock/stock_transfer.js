define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'stock.stock_transfer/index' + location.search,
                    add_url: 'stock.stock_transfer/add',
                    edit_url: 'stock.stock_transfer/edit',
                    del_url: 'stock.stock_transfer/del',
                    multi_url: 'stock.stock_transfer/multi',
                    table: 'stock_transfer',
                }
            });

            var table = $("#table");

            // 初始化表格
            table.bootstrapTable({
                url: $.fn.bootstrapTable.defaults.extend.index_url,
                pk: 'id',
                sortName: 'id',
                showColumns: false,//表格显示参数
                showExport: false,//表格导出
                //commonSearch:false, //表格搜索按钮
                showToggle: false,
                pagination: true,
                columns: [
                    [
                        {field: 'admin_name', title: __('Admin_id'),operate: false},
                        {field: 'code', title: __('Code'),operate: 'LIKE'},
                        {
                            field: 'out_stock_id', title: __('Out_stock_id'),
                            searchList:Config.stockList,
                            addclass:'selectpicker',
                            data:'data-live-search="true"',
                            formatter: function (index, row) {
                                console.log(row);
                                return Config.stockList[row.out_stock_id];
                            }
                        },
                        {
                            field: 'get_stock_id', title: __('Get_stock_id'),
                            searchList:Config.stockList,
                            addclass:'selectpicker',
                            data:'data-live-search="true"',
                            formatter: function (index, row) {
                                return Config.stockList[row.get_stock_id];
                            }
                        },
                        {
                            field: 'goods_id', title: __('Goods_id'),
                            searchList:Config.goodsList,
                            addclass:'selectpicker',
                            data:'data-live-search="true"',
                            formatter:function (index,row){
                                return Config.goodsList[row.goods_id];
                            }
                        },

                        {field: 'number', title: __('Number'),operate: false},
                        {field: 'status', title: __('Status'), searchList: {"1":__('Status 1'),"2":__('Status 2'),"3":__('Status 3'),"4":__('Status 4'),"5":__('Status 5'),"6":__('Status 6'),"7":__('Status 7')}, formatter: Table.api.formatter.status},
                        {field: 'createtime', title: __('Createtime'), operate:'RANGE', addclass:'datetimerange', formatter: Table.api.formatter.datetime},
                        {field: 'remark', title: __('Remark'),operate: false},
                        {
                            field: 'operate',
                            title: __('Operate'),
                            table: table,
                            // 自定义按钮
                            buttons:[

                                // 提交审核按钮
                                {
                                    name: 'submitVerify',
                                    text: '提交审核',
                                    classname: 'btn btn-xs btn-primary btn-ajax',
                                    icon: 'fa fa-upload',
                                    confirm: '确认提交审核?',
                                    visible: function (row) {
                                        if (row.status == 1 || row.status == 4) {
                                            return true;
                                        } else {
                                            return false
                                        }
                                    },
                                    url: function (row, button) {
                                        return '/admin/stock.StockTransfer/submitVerify?id=' + row.id;
                                    },
                                    // 请求成功回调
                                    success: function (row) {
                                        // 刷新表格
                                        table.bootstrapTable('refresh');
                                    }
                                },

                                // 审核通过按钮
                                {
                                    name: 'confirmVerify',
                                    text: '审核通过',
                                    classname: 'btn btn-xs btn-success btn-ajax',
                                    icon: 'fa fa-check-square-o',
                                    confirm: '确认审核通过?',
                                    visible: function (row) {
                                        if (row.status == 2) {
                                            return true;
                                        } else {
                                            return false
                                        }
                                    },
                                    url: function (row, button) {
                                        return '/admin/stock.StockTransfer/confirmVerify?id=' + row.id;
                                    },
                                    // 请求成功回调
                                    success: function (row) {
                                        // 刷新表格
                                        table.bootstrapTable('refresh');
                                    }
                                },

                                // 复审按钮
                                {
                                    name: 'againVerify',
                                    text: '复审通过',
                                    classname: 'btn btn-xs btn-info btn-ajax',
                                    icon: 'fa fa-check-circle',
                                    confirm: '确认复审通过?',
                                    visible: function (row) {
                                        if (row.status == 3) {
                                            return true;
                                        } else {
                                            return false
                                        }
                                    },
                                    url: function (row, button) {
                                        return '/admin/stock.StockTransfer/againVerify?id=' + row.id;
                                    }
                                    ,  // 请求成功回调
                                    success: function (row) {
                                        // 刷新表格
                                        table.bootstrapTable('refresh');
                                    }
                                },

                                // 确认入库按钮
                                {
                                    name: 'confirmPut',
                                    text: '确认入库',
                                    classname: 'btn btn-xs btn-warning btn-ajax',
                                    icon: 'fa fa-check-circle',
                                    confirm: '确认订单入库?',
                                    visible: function (row) {
                                        if (row.status == 5) {
                                            return true;
                                        } else {
                                            return false
                                        }
                                    },
                                    url: function (row, button) {
                                        return '/admin/stock.StockTransfer/confirmPut?id=' + row.id;
                                    }
                                    ,  // 请求成功回调
                                    success: function (row) {
                                        // 刷新表格
                                        table.bootstrapTable('refresh');
                                    }
                                },

                                // 取消入库按钮
                                {
                                    name: 'cancelPut',
                                    text: '取消入库',
                                    classname: 'btn btn-xs btn-danger btn-ajax',
                                    icon: 'fa fa-times-circle',
                                    confirm: '确认取消入库?',
                                    visible: function (row) {
                                        if (row.status == 5) {
                                            return true;
                                        } else {
                                            return false
                                        }
                                    },
                                    url: function (row, button) {
                                        return '/admin/stock.StockTransfer/cancelPut?id=' + row.id;
                                    }
                                    ,  // 请求成功回调
                                    success: function (row) {
                                        // 刷新表格
                                        table.bootstrapTable('refresh');
                                    }
                                },

                                // 审核驳回按钮
                                {
                                    name: 'rejectVerify',
                                    text: '审核驳回',
                                    classname: 'btn btn-xs btn-danger btn-ajax',
                                    icon: 'fa fa-times-circle',
                                    confirm: '确认驳回审核?',
                                    visible: function (row) {
                                        if (row.status == 2 || row.status == 3) {
                                            return true;
                                        } else {
                                            return false
                                        }
                                    },
                                    url: function (row, button) {
                                        return '/admin/stock.StockTransfer/rejectVerify?id=' + row.id;
                                    }
                                    ,  // 请求成功回调
                                    success: function (row) {
                                        // 刷新表格
                                        table.bootstrapTable('refresh');
                                    }
                                },

                            ],

                            events: Table.api.events.operate,
                            // 表格回调
                            formatter: function (value, row, index) {
                                var that = $.extend({}, this);
                                var table = $(that.table).clone(true);

                                // 草稿和审核未通过时显示编辑和删除按钮
                                if (row.status == 1 || row.status == 4) {
                                    $(table).data('operate-edit', true);
                                    $(table).data('operate-del', true);
                                } else {
                                    // 其余状态隐藏编辑和删除
                                    $(table).data('operate-edit', false);
                                    $(table).data('operate-del', false);
                                }

                                // 入库取消显示删除按钮
                                if(row.status==7){
                                    $(table).data('operate-del', true);
                                }

                                that.table = table;
                                return Table.api.formatter.operate.call(that, value, row, index);
                            },
                        }
                    ]
                ]
            });

            // 为表格绑定事件
            Table.api.bindevent(table);
        },
        recyclebin: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    'dragsort_url': ''
                }
            });

            var table = $("#table");

            // 初始化表格
            table.bootstrapTable({
                url: 'stock.stock_transfer/recyclebin' + location.search,
                pk: 'id',
                sortName: 'id',
                columns: [
                    [
                        {checkbox: true},
                        {field: 'id', title: __('Id')},
                        {
                            field: 'deletetime',
                            title: __('Deletetime'),
                            operate: 'RANGE',
                            addclass: 'datetimerange',
                            formatter: Table.api.formatter.datetime
                        },
                        {
                            field: 'operate',
                            width: '130px',
                            title: __('Operate'),
                            table: table,
                            events: Table.api.events.operate,
                            buttons: [
                                {
                                    name: 'Restore',
                                    text: __('Restore'),
                                    classname: 'btn btn-xs btn-info btn-ajax btn-restoreit',
                                    icon: 'fa fa-rotate-left',
                                    url: 'stock.stock_transfer/restore',
                                    refresh: true
                                },
                                {
                                    name: 'Destroy',
                                    text: __('Destroy'),
                                    classname: 'btn btn-xs btn-danger btn-ajax btn-destroyit',
                                    icon: 'fa fa-times',
                                    url: 'stock.stock_transfer/destroy',
                                    refresh: true
                                }
                            ],
                            formatter: Table.api.formatter.operate
                        }
                    ]
                ]
            });

            // 为表格绑定事件
            Table.api.bindevent(table);
        },
        add: function () {
            Controller.api.bindevent();
        },
        edit: function () {
            Controller.api.bindevent();
        },
        api: {
            bindevent: function () {
                Form.api.bindevent($("form[role=form]"));
            }
        }
    };
    return Controller;
});