define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'pss.purchase/index' + location.search,
                    add_url: 'pss.purchase/add',
                    edit_url: 'pss.purchase/edit',
                    del_url: 'pss.purchase/del',
                    multi_url: 'pss.purchase/multi',
                    table: 'purchase',
                }
            });

            var table = $("#table");

            // 初始化表格
            table.bootstrapTable({
                url: $.fn.bootstrapTable.defaults.extend.index_url,
                pk: 'id',
                sortName: 'id',
                search: true,
                showColumns: false,//表格显示参数
                showExport: false,//表格导出
                //commonSearch:false, //表格搜索按钮
                showToggle: false,
                columns: [
                    [
                        {field: 'admin_name', title: __('Admin_id')},


                        {
                            field: 'supplier_id',
                            title: __('Supplier_id'),
                            searchList: Config.supplierList,
                            addclass: 'selectpicker',
                            data: 'data-live-search="true"',
                            formatter: function (index, row) {
                                return Config.supplierList[row.supplier_id];
                            }

                        },

                        {
                            field: 'stock_id',
                            title: __('Stock_id'),
                            searchList: Config.stockList,
                            addclass: 'selectpicker',
                            data: 'data-live-search="true"',
                            formatter: function (index, row) {
                                return Config.stockList[row.stock_id];
                            }
                        },

                        {
                            field: 'goods_id',
                            title: __('Goods_id'),
                            searchList:Config.goodsList,
                            addclass:'selectpicker',
                            data:'data-live-search="true"',
                            formatter: function (index, row) {
                                return Config.goodsList[row.goods_id];
                            }
                        },

                        {field: 'code', title: __('Code'),operate: 'LIKE'},
                        {field: 'goods_number', title: __('Goods_number')},
                        {field: 'goods_price', title: __('Goods_price'), operate: 'BETWEEN'},
                        {field: 'other_price', title: __('Other_price'), operate: 'BETWEEN'},
                        {field: 'transport_price', title: __('Transport_price'), operate: 'BETWEEN'},
                        {field: 'amount_price', title: __('Amount_price'), operate: 'BETWEEN'},
                        {field: 'status', title: __('Status'), searchList: {"1": __('Status 1'), "2": __('Status 2'), "3": __('Status 3'), "4": __('Status 4'), "5": __('Status 5'), "6": __('Status 6'), "7": __('Status 7'), "8": __('Status 8'), "9": __('Status 9')}, formatter: Table.api.formatter.status},

                        {
                            field: 'createtime',
                            title: __('Createtime'),
                            operate: 'RANGE',
                            addclass: 'datetimerange',
                            formatter: Table.api.formatter.datetime
                        },

                        {field: 'remark', title: __('Remark')},
                        
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
                                        return '/admin/pss.Purchase/submitVerify?id=' + row.id;
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
                                        return '/admin/pss.Purchase/confirmVerify?id=' + row.id;
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
                                        return '/admin/pss.Purchase/againVerify?id=' + row.id;
                                    }
                                    ,  // 请求成功回调
                                    success: function (row) {
                                        // 刷新表格
                                        table.bootstrapTable('refresh');
                                    }
                                },

                                // 确认支付
                                {
                                    name: 'confirmPay',
                                    text: '确认支付',
                                    classname: 'btn btn-xs btn-warning btn-ajax',
                                    icon: 'fa fa-check-circle',
                                    confirm: '确认订单支付?',
                                    visible: function (row) {
                                        if (row.status == 5 || row.status == 7) {
                                            return true;
                                        } else {
                                            return false
                                        }
                                    },
                                    url: function (row, button) {
                                        return '/admin/pss.Purchase/confirmPay?id=' + row.id;
                                    }
                                    ,  // 请求成功回调
                                    success: function (row) {
                                        // 刷新表格
                                        table.bootstrapTable('refresh');
                                    }
                                },

                                // 取消支付
                                {
                                    name: 'cancelPay',
                                    text: '取消支付',
                                    classname: 'btn btn-xs btn-danger btn-ajax',
                                    icon: 'fa fa-times-circle',
                                    confirm: '确认取消支付',
                                    visible: function (row) {
                                        if (row.status == 5) {
                                            return true;
                                        } else {
                                            return false
                                        }
                                    },
                                    url: function (row, button) {
                                        return '/admin/pss.Purchase/cancelPay?id=' + row.id;
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
                                        return '/admin/pss.Purchase/rejectVerify?id=' + row.id;
                                    }
                                    ,  // 请求成功回调
                                    success: function (row) {
                                        // 刷新表格
                                        table.bootstrapTable('refresh');
                                    }
                                },

                                // 确认出库按钮
                                {
                                    name: 'confirmPut',
                                    text: '确认入库',
                                    classname: 'btn btn-xs btn-warning btn-ajax',
                                    icon: 'fa fa-check-circle',
                                    confirm: '确认订单入库?',
                                    visible: function (row) {
                                        if (row.status == 6) {
                                            return true;
                                        } else {
                                            return false
                                        }
                                    },
                                    url: function (row, button) {
                                        return '/admin/pss.Purchase/confirmPut?id=' + row.id;
                                    }
                                    ,  // 请求成功回调
                                    success: function (row) {
                                        // 刷新表格
                                        table.bootstrapTable('refresh');
                                    }
                                },

                                // 取消出库按钮
                                {
                                    name: 'cancelPut',
                                    text: '取消入库',
                                    classname: 'btn btn-xs btn-danger btn-ajax',
                                    icon: 'fa fa-times-circle',
                                    confirm: '确认取消入库?',
                                    visible: function (row) {
                                        if (row.status == 6) {
                                            return true;
                                        } else {
                                            return false
                                        }
                                    },
                                    url: function (row, button) {
                                        return '/admin/pss.Purchase/cancelPut?id=' + row.id;
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

                                // 取消支付显示显示删除
                                if(row.status==9){
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
                url: 'pss.purchase/recyclebin' + location.search,
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
                                    url: 'pss.purchase/restore',
                                    refresh: true
                                },
                                {
                                    name: 'Destroy',
                                    text: __('Destroy'),
                                    classname: 'btn btn-xs btn-danger btn-ajax btn-destroyit',
                                    icon: 'fa fa-times',
                                    url: 'pss.purchase/destroy',
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