<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>更新订单</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
    <link type="text/css" href="http://cdn.amazeui.org/amazeui/2.7.2/css/amazeui.min.css" rel="stylesheet"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/bootstrap/js/jQuery.js"></script>
    <script type="text/javascript" src="http://cdn.amazeui.org/amazeui/2.7.2/js/amazeui.min.js"></script>
    <script type="text/javascript" src="http://cdn.amazeui.org/amazeui/2.7.2/js/amazeui.ie8polyfill.min.js"></script>
    <script type="text/javascript" src="http://cdn.amazeui.org/amazeui/2.7.2/js/amazeui.widgets.helper.min.js"></script>
  </head>
 
  <body>
  <div>
  <h1 align="center" style="margin-top:20%;color:green;">更新订单</h1>
  </div>
  <hr data-am-widget="divider"  class="am-divider am-divider-default" />
  <form class="am-form am-form-success am-form-horizontal">
  <div class="am-form-group am-form-group-sm">
    <label class="am-u-sm-3 am-form-label">订单号：</label>
    <label class="am-u-sm-4 am-form-label">1802070001</label>
    <label class="am-u-sm-3 am-form-label">工序：</label>
    <label class="am-u-sm-2 am-form-label">印刷</label>
  </div>

  <div class="am-form-group am-form-group-sm" >
    <label for="doc1" class="am-u-sm-3 am-form-label">今日产量</label>
    <div class="am-u-sm-9">
      <input type="text" id="doc1" required style="width:60%;">
    </div>
  </div>
  <div class="am-form-group am-form-group-sm">
    <label for="doc2" class="am-u-sm-3 am-form-label">损耗量</label>
    <div class="am-u-sm-9">
      <input type="text" id="doc2"  style="width:60%;">
    </div>
  </div>
  <div class="am-form-group am-form-group-sm">
    <label for="doc3" class="am-u-sm-3 am-form-label">损耗时间</label>
    <div class="am-u-sm-9">
      <input type="text" id="doc3" data-am-datepicker readonly required style="width:60%;">
    </div>
  </div>
  <div class="am-form-group am-form-group-sm">
    <label for="doc4" class="am-u-sm-3 am-form-label">损耗原因</label>
    <div class="am-u-sm-9">
      <textarea id="doc4" style="width:60%;"></textarea>
    </div>
  </div>
  

  <div class="am-form-group">
    <div class="am-u-sm-8 am-u-sm-offset-4">
      <button type="submit" class="am-btn am-round am-btn-sm am-btn-success">提交</button>
    </div>
  </div>
</form>
  </body>
</html>
