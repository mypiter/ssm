<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <title>纸板库存调整记录</title>
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
                       	url:'/CardboardEdit/findByPurEdit/',
			            childTabs: [
                            {id:'eastTabs'}
                        ]">
            <thead>
            <tr>
                <th data-options="field:'cardboardEditId',title:'UUID',checkbox:true"></th>
                <th data-options="field:'orderAcount',title:'调整订单号',sortable:true"></th>
                <th data-options="field:'editPrice',title:'调整前单价',sortable:true"></th>
                <th data-options="field:'editOutNum',title:'调整前出库数',sortable:true"></th>
                <th data-options="field:'editLoan',title:'调整前被借调数',sortable:true"></th>
                <th data-options="field:'editNum',title:'调整前库存数',sortable:true"></th>
                <th data-options="field:'editPrices',title:'调整后单价',sortable:true"></th>
                <th data-options="field:'editOutNums',title:'调整后出库数',sortable:true"></th>
                <th data-options="field:'editLoans',title:'调整后被借调数',sortable:true"></th>
                <th data-options="field:'editNums',title:'调整后库存数',sortable:true"></th>
                <th data-options="field:'editTime',title:'调整时间',sortable:true"></th>
                <th data-options="field:'editRemark',title:'调整备注'"></th>
                <th data-options="field:'editName',title:'调整人'"></th>
                <th data-options="field:'editTye',title:'调整类型'"></th>
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
    <%--<a href="javascript:void(0)"--%>
    <%--data-toggle="topjui-menubutton"--%>
    <%--data-options="method:'doAjax',--%>
    <%--extend: '#userDg-toolbar',--%>
    <%--btnCls:'topjui-btn-brown',--%>
    <%--iconCls:'fa fa-trash',--%>
    <%--url:_ctx + '/json/response/success.json',--%>
    <%--grid: {uncheckedMsg:'请先勾选要删除的数据',param:'uuid:uuid,code:code'}">删除</a>--%>
    <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method:'search',
       extend: '#userDg-toolbar',
       btnCls:'topjui-btn-blue'">查询</a>
    <form id="queryForm" class="search-box">
        调整时间<input type="text" name="startTime" data-toggle="topjui-datebox"
                   data-options="id:'name',prompt:'开始时间',width:180">
        <input type="text" name="endTime" data-toggle="topjui-datebox"
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
<!-- 表格工具栏结束 -->

</body>
</html>