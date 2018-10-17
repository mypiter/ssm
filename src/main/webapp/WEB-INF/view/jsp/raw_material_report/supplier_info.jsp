<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>供应商详情</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
    
	<link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/bootstrap/css/table_common.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap-responsive.css" rel="stylesheet">
	<script src="${pageContext.request.contextPath}/bootstrap/js/jQuery.js"></script>
	<script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.js"></script>
    <style type="text/css">
       
    </style>
  </head>
  
  <body>
    
    <div align="center">
    <h3 style="margin-top:30px;">当前是江西晟丰公司的供应信息</h3>
    <div align="center">
       <h4 style="margin-top:30px;">纸板材料</h4>
       <table class="table table-striped table-bordered table-hover " align="center"  style="margin-top:30px;">
       <tr>
       <td ><b>纸质名称</b></td>
       <td><b>本公司代号</b></td>
       <td><b>材料代号</b></td>
       <td><b>纸平方价</b></td>
       <td><b>特价</b></td>
       </tr>
       <tr>
       <td ></td>
       <td ></td>
       <td >B636C</td>
       <td >5.26元</td>
       <td ></td>
       <td ></td>
       </tr>
       <tr>
       <td ></td>
       <td ></td>
       <td >B636C</td>
       <td >5.26元</td>
       <td ></td>
       <td ></td>
       </tr>
       <tr>
       <td ></td>
       <td ></td>
       <td >B636C</td>
       <td >5.26元</td>
       <td ></td>
       <td ></td>
       </tr>
       </table>
    </div>
    <div align="center">
         <h4 style="margin-top:30px;">可生产楞型</h4>
         <div style="border:1px solid;margin-top:15px;padding:10px;">
         <label style="font-size:20px;"><b>BC,BA,BB,CC,CD,DF</b></label>
         </div>
    </div>
    <div align="center">
    <h4 style="margin-top:30px;">优惠</h4>
     <table class="table table-striped table-bordered table-hover " align="center"  style="margin-top:15px;">
       <tr>
       <td ><b></b></td>
       <td><b>三层>=1000平方米</b></td>
       <td><b>五层>=2000平方米</b></td>
       <td><b>七层>=3000平方米</b></td>
      
       </tr>
       <tr>
      <td ><b></b></td>
       <td>0.01</td>
       <td>0.02</td>
       <td>0.03</td>
       
       </tr>
       <tr>
      <td ><b></b></td>
       <td>0.02</td>
       <td>0.03</td>
       <td>0.04</td>
       
       </tr>
       <tr>
       <td ><b></b></td>
       <td >0.03</td>
       <td >0.04</td>
       <td >0.05</td>
       
       </tr>
       </table>
    </div>
    <div align="center">
        <h4 style="margin-top:30px;">生产信息</h4>
        <table class="table table-striped table-bordered table-hover " align="center"  style="margin-top:15px;">
            <tr>
            <td>最大纸板长：</td>
            <td>66cm</td>
            <td>最大纸板宽：</td>
            <td>88cm</td>
            </tr>
            <tr>
            <td>最小纸板长：</td>
            <td>48cm</td>
            <td>最小纸板宽：</td>
            <td>32cm</td>
            </tr>
        </table>
    </div>
    
    </div>
  </body>
</html>
