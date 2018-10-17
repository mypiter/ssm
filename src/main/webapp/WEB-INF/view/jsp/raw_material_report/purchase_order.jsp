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
    <title>纸板采购单列表</title>
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
                       	url:'/Purchase/findByPurOrderAll/',
			            childTabs: [
                            {id:'eastTabs'}
                        ]">
            <thead>
            <tr>
                <th data-options="field:'purchaseId',title:'id',checkbox:true"></th>
                <th data-options="field:'purchaseAccount',title:'采购单号',sortable:true"></th>
                <th data-options="field:'orderAccount',title:'订单号',sortable:true"></th>
                <th data-options="field:'customName',title:'客户名称'"></th>
                <th data-options="field:'cartonName',title:'产品名称'"></th>
                <th data-options="field:'supplierName',title:'供应商'"></th>
                <th data-options="field:'singlePrice',title:'单价',sortable:true"></th>
                <th data-options="field:'time',title:'采购日期',sortable:true"></th>
                <th data-options="field:'arrivalTime',title:'到货日期',sortable:true"></th>
                <th data-options="field:'num',title:'采购数',sortable:true"></th>
                <th data-options="field:'endNum',title:'到料数',sortable:true"></th>
                <th data-options="field:'consignee',title:'收货人'"></th>
                <th data-options="field:'cardboardSpec',title:'材质'"></th>
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
                <th data-options="field:'caigouName',title:'采购单样式'"></th>
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
       tab:{
           title:'新增采购单',
           href:'/AdminController/jsp/?url=/raw_material_register/purchase'
       }">新增</a>
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
                width: 950,
                height: 500,
                href:'/AdminController/jsp/?url=/raw_material_report/purchase_order_edit',
                url:'../../Purchase/findByPurId/?purchaseId={purchaseId}',
                buttonsGroup: [
                    {
                        text: '更新',
                        url: '../../Purchase/updatePurOrder/',
                        iconCls: 'fa fa-save',
                        handler: 'ajaxForm',
                        btnCls: 'topjui-btn-green'
                    }
                ]
            }">编辑</a>
    <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method:'doAjax',
       extend: '#userDg-toolbar',
       btnCls:'topjui-btn-brown',
       iconCls:'fa fa-trash',
       url:'/Purchase/updateByfakeS/',
       grid: {uncheckedMsg:'请先勾选要删除的数据',param:'purchaseId:purchaseId,purchaseAccount:purchaseAccount,orderAccount:orderAccount,num:num'}">删除</a>
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
       <%--windowHref:'/Purchase/printing/?url=/baobiao/purchaseOrder&purchaseAccount={purchaseAccount}&supplierId={supplierId}'">打印采购单</a>--%>
    <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method:'openWindow',
        extend: '#userDg-toolbar',
        grid: {uncheckedMsg:'请先勾选要打印的数据'},
        btnCls:'topjui-btn-black',
        iconCls:'fa fa-pencil',
        windowHref:'/Purchase/printing/?url=/baobiao/purchaseOrder2&purchaseAccount={multiple.purchaseAccount}&orderAccount={multiple.orderAccount}&supplierId={multiple.supplierId}&taiId={multiple.taiId}&caigouUrl={multiple.caigouUrl}'">打印采购单</a>
    <form id="queryForm" class="search-box">
        采购时间<input type="text" name="startTime" data-toggle="topjui-datebox"
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