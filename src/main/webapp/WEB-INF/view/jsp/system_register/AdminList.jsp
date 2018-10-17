
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
    <title>管理列表</title>
</head>

<body>
<!-- layout布局 开始 -->
<div data-toggle="topjui-layout" data-options="fit:true">
		<div data-options="region:'center',iconCls:'icon-reload',title:'',split:true,border:false,bodyCls:'border_left_right'">
		        <!-- datagrid表格 -->
                <table data-toggle="topjui-datagrid"
                       data-options="id:'userDg',
                        singleSelect:true,
					    selectOnCheck:false,
					    checkOnSelect:false,
                        url:'/AdminController/AdminList/',
			            childTabs: [
                            {id:'eastTabs'}
                        ]">
                    <thead>
                    <tr>
                        <th data-options="field: 'adminId', title: 'UID', checkbox: true"></th>
                        <th data-options="field: 'adminName', title: '管理员名称', sortable: true"></th>
                        <th data-options="field: 'adminAccount', title: '管理员账号', sortable: true"></th>
                        <th data-options="field: 'adminPassword', title: '密码', sortable: true"></th>
                        <th data-options="field: 'level', title: '管理员类型', sortable: true,
                        formatter:function(value,row,index){
                                    if (value == '1') {
                                        return '普通管理员';
                                    }else if (value == null) {
                                        return '超级管理员';
                                    } else {
                                        return value;
                                    }
                                }"></th>
                        <th data-options="field: 'motif', title: '对应主题', sortable: true"></th>
                        <th data-options="field: 'registerTime', title: '注册时间', sortable: true"></th>
                    </tr>
                    </thead>
                </table>
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
        tab:{
           title:'管理添加',
            href:'/AdminController/jsp/?url=/Admin/Add_admin'
       }">新增</a>
		<a href="javascript:void(0)" data-toggle="topjui-menubutton"
			data-options="method: 'openTab',
            extend: '#userDg-toolbar',
            iconCls: 'fa fa-pencil',
            btnCls: 'topjui-btn-green',
            tab: {
                title:'编辑管理',
                href: '/AdminController/edit/?url=/Admin/Add_admin&adminId={adminId}&adminNamed=123666'
            }">编辑</a>
       <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method:'doAjax',btnCls:'topjui-btn-brown',
       extend: '#userDg-toolbar',
       iconCls:'fa fa-trash',
       url:'/AdminController/deleteAdmin/',
       grid: {uncheckedMsg:'请先勾选要删除的数据',param:'adminId:adminId,plan_num:plan_num'}">删除</a>
	   <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method:'search',
       extend: '#userDg-toolbar',
       btnCls:'topjui-btn-blue'">查询</a><%--
	   <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method:'filter',
       extend: '#userDg-toolbar',
       btnCls:'topjui-btn-black'">过滤</a>--%>
  
	</div>
</div>
</body>
</html>