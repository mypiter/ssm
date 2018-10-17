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
    <title>纸板入库记录列表</title>
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
                       url:'${pageContext.request.contextPath}/json/data/cartonStorage.json', 
			            childTabs: [
                            {id:'eastTabs'}
                        ]">
                    <thead>
                    <tr>
                    	<th data-options="field: 'pur_id', title: 'UID', checkbox: true"></th>
                    	<th data-options="field: 'order_account', title: '采购单号', sortable: true"></th>
                    	<th data-options="field: 'batch', title: '批号', sortable: true"></th>
                        <th data-options="field: 'order_id', title: '订单号', sortable: true"></th>
                        <th data-options="field: 'custom_name', title: '客户名称', sortable: true"></th>
                        <th data-options="field: 'carton_name', title: '产品名称', sortable: true"></th>
                        <th data-options="field: 'material_science', title: '材质', sortable: true"></th>
                        <th data-options="field: 'pit_type', title: '楞型', sortable: true"></th>
                        <th data-options="field: 'size', title: '纸板尺寸', sortable: true"></th>
                        <th data-options="field: 'width_line', title: '宽度压线', sortable: true"></th>               
                        <th data-options="field: 'line_type', title: '压线类型', sortable: true"></th>  
                        <th data-options="field: 'purchase_number', title: '采购数量', sortable: true"></th>
                        <th data-options="field: 'num', title: '入库数量', sortable: true"></th>
                        <th data-options="field: 'return_number', title: '退回数', sortable: true"></th>
                        <th data-options="field: 'difference', title: '少数', sortable: true"></th>
                        <th data-options="field: 'singular', title: '开单数', sortable: true"></th>
                        <th data-options="field: 'price', title: '单价', sortable: true"></th>
                        <th data-options="field: 'p_price', title: '平方价', sortable: true"></th>
                        <th data-options="field: 'time', title: '入库时间', sortable: true"></th>               
                        <th data-options="field: 'admin_name', title: '入库员', sortable: true"></th>
                        <th data-options="field: 'reservoir', title: '库区位置', sortable: true"></th>
                        <th data-options="field: 'pallet_number', title: '托盘数', sortable: true"></th>
                        <th data-options="field: 'song_mr', title: '送货员', sortable: true"></th>
                        <th data-options="field: 'car_number', title: '车号', sortable: true"></th>
                        <th data-options="field: 'gong_number', title: '供方单号', sortable: true"></th>
                        <th data-options="field: 'content', title: '备注', sortable: true"></th>
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
       href:'cartonStrage_putin_label.jsp'">入库标签生成</a>
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
</body>
</html>