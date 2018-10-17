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
    <title>纸箱入库列表</title>
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
                      url:'${pageContext.request.contextPath}/json/data/cartonStock1.json',
			            childTabs: [
                            {id:'eastTabs'}
                        ]">
                    <thead>
                    <tr>
                    	<th data-options="field: 'ticket_id', title: 'UID', checkbox: true"></th>
                         <th data-options="field: 'carton_price', title: '订单号', sortable: true"></th>
                        <th data-options="field: 'carton_price', title: '客户名称', sortable: true"></th>
                        <th data-options="field: 'ticket_accout', title: '业务员', sortable: true"></th>
                        <th data-options="field: 'ticket_accout', title: '产品名称', sortable: true"></th>
                        <th data-options="field: 'ticket_object', title: '订单数量', sortable: true"></th>
                        <th data-options="field: 'ticket_object', title: '入库数量', sortable: true"></th>
                         <th data-options="field: 'ticket_money', title: '入库时间', sortable: true"></th>
                        <th data-options="field: 'ticket_object', title: '库区位置', sortable: true"></th>
                        <th data-options="field: 'ticket_object', title: '单价', sortable: true"></th>
                        <th data-options="field: 'ticket_object', title: '总金额', sortable: true"></th>
                        <th data-options="field: 'ticket_money', title: '材质/楞型', sortable: true"></th>  
                        <th data-options="field: 'ticket_name', title: '纸箱尺寸', sortable: true"></th>
                        <th data-options="field: 'deli_time', title: '备注', sortable: true"></th>
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
       data-options="method:'openWindow',
       extend: '#userDg-toolbar',
       btnCls:'topjui-btn-black',
       href:'cartonStrage1_putin_label.jsp'">入库标签生成</a>
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
   <form id="queryForm" class="search-box">
        <input type="text" name="startTime" data-toggle="topjui-datetimebox"
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