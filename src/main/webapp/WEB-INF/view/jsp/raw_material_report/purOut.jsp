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
    <title>纸板出库记录</title>
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
                       	url:'/OutStorage/findByPurOut/',
			            childTabs: [
                            {id:'eastTabs'}
                        ]">
            <thead>
            <tr>
                <th data-options="field:'purId',title:'id',checkbox:true"></th>
                <th data-options="field:'purNumber',title:'出库单号',sortable:true"></th>
                <th data-options="field:'orderAccount',title:'订单号',sortable:true"></th>
                <th data-options="field:'customName',title:'客户名称'"></th>
                <th data-options="field:'cartonName',title:'产品名称'"></th>
                <th data-options="field:'num',title:'出库数量',sortable:true"></th>
                <th data-options="field:'time',title:'出库时间',sortable:true"></th>
                <th data-options="field:'leader',title:'领料人'"></th>
                <th data-options="field:'adminName',title:'出库员'"></th>
                <th data-options="field:'materialScience',title:'材质'"></th>
                <th data-options="field:'pitType',title:'楞型'"></th>
                <th data-options="field:'cardboardLength',title:'纸板长',sortable:true"></th>
                <th data-options="field:'cardboardWidth',title:'纸板宽',sortable:true"></th>
                <th data-options="field:'widthLine',title:'宽压线'"></th>
                <th data-options="field:'lineType',title:'压线类型',sortable:true,
                                formatter:function(value,row,index){
                                if (value == '1') {
                                return '明线';
                                } else if (value == '2') {
                                return '暗线';
                                } else {
                                return '';
                                }
                                }"></th>
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
    <%--<a href="javascript:void(0)"--%>
           <%--data-toggle="topjui-menubutton"--%>
           <%--data-options="method:'openWindow',--%>
       <%--extend: '#userDg-toolbar',--%>
       <%--btnCls:'topjui-btn-black',--%>
       <%--iconCls:'fa fa-pencil',--%>
       <%--windowHref: '/PlaceController/make/?url=/sale_report/production&orderAccount={orderAccount}&num={num}'">生成制造单</a>--%>
        <a href="javascript:void(0)"
        data-toggle="topjui-menubutton"
        data-options="method:'openWindow',
        extend: '#userDg-toolbar',
        grid: {uncheckedMsg:'请先勾选要打印的数据'},
        btnCls:'topjui-btn-black',
        iconCls:'fa fa-pencil',
        windowHref:'/PlaceController/make/?url=/sale_report/production&orderAccount={multiple.orderAccount}&num={multiple.num}'">生产制造单</a>
        <form id="queryForm" class="search-box">
        出库时间<input type="text" name="startTime" data-toggle="topjui-datebox"
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