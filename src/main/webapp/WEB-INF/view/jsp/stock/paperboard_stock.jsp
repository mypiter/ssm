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
    <title>纸板库存明细</title>
    <!-- 导入公共样式 -->
    <%@ include file="../ap.jsp" %>
</head>

<body>
<!-- layout布局 开始 -->
<div data-toggle="topjui-layout" data-options="fit:true">
    <div data-options="region:'center',iconCls:'icon-reload',title:'',split:true,border:false">
        <div data-toggle="topjui-layout" data-options="fit:true">
            <div data-options="region:'center',title:'',fit:false,split:true,border:false,bodyCls:'border_right_bottom'"
                 style="height:80%">
                <!-- datagrid表格 -->
                 <table data-toggle="topjui-datagrid"
		               data-options="id:'userDg',
		                    singleSelect:true,
						    selectOnCheck:false,
						    checkOnSelect:false,
		                    url:'${pageContext.request.contextPath}/json/data/cartonStock1.json',
		                    childTab: [{id:'eastTabs'}]">
		            <thead>
		                <tr>
		                	<th data-options="field: 'ticket_id', title: 'UID', checkbox: true"></th>
		                	<th data-options="field: 'carton_price', title: '采购单号', sortable: true"></th>
		                    <th data-options="field: 'carton_price', title: '订单号', sortable: true"></th>
		                    <th data-options="field: 'ticket_object', title: '客户名称', sortable: true"></th>
		                    <th data-options="field: 'ticket_object', title: '产品名称', sortable: true"></th>
		                    <th data-options="field: 'ticket_object', title: '材质/楞型', sortable: true"></th>
		                    <th data-options="field: 'ticket_money', title: '纸板尺寸', sortable: true"></th>
		                    <th data-options="field: 'ticket_money', title: '压线规格', sortable: true"></th>               
		                    <th data-options="field: 'ticket_money', title: '压线类型', sortable: true"></th>   		                   
		                    <th data-options="field: 'ticket_money', title: '库存数量', sortable: true"></th>
		                    <th data-options="field: 'carton_price', title: '单价', sortable: true"></th>
                        	<th data-options="field: 'carton_total', title: '总金额', sortable: true"></th>
		                    <th data-options="field: 'ticket_accout', title: '备注', sortable: true"></th>
		                </tr>
		            </thead>
		        </table>
            </div>
        </div>
    </div>
</div>
<!-- 表格工具栏开始 -->
<div id="userDg-toolbar" class="topjui-toolbar"
     data-options="grid:{
           type:'datagrid',
           id:'userDg'
       }">
   <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method:'openDialog',
       extend:'#productDg-toolbar',
       btnCls:'topjui-btn-green',
       dialog:{
           id:'formDialog',
           href:_ctx + '/jsp/stock/paperboard_stock_putin.jsp',
           height:400,
           width:600,
           buttonsGroup:[
               {text:'保存',url: _ctx + '/json/response/success.json',iconCls:'fa fa-plus',handler:'ajaxForm'}
           ]
       }">入库</a>
       <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method: 'openDialog',
       extend: '#userDg-toolbar',
       iconCls: 'fa fa-cog',
       btnCls: 'topjui-btn-red',
       grid: {
           type: 'datagrid',
           id: 'userDg',
           param:'uuid:uuid,code',
           uncheckedMsg:'请先选择你要出库的采购单'
       },
       dialog: {
           title: '纸板出库',
            height:300,
           width:1000,
            href: 'paperboard_stock_out2.jsp',
           buttonsGroup: [
               {
                   text: '提交',
                   url: _ctx + '/json/response/success.json',
                   iconCls: 'fa fa-cog',
                   handler: 'multiAjaxForm',
                   btnCls: 'topjui-btn-green'
               }
           ]
       }">订单批量出库</a>
     <!--   <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method: 'openDialog',
       extend: '#userDg-toolbar',
       iconCls: 'fa fa-cog',
       btnCls: 'topjui-btn-red',
       grid: {
           type: 'datagrid',
           id: 'userDg',
           param:'uuid:uuid,code',
           uncheckedMsg:'请先选择你要出库的采购单'
       },
       dialog: {
           title: '',
            href: 'paperboard_stock_out3.jsp',
           buttonsGroup: [
               {
                   text: '提交',
                   url: _ctx + '/json/response/success.json',
                   iconCls: 'fa fa-cog',
                   handler: 'multiAjaxForm',
                   btnCls: 'topjui-btn-green'
               }
           ]
       }">材质批量出库</a> -->
       		<!--  <input style="width:115px;height:35px" id="add" name="sub" onclick="addCartonType()" value="录入订单" type="button" /> -->
		<a href="javascript:void(0)" data-toggle="topjui-menubutton"
			data-options="method: 'openDialog',
            extend: '#userDg-toolbar',
            iconCls: 'fa fa-pencil',
            btnCls: 'topjui-btn-green',
            grid: {
                type: 'datagrid',
                id: 'userDg'
            },
            dialog: {
                width: 1000,
                height: 500,
                href: 'paperboard_stock_out3.jsp',
                buttonsGroup: [
                    {
                        text: '更新',
                        url: 'placeupdate.action',
                        iconCls: 'fa fa-save',
                        handler: 'ajaxForm',
                        btnCls: 'topjui-btn-green'
                    }
                ]
            }">材质出库</a>
       <!-- <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method: 'openDialog',
       extend: '#userDg-toolbar',
       iconCls: 'fa fa-cog',
       btnCls: 'topjui-btn-red',
       grid: {
           type: 'datagrid',
           id: 'userDg',
           param:'uuid:uuid,code',
           uncheckedMsg:'请先选择要编辑的库存明细'
       },
       dialog: {
           title: '',
           href: 'paperboard_stock_out2.jsp',
           height:500,
           width:1100,
           buttonsGroup: [
               {
                   text: '保存',
                   url: _ctx + '/json/response/success.json',
                   iconCls: 'fa fa-cog',
                   handler: 'multiAjaxForm',
                   btnCls: 'topjui-btn-green'
               }
           ]
       }">编辑</a> -->
       <!--  <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="extend:'#productDg-toolbar',
       iconCls:'fa fa-pencil',
       btnCls:'topjui-btn-brown',
       onClick:myDialog">出库</a> -->
		<!--  <input style="width:115px;height:35px" id="add" name="sub" onclick="addCartonType()" value="录入订单" type="button" /> -->
		<a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method: 'openDialog',
       extend: '#userDg-toolbar',
       iconCls: 'fa fa-cog',
       btnCls: 'topjui-btn-red',
       grid: {
           type: 'datagrid',
           id: 'userDg',
           param:'uuid:uuid,code',
           uncheckedMsg:'请先选择你要调整的订单'
       },
       dialog: {
           title: '这里填写要调整的内容',
            href: 'paperboard_stock_adjustment.jsp',
           buttonsGroup: [
               {
                   text: '提交',
                   url: _ctx + '/json/response/success.json',
                   iconCls: 'fa fa-cog',
                   handler: 'multiAjaxForm',
                   btnCls: 'topjui-btn-green'
               }
           ]
       }">批量调整</a>
        <!-- <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="extend:'#productDg-toolbar',
       iconCls:'fa fa-pencil',
       btnCls:'topjui-btn-brown',
       onClick:jDialog">借调</a> -->
       <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method:'doAjax',btnCls:'topjui-btn-brown',
       extend: '#userDg-toolbar',
       iconCls:'fa fa-trash',
       url:'placedelete.action',
       grid: {uncheckedMsg:'请先勾选要删除的数据',param:'id:id,plan_num:plan_num'}">删除</a>
	   <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method:'search',
       extend: '#userDg-toolbar',
       btnCls:'topjui-btn-blue'">查询</a>
	   <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method:'filter',
       extend: '#userDg-toolbar',
       btnCls:'topjui-btn-black'">过滤</a>
       <!-- <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method:'openDialog',
       extend:'#productDg-toolbar',
       btnCls:'topjui-btn-green',
       dialog:{
           id:'formDialog',
            href:_ctx + '/jsp/stock/zhiban_w.jsp',
           height:250,
           width:900,
           buttonsGroup:[
               {text:'保存',url: _ctx + '/json/response/success.json',iconCls:'fa fa-plus',handler:'ajaxForm'}
           ]
       }">库存预警</a> -->
</div>
<script>
function jDialog() {
        $('<div></div>').iDialog({
            id: 'jDialog',
            title: '借调',
            closed: false,
            height: 650,
            width: 1050,
            href:_ctx + '/jsp/stock/carton_zb.jsp',
            buttons: [
                {text: '保存', iconCls: 'fa fa-plus', btnCls: 'topjui-btn-green', handler: ajaxSubmit},
                {text: '关闭', iconCls: 'fa fa-no', btnCls: 'topjui-btn-red', handler: closeMyDialog}
            ]
        })
    }
    function myDialog() {
        $('<div></div>').iDialog({
            id: 'myDialog',
            title: '出库',
            closed: false,
            height: 450,
            width: 1500,
            href:_ctx + '/jsp/stock/paperboard_stock_out.jsp',
            buttons: [
                {text: '保存', iconCls: 'fa fa-plus', btnCls: 'topjui-btn-green', handler: ajaxSubmit},
                {text: '关闭', iconCls: 'fa fa-no', btnCls: 'topjui-btn-red', handler: closeMyDialog}
            ]
        })
    }
    var ajaxSubmit = function () {
        $.iMessager.alert('操作提示', '我是点击提交按钮执行的方法', 'messager-info');
    }
    var closeMyDialog = function () {
        $('#myDialog').dialog('close');
        $('#myDialog').dialog('destroy');
    }
</script>
<!-- 表格工具栏结束 -->

<script>
    /*  function progressFormatter(value, rowData, rowIndex) {
        var htmlstr = '<div id="p" class="easyui-progressbar progressbar" data-options="value:' + value + '" style="width: 398px; height: 26px;">';
        htmlstr += '<div class="progressbar-text" style="width: 398px; height: 26px; line-height: 26px;">' + value + '%</div>';
        htmlstr += '<div class="progressbar-value" style="width: ' + value + '%; height: 26px; line-height: 26px;">';
        htmlstr += '<div class="progressbar-text" style="width: 398px; height: 26px; line-height: 26px;">' + value + '%</div>';
        htmlstr += '</div>';
        htmlstr += '</div>';
        return htmlstr;
    }  */

    $(function () {
        var userDg = {
            type: 'datagrid',
            id: 'userDg'
        };
        $("#filter").iMenubutton({
            method: 'filter',
            extend: '#productDg-toolbar',
            btnCls: 'topjui-btn-warm',
            grid: userDg
        });

        $("#search").iMenubutton({
            method: 'search',
            extend: '#productDg-toolbar',
            btnCls: 'topjui-btn-danger',
            grid: userDg
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
            grid: {type: 'datagrid', 'id': 'userDg'}
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