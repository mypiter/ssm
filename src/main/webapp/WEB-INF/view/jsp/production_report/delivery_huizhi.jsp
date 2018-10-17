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
    <!-- 导入公共样式 -->
    <%@ include file="../ap.jsp" %>
    <title>成品退货赔款列表</title>
    <script type="text/javascript">
        $(document).ready(function(){
            //var html = $("#userDg").html();
            //console.info(html);

            //$("#userDg").click(function(a){
            //    alert(a);
            // });
        });
    </script>
</head>

<body>
<!-- layout布局 开始 -->
<div data-toggle="topjui-layout" data-options="fit:true">
    <div data-options="region:'center',title:'',fit:false,split:true,border:false,bodyCls:'border_right_bottom'">
        <!-- datagrid表格 -->
        <table data-toggle="topjui-datagrid"
               data-options="id:'userDg',
                        singleSelect:true,
					    selectOnCheck:false,
					    checkOnSelect:false,
                       	url:'/RejectedController/RejectedList/',
			            childTabs: [
                            {id:'eastTabs'}
                        ]">
            <thead>
            <tr>
                <th data-options="field: 'rejectedId', title: 'UID', checkbox: true"></th>
                <th data-options="field: 'orderAccount', title: '订单号', sortable: true,formatter: openNewTab"></th>
                <th data-options="field: 'deliveryNumber', title: '配送单号', sortable: true,formatter: openNewTabTwo"></th>
                <th data-options="field: 'rejectedProduct', title: '产品名称', sortable: true"></th>
                <th data-options="field: 'oderNum', title: '订单数量', sortable: true"></th>
                <th data-options="field: 'rejectedNum', title: '退货数量', sortable: true"></th>
                <th data-options="field: 'compensateTime', title: '退货时间', sortable: true"></th>
                <th data-options="field: 'compensateType', title: '退赔方式', sortable: true,
                        formatter:function(value,row,index){
                                    if (value == '1') {
                                        return '直接赔款';
                                    } else if (value == '2') {
                                        return '补数';
                                    }else {
                                        return '';
                                    }
                                }"></th>
                <th data-options="field: 'refillNum', title: '补数数量', sortable: true"></th>
                <th data-options="field: 'compensateMoney', title: '退赔金额', sortable: true"></th>
                <th data-options="field: 'compensateTime', title: '退赔时间', sortable: true"></th>
                <th data-options="field: 'rejectedCompany', title: '退货公司名称', sortable: true"></th>
                <th data-options="field: 'cartonPrice', title: '单价', sortable: true"></th>
                <%--<th data-options="field: 'allPrice', title: '总金额', sortable: true"></th>--%>
            </tr>
            </thead>
        </table>
    </div>
    <%--<div data-options="region:'east',iconCls:'icon-chart_pie',title:'',split:true,border:false,width:'25%'">
        <div data-toggle="topjui-tabs"
             data-options="id:'eastTabs',
             fit:true,
             border:true,
             bodyCls:'border_right_none',
             parentGrid:{
                 type:'datagrid',
                 id:'userDg',
                 param:'customId:customId'
             }">
            <div title="客户详情"
                 data-options="id:'eastTab0',iconCls:'fa fa-th',
					 href:'${pageContext.request.contextPath}/jsp/user/userInfo.jsp'"></div>

        </div>
    </div>--%>
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
           title:'成品退货赔款',
            href:'/AdminController/jsp/?url=/production_register/finished_return_compensate'
       }">新增</a>
    <a href="javascript:void(0)" data-toggle="topjui-menubutton"
       data-options="method: 'openTab',
            extend: '#userDg-toolbar',
            iconCls: 'fa fa-pencil',
            btnCls:'topjui-btn-blue',
            tab: {
                title:'编辑成品退货赔偿',
                href: '/RejectedController/edit/?url=/production_register/finished_return_compensate&rejectedId={rejectedId}'
            }">编辑</a>
    <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method:'doAjax',btnCls:'topjui-btn-brown',
       extend: '#userDg-toolbar',
       iconCls:'fa fa-trash',
       url:'/RejectedController/deleteRejected/',
       grid: {uncheckedMsg:'请先勾选要删除的数据',param:'rejectedId:rejectedId,plan_num:plan_num'}">删除</a>
    <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method:'search',
       extend: '#userDg-toolbar',
       btnCls:'topjui-btn-blue'">查询</a>

</div>


<!-- 表格工具栏结束 -->
<script type="text/javascript">
    $(function(){
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
    });
    function openNewTab(value, row, index) {
        console.log(value);
        console.log(row);
        console.log(index);
        return '<a style="color:blue" href=\"javascript:openNewTab1(\'' + value + '\')\">' + value + '</a>';
    }
    function openNewTab1(value) {
        console.log(value);
        var url="/PlaceController/jumpPlaceInfo/?url=/sale_report/placeInfo&orderAccount="+value;
        $('#handleBtn').iDialog('openDialog', {
            id: 'businessDialog',
            title: '订单详情',
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
    function openNewTabTwo(value, row, index) {
        console.log(value);
        console.log(row);
        console.log(index);
        return '<a style="color:blue" href=\"javascript:openNewTabTwo1(\'' + value + '\')\">' + value + '</a>';
    }
    function openNewTabTwo1(value) {
        console.log(value);
        var url="/CartonOutInfo/jumpCartonInfo/?url=/production_report/cartonOutInfoInfo&deliveryNumber="+value;
        $('#handleBtn').iDialog('openDialog', {
            id: 'businessDialog',
            title: '配送详情',
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