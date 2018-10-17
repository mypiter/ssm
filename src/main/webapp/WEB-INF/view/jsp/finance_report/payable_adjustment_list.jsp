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
    <!-- 导入公共样式 -->
    <%@ include file="../ap.jsp" %>
    <title>应付调整记录列表</title>
</head>

<body>
<!-- layout布局 开始 -->
<div data-toggle="topjui-layout" data-options="fit:true">
  <div data-options="region:'center',title:'',fit:false,split:true,border:false,bodyCls:'border_right_bottom'">
		        <!-- datagrid表格 -->
                <table data-toggle="topjui-datagrid"
                       data-options="id:'userDg',
                        singleSelect:true,
					    selectOnCheck:false,
					    checkOnSelect:false,
                       	url:'/ReceivableAdjustmentController/loadReceivableList/',
			            childTabs: [
                            {id:'eastTabs'}
                        ]">
                    <thead>
                     <tr>
                        <th data-options="field: 'receivableAdjustmentId', title: 'UID', checkbox: true"></th>
                         <%--<th data-options="field: 'orderAccount', title: '订单号', sortable: true"></th>--%>
                         <th data-options="field: 'customName', title: '客户名称', sortable: true"></th>
                         <th data-options="field: 'cartonName', title: '产品名称', sortable: true"></th>
                        <th data-options="field: 'receivableAdjustmentDate', title: '调整时间', sortable: true"></th>
                        <%--<th data-options="field: 'receivableAdjustmentPrice', title: '调整前单价', sortable: true"></th>--%>
                        <%--<th data-options="field: 'receivableAdjustmentAfterPrice', title: '调整后单价', sortable: true"></th>--%>
                        <th data-options="field: 'receivableAdjustmentTotal', title: '调整前总金额', sortable: true"></th>
                        <th data-options="field: 'receivableAdjustmentAfterTotal', title: '调整后总金额', sortable: true"></th>
                        <th data-options="field: 'receivableAdjustmentType', title: '调整类型', sortable: true,
                        formatter:function(value,row,index){
                                    if (value == '1') {
                                        return '盘盈';
                                    } else if (value == '2') {
                                        return '盘亏';
                                    }else {
                                        return value;
                                    }
                                }"></th>
                         <th data-options="field: 'receivableAdjustmentRemarks', title: '调整备注', sortable: true"></th>
 					</tr>        
                    </thead>
                </table>
            </div>
</div>
<!-- layout布局 结束 -->


<!-- 表格工具栏开始 -->
	<div id="userDg-toolbar" class="topjui-toolbar"
		data-options="grid:{
           type:'datagrid',
           id:'userDg'
       }">
        <%--<a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method:'openTab',
        extend: '#userDg-toolbar',
       tab:{
           title:'成品退货赔款',
            href:'/AdminController/jsp/?url=/production_register/finished_return_compensate'
       }">新增</a>
		<a href="javascript:void(0)" data-toggle="topjui-menubutton"
			data-options="method: 'openTab',
            extend: '#userDg-toolbar',
            iconCls: 'fa fa-pencil',
            btnCls:'topjui-btn-blue',
            tab: {
                title:'编辑成品退货赔偿',
                href: '/RejectedController/edit/?url=/production_register/finished_return_compensate&rejectedId={rejectedId}'
            }">编辑</a>
       <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method:'doAjax',btnCls:'topjui-btn-brown',
       extend: '#userDg-toolbar',
       iconCls:'fa fa-trash',
       url:'/RejectedController/deleteRejected/',
       grid: {uncheckedMsg:'请先勾选要删除的数据',param:'rejectedId:rejectedId,plan_num:plan_num'}">删除</a>--%>
	   <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method:'search',
       extend: '#userDg-toolbar',
       btnCls:'topjui-btn-blue'">查询</a>


	</div>
</body>
</html>