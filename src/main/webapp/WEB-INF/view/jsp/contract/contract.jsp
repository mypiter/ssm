<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
</head>
<!-- 避免IE使用兼容模式 -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
    <meta name="renderer" content="webkit">
    <!-- TopJUI框架样式 -->
    <link type="text/css" href="../../topjui/css/topjui.core.min.css" rel="stylesheet">
    <link type="text/css" href="../../topjui/themes/default/topjui.red.css" rel="stylesheet" id="dynamicTheme"/>
    <!-- FontAwesome字体图标 -->
    <link type="text/css" href="../../static/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet"/>
    <!-- layui框架样式 -->
    <link type="text/css" href="../../static/plugins/layui/css/layui.css" rel="stylesheet"/>
    <!-- jQuery相关引用 -->
    <script type="text/javascript" src="../../static/plugins/jquery/jquery.min.js"></script>
    <script type="text/javascript" src="../../static/plugins/jquery/jquery.cookie.js"></script>
    <!-- TopJUI框架配置 -->
    <script type="text/javascript" src="../../static/public/js/topjui.config.js"></script>
    <!-- TopJUI框架核心-->
    <script type="text/javascript" src="../../topjui/js/topjui.core.min.js"></script>
    <!-- TopJUI中文支持 -->
    <script type="text/javascript" src="../../topjui/js/locale/topjui.lang.zh_CN.js"></script>
    <!-- layui框架js -->
    <script src="../../static/plugins/layui/layui.js" charset="utf-8"></script>
  <body>
   <table id="productDg"></table>

<!-- 表格工具栏开始 -->
<div id="productDg-toolbar" class="topjui-toolbar"
     data-options="grid:{
           type:'datagrid',
           id:'productDg'
       }">
    <a id="add" href="javascript:void(0)">新增</a>
    <a id="edit" href="javascript:void(0)">编辑</a>
    <a id="delete" href="javascript:void(0)">删除</a>
    <a id="see" href="javascript:void(0)">查看</a>
    <a id="filter" href="javascript:void(0)">过滤</a>
    <a id="search" href="javascript:void(0)">查询</a>
    <a id="import" href="javascript:void(0)">导入</a>
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
        <input type="text" name="code" data-toggle="topjui-textbox"
               data-options="id:'code',prompt:'产品型号'">
        <a id="queryBtn" href="javascript:void(0)">查询</a>
    </form>
</div>
<!-- 表格工具栏结束 -->

<script>
    function progressFormatter(value, rowData, rowIndex) {
        var htmlstr = '<div id="p" class="easyui-progressbar progressbar" data-options="value:' + value + '" style="width: 398px; height: 26px;">';
        htmlstr += '<div class="progressbar-text" style="width: 398px; height: 26px; line-height: 26px;">' + value + '%</div>';
        htmlstr += '<div class="progressbar-value" style="width: ' + value + '%; height: 26px; line-height: 26px;">';
        htmlstr += '<div class="progressbar-text" style="width: 398px; height: 26px; line-height: 26px;">' + value + '%</div>';
        htmlstr += '</div>';
        htmlstr += '</div>';
        return htmlstr;
    }

    $(function () {
        var productDg = {
            type: 'datagrid',
            id: 'productDg'
        };

        $("#productDg").iDatagrid({
            id: 'productDg',
            url: '../../json/contract/contract.json',
            columns: [[
                {field: 'uuid', title: 'UUID', checkbox: true},
                {field: 'id', title: '合同id', sortable: true},
                {field: 'contract_customers', title: '签约客户', sortable: true},
                {field: 'product_name', title: '产品名称', sortable: true},
                {field: 'product_num', title: '产品数量', sortable: true},
                {field: 'cooperation_time', title: '合作时间', sortable: true},
                {field: 'contract_time', title: '合同时间', sortable: true},
                {field: 'contract_img1', title: '合同附件1', sortable: true},
                {field: 'contract_img2', title: '合同附件2', sortable: true},
                {field: 'contract_progress', title: '合同进度', sortable: true, formatter: progressFormatter}
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

        $("#add").iMenubutton({
            method: 'openDialog',
            extend: '#productDg-toolbar',
            iconCls: 'fa fa-plus',
            dialog: {
                id: 'userAddDialog',
                height: 350,
                href: _ctx + '/jsp/contract/contract_add.jsp',
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
        });

        $("#edit").iMenubutton({
            method: 'openDialog',
            extend: '#productDg-toolbar',
            iconCls: 'fa fa-pencil',
            btnCls: 'topjui-btn',
            grid: productDg,
            dialog: {
                width: 750,
                height: 350,
                href: _ctx + '/jsp/contract/contract_add.jsp?uuid={uuid}',
                url: _ctx + '/json/contract/eidt.json?uuid={uuid}',
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
        $("#see").iMenubutton({
            method: 'openDialog',
            extend: '#productDg-toolbar',
            iconCls: 'fa fa-eye',
            btnCls: 'topjui-btn-danger',
            grid: productDg,
            dialog: {
                width: 700,
                height: 300,
                href: _ctx + '/jsp/outStorage/contract_see.jsp?uuid={uuid}',
                url: _ctx + '/json/demo/cartonPurEdit.json?uuid={uuid}'
            }
        });

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

        $('#queryBtn').iMenubutton({
            method: 'query',
            iconCls: 'fa fa-search',
            btnCls: 'topjui-btn-danger',
            form: {id: 'queryForm'},
            grid: {type: 'datagrid', 'id': 'productDg'}
        });
    });

    // 自定义方法
    function myQuery() {
        // 提示信息
        $.iMessager.alert('自定义方法', '自定义方法被执行了！', 'messager-info');
        // 提交参数查询表格数据
        $('#productDg').iDatagrid('reload', {
            name: $('#name').iTextbox('getValue'),
            code: $('#code').iTextbox('getValue')
        });
    }
</script>
  </body>
</html>
