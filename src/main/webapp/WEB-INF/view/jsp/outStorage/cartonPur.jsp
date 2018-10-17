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
    <title>纸板出库记录列表</title>
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
                       	url:'${pageContext.request.contextPath}/json/data/cartonPur.json', 
			            childTabs: [
                            {id:'eastTabs'}
                        ]">
                    <thead>
                    <tr>
                    	<th data-options="field: 'ticket_id', title: 'UID', checkbox: true"></th>
                        <th data-options="field: 'ticket_accout', title: '订单号', sortable: true"></th>
                        <th data-options="field: 'order_num', title: '客户名称', sortable: true"></th>
                        <th data-options="field: 'order_num', title: '产品名称', sortable: true"></th>
                        <th data-options="field: 'order_num', title: '材质/楞型', sortable: true"></th>
                        <th data-options="field: 'order_num', title: '纸板尺寸', sortable: true"></th>
                        <th data-options="field: 'order_num', title: '压线规格', sortable: true"></th>
                        <th data-options="field: 'ticket_accout', title: '压线类型', sortable: true"></th>                      
                        <th data-options="field: 'ticket_accout', title: '订单数量', sortable: true"></th>
                        <th data-options="field: 'ticket_accout', title: '出库数量', sortable: true"></th>
                        <th data-options="field: 'ticket_accout', title: '单价', sortable: true"></th>
                        <th data-options="field: 'ticket_accout', title: '总价', sortable: true"></th>
                        <th data-options="field: 'order_num', title: '出库时间', sortable: true"></th> 
                        <th data-options="field: 'order_num', title: '备注', sortable: true"></th>
                    </tr>
                    </thead>
                </table>
            </div>
           <%--  <div data-options="region:'east',iconCls:'icon-chart_pie',title:'',split:true,border:false,width:'40%'">
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
	            <div title="出库详细信息"
	                 data-options="id:'eastTab0',iconCls:'fa fa-comment',
						 href:'${pageContext.request.contextPath}/jsp/outStorage/cartonPur_info.jsp'"></div>
			   </div>
	            
	        </div> --%>
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
       href:'cartonPur_out.jsp'">出库单生成</a>
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