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
    <title>纸箱出库</title><!-- 正在使用 -->
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
    <div data-options="region:'center',iconCls:'icon-reload',title:'',split:true,border:false">
        <div data-toggle="topjui-layout" data-options="fit:true">
            <div data-options="region:'center',title:'',fit:false,split:true,border:false,bodyCls:'border_right_bottom'"
                 style="height:80%">
                <!-- datagrid表格 -->
                <table data-toggle="topjui-datagrid"
                       data-options="id:'userDg',
                        idField:'uuid',treeField:'taskType',
                        pagination:true,
                        striped:true,
                        fitColumns:true,
                        rownumbers: true,
                        url:'${pageContext.request.contextPath}/json/data/cartonOut.json',
			            childTabs: [
                            
                            {id:'eastTabs'}
                        ]">
                    <thead>
                    <tr>
                        <th data-options="field: 'cartonOut_id', title: 'cartonOut_id', checkbox: true"></th>
                        <th data-options="field:'order_account', title: '订单号', sortable: true"></th>
                        <th data-options="field: 'product_name', title: '产品名称', sortable: true"></th>
                        <th data-options="field: 'carton_length', title: '长', sortable: true"></th>
                        <th data-options="field: 'carton_width', title: '宽', sortable: true"></th>
                        <th data-options="field: 'carton_height', title: '高', sortable: true"></th>
                        <th data-options="field: 'material_name', title: '材质', sortable: true"></th>                   
                        <th data-options="field: 'pit_type_name', title: '楞型', sortable: true"></th>
                        <th data-options="field: 'order_num', title: '订单数量', sortable: true"></th>
                        <th data-options="field: 'out_num', title: '出库数量', sortable: true"></th>
                        <th data-options="field: 'reservoir', title: '库区位置', sortable: true"></th>
                        <th data-options="field: 'pallet_number', title: '托盘数', sortable: true"></th>
                        <th data-options="field: 'carton_price', title: '单价', sortable: true"></th>
                        <th data-options="field: 'carton_total', title: '总金额', sortable: true"></th>
                        <th data-options="field: 'deli_man', title: '配送人', sortable: true"></th>
                        <th data-options="field: 'deli_contact', title: '配送人联系方式', sortable: true"></th>
                        <th data-options="field: 'deli_license', title: '配送车牌号', sortable: true"></th>
                        <th data-options="field: 'deli_time', title: '配送时间', sortable: true"></th>
                      
                        
                    </tr>
                    </thead>
                </table>
            </div>
            
        </div>
    </div>
    </div>  
<!-- layout布局 结束 -->
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

</script>
</body>
</html>