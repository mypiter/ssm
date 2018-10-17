<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>登录</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!-- head 中 -->
    <link rel="stylesheet" href="https://cdn.bootcss.com/weui/1.1.2/style/weui.min.css">
    <link rel="stylesheet" href="https://cdn.bootcss.com/jquery-weui/1.2.0/css/jquery-weui.min.css">
    <!-- layui框架样式 -->
   
    <script type="text/javascript" src="${pageContext.request.contextPath}/bootstrap/js/jQuery.js"></script>
  </head>
  <style>
  body{
  background: url("${pageContext.request.contextPath}/image/back.jpg") no-repeat center center;
  background-size: cover;
  margin: 0 auto;
  position: relative;
  width: 100%;
  height: 100%;

  
}
  </style>
  <body>
  <div align="center" style="margin-top:60%;">
  <h1>纸箱厂管理系统</h1>
  </div>
  <div style="margin-top:30%;">
<form>


<div class="weui-cells">
  <div class="weui-cell">
    <div class="weui-cell__bd">
      <input class="weui-input" required type="text" placeholder="请输入帐号">
    </div>
  </div>
</div>


<div class="weui-cells weui-cells_form">
  <div class="weui-cell">
    <div class="weui-cell__bd">
      <input class="weui-input" required type="text" placeholder="请输入密码">
    </div>
  </div>
</div> 

  <div class="weui-cell">
    <div class="weui-cell__bd">
      <button type="submit" class="weui-btn weui-btn_primary" style="width:70%;">登录</button>
    </div>
  </div>

</form>
</div>

  <script src="https://cdn.bootcss.com/jquery/1.11.0/jquery.min.js"></script>
  <script src="https://cdn.bootcss.com/jquery-weui/1.2.0/js/jquery-weui.min.js"></script>
  </body>
</html>
