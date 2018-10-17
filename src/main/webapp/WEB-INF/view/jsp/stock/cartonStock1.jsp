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
    <title>纸箱库存管理列表</title>
    <!-- 导入公共样式 -->
    <%@ include file="../ap.jsp" %>
</head>

<body>
<!-- layout布局 开始 -->
<div data-toggle="topjui-layout" data-options="fit:true">
    <div data-options="region:'center',iconCls:'icon-reload',title:'',split:true,border:false">
        <div data-toggle="topjui-layout" data-options="fit:true">
            <div data-options="region:'center',title:'',fit:false,split:true,border:false,bodyCls:'border_right_bottom'"
                 style="height:80%">
                <!-- datagrid表格 -->
                 <table data-toggle="topjui-datagrid"
		               data-options="id:'userDg',
		                    singleSelect:true,
						    selectOnCheck:false,
						    checkOnSelect:false,
		                    url:'${pageContext.request.contextPath}/json/data/cartonStock1.json',
		                    childTab: [{id:'eastTabs'}]">
		            <thead>
		                <tr>
		                	<th data-options="field: 'ticket_id', title: 'UID', checkbox: true"></th>
                        <th data-options="field: 'carton_price', title: '订单号', sortable: true"></th>
                        <th data-options="field: 'ticket_accout', title: '客户名称', sortable: true"></th>
                        <th data-options="field: 'ticket_accout', title: '业务员', sortable: true"></th>
                        <th data-options="field: 'ticket_money', title: '产品名称', sortable: true"></th>               
                        <th data-options="field: 'ticket_money', title: '订单数量', sortable: true"></th>
                        <th data-options="field: 'ticket_object', title: '材质/楞型', sortable: true"></th>
                        <th data-options="field: 'ticket_money', title: '纸箱尺寸', sortable: true"></th>                          
                        <th data-options="field: 'ticket_money', title: '单价', sortable: true"></th>                                     
                        <th data-options="field: 'ticket_money', title: '库存数量', sortable: true"></th>
                        <th data-options="field: 'ticket_money', title: '总价', sortable: true"></th>
                        <th data-options="field: 'ticket_money', title: '库区位置', sortable: true"></th>                                                                                        
                        <th data-options="field: 'ticket_money', title: '托盘数', sortable: true"></th>
                        <th data-options="field: 'ticket_money', title: '备注', sortable: true"></th>
		                </tr>
		            </thead>
		        </table>
            </div>
        </div>
    </div>
    <!-- <div data-options="region:'east',iconCls:'icon-chart_pie',title:'',split:true,border:false,width:'30%'">
        <div data-toggle="topjui-tabs"
             data-options="id:'eastTabs',
             fit:true,
             border:true,
             bodyCls:'border_right_none',
             parentGrid:{
                 type:'datagrid',
                 id:'userDg',
                 param:'puuid:uuid'
             }">
            <div title="库存记录备注详情"
                 data-options="id:'eastTab0',iconCls:'fa fa-th',
					 href:'cartonStockInfo.jsp?carton_price={carton_price}'"></div>
            
        </div>
    </div> -->
</div>
<!-- 表格工具栏开始 -->
<div id="userDg-toolbar" class="topjui-toolbar"
     data-options="grid:{
           type:'datagrid',
           id:'userDg'
       }">
   <!-- <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method:'openDialog',
       extend:'#productDg-toolbar',
       btnCls:'topjui-btn-green',
       dialog:{
           id:'formDialog',
            href:_ctx + '/jsp/stock/cartonStock_putin.jsp',
           height:500,
           width:900,
           buttonsGroup:[
               {text:'保存',url: _ctx + '/json/response/success.json',iconCls:'fa fa-plus',handler:'ajaxForm'}
           ]
       }">入库</a> -->
       <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method:'openDialog',
       extend:'#productDg-toolbar',
       btnCls:'topjui-btn-green',
       dialog:{
           id:'formDialog',
            href:_ctx + '/jsp/stock/cartonStockAdd.jsp',
           height:400,
           width:700,
           buttonsGroup:[
               {text:'保存',url: _ctx + '/json/response/success.json',iconCls:'fa fa-plus',handler:'ajaxForm'}
           ]
       }">入库</a>
         <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="extend:'#productDg-toolbar',
       iconCls:'fa fa-pencil',
       btnCls:'topjui-btn-brown',
       onClick:myDialog">出库</a>
       <!-- <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="extend:'#productDg-toolbar',
       iconCls:'fa fa-pencil',
       btnCls:'topjui-btn-brown',
       onClick:jDialog">借调</a> -->
		<!--  <input style="width:115px;height:35px" id="add" name="sub" onclick="addCartonType()" value="录入订单" type="button" /> -->
		<a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method: 'openDialog',
       extend: '#userDg-toolbar',
       iconCls: 'fa fa-cog',
       btnCls: 'topjui-btn-red',
       grid: {
           type: 'datagrid',
           id: 'userDg',
           param:'uuid:uuid,code',
           uncheckedMsg:'请先选择你要调整的订单'
       },
       dialog: {
           title: '这里填写要调整的内容',
            href: 'cartonStock1_adjustment.jsp',
           buttonsGroup: [
               {
                   text: '提交',
                   url: _ctx + '/json/response/success.json',
                   iconCls: 'fa fa-cog',
                   handler: 'multiAjaxForm',
                   btnCls: 'topjui-btn-green'
               }
           ]
       }">批量调整</a>
       <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method:'doAjax',btnCls:'topjui-btn-brown',
       extend: '#userDg-toolbar',
       iconCls:'fa fa-trash',
       url:'placedelete.action',
       grid: {uncheckedMsg:'请先勾选要删除的数据',param:'id:id,plan_num:plan_num'}">删除</a>
	   <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method:'search',
       extend: '#userDg-toolbar',
       btnCls:'topjui-btn-blue'">查询</a>
	   <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method:'filter',
       extend: '#userDg-toolbar',
       btnCls:'topjui-btn-black'">过滤</a>
       <!--  <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method:'openDialog',
       extend:'#productDg-toolbar',
       btnCls:'topjui-btn-green',
       dialog:{
           id:'formDialog',
            href:_ctx + '/jsp/stock/carton_w.jsp',
           height:250,
           width:900,
           buttonsGroup:[
               {text:'保存',url: _ctx + '/json/response/success.json',iconCls:'fa fa-plus',handler:'ajaxForm'}
           ]
       }">库存预警</a> -->
</div>
<script>
function myDialog() {
        $('<div></div>').iDialog({
            id: 'myDialog',
            title: '出库',
            closed: false,
            height: 650,
            width:990,
            href:_ctx + '/jsp/stock/cartonStock_out.jsp',
            buttons: [
                {text: '保存', iconCls: 'fa fa-plus', btnCls: 'topjui-btn-green', handler: ajaxSubmit},
                {text: '关闭', iconCls: 'fa fa-no', btnCls: 'topjui-btn-red', handler: closeMyDialog}
            ]
        });
    }
    function jDialog() {
        $('<div></div>').iDialog({
            id: 'myDialog',
            title: '借调',
            closed: false,
            height: 650,
            width: 850,
            href:_ctx + '/jsp/stock/carton_jd.jsp',
            buttons: [
                {text: '保存', iconCls: 'fa fa-plus', btnCls: 'topjui-btn-green', handler: ajaxSubmit},
                {text: '关闭', iconCls: 'fa fa-no', btnCls: 'topjui-btn-red', handler: closeMyDialog}
            ]
        })
    }
    var ajaxSubmit = function () {
        $.iMessager.alert('操作提示', '我是点击提交按钮执行的方法', 'messager-info');
    }
    var closeMyDialog = function () {
        $('#myDialog').dialog('close');
        $('#myDialog').dialog('destroy');
    }
</script>
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
	
	/* $.ajax({
	     url:remoteHost+'/system/organization/getListByCodeSetIdAndLevelId?codeSetId=A&levelId=1',
	     data:null,
	     type:"post",
	     dataType:"json",
	     success:function(data){
	         console.info(JSON.stringify(data));
	          
	     }
	});
	$.ajax({
	     url:remoteHost+'/system/organization/getListByPid?pid=3',
	     data:null,
	     type:"post",
	     dataType:"json",
	     success:function(data){
	         console.info(JSON.stringify(data));
	     }
	}); */
	
	
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
<!-- 表格工具栏结束 -->
</body>
</html>