<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>箱型公式设置</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!-- 导入公共样式 -->
    <%@ include file="/jsp/ap.jsp" %>
  </head>
  <style>
  	.hang{margin: 4px 0;}
  </style>
  <body>
  	<div class="hang">
 		<span>&nbsp;箱型编号&nbsp;</span><input type="text" name="userNameId" data-toggle="topjui-textbox" style="width:150px;">
 		<span>&nbsp;箱型名称&nbsp;</span><input type="text" name="userNameId" data-toggle="topjui-textbox" style="width:110px;">
 		<span>&nbsp;类&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;型&nbsp;</span><input type="text" name="sex" data-toggle="topjui-combobox" data-options="data:[{value:1,text:'板片'},{value:2,text:'纸板'}]" style="width:110px;">
 		<span>&nbsp;成&nbsp;箱&nbsp;数&nbsp;</span><input type="text" name="userNameId" data-toggle="topjui-textbox" style="width:100px;">
		<span>&nbsp;搭口类型&nbsp;</span><input type="text" name="sex" data-toggle="topjui-combobox" data-options="data:[{value:1,text:'全搭'},{value:2,text:'纸板'}]" style="width:110px;">
	</div>
	<div class="hang">
		<span>&nbsp;长度压线&nbsp;</span><input type="text" name="userNameId" data-toggle="topjui-textbox" style="width:325px;">
		<span>&nbsp;宽度压线&nbsp;</span><input type="text" name="userNameId" data-toggle="topjui-textbox" style="width:325px;">
	</div>
	<div class="hang" style="margin-left: 400px;">
		<button class="layui-btn">保存</button>
	</div>
  </body>
</html>
