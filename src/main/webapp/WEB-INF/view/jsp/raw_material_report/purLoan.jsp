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
    <title>纸板借调记录</title>
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
                       	url:'/CartonLoan/findlist/',
			            childTabs: [
                            {id:'eastTabs'}
                        ]">
            <thead>
            <tr>
                <th data-options="field:'cartonLoanId',title:'UUID',checkbox:true"></th>
                <th data-options="field:'bSecondedCustomer',title:'被借调客户',sortable:true"></th>
                <th data-options="field:'bOrderAccount',title:'被借调订单号',sortable:true,formatter: openNewTabFox"></th>
                <th data-options="field:'secondedCustomer',title:'借调客户',sortable:true"></th>
                <th data-options="field:'orderAccount',title:'借调订单',sortable:true,formatter: openNewTabFox"></th>
                <th data-options="field:'material',title:'材质'"></th>
                <th data-options="field:'fluteType',title:'楞型'"></th>
                <th data-options="field:'size',title:'规格',sortable:true"></th>
                <th data-options="field:'cartonLoanNum',title:'借调数',sortable:true"></th>
                <th data-options="field:'cartonLoanTime',title:'借调时间',sortable:true"></th>
                <th data-options="field:'cent',title:'备注'"></th>
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
        借调时间<input type="text" name="startTime" data-toggle="topjui-datebox" data-options="width:200,prompt:'开始时间'">
        <input type="text" name="endTime" data-toggle="topjui-datebox" data-options="width:200,prompt:'结束时间'">
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
<script>
    function openNewTabFox(value, row, index) {
        console.log(value);
        console.log(row);
        console.log(index);
        return '<a style="color:blue" href=\"javascript:openNewTabFox1(\'' + value + '\')\">' + value + '</a>';
    }
    function openNewTabFox1(value) {
        console.log(value);
        var url="/CartonStock/jumpCartonInfo/?url=/production_report/cartonStockInfo&orderAccount="+value;
        $('#handleBtn').iDialog('openDialog', {
            id: 'businessDialog',
            title: '成品仓库详情',
            iconCls: 'fa fa-key',
            href: url,
            height:650,
            width:1000,
            buttons: [
                {
                    text: '关闭',
                    iconCls: 'fa fa-close',
                    btnCls: 'topjui-btn-red',
                    handler: function () {
                        $('#businessDialog').iDialog('close');
                    }
                }],
        });
    }
</script>
</body>
</html>