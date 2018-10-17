<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>物材出库面板</title>
    
	<!-- 导入列表页面公共样式 -->
    <%@ include file="../ap.jsp" %>

  </head>
  
  <body>
    <div>
	<table class="editTable">
    <tr>
        <td class="label">出库数量</td>
        <td>
            <input type="text" name="num" data-toggle="topjui-numberspinner" data-options="required:true">
        </td>
        <td class="label">出库时间</td>
        <td>
            <input type="text" name="time" data-toggle="topjui-datebox" data-options="required:true">
        </td>
    </tr>
</table>
<!-- <div style="position: fixed;right: 0px; bottom: 0px;">
    <button class='layui-btn layui-btn-xs' onclick="aa()">确定</button>&nbsp;&nbsp;&nbsp;&nbsp;<button class='layui-btn layui-btn-xs layui-btn-warm' onclick="aa()">取消</button>&nbsp;&nbsp;&nbsp;&nbsp;
</div> -->
</div>
  </body>
</html>
