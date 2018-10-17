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
    <title>发票记录</title>
</head>
<body>
<!-- layout布局 开始 -->
<div data-toggle="topjui-layout" data-options="fit:true">
    <div data-options="region:'center',title:'',fit:false,split:true,border:false,bodyCls:'border_right_bottom'"
         style="height:60%">
        <!-- datagrid表格 -->
        <table data-toggle="topjui-datagrid"
               data-options="id:'userDg',
                        idField:'stockId',<%--指明哪一个字段是标识字段。--%>
                        treeField:'taskType',
                        pagination:true,<%--如果为true，则在DataGrid控件底部显示分页工具栏。--%>
                        striped:true,<%--是否显示斑马线效果。--%>
                        fitColumns:true,<%--真正的自动展开/收缩列的大小，以适应网格的宽度，防止水平滚动。--%>
                        rownumbers: true,<%--如果为true，则显示一个行号列。--%>

                        singleSelect:true,<%--如果为true，则只允许选择一行。--%>
					    selectOnCheck:false,<%--如果为true，单击复选框将永远选择行。如果为false，选择行将不选中复选框。--%>
					    checkOnSelect:false,<%--如果为true，当用户点击行的时候该复选框就会被选中或取消选中。如果为false，当用户仅在点击该复选框的时候才会呗选中或取消。--%>
                        url:'/Ticket/findByTicket/',
			            childTab: [{id:'southTabs'}]">
            <thead>
            <tr>
                <th data-options="field:'ticketId',title:'uuid',checkbox:true"></th>
                <th data-options="field:'type',title:'类型',sortable:true,
                                formatter:function(value,row,index){
                                if (value == '1') {
                                return '开出';
                                } else if (value == '2') {
                                return '接收';
                                } else {
                                return '';
                                }
                                }"></th>
                <th data-options="field:'ticketName',title:'发票名称'"></th>
                <th data-options="field:'ticketHolder',title:'开票方'"></th>
                <th data-options="field:'ticketCollector',title:'收票方'"></th>
                <th data-options="field:'ticketMoney',title:'金额',sortable:true"></th>
                <th data-options="field:'cess',title:'税率'"></th>
                <th data-options="field:'ticketAdValoremTotal',title:'税额'"></th>
                <th data-options="field:'ticketTime',title:'开票时间',sortable:true"></th>
                <th data-options="field:'contacts',title:'联系人'"></th>
                <th data-options="field:'contactsTel',title:'电话'"></th>
                <th data-options="field:'ticketRemark',title:'备注'"></th>
            </tr>
            </thead>
        </table>
    </div>
    <div data-options="region:'south',fit:false,split:true,border:false"
         style="height:40%">
        <div data-toggle="topjui-tabs"
             data-options="id:'southTabs',
             fit:true,
             border:false,
             parentGrid:{
                 type:'datagrid',
                 id:'userDg',
                 param:'ticketId:ticketId'
             }">
            <div title="发票货物详情" data-options="id:'tab0',iconCls:'fa fa-th'">
                <!-- datagrid表格 -->
                <table data-toggle="topjui-datagrid"
                       data-options="id:'southTab0',
                               initCreate: false,
                               fitColumns:true,
						       url:'/TicketProduct/findByTicketProduct/'">
                    <thead>
                    <tr>
                        <th data-options="field:'ticketProductId',title:'UUID',checkbox:true"></th>
                        <th data-options="field:'ticketProductName',title:'产品名称'"></th>
                        <th data-options="field:'ticketNum',title:'数量',sortable:true"></th>
                        <th data-options="field:'ticketUnit',title:'单位'"></th>
                        <th data-options="field:'ticketPrice',title:'单价',sortable:true"></th>
                        <th data-options="field:'ticketProductMoney',title:'金额',sortable:true"></th>
                    </tr>
                    </thead>
                </table>
            </div>
            <%--<div title="Panel面板"--%>
            <%--data-options="id:'tab8',--%>
            <%--iconCls:'fa fa-th',--%>
            <%--href:'https://www.topjui.com?uuid={uuid}'"></div>--%>
        </div>
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
       iconCls: 'fa fa-plus',
       btnCls: 'topjui-btn-green',
       tab:{
           title:'开发票',
           href:'/AdminController/jsp/?url=/finance_register/invoice_registration'
       }">开发票</a>
    <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method:'openTab',
       extend: '#userDg-toolbar',
       iconCls: 'fa fa-plus',
       btnCls: 'topjui-btn-green',
       tab:{
           title:'接收发票',
           href:'/AdminController/jsp/?url=/finance_register/receipt_invoices'
       }">接收发票</a>
    <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method:'doAjax',
       extend: '#userDg-toolbar',
       btnCls:'topjui-btn-brown',
       iconCls:'fa fa-trash',
       url:'/Ticket/updateFake/',
       grid: {uncheckedMsg:'请先勾选要删除的数据',param:'ticketId:ticketId'}">删除</a>
    <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method:'search',
       extend: '#userDg-toolbar',
       btnCls:'topjui-btn-blue'">查询</a>
    <form id="queryForm" class="search-box">
        开票时间<input type="text" name="startTime" data-toggle="topjui-datetimebox"
               data-options="id:'name',prompt:'开始时间',width:180">
        <input type="text" name="endTime" data-toggle="topjui-datetimebox"
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

<!-- 可编辑表格工具栏 -->
<%--<div id="southTab1-toolbar" data-options="grid:{--%>
<%--type:'edatagrid',--%>
<%--id:'southTab1'--%>
<%--},parentGrid:{--%>
<%--type:'datagrid',--%>
<%--id:'userDg'--%>
<%--}" class="topjui-toolbar">--%>
<%--<a href="javascript:void(0)"--%>
<%--data-toggle="topjui-menubutton"--%>
<%--data-options="method:'edatagrid',--%>
<%--extend: '#southTab1-toolbar',--%>
<%--iconCls:'fa fa-plus',--%>
<%--btnCls:'topjui-btn-green',--%>
<%--type:'addRow'">新增</a>--%>
<%--<a href="javascript:void(0)"--%>
<%--data-toggle="topjui-menubutton"--%>
<%--data-options="method:'edatagrid',--%>
<%--extend: '#southTab1-toolbar',--%>
<%--iconCls:'fa fa-save',--%>
<%--btnCls:'topjui-btn-brown',--%>
<%--type:'saveRow'">保存</a>--%>
<%--<a href="javascript:void(0)"--%>
<%--data-toggle="topjui-menubutton"--%>
<%--data-options="method:'edatagrid',--%>
<%--extend: '#southTab1-toolbar',--%>
<%--iconCls:'fa fa-remove',--%>
<%--btnCls:'topjui-btn-black',--%>
<%--type:'cancelRow'">取消</a>--%>
<%--<a href="javascript:void(0)"--%>
<%--data-toggle="topjui-menubutton"--%>
<%--data-options="method:'doAjax',--%>
<%--extend: '#southTab1-toolbar',--%>
<%--iconCls:'fa fa-remove',--%>
<%--btnCls:'topjui-btn-blue',--%>
<%--url:_ctx + '/json/response/delete.json'">删除</a>--%>
<%--<a href="javascript:void(0)"--%>
<%--data-toggle="topjui-menubutton"--%>
<%--data-options="method:'filter',--%>
<%--extend: '#southTab1-toolbar',--%>
<%--btnCls:'topjui-btn-black'">过滤</a>--%>
<%--<a href="javascript:void(0)"--%>
<%--data-toggle="topjui-menubutton"--%>
<%--data-options="method:'search',--%>
<%--extend: '#southTab1-toolbar',--%>
<%--btnCls:'topjui-btn-blue'">查询</a>--%>
<%--</div>--%>

<script>
    var rowEditingIndex = 0;

    function onEdit(index, row) {
        rowEditingIndex = index;
    }

    function onSelect(record) {
        setGridFieldsValue("southTab1", rowEditingIndex, ["id", "mobile"], ["email", "mobile"], record, "mobile");
    }

    function onBeforeLoad(param) {
        var row = getSelectedRowData('datagrid', 'userDg');
        param.email = row.email;
    }
</script>

</body>
</html>