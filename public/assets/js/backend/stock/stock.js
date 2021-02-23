define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'stock.stock/index' + location.search,
                    add_url: 'stock.stock/add',
                    edit_url: 'stock.stock/edit',
                    del_url: 'stock.stock/del',
                    multi_url: 'stock.stock/multi',
                    stockInit: 'stock.stock/stockInit',
                    table: 'stock',
                }
            });

            var table = $("#table");
            // 初始化表格
            table.bootstrapTable({
                url: $.fn.bootstrapTable.defaults.extend.index_url,
                pk: 'id',
                sortName: 'weigh',
                search:true,
                showColumns: false ,//表格显示参数
                showExport:false ,//表格导出
                //commonSearch:false, //表格搜索按钮
                showToggle:false,
                columns: [
                    [
                        {field: 'title',operate:'LIKE',title: __('Title')},
                        {field: 'address', operate:'LIKE',title: __('Address')},
                        {field: 'createtime', title: __('Createtime'), operate:'RANGE', addclass:'datetimerange', formatter: Table.api.formatter.datetime},
                        {field: 'status', title: __('Status'), searchList: {"1":__('Status 1'),"2":__('Status 2'),"3":__('Status 3')}, formatter: Table.api.formatter.status},
                        {field: 'remark',operate:false, title: __('Remark')},
                        {field: 'operate', title: __('Operate'),

                            table: table,
                            buttons:[
                                {
                                    name: 'stockInit',
                                    text:'商品初始化',
                                    title:'选择仓库商品初始化,数量归零',
                                    /*btn-dialog 打开弹窗属性*/
                                    classname:'btn btn-xs btn-warning btn-dialog',
                                    // 设置遮罩层
                                    extend : 'data-shade = \'["0.3","#dfd"]\'',
                                    icon: 'fa fa-cart-arrow-down',
                                    url: function (row,button) {
                                        return '/admin/stock.stock/stockInit?stock_id='+row.id;
                                    }
                                }
                            ],
                            events: Table.api.events.operate,
                            formatter: Table.api.formatter.operate
                           /* formatter: function (value,row,index) {
                               var that = $.extend({},this);
                               var table = $(that.table).clone(true);
                               $(table).data('operate-stockInit',null);
                               that.table = table;
                               return Table.api.formatter.operate.call(that,value,row,index);
                           }*/
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
                url: 'stock.stock/recyclebin' + location.search,
                pk: 'id',
                sortName: 'id',
                columns: [
                    [
                        {checkbox: true},
                        {field: 'id', title: __('Id')},
                        {field: 'title', title: __('Title'), align: 'left'},
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
                                    url: 'stock.stock/restore',
                                    refresh: true
                                },
                                {
                                    name: 'Destroy',
                                    text: __('Destroy'),
                                    classname: 'btn btn-xs btn-danger btn-ajax btn-destroyit',
                                    icon: 'fa fa-times',
                                    url: 'stock.stock/destroy',
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
        stockinit: function (){
            Controller.api.bindevent();
        },
        api: {
            bindevent: function () {
                Form.api.bindevent($("form[role=form]"));
            }
        },

    };
    return Controller;
});