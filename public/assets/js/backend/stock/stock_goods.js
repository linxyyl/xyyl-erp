define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'stock.stock_goods/index' + location.search,
                    add_url: 'stock.stock_goods/add',
                    edit_url: 'stock.stock_goods/edit',
                    del_url: 'stock.stock_goods/del',
                    multi_url: 'stock.stock_goods/multi',
                    table: 'stock_goods',
                }
            });

            var table = $("#table");

            // 初始化表格
            table.bootstrapTable({
                url: $.fn.bootstrapTable.defaults.extend.index_url,
                pk: 'id',
                sortName: 'id',
                search: false,
                showColumns: false,//表格显示参数
                showExport: false,//表格导出
                commonSearch: true, //表格搜索按钮
                showToggle: false,
                searchFormVisible: true,// 默认打开

                columns: [
                    [
                        {
                            field: 'stock_id', title: __('Stock_id'),
                            searchList:Config.stockList,
                            addclass:'selectpicker',
                            data:'data-live-search="true"',
                            formatter: function (index, row) {
                                return Config.stockList[row.stock_id];
                            }
                        },
                        {field: 'goods_id', title: __('Goods_id'),
                            searchList:Config.goodsList,
                            addclass:'selectpicker',
                            data:'data-live-search="true"',
                            formatter:function (index,row){
                                return Config.goodsList[row.goods_id];
                            }
                        },

                        {field: 'number', operate: false, title: __('Number')},
                        {
                            field: 'createtime',
                            title: __('Createtime'),
                            operate: 'RANGE',
                            addclass: 'datetimerange',
                            formatter: Table.api.formatter.datetime
                        },
                        //{field: 'remark', operate:false,title: __('Remark')},
                        //{field: 'operate', title: __('Operate'), table: table, events: Table.api.events.operate, formatter: Table.api.formatter.operate}
                    ]
                ],
                pageSize:10,
                pageList: [10,50],

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