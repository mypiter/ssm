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
    <title>订单列表</title>
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
                       	url:'/PlaceController/loadPlaceList/',
			            childTabs: [
                            {id:'eastTabs'}
                        ]">
                    <thead>
                    <tr>
                        <th data-options="field: 'id', title: 'UID', checkbox: true"></th>
                        <th data-options="field:'orderAccount', title: '订单号', sortable: true,formatter: openNewTab"></th>
                        <th data-options="field:'customName', title: '客户名称', sortable: true"></th>
                        <th data-options="field:'cartonName', title: '产品名称', sortable: true"></th>
                        <th data-options="field:'customTel', title: '联系方式', sortable: true"></th>
                        <th data-options="field:'staffId', title: '业务员', sortable: true"></th>
                        <th data-options="field:'orderNum', title: '订单数量', sortable: true"></th>
                        <th data-options="field: 'orderTime', title: '下单日期', sortable: true"></th>
                        <th data-options="field: 'deliveryTime', title: '交货日期', sortable: true"></th>
                        <th data-options="field: 'orderState', title: '订单标识', sortable: true,
                        formatter:function(value,row,index){
                                    if (value == '0') {
                                        return '<font color=\'#1E9FFF\'>待采购</font>';
                                    } else if (value == '1') {
                                        return '<font color=\'#FF5722\'>待生产</font>';
                                    }else if (value == '2') {
                                        return '<font color=\'#FF5722\'>待入库</font>';
                                    }else if (value == '3') {
                                        return '<font color=\'#FF5722\'>待出库</font>';
                                    }else if (value == '4') {
                                        return '<font color=\'#FF5722\'>待配送</font>';
                                    }else if (value == '5') {
                                        return '<font color=\'#FF5722\'>配送中</font>';
                                    }else if (value == '6') {
                                        return '<font color=\'#009688\'>订单完成</font>';
                                    } else {
                                        return '';
                                    }
                                }"></th>
                        <th data-options="field:'materialScience', title: '材质', sortable: true"></th>
                        <th data-options="field:'pitType', title: '楞型', sortable: true"></th>
                        <th data-options="field: 'cartonLength', title: '长', sortable: true"></th>
                        <th data-options="field: 'cartonWidth', title: '宽', sortable: true"></th>
                        <th data-options="field: 'cartonHeight', title: '高', sortable: true"></th>
                        <th data-options="field: 'lengthLine', title: '长压线', sortable: true"></th>
                        <th data-options="field: 'widthLine', title: '宽压线', sortable: true"></th>
                        <th data-options="field:'lineType', title: '压线类型', sortable: true,
                        formatter:function(value,row,index){
                                    if (value == '1') {
                                        return '明线';
                                    } else if (value == '2') {
                                        return '暗线';
                                    } else {
                                        return '';
                                    }
                                }"></th>
                        <!-- <th data-options="field: 'completed_num', title: '刀模版号', sortable: true"></th>
                        <th data-options="field:'carton_spec', title: '印版号', sortable: true"></th>
                        <th data-options="field:'carton_spec', title: '印刷颜色', sortable: true"></th>
                        <th data-options="field:'carton_spec', title: '结合方式', sortable: true"></th>
                        <th data-options="field:'carton_spec', title: '工序', sortable: true"></th>
                        <th data-options="field:'carton_spec', title: '是否开票', sortable: true"></th>
                        <th data-options="field:'carton_spec', title: '合同编号', sortable: true"></th>
                        <th data-options="field:'carton_spec', title: '付款方式', sortable: true"></th>
                        <th data-options="field: 'delivery_time', title: '收货人', sortable: true"></th>
                        <th data-options="field: 'delivery_time', title: '收货人联系方式', sortable: true"></th>
                        <th data-options="field: 'delivery_time', title: '收货地址', sortable: true"></th> -->
                    </tr>
                    </thead>
                </table>
            </div>
        <%--<div data-options="region:'east',iconCls:'icon-chart_pie',title:'',split:true,border:false,width:'25%'">--%>
	        <%--<div data-toggle="topjui-tabs"--%>
	             <%--data-options="id:'eastTabs',--%>
	             <%--fit:true,--%>
	             <%--border:true,--%>
	             <%--bodyCls:'border_right_none',--%>
	             <%--parentGrid:{--%>
	                 <%--type:'datagrid',--%>
	                 <%--id:'userDg',--%>
	                 <%--param:'puuid:uuid'--%>
	             <%--}">--%>
	            <%--<div title="订单详情"--%>
	                 <%--data-options="id:'eastTab0',iconCls:'fa fa-th',--%>
						 <%--href:'../sale_register/place_order.jsp'"></div>--%>
					<%----%>
	        <%--</div>        --%>
        <%--</div>--%>
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
           title:'订单登记',
           href:'/AdminController/jsp/?url=/sale_register/place_order'
       }">新增</a>
        <a href="javascript:void(0)"
           data-toggle="topjui-menubutton"
           data-options="method:'openTab',
       extend: '#userDg-toolbar',
       iconCls:'fa fa-pencil',
           btnCls:'topjui-btn-blue',
       tab:{
           title:'编辑订单',
           href:'/PlaceController/edit/?url=/sale_register/place_order&placeId={id}'
       }">编辑</a>
    <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method:'doAjax',
       extend: '#userDg-toolbar',
       btnCls:'topjui-btn-brown',
       iconCls:'fa fa-trash',
       <%--confirmMsg:'这个是勾选复选框实现多条数据的Ajax删除提交操作，提交grid.param中指定的参数值',--%>
       grid: {uncheckedMsg:'请先勾选要删除的数据',param:'orderAccount:orderAccount,orderState:orderState'},
       url: '/PlaceController/deletePlace/'">删除</a>
    <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method:'search',
       extend: '#userDg-toolbar',
       btnCls:'topjui-btn-blue'">查询</a>
        <a href="javascript:void(0)"
           data-toggle="topjui-menubutton"
           data-options="method:'import',
       extend: '#userDg-toolbar',
       grid:{
           type:'datagrid',
           id:'userDg'
       },
       iconCls:'fa fa-cloud-upload',
       btnCls:'topjui-btn-orange',
       uploadUrl:'/Mian/uploadExcel/',
       url:'/Mian/importExcel/'">导入订单</a>
        <%--<a href="javascript:void(0)"--%>
           <%--data-toggle="topjui-menubutton"--%>
           <%--data-options="method:'openWindow',--%>
       <%--extend: '#userDg-toolbar',--%>
       <%--btnCls:'topjui-btn-black',--%>
       <%--iconCls:'fa fa-pencil',--%>
       <%--grid: {uncheckedMsg:'请先勾选要生成的数据',param:'orderAccount:orderAccount'},--%>
       <%--href: '/PlaceController/make/?url=/sale_report/production&orderAccount={orderAccount}&urll=http://demo.jxxiongshi.com/'">生成制造单</a>--%>
     <form id="queryForm" class="search-box">
        <input type="text" name="startTime" data-toggle="topjui-datebox"
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
                //     {
                //     text: '审批',
                //     iconCls: 'fa fa-save',
                //     btnCls: 'topjui-btn-green',
                //     handler: function () {
                //         LiuchengChuLi.openLiuchenChuliDialog();
                //     }
                // },
                 {
                    text: '关闭',
                    iconCls: 'fa fa-close',
                    btnCls: 'topjui-btn-red',
                    handler: function () {
                        $('#businessDialog').iDialog('close');
                    }
                }],
                // onLoad: function () {
                //     //加载表单数据
                //     $.getJSON(detailUrl, function (data) {
                //         $('#businessDialog').form('load', data);
                //     });
                // }
            });
    }
    // function openNewTab1(value, depUuid, businessId) {
    //     $.getJSON('/office/ewfRuVariable/getVariables', {
    //         depUuid: depUuid,
    //     }, function (data) {
    //         var editUrl, saveUrl, detailUrl;
    //         for (var i = 0; i < data.length; i++) {
    //             if (data[i]['variableName'] == "editUrl") {
    //                 editUrl = data[i]['variableValue'];
    //                 editUrl += editUrl.indexOf("?") > -1 ? "&uuid=" + businessId : "?uuid=" + businessId;
    //             }
    //             if (data[i]['variableName'] == "saveUrl") {
    //                 saveUrl = data[i]['variableValue'];
    //             }
    //             if (data[i]['variableName'] == "detailUrl") {
    //                 detailUrl = data[i]['variableValue'];
    //                 detailUrl += detailUrl.indexOf("?") > -1 ? '&uuid=' + businessId : "?uuid=" + businessId;
    //             }
    //         }
    //         $('#handleBtn').iDialog('openDialog', {
    //             id: 'businessDialog',
    //             title: '业务信息',
    //             iconCls: 'fa fa-key',
    //             href: editUrl,
    //             buttons: [{
    //                 text: '审批',
    //                 iconCls: 'fa fa-save',
    //                 btnCls: 'topjui-btn-green',
    //                 handler: function () {
    //                     LiuchengChuLi.openLiuchenChuliDialog();
    //                 }
    //             }, {
    //                 text: '关闭',
    //                 iconCls: 'fa fa-close',
    //                 btnCls: 'topjui-btn-red',
    //                 handler: function () {
    //                     $('#businessDialog').iDialog('close');
    //                 }
    //             }],
    //             onLoad: function () {
    //                 //加载表单数据
    //                 $.getJSON(detailUrl, function (data) {
    //                     $('#businessDialog').form('load', data);
    //                 });
    //             }
    //         });
    //     });
    // }
	
</script>
</body>
</html>