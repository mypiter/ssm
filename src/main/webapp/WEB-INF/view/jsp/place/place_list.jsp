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
    <title>纸箱出库记录</title>
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
                        <th data-options="field: 'uuid', title: 'UID', checkbox: true"></th>
                        <th data-options="field:'user_tel', title: '客户名称', sortable: true"></th>
                        <th data-options="field:'order_account', title: '订单号', sortable: true"></th>
                        <th data-options="field:'user_company', title: '公司名称', sortable: true"></th>                        
                        <th data-options="field:'model_name', title: '产品名称', sortable: true"></th>
                        <th data-options="field:'user_tel', title: '联系方式', sortable: true"></th>
                        <th data-options="field:'model_name', title: '业务员', sortable: true"></th>
                        <th data-options="field: 'order_time', title: '箱型', sortable: true"></th>
                        <th data-options="field: 'order_time', title: '生产尺寸', sortable: true"></th>
                        <th data-options="field: 'order_time', title: '压线规格', sortable: true"></th>
                        <th data-options="field: 'order_time', title: '纸板尺寸', sortable: true"></th>
                        <th data-options="field:'material_science', title: '材质/楞型', sortable: true"></th>
                        <th data-options="field:'pit_type', title: '单价 ', sortable: true"></th>
                        <th data-options="field:'order_num', title: '订单数量', sortable: true"></th>
                        <th data-options="field:'carton_spec', title: '总金额', sortable: true"></th>
                        <th data-options="field: 'completed_num', title: '刀模版号', sortable: true"></th>
                        <th data-options="field:'carton_spec', title: '印版号', sortable: true"></th>
                        <th data-options="field:'carton_spec', title: '印刷颜色', sortable: true"></th>
                        <th data-options="field:'carton_spec', title: '结合方式', sortable: true"></th>
                        <th data-options="field:'carton_spec', title: '压线类型', sortable: true"></th>
                        <th data-options="field:'carton_spec', title: '工序', sortable: true"></th>
                        <th data-options="field:'carton_spec', title: '是否开票', sortable: true"></th>
                        <th data-options="field:'carton_spec', title: '合同编号', sortable: true"></th>
                        <th data-options="field:'carton_spec', title: '付款方式', sortable: true"></th>
                        <th data-options="field:'carton_spec', title: '面纸尺寸', sortable: true"></th>
                        <th data-options="field:'carton_spec', title: '面纸材质', sortable: true"></th>
                        <th data-options="field: 'order_time', title: '交货日期', sortable: true"></th>
                        <th data-options="field: 'order_time', title: '下单日期', sortable: true"></th>
                        <th data-options="field: 'delivery_time', title: '地址', sortable: true"></th>
                    </tr>
                    </thead>
                </table>
            </div>
           <div data-options="region:'east',iconCls:'icon-chart_pie',title:'',split:true,border:false,width:'25%'">
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
	            <div title="订单详情"
	                 data-options="id:'eastTab0',iconCls:'fa fa-th',
						 href:'place_info.jsp'"></div>
					
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
       data-options="method:'filter',
       extend: '#userDg-toolbar',
       btnCls:'topjui-btn-warm'">过滤</a>
    <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method:'search',
       extend: '#userDg-toolbar',
       btnCls:'topjui-btn-danger'">查询</a>
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