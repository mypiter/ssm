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
    <title>送货单列表</title>
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
                        idField:'staffId',
                        treeField:'staffName',
                        pagination:true,
                        striped:true,
                        fitColumns:true,
                        rownumbers: true,
                        url:'/Dively/DivelyList/',
			            childTabs: [
                            {id:'eastTabs'}
                        ]">
                    <thead>
                    <tr>
                        <th data-options="field: 'id', title: 'UID', checkbox: true"></th>
                        <th data-options="field: 'biao', title: '类别',
                        formatter:function(value,row,index){
                                    if (value == '1') {
                                        return '采购单';
                                    } else if (value == '2') {
                                        return '送货单';
                                    } else {
                                        return '对账单';
                                    }
                                }"></th>
                        <th data-options="field: 'name', title: '名称'"></th>
                        <th data-options="field: 'url', title: '文件名'"></th>
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
           data-options="method:'openTab',
       extend: '#userDg-toolbar',
       tab:{
           title:'送货单登记',
           href:'/AdminController/jsp/?url=/dively/add_dively'
       }">新增</a>
        <a href="javascript:void(0)" data-toggle="topjui-menubutton"
           data-options="method: 'openTab',
            extend: '#userDg-toolbar',
            iconCls: 'fa fa-pencil',
            btnCls:'topjui-btn-blue',
            tab: {
                title:'更新送货单',
                href: '/Dively/edit/?url=/dively/add_dively&id={id}'
            }">更新送货单</a>
       <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method:'doAjax',btnCls:'topjui-btn-brown',
       extend: '#userDg-toolbar',
       iconCls:'fa fa-trash',
       url:'/Dively/deleteDively/',
       grid: {uncheckedMsg:'请先勾选要删除的数据',param:'id:id'}">删除</a>
	   <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method:'search',
       extend: '#userDg-toolbar',
       btnCls:'topjui-btn-blue'">查询</a>
	   <%--<a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method:'filter',
       extend: '#userDg-toolbar',
       btnCls:'topjui-btn-black'">过滤</a>--%>
  
	</div>
</div>
<!-- 表格工具栏结束 -->
</body>
</html>