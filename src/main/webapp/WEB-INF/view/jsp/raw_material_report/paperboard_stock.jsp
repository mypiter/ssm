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
    <%@ include file="/jsp/ap.jsp" %>
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
		                	<th data-options="field: 'carton_price', title: '批号', sortable: true"></th>
		                    <th data-options="field: 'carton_price', title: '订单号', sortable: true"></th>
		                    <th data-options="field: 'ticket_object', title: '客户名称', sortable: true"></th>
		                    <th data-options="field: 'ticket_object', title: '产品名称', sortable: true"></th>
		                    <th data-options="field: 'ticket_object', title: '材质', sortable: true"></th>
		                    <th data-options="field: 'ticket_object', title: '楞型', sortable: true"></th>
		                    <th data-options="field: 'ticket_money', title: '尺寸', sortable: true"></th>
		                    <th data-options="field: 'ticket_money', title: '宽度压线', sortable: true"></th>               
		                    <th data-options="field: 'ticket_money', title: '压线类型', sortable: true"></th>   		                   
		                    <th data-options="field: 'ticket_money', title: '数量', sortable: true"></th>
		                    <th data-options="field: 'carton_total', title: '库区位置', sortable: true"></th>
		                    <th data-options="field: 'carton_price', title: '单价', sortable: true"></th>
                        	<th data-options="field: 'carton_total', title: '总金额', sortable: true"></th>
                        	<th data-options="field: 'carton_total', title: '入库员', sortable: true"></th>
                        	<th data-options="field: 'carton_total', title: '入库日期', sortable: true"></th>
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
       data-options="method:'openTab',
       tab:{
           title:'原材料入库',
           href:'./jsp/raw_material_register/raw_material.jsp'
       }">入库</a>
      <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method:'openTab',
       tab:{
           title:'原材料领料',
           href:'./jsp/raw_material_register/raw_material_out.jsp'
       }">出库</a>
     <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method:'openTab',
       tab:{
           title:'纸板库存调整',
           href:'./jsp/raw_material_register/raw_material_store_adjustment.jsp'
       }">库存调整</a>
     <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method:'openTab',
       tab:{
           title:'纸板借调',
           href:'./jsp/raw_material_register/raw_material_use_adjustment.jsp'
       }">纸板借调</a>
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
       <form id="queryForm" class="search-box">
        <input type="text" name="startTime" data-toggle="topjui-datetimebox"
               data-options="id:'name',prompt:'开始时间',width:180">
        <input type="text" name="endTime" data-toggle="topjui-datetimebox"
               data-options="id:'code',prompt:'结束时间',width:180">
        <a href="javascript:void(0)"
           data-toggle="topjui-menubutton"
           data-options="method:'query',
           iconCls:'fa fa-search',
           btnCls:'topjui-btn-blue',
           form:{id:'queryForm'},
           grid:{type:'datagrid','id':'userDg'}">查询</a>
    </form>
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