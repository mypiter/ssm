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
    <title>财务登记列表</title>
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
                       	url:'/FinancialRegistration/FinancialList/',
			            childTabs: [
                            {id:'eastTabs'}
                        ]">
                    <thead>
                     <tr>
                        <th data-options="field: 'financialRegistrationId', title: 'UID', checkbox: true"></th>
                        <th data-options="field: 'financeMoney', title: '金额', sortable: true"></th>
                        <th data-options="field: 'financePeople', title: '使用对象', sortable: true"></th>
                        <th data-options="field: 'financeRegister', title: '登记人', sortable: true"></th>
                        <th data-options="field: 'financeDate', title: '日期', sortable: true"></th>
                        <th data-options="field: 'financePrice', title: '单价', sortable: true"></th>
                        <th data-options="field: 'financeNum', title: '数量', sortable: true"></th>
                        <th data-options="field: 'financeRemarks', title: '备注', sortable: true"></th>
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
        <a href="javascript:void(0)"
           data-toggle="topjui-menubutton"
           data-options="method:'openTab',
        extend: '#userDg-toolbar',
        btnCls:'topjui-btn-green',
       tab:{
           title:'货款回笼登记',
            href:'/AdminController/jsp/?url=/finance_register/loan_back'
       }">货款回笼登记</a>
        <a href="javascript:void(0)"
           data-toggle="topjui-menubutton"
           data-options="method:'openTab',
        extend: '#userDg-toolbar',
        btnCls:'topjui-btn-green',
       tab:{
           title:'应付货款登记',
           href:'/AdminController/jsp/?url=/finance_register/pay_load'
       }">应付货款登记</a>
        <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method:'openTab',
       extend: '#userDg-toolbar',
       tab:{
           title:'财务登记',
           href:'/AdminController/jsp/?url=/finance_register/financial_registration'
       }">新增</a>
		<a href="javascript:void(0)" data-toggle="topjui-menubutton"
			data-options="method: 'openTab',
            extend: '#userDg-toolbar',
            iconCls: 'fa fa-pencil',
            btnCls:'topjui-btn-blue',
            tab: {
                title:'编辑成品退货赔偿',
                href: '/FinancialRegistration/edit/?url=/finance_register/financial_registration&financialRegistrationId={financialRegistrationId}'
            }">编辑</a>
       <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method:'doAjax',btnCls:'topjui-btn-brown',
       extend: '#userDg-toolbar',
       iconCls:'fa fa-trash',
       url:'/FinancialRegistration/deleteFinancial/',
       grid: {uncheckedMsg:'请先勾选要删除的数据',param:'financialRegistrationId:financialRegistrationId,plan_num:plan_num'}">删除</a>
	   <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method:'search',
       extend: '#userDg-toolbar',
       btnCls:'topjui-btn-blue'">查询</a>

	</div>


<!-- 表格工具栏结束 -->

</body>
</html>