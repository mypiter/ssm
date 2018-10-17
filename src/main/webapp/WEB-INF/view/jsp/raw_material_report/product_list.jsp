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
    <title>产品统计报表</title>
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
                       	url:'/ProductRegister/ProductList/',
			            childTabs: [
                            {id:'eastTabs'}
                        ]">
                    <thead>
                    <tr>
                        <th data-options="field: 'cartonId', title: 'UID', checkbox: true"></th>
                        <th data-options="field:'cartonName', title: '产品名称', sortable: true"></th>
                        <th data-options="field:'customName', title: '客户名称', sortable: true"></th>
                        <th data-options="field:'boxName', title: '箱型', sortable: true"></th>
                        <th data-options="field:'sizeType', title: '尺寸类型', sortable: true,
                        formatter:function(value,row,index){
                                    if (value == '1') {
                                        return '<font color=\'#FF5722\'>内径</font>';
                                    }else if (value == '2') {
                                        return '<font color=\'#FF5722\'>外径</font>';
                                    }else if (value == '3') {
                                        return '<font color=\'#FF5722\'>制造</font>';
                                    } else {
                                        return '';
                                    }
                                }"></th>
                        <th data-options="field:'cartonLength', title: '长', sortable: true"></th>
                        <th data-options="field:'cartonWidth', title: '宽', sortable: true"></th>
                        <th data-options="field:'cartonHeight', title: '高', sortable: true"></th>
                        <th data-options="field: 'materialName', title: '材质', sortable: true"></th>
                        <th data-options="field: 'pitType', title: '楞型', sortable: true"></th>
                        <th data-options="field: 'cartonPrice', title: '单价', sortable: true"></th>
                        <th data-options="field: 'lengthLine', title: '长度压线', sortable: true"></th>
                        <th data-options="field: 'widthLine', title: '宽度压线', sortable: true"></th>
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
                        <th data-options="field: 'workingProcedure', title: '生产工序', sortable: true<%--,
                        formatter:function(value,row,index){
                                    if (value == '1') {
                                        return '<font color=\'#FF5722\'>分纸</font>';
                                    }else if (value == '2') {
                                        return '<font color=\'#FF5722\'>印刷</font>';
                                    }else if (value == '3') {
                                        return '<font color=\'#FF5722\'>开槽</font>';
                                    }else if (value == '4') {
                                        return '<font color=\'#FF5722\'>模切</font>';
                                    }else if (value == '5') {
                                        return '<font color=\'#FF5722\'>粘合</font>';
                                    }else if (value == '6') {
                                        return '<font color=\'#009688\'>钉箱</font>';
                                    }else if (value == '7') {
                                        return '<font color=\'#009688\'>打包</font>';
                                    }else if (value == '8') {
                                        return '<font color=\'#009688\'>入库</font>';
                                    } else {
                                        return '';
                                    }
                                }--%>"></th>
                        <th data-options="field: 'knifePlateNum', title: '刀模版号', sortable: true"></th>
                        <th data-options="field: 'knifePlateName', title: '刀模名称', sortable: true"></th>
                        <th data-options="field:'printedId', title: '印版号', sortable: true"></th>
                        <th data-options="field:'printedName', title: '印版名称', sortable: true"></th>
                        <%--<th data-options="field:'cardSize', title: '纸板尺寸', sortable: true"></th>--%>


                        <!-- <th data-options="field:'carton_spec', title: '印刷颜色', sortable: true"></th>
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
           title:'产品添加',
           href:'/AdminController/jsp/?url=/raw_material_register/product_register'
       }">新增</a>
        <a href="javascript:void(0)"
           data-toggle="topjui-menubutton"
           data-options="method:'openTab',
       extend: '#userDg-toolbar',
       iconCls:'fa fa-pencil',
           btnCls:'topjui-btn-blue',
       tab:{
           title:'编辑产品',
           href:'/ProductRegister/edit/?url=/raw_material_register/product_register&cartonId={cartonId}'
       }">编辑</a>
    <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method:'doAjax',
       extend: '#userDg-toolbar',
       btnCls:'topjui-btn-brown',
       iconCls:'fa fa-trash',
       <%--confirmMsg:'这个是勾选复选框实现多条数据的Ajax删除提交操作，提交grid.param中指定的参数值',--%>
       grid: {uncheckedMsg:'请先勾选要删除的数据',param:'cartonId:cartonId,orderState:orderState'},
       url: '/ProductRegister/deleteProduct/'">删除</a>
    <%--<a href="javascript:void(0)" --%>
    	<%--data-toggle="topjui-menubutton" --%>
    	<%--data-options="method:'openWindow',--%>
       <%--extend: '#userDg-toolbar',--%>
       <%--btnCls:'topjui-btn-black',--%>
       <%--href:'code_show.jsp?id={plan_num}'">打印生产单</a>--%>
    <%--<a href="javascript:void(0)"--%>
       <%--data-toggle="topjui-menubutton"--%>
       <%--data-options="method:'filter',--%>
       <%--extend: '#userDg-toolbar',--%>
       <%--btnCls:'topjui-btn-black'">过滤</a>--%>
    <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method:'search',
       extend: '#userDg-toolbar',
       btnCls:'topjui-btn-blue'">查询</a>
     <%--<form id="queryForm" class="search-box">--%>
        <%--<input type="text" name="startTime" data-toggle="topjui-datetimebox"--%>
               <%--data-options="id:'name',prompt:'开始时间',width:180">--%>
        <%--<input type="text" name="endTime" data-toggle="topjui-datetimebox"--%>
               <%--data-options="id:'code',prompt:'结束时间',width:180">--%>
        <%--<a href="javascript:void(0)"--%>
           <%--data-toggle="topjui-menubutton"--%>
           <%--data-options="method:'query',--%>
           <%--iconCls:'fa fa-search',--%>
           <%--btnCls:'topjui-btn-blue',--%>
           <%--form:{id:'queryForm'},--%>
           <%--grid:{type:'datagrid','id':'userDg'}">查询</a>--%>
    <%--</form>--%>
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

    /*function openNewTab(value, row, index) {
        console.log(value);
        console.log(row);
        console.log(index);
        return '<a style="color:blue" href=\"javascript:openNewTab1(\'' + value + '\')\">' + value + '</a>';
    }*/
    /*function openNewTab1(value) {
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
    }*/
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