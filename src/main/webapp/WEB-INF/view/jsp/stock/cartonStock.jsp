<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <!-- 避免IE使用兼容模式 -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
    <meta name="renderer" content="webkit">
    <!-- 导入列表页面公共样式 -->
    <%@ include file="../ap.jsp" %>
    <title>纸箱库存</title>
</head>
<body>
<table id="productDg"></table>

<!-- 表格工具栏开始 -->
<div id="productDg-toolbar" class="topjui-toolbar"
     data-options="grid:{
           type:'datagrid',
           id:'productDg'
       }">
    <div id="cc" class="topjui-iDialog" closed="true"></div>
    <!-- <a id="add" href="javascript:void(0)">新增</a> -->
    <a id="edit" href="javascript:void(0)">编辑</a>
    <a id="delete" href="javascript:void(0)">删除</a>
    <!-- <a id="see" href="javascript:void(0)">查看</a> -->
    <a id="filter" href="javascript:void(0)">过滤</a>
    <a id="search" href="javascript:void(0)">查询</a>
    <a id="import" href="javascript:void(0)">导入</a>
    <!--<a id="export" href="javascript:void(0)">导出</a>
    <a id="openTab" href="javascript:void(0)">打开Tab窗口</a>
    <a id="openWindow" href="javascript:void(0)">打开新窗口</a>
    <a id="request" href="javascript:void(0)">执行普通请求</a>
    <a id="myFun" href="javascript:void(0)">执行自定义方法</a> -->
    <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="menu:'#exportSubMenu',
       btnCls:'topjui-btn-danger',
       hasDownArrow:true,
       iconCls:'fa fa-list'">更多</a>
    <div id="exportSubMenu" class="topjui-toolbar"
         data-options="grid:{
           type:'datagrid',
           id:'productDg'
       }" style="width:150px;">
        <!-- <div data-toggle="topjui-menubutton"
             data-options="method:'request',
             url:_ctx + '/json/response/success.json?uuid={uuid}'">导出 PDF 报表
        </div> -->
        <div data-toggle="topjui-menubutton"
             data-options="method:'export',
             url: _ctx + '/json/response/export.html'">导出EXCEL列表
        </div>
        <div data-toggle="topjui-menubutton"
             data-options="method:'request',
             url:_ctx + '/json/response/success.json?uuid={uuid}'">导出EXCEL报表
        </div>
        <div data-toggle="topjui-menubutton"
             data-options="method:'request',
             url:_ctx + '/json/response/success.json?uuid={uuid}'">导出WORD报表
        </div>
    </div>
    <form id="queryForm" class="search-box">
        <input type="text" name="name" data-toggle="topjui-textbox"
               data-options="id:'name',prompt:'产品名称'">
        <!-- <input type="text" name="code" data-toggle="topjui-textbox"
               data-options="id:'code',prompt:'产品型号'"> -->
        <a id="queryBtn" href="javascript:void(0)">查询</a>
    </form>
</div>
<!-- 表格工具栏结束 -->
<div style="display: none;"> 
	<div id="tt">
			<a href="#" class="l-btn topjui-btn-normal l-btn-small" style="position: static; display: inline-block; left: auto; height: 34px;"><span class="l-btn-left l-btn-icon-left" style="margin-top: 5px;"><span class="l-btn-text">确定</span><span class="l-btn-icon fa fa-plus">&nbsp;</span></span></a>
			<a href="#" class="closeDialog l-btn topjui-btn-danger l-btn-small" onclick="javascript:$('#cc').dialog('close')" id="301410" style="position: static; display: inline-block; left: auto; height: 34px;"><span class="l-btn-left l-btn-icon-left" style="margin-top: 5px;"><span class="l-btn-text">关闭</span><span class="l-btn-icon fa fa-close">&nbsp;</span></span></a>
	</div>
</div>
<script>
	function outgoing_plan(){
    	$("#cc").iDialog({
            title: '生成出库计划',
            width: 650,
            height: 400,
            closed: false,
            cache: false,
            content:"<iframe scrolling='auto' frameborder='0' src='outgoing_plan.jsp' style='width:100%; height:100%; display:block;'></iframe>",
            modal: true,
            //头部按钮组
            //toolbar:'#tt'
           /*  toolbar: [{
			 text : '编辑',
			 iconCls : 'icon-edit',
			 handler : function () {
			 alert('edit');
			 },
			}, {}], */
            //底部按钮组
            buttons:'#tt'
            /* buttons : [{
			 text : '保存',
			 iconCls : 'icon-ok',
			 handler : function () {
			 //点击保存执行的方法
			 // alert('save');
			 
			 }
			},{}] */
           
       });
       /* $("#msgDialog").iDialog("open"); */
   	}
    /* function progressFormatter(value, rowData, rowIndex) {
        var htmlstr = '<div id="p" class="easyui-progressbar progressbar" data-options="value:' + value + '" style="width: 398px; height: 26px;">';
        htmlstr += '<div class="progressbar-text" style="width: 398px; height: 26px; line-height: 26px;">' + value + '%</div>';
        htmlstr += '<div class="progressbar-value" style="width: ' + value + '%; height: 26px; line-height: 26px;">';
        htmlstr += '<div class="progressbar-text" style="width: 398px; height: 26px; line-height: 26px;">' + value + '%</div>';
        htmlstr += '</div>';
        htmlstr += '</div>';
        return htmlstr;
    } */

    $(function () {
        var productDg = {
            type: 'datagrid',
            id: 'productDg'
        };
        
        

        $("#productDg").iDatagrid({
            id: 'productDg',
            url: '${pageContext.request.contextPath}/json/demo/cartonStock.json',
            columns: [[
                {field: 'stock_id', title: 'UID', checkbox: true},
                {field: 'order_account', title: '订单号', sortable: true},
                {field: 'corporate_name', title: '客户公司', sortable: true},
                {field: 'carton_spec', title: '纸箱规格', sortable: true},
                {field: 'model_name', title: '纸箱名称', sortable: true},
                {field: 'material', title: '材质', sortable: true},
                {field: 'pit_type', title: '坑型', sortable: true},
                {field: 'price', title: '纸箱单价', sortable: true},
                /* {field: 'rate', title: '完成率', sortable: true, formatter: progressFormatter} */
                {field: 'order_num', title: '订单数量', sortable: true},
                {field: 'storage_num', title: '入库数量', sortable: true},
                {field: 'out_num', title: '出库数量', sortable: true},
                {field: 'stock_num', title: '库存数量', sortable: true},
                {field: 'storage_name', title: '库区', sortable: true},
                {field: 'mold', title: '类型', sortable: true},
                {field: 'operation', title: '操作', sortable: true,
	                formatter:function(value,row,index){
	                        if (value == '1') {
	                            return '<span id=\'caozuo\'><a href=\'javascript:void(0)\'  onclick=\'outgoing_plan()\' >生成出库计划</a></span>';
	                        } else if (value == '2') {
	                            return '';
	                        } 
	                    }
                   	},
            ]],
            filter: [{
                field: 'name',
                type: 'textbox',
                op: ['contains', 'equal', 'notequal', 'less', 'greater']
            }, {
                field: 'code',
                type: 'combobox',
                options: {
                    valueField: 'label',
                    textField: 'value',
                    data: [{
                        label: '2103',
                        value: '2103'
                    }, {
                        label: '5103',
                        value: '5103'
                    }, {
                        label: '1204',
                        value: '1204'
                    }]
                },
                op: ['contains', 'equal', 'notequal', 'less', 'greater']
            }, {
                field: 'spec',
                type: 'combobox',
                options: {
                    valueField: 'label',
                    textField: 'value',
                    multiple: true,
                    data: [{
                        label: 'KC-W200SW',
                        value: 'KC-W200SW'
                    }, {
                        label: '白色LR-1688BY-2',
                        value: '白色LR-1688BY-2'
                    }, {
                        label: '银灰色BCD-339WBA 339',
                        value: '银灰色BCD-339WBA 339'
                    }]
                },
                op: ['contains', 'equal', 'notequal', 'less', 'greater']
            }]
        });

        /* $("#add").iMenubutton({
            method: 'openDialog',
            extend: '#productDg-toolbar',
            iconCls: 'fa fa-plus',
            dialog: {
                id: 'userAddDialog',
                height: 350,
                href: _ctx + '/jsp/stock/materialsStockAdd.jsp',
                buttonsGroup: [
                    {
                        text: '保存',
                        url: _ctx + '/json/response/success.json',
                        iconCls: 'fa fa-plus',
                        handler: 'ajaxForm',
                        btnCls: 'topjui-btn-normal'
                    }
                ]
            }
        }); */

        $("#edit").iMenubutton({
            method: 'openDialog',
            extend: '#productDg-toolbar',
            iconCls: 'fa fa-pencil',
            btnCls: 'topjui-btn',
            grid: productDg,
            dialog: {
                width: 950,
                height: 500,
                href: _ctx + '/jsp/stock/cartonStockAdd.jsp?uuid={uuid}',
                url: _ctx + '/jsp/stock/json/cartonStockEdit.json?uuid={uuid}',
                buttonsGroup: [
                    {
                        text: '更新',
                        url: _ctx + '/json/response/success.json',
                        iconCls: 'fa fa-save',
                        handler: 'ajaxForm',
                        btnCls: 'topjui-btn'
                    }
                ]
            }
        });

        $("#delete").iMenubutton({
            method: 'doAjax',
            extend: '#productDg-toolbar',
            iconCls: 'fa fa-trash',
            btnCls: 'topjui-btn-normal',
            confirmMsg: '这个是勾选复选框实现多条数据的Ajax删除提交操作，提交grid.param中指定的参数值',
            grid: {
                type: 'datagrid',
                id: 'productDg',
                uncheckedMsg: '请先勾选要删除的数据',
                param: 'uuid:uuid,code:code'
            },
            url: _ctx + '/json/response/success.json'
        });
        /* $("#see").iMenubutton({
            method: 'openDialog',
            extend: '#productDg-toolbar',
            iconCls: 'fa fa-eye',
            btnCls: 'topjui-btn-danger',
            grid: productDg,
            dialog: {
                width: 700,
                height: 300,
                href: _ctx + '/jsp/outStorage/cartonPurAdd.jsp?uuid={uuid}',
                url: _ctx + '/json/demo/cartonPurEdit.json?uuid={uuid}'
            }
        }); */


        $("#filter").iMenubutton({
            method: 'filter',
            extend: '#productDg-toolbar',
            btnCls: 'topjui-btn-warm',
            grid: productDg
        });

        $("#search").iMenubutton({
            method: 'search',
            extend: '#productDg-toolbar',
            btnCls: 'topjui-btn-danger',
            grid: productDg
        });

        $("#import").iMenubutton({
            method:'import',
            extend: '#productDg-toolbar',
            btnCls:'topjui-btn-normal',
            uploadUrl:_ctx + '/json/response/upload.json',
            url:_ctx+'/json/response/success.json'
        });

        /* $("#export").iMenubutton({
            method: 'export',
            extend: '#productDg-toolbar',
            btnCls: 'topjui-btn',
            url: _ctx + '/json/response/export.html'
        }); */

        /* $("#openTab").iMenubutton({
            method: 'openTab',
            btnCls: 'topjui-btn-normal',
            tab: {
                title: '这是新的Tab窗口',
                href: _ctx + '/html/complex/panel_add.html'
            },
            grid: productDg
        }); */

        /* $("#openWindow").iMenubutton({
            method: 'openWindow',
            extend: '#productDg-toolbar',
            btnCls: 'topjui-btn-warm',
            href: 'http://www.topjui.com?uuid={uuid}',
            grid: productDg
        }); */

        /* $('#request').iMenubutton({
            method: 'request',
            btnCls: 'topjui-btn',
            url: _ctx + '/json/response/success.json'
        }); */

        /* $('#myFun').iMenubutton({
            btnCls: 'topjui-btn-normal',
            onClick: myQuery
        }); */

        $('#queryBtn').iMenubutton({
            method: 'query',
            iconCls: 'fa fa-search',
            btnCls: 'topjui-btn-danger',
            form: {id: 'queryForm'},
            grid: {type: 'datagrid', 'id': 'productDg'}
        });
    });

    // 自定义方法
    /* function myQuery() {
        // 提示信息
        $.iMessager.alert('自定义方法', '自定义方法被执行了！', 'messager-info');
        // 提交参数查询表格数据
        $('#productDg').iDatagrid('reload', {
            name: $('#name').iTextbox('getValue'),
            code: $('#code').iTextbox('getValue')
        });
    } */
    
</script>

</body>
</html>