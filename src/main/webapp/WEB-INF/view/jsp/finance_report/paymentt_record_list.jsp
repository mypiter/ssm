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
    <title>付款记录列表</title>
</head>

<body>
<!-- layout布局 开始 -->
<div data-toggle="topjui-layout" data-options="fit:true">
  <div data-options="region:'center',title:'',fit:false,split:true,border:false,bodyCls:'border_right_bottom'">
		        <!-- datagrid表格 -->
                <table data-toggle="topjui-datagrid"
                       data-options="id:'userDg',
                        singleSelect:true,
                        fitColumns:false,
					    selectOnCheck:false,
					    checkOnSelect:false,
                       	url:'/PayLoad/PayLoadList/',
			            childTabs: [
                            {id:'eastTabs'}
                        ]">
                    <thead>
                     <tr>
                        <th data-options="field: 'paymentRecordId', title: 'UID', checkbox: true"></th>
                        <th data-options="field: 'supplierName', title: '供货商', sortable: true"></th>
                        <th data-options="field: 'paymentMoney', title: '已付金额', sortable: true"></th>
                        <th data-options="field: 'paymentType', title: '支付方式', sortable: true,
                        formatter:function(value,row,index){
                                    if (value == '1') {
                                        return '账期';
                                    } else if (value == '2') {
                                        return '现金';
                                    } else if (value == '3') {
                                        return '转账';
                                    } else if (value == '4') {
                                        return '微信';
                                    }else {
                                        return '';
                                    }
                                }"></th>
                        <th data-options="field: 'paymentAcceptanceTicket', title: '承兑票号', sortable: true"></th>
                        <th data-options="field: 'paymentAcceptanceDate', title: '承兑日期', sortable: true"></th>
                        <th data-options="field: 'paymentTime', title: '录入时间', sortable: true"></th>
                        <th data-options="field: 'paymentRemarks', title: '备注', sortable: true"></th>
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
        <%-- <a href="javascript:void(0)"
        data-toggle="topjui-menubutton"
        data-options="method:'openTab',
         extend: '#userDg-toolbar',
        tab:{
            title:'成品退货赔款',
             href:'/AdminController/jsp/?url=/production_register/finished_return_compensate'
        }">新增</a>--%>
         <a href="javascript:void(0)" data-toggle="topjui-menubutton"
             data-options="method: 'openTab',
             extend: '#userDg-toolbar',
             iconCls: 'fa fa-pencil',
             btnCls:'topjui-btn-blue',
             tab: {
                 title:'调整',
                 href: '/ReceivableAdjustmentController/edit/?url=/finance_register/financial_load&paymentRecordId={paymentRecordId}'
             }">调整</a>
        <%--<a href="javascript:void(0)"
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

<%--
<!-- 表格工具栏结束 -->
<script type="text/javascript">
	$(function(){
	     $("#treetab th").tabs({
               onClick:function(node){          
                  alert(node.text);
               }
       });
		$('#queryBtn').iMenubutton({
            method: 'query',
            iconCls: 'fa fa-search',
            btnCls: 'topjui-btn-danger',
            form: {id: 'queryForm'},
            grid: {type: 'datagrid', 'id': 'productDg'}
        });
	});
</script>--%>
</body>
</html>