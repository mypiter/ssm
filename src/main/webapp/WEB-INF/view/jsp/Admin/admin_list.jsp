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
    <meta http-equiv="description" content="This is my page">
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <!-- 导入公共样式 -->
    <%@ include file="../ap.jsp" %>
    <title>在线列表</title>
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
                        idField:'id',
                        treeField:'name',
                        pagination:true,
                        striped:true,
                        fitColumns:true,
                        rownumbers: true,
                        url:'/AdminController/AdminList/',
			            childTabs: [
                            {id:'eastTabs'}
                        ]">
                    <thead>
                    <tr>
                        <th data-options="field: 'adminId', title: 'UID', checkbox: true"></th>
                        <th data-options="field: 'adminName', title: '名称', sortable: true"></th>
                        <th data-options="field: 'adminAccount', title: '账号', sortable: true"></th>
                        <th data-options="field: 'level', title: '权限', sortable: true"></th>
                    </tr>
                    </thead>
                </table>
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
       data-options="method:'doAjax',btnCls:'topjui-btn-brown',
       extend: '#userDg-toolbar',
       iconCls:'fa fa-trash',
       url:'/AdminController/delete/',
       grid: {uncheckedMsg:'请先勾选要下线的数据',param:'adminId:adminId'}">全部强制下线</a>
	</div>
</div>
<!-- 表格工具栏结束 -->
</body>
</html>