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
    <title>客户列表</title>
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
		<div data-options="region:'center',iconCls:'icon-reload',title:'',split:true,border:false,bodyCls:'border_left_right'">
		        <!-- datagrid表格 -->
                <table data-toggle="topjui-datagrid"
                       data-options="id:'userDg',
                        singleSelect:true,
					    selectOnCheck:false,
					    checkOnSelect:false,
                        url:'${pageContext.request.contextPath}/json/data/ticket.json',
			            childTabs: [
                            {id:'eastTabs'}
                        ]">
                    <thead>
                    <tr>
                        <th data-options="field: 'ticket_id', title: 'UID', checkbox: true"></th>
                        <th data-options="field: 'ticket_accout', title: '发票编号', sortable: true"></th>
                        <th data-options="field: 'ticket_object', title: '开票名称', sortable: true"></th>
                        <th data-options="field: 'ticket_money', title: '购买方', sortable: true"></th>
                         <th data-options="field: 'ticket_time', title: '销售方', sortable: true"></th>
                        <th data-options="field: 'ticket_time', title: '合计金额', sortable: true"></th>
                        <th data-options="field: 'ticket_time', title: '税额合计', sortable: true"></th>
                        <th data-options="field: 'ticket_time', title: '价税合计', sortable: true"></th>
                        <th data-options="field: 'ticket_time', title: '开票时间', sortable: true"></th>
                        <th data-options="field: 'ticket_time', title: '备注', sortable: true"></th>
                    </tr>
        
                    </thead>
                </table>
            </div>
 		<div data-options="region:'east',iconCls:'icon-chart_pie',title:'',split:true,border:false,width:'40%'">
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
            <div title="发票明细"
                 data-options="id:'eastTab0',iconCls:'fa fa-th',
					 href:'${pageContext.request.contextPath}/jsp/ticket/ticketInfo.jsp?ticket_id=1'"></div>
            
            </div>
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
       data-options="method:'openDialog',
        extend: '#userDg-toolbar',
       iconCls: 'fa fa-plus',
       dialog:{
           width: 800,
           height:400,
           id:'userAddDialog',
            href:_ctx + '/jsp/ticket/ticketAdd.jsp',
           buttonsGroup:[
               {text:'保存',url:'placeadd.action',iconCls:'fa fa-plus',handler:'ajaxForm',btnCls:'topjui-btn-brown'}
           ]
       }">新增</a>
		<!--  <input style="width:115px;height:35px" id="add" name="sub" onclick="addCartonType()" value="录入订单" type="button" /> -->
		<a href="javascript:void(0)" data-toggle="topjui-menubutton"
			data-options="method: 'openDialog',
            extend: '#userDg-toolbar',
            iconCls: 'fa fa-pencil',
            btnCls: 'topjui-btn-green',
            grid: {
                type: 'datagrid',
                id: 'userDg'
            },
            dialog: {
                width: 750,
                height: 400,
                href: 'add_place1.jsp?id={id}',
                url: 'placefindInfo.action?id={id}',
                buttonsGroup: [
                    {
                        text: '更新',
                        url: 'placeupdate.action',
                        iconCls: 'fa fa-save',
                        handler: 'ajaxForm',
                        btnCls: 'topjui-btn-green'
                    }
                ]
            }">编辑</a>
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
  
	</div>


<!-- 表格工具栏开始 -->
<!-- <div id="userDg-toolbar" class="topjui-toolbar"
     data-options="grid:{
           type:'datagrid',
           id:'userDg'
       }">
     <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method:'openDialog',
       extend: '#userDg-toolbar',
       iconCls: 'fa fa-plus',
      
       dialog:{
           width: 750,
           height: 400,
           id:'userAddDialog',
           href:_ctx + '/jsp/user/userAdd.jsp',
           buttonsGroup:[
               {text:'保存',url:_ctx + '/json/response/success.json',iconCls:'fa fa-plus',handler:'ajaxForm',btnCls:'topjui-btn-normal'}
           ]
       }">新增</a>
    <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method: 'openDialog',
            extend: '#userDg-toolbar',
            iconCls: 'fa fa-pencil',
            btnCls: 'topjui-btn',
            grid: {
                type: 'datagrid',
                id: 'userDg'
            },
            dialog: {
                width: 750,
                height: 400,
                href: _ctx + '/jsp/user/userAdd.jsp?transaction_id={UID}',
                url: _ctx + '/json/demo/userEdit.json?transaction_id={UID}',
                buttonsGroup: [
                    {
                        text: '更新',
                        url: _ctx + '/json/response/success.json',
                        iconCls: 'fa fa-save',
                        handler: 'ajaxForm',
                        btnCls: 'topjui-btn'
                    }
                ]
            }">编辑</a> -->
   <!--  <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method:'openTab',
       btnCls:'topjui-btn-warm',
       iconCls:'fa fa-database',
       tab:{
           title:'产品库',
           href:_ctx + '/jsp/user/user_model.jsp'
       }">查看成品库</a> -->
      <!--  <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method:'openTab',
       btnCls:'topjui-btn-normal',
       tab:{
           title:'个人产品库',
           href:_ctx + '/html/menu/openTab_index.html'}">查看个人产品库</a> -->
       
   <!--  <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method:'doAjax',
       extend: '#userDg-toolbar',
       btnCls:'topjui-btn-normal',
       iconCls:'fa fa-trash',
       url:_ctx + '/json/response/success.json',
       grid: {uncheckedMsg:'请先勾选要删除的数据',param:'uuid:uuid,code:code'}">删除</a>
   
    <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method:'filter',
       extend: '#userDg-toolbar',
       btnCls:'topjui-btn-warm'">过滤</a>
    <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method:'search',
       extend: '#userDg-toolbar',
       btnCls:'topjui-btn-danger'">查询</a>
    <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method:'import',
       extend: '#userDg-toolbar',
       iconCls: 'fa fa-plus',
       btnCls:'topjui-btn-normal',
       uploadUrl:_ctx + '/json/response/upload.json',
            url:_ctx+'/json/response/success.json'">导入</a> -->
     <!--    
    <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method:'export',
       extend: '#userDg-toolbar',
       btnCls:'topjui-btn',
       url:_ctx + '/json/response/export.html'">导出</a>
    <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method:'openTab',
       btnCls:'topjui-btn-normal',
       tab:{
           title:'这是新的Tab窗口',
           href:_ctx + '/html/menu/openTab_index.html'
       }">打开Tab窗口</a>
    <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method:'openWindow',
       extend: '#userDg-toolbar',
       btnCls:'topjui-btn-warm',
       href:'http://www.topjui.com?uuid={uuid}'">打开新窗口</a>
    <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method:'request',
       btnCls:'topjui-btn',
       url:_ctx + '/json/response/success.json'">执行普通请求</a> -->
    <!-- <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="menu:'#exportSubMenu',
       btnCls:'topjui-btn-danger',
       hasDownArrow:true,
       iconCls:'fa fa-list'">更多</a> 
    <div id="exportSubMenu" class="topjui-toolbar" style="width:150px;"> -->
        <!-- <div data-toggle="topjui-menubutton"
             data-options="method:'request',
             extend: '#userDg-toolbar',
             url:_ctx + '/json/response/success.json?uuid={uuid}'">导出 PDF 报表
        </div> -->
       <!--  <div data-toggle="topjui-menubutton"
             data-options="method:'export',
             extend: '#userDg-toolbar',
             url: _ctx + '/json/response/export.html'">导出EXCEL列表
        </div>
        <div data-toggle="topjui-menubutton"
             data-options="method:'request',
             extend: '#userDg-toolbar',
             url:_ctx + '/json/response/success.json?uuid={uuid}'">导出EXCEL报表
        </div>
        <div data-toggle="topjui-menubutton"
             data-options="method:'request',
             extend: '#userDg-toolbar',
             url:_ctx + '/json/response/success.json?uuid={uuid}'">导出WORD报表
        </div>
    </div>
    
</div> -->
<!-- 表格工具栏结束 -->
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
	
	$.ajax({
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