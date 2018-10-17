
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <!-- 避免IE使用兼容模式 -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
    <meta name="renderer" content="webkit">
    <!-- 导入公共样式 -->
    <%@ include file="../ap.jsp" %>
</head>

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
</div>
<!-- 表格工具栏结束 -->

<script>
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
            url: '${pageContext.request.contextPath}/json/finance/qita.json',
            columns: [[
                {field: 'id', title: 'id', checkbox: true},
                {field: 'name', title: '支出名称', sortable: true},
                {field: 'pay_type', title: '支出类型', sortable: true},
                {field: 'pay_money', title: '支出金额', sortable: true},
                {field: 'pay_time', title: '支出时间', sortable: true},
                {field: 'user_name', title: '使用者', sortable: true},
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
                href: _ctx + '/jsp/finance/add_loss.jsp',
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
                width: 850,
                height: 350,
                href: _ctx + '/jsp/finance/add_loss.jsp?uuid={uuid}',
                url: _ctx + '/json/demo/cartonLossEdit.json?uuid={uuid}',
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
        $("#zdy").iMenubutton({
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

        $("#export").iMenubutton({
            method: 'export',
            extend: '#productDg-toolbar',
            btnCls: 'topjui-btn',
            url: _ctx + '/json/response/export.html'
        });

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