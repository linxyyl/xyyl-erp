define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'goods.goods/index' + location.search,
                    add_url: 'goods.goods/add',
                    edit_url: 'goods.goods/edit',
                    del_url: 'goods.goods/del',
                    multi_url: 'goods.goods/multi',
                    table: 'goods',
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
                        {field: 'place_id', title: __('Place_id'),visible:false,searchList:Config.GoodsPlaceList},

                        {field: 'brand_id', title: __('Brand_id'),visible:false,searchList:Config.GoodsBrandList},

                        {field:'title',operate:'LIKE',title: __('Title'),formatter: function (value, row, index){
                            return Config.GoodsPlaceList[row.place_id]
                                + '/' +
                                Config.GoodsBrandList[row.brand_id]
                                +'/' +
                                value;
                            }},

                        {field: 'type_id', title: __('Type_id'),searchList:Config.GoodsTypeList,formatter:function (value, row){
                                return Config.GoodsTypeList[row.type_id];
                            }},

                        {field: 'unit_id', title: __('Unit_id'),searchList:Config.GoodsUnitList,formatter:function (value,row){
                                return Config.GoodsUnitList[row.unit_id];
                            }},

                        {field: 'quantity', title: __('Quantity')},
                        {field: 'price', title: __('Price')},
                        {field: 'num',operate:'LIKE', title: __('Num')},
                        {field: 'image', operate:false, title: __('Image'), events: Table.api.events.image, formatter: Table.api.formatter.image},
                        {field: 'describe', operate:false, title: __('Describe')},
                        {field: 'status',title: __('Status'), searchList: {"1":__('Status 1'),"2":__('Status 2'),"3":__('Status 3')}, formatter: Table.api.formatter.status},
                        {field: 'remark', operate:false, title: __('Remark')},
                        {field: 'createtime', title: __('Createtime'), operate:false, addclass:'datetimerange', formatter: Table.api.formatter.datetime},
                        {field: 'operate', title: __('Operate'), table: table, events: Table.api.events.operate, formatter: Table.api.formatter.operate}
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
                url: 'goods.goods/recyclebin' + location.search,
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
                                    url: 'goods.goods/restore',
                                    refresh: true
                                },
                                {
                                    name: 'Destroy',
                                    text: __('Destroy'),
                                    classname: 'btn btn-xs btn-danger btn-ajax btn-destroyit',
                                    icon: 'fa fa-times',
                                    url: 'goods.goods/destroy',
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