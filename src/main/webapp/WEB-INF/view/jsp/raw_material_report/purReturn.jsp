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
    <title>纸板退货记录</title>
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
                       	url:'/PurRejected/findByPurReturn/',
			            childTabs: [
                            {id:'eastTabs'}
                        ]">
            <thead>
            <tr>
                <th data-options="field:'rejectedId',title:'id',checkbox:true"></th>
                <th data-options="field:'orderAccount',title:'订单号',sortable:true"></th>
                <th data-options="field:'batchNumber',title:'批号',sortable:true"></th>
                <th data-options="field:'purPrice',title:'单价',sortable:true"></th>
                <th data-options="field:'materialsNumber',title:'来料数',sortable:true"></th>
                <th data-options="field:'rejectedNum',title:'退货数量',sortable:true"></th>
                <th data-options="field:'compensateMoney',title:'补数',sortable:true"></th>
                <th data-options="field:'money',title:'直接赔款',sortable:true"></th>
                <th data-options="field:'causeOfReturn',title:'退货原因'"></th>
                <th data-options="field:'rejectedTime',title:'退货时间',sortable:true"></th>
                <th data-options="field:'supplierName',title:'供应商名称'"></th>
                <th data-options="field:'supperSpec',title:'供方材质'"></th>
                <th data-options="field:'materialName',title:'材质'"></th>
                <th data-options="field:'pitType',title:'楞型'"></th>
                <th data-options="field:'blankingSize',title:'尺寸',sortable:true"></th>
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
                <th data-options="field:'rejectedRemarks',title:'备注'"></th>
                <th data-options="field:'registrant',title:'经手人'"></th>
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
        退货时间<input type="text" name="startTime" data-toggle="topjui-datebox"
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