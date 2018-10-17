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
    <title>成品库存调整列表</title>
    <script type="text/javascript">
        $(document).ready(function(){
        });
    </script>
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
                       	url:'/CartonRecord/findRecod/',
			            childTabs: [
                            {id:'eastTabs'}
                        ]">
            <thead>
            <tr>
                <th data-options="field: 'recordId', title: 'UID', checkbox: true"></th>
                <th data-options="field:'orderNumber', title: '配送单号', sortable: true,formatter: openNewTabThree"></th>
                <th data-options="field:'customer', title: '客户名称', sortable: true"></th>
                <th data-options="field:'productName', title: '产品名称', sortable: true"></th>
                <th data-options="field:'remark', title: '调整备注'"></th>
                <th data-options="field:'cartonNum', title: '纸箱调整前库存数量', sortable: true"></th>
                <th data-options="field:'cartonNewNum', title: '纸箱调整后库存数量', sortable: true"></th>
                <th data-options="field: 'cartonType', title: '调整类型', sortable: true"></th>
                <th data-options="field: 'cardboardTime', title: '调整时间', sortable: true"></th>
                <th data-options="field:'reservoirArea', title: '库区', sortable: true"></th>
                <th data-options="field:'operator', title: '操作人', sortable: true"></th>
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
           title:'成品库存调整',
           href:'/AdminController/jsp/?url=/production_register/finished_stock_adjustment'
       }">新增</a>
    <%--<a href="javascript:void(0)"--%>
       <%--data-toggle="topjui-menubutton"--%>
       <%--data-options="method:'openWindow',--%>
       <%--extend: '#userDg-toolbar',--%>
       <%--btnCls:'topjui-btn-black',--%>
       <%--href:'code_show.jsp?id={plan_num}'">打印报表</a>--%>
    <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method:'search',
       extend: '#userDg-toolbar',
       btnCls:'topjui-btn-blue'">查询</a>
    <form id="queryForm" class="search-box">
        <input type="text" name="startTime" data-toggle="topjui-datebox" data-options="width:200,required:true,prompt:'开始时间'">
        <input type="text" name="endTime" data-toggle="topjui-datebox" data-options="width:200,required:true,prompt:'结束时间'">
        <a href="javascript:void(0)"
           data-toggle="topjui-menubutton"
           data-options="method:'query',
           iconCls:'fa fa-search',
           btnCls:'topjui-btn-blue',
           form:{id:'queryForm'},
           grid:{type:'datagrid','id':'userDg'}">查询</a>
    </form>
</div>



<script type="text/javascript">
    $(function(){
        // alert("4164553453534");
        //测试
        $("#treetab th").tabs({
            onClick:function(node){
                alert(node.text);
            }
        });
        $('#queryBtn').iMenubutton({
            method: 'query',
            iconCls: 'fa fa-search',
            btnCls: 'topjui-btn-danger',
            form: {id: 'queryForm'},
            grid: {type: 'datagrid', 'id': 'productDg'}
        });
        // var body = $("#body").html();
        // console.info(body);

    });

    function openNewTabThree(value, row, index) {
        return '<a style="color:blue" href=\"javascript:openNewTabThree1(\'' + value + '\')\">' + value + '</a>';
    }
    function openNewTabThree1(value) {
        var url="/CartonRecord/jumpCarton/?url=/production_report/cartonRecordInfo&orderNumber="+value;
        $('#handleBtn').iDialog('openDialog', {
            id: 'businessDialog',
            title: '成品库存调整详情',
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