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
    <title>印版列表</title>
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
            url:'/PrintedController/PrintedList/',
            childTabs: [
                {id:'eastTabs'}
            ]">
        <thead>
         <tr>
            <th data-options="field: 'printedId', title: 'UID', checkbox: true"></th>
            <th data-options="field: 'printName', title: '印版名称', sortable: true"></th>
            <th data-options="field: 'printNum', title: '印版编号', sortable: true"></th>
            <th data-options="field: 'printPicture', title: '照片', sortable: true"></th>
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
           title:'印版登记',
            href:'/AdminController/jsp/?url=/raw_material_register/printing_plate'
       }">新增</a>
        <a href="javascript:void(0)" data-toggle="topjui-menubutton"
			data-options="method: 'openTab',
            extend: '#userDg-toolbar',
            iconCls: 'fa fa-pencil',
            btnCls:'topjui-btn-blue',
            tab: {
                title:'编辑印版',
                href: '/PrintedController/edit/?url=/raw_material_register/printing_plate&printedId={printedId}'
            }">编辑</a>
       <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method:'doAjax',btnCls:'topjui-btn-brown',
       extend: '#userDg-toolbar',
       iconCls:'fa fa-trash',
       url:'/PrintedController/deletePrinted/',
       grid: {uncheckedMsg:'请先勾选要删除的数据',param:'printedId:printedId,plan_num:plan_num'}">删除</a>
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
       // var body = $("#body").html();
       // console.info(body);
      
	});
	
	function huoqu(){
      	/* alert("没获取到"); */
      		/* var row = $('#userDg').detagrid('getSelected');
      		if(row){
      			alert('Item ID:' + row.itemid + "Price:" + row.listprice);
      		}else{
      			alert("没获取到");
      		} */
      };
	
</script>
</body>
</html>