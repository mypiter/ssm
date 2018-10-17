<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>楞型设置</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<!-- 导入公共样式 -->
    <%@ include file="/jsp/ap.jsp" %>
  </head>
  <style>
	#zhiban{width: 600px;margin: 0 auto;  border: 1px solid #ccc;}
	#zhiban th{font-size:20px;font-family:'黑体'; height: 30px;}
	#zhiban td{font-size:16px; line-height: 20px;  height: 30px;}
	#zhiban td a{margin-left: 30px;}
  </style>
  <body>
	<button class="layui-btn">保存</button>
  	<!-- 纸张设置table Start -->
	<table id="zhiban" border="1" >
		<tr>
			<th>操作</th>
			<th>名称</th>
			<th>瓦楞</th>
			<th>折率</th>
			<th>厚度</th>
			<th>面积系数</th>
			<th>体积系数</th>
		</tr>
		<tr id="tr1">
			<td><a href="javascript:void(0)" title="新增" onclick="add1()"><i class="fa fa-plus"></i></a></td><!-- <i class="fa fa-minus"></i> -->
		</tr>
	</table>
	<!-- 纸张设置table End -->
	<script type="text/javascript">
		/* 纸板材料 */
		function add1(){
			var html1="";
			html1 += "<tr>";
			html1 += "<td><a href=\"javascript:void(0)\" title=\"删除\" onclick=\"delet1(this)\"><i class=\"fa fa-minus\"></i></a></td>";
			html1 += "<td contentEditable=\"true\"></td>";
			html1 += "<td contentEditable=\"true\"></td>";
			html1 += "<td contentEditable=\"true\"></td>";
			html1 += "<td contentEditable=\"true\"></td>";
			html1 += "<td contentEditable=\"true\"></td>";
			html1 += "<td contentEditable=\"true\"></td>";
			html1 += "</tr>";
			$("#tr1").before(html1);
		};
		function delet1(e1){
			e1.parentElement.parentElement.remove();
		};
	</script>
  </body>
</html>
