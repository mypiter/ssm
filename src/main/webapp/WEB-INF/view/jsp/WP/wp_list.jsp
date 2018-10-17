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
    <title>楞型列表</title>
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
                        url:'/WorkingProcedure/getList/',
			            childTabs: [
                            {id:'eastTabs'}
                        ]">
                    <thead>
                    <tr>
                        <th data-options="field: 'id', title: 'UID', checkbox: true"></th>
                        <th data-options="field: 'name', title: '工序名称', sortable: true"></th>
                        <th data-options="field: 'code', title: '工序代号', sortable: true"></th>
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
           data-options="method:'openDialog',
       extend: '#userDg-toolbar',
       iconCls: 'fa fa-plus',
       dialog:{
           width:700,
           height:300,
           id:'userAddDialog',
           title:'新增工序',
           href:'/AdminController/jsp/?url=WP/add_wp',
           buttonsGroup:[
               {text:'保存',url:'/WorkingProcedure/addWP/',iconCls:'fa fa-plus',handler:'ajaxForm',btnCls:'topjui-btn-green'}
           ]
       }">新增工序</a>
        <a href="javascript:void(0)"
           data-toggle="topjui-menubutton"
           data-options="method: 'openDialog',
            extend: '#userDg-toolbar',
            iconCls: 'fa fa-pencil',
            btnCls: 'topjui-btn-green',
            grid: {
                type: 'datagrid',
                id: 'userDg'
            },
            dialog: {
                width: 700,
                height: 300,
                href:'/AdminController/jsp/?url=WP/add_wp&id={id}',
                url:'/WorkingProcedure/findeById/?id={id}',
                buttonsGroup: [
                    {
                        text: '更新',
                        url:'/WorkingProcedure/updateWP/',
                        iconCls: 'fa fa-save',
                        handler: 'ajaxForm',
                        btnCls: 'topjui-btn-green'
                    }
                ]
            }">编辑工序</a>
        <a href="javascript:void(0)"
           data-toggle="topjui-menubutton"
           data-options="method:'doAjax',btnCls:'topjui-btn-brown',
       extend: '#userDg-toolbar',
       iconCls:'fa fa-trash',
       url:'/WorkingProcedure/delect/',
       grid: {uncheckedMsg:'请先勾选要删除的数据',param:'id:id'}">删除</a>
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