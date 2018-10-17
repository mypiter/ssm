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
    <script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/jquery.jqprint-0.3.js"></script>
	<script type="text/javascript" src="js/jquery.browser.js"></script>
	<script type="text/javascript" src="js/jquery.qrcode.min.js"></script>
	<script type="text/javascript" src="js/jquery.jokeer.js"></script>
    <title>打印纸箱入库标签页面</title>
</head>
<style type="text/css">
.one{
    width:170px;
    height:120px;
    border:1px red solid;
    background-color: white;
    float:left;
}

p{
   font-size:1px;
   font-family:verdana;
   }
body{
background-color: gray;
}

tr{
background-color:white;
}

</style>
<body id="body">
		<!--startprint-->
		<input style="width:150px;height:35px" onclick="preview()" value="打印纸箱入库标签" type="button" />
		<div class="codeBox"></div>
		<!--endprint-->
<div  id="">

<table   id="tab" border="0px" bordercolor="#000000" cellspacing="0px">
       <div align="left" id="tab1" >
  	
  			<!--startprint--><!--实现打印的开始标签-->
  			<table id="tab" border="0px" bordercolor="#000000" cellspacing="0px" style="width:200px;height:360px">
  				<tr >
  					<td colspan="4"  align="center">
  						
  						<h4><b><strong class="str1">公司名称</strong></b></h4>
  					</td>
  					
  				</tr>
  				<tr  >
  					<td style="width:2%" align="left"  ><b>订单号：</b></td>
  				    <td style="width:1% " align="left"  colspan="3" ></td>
  				</tr>
  				
  				<tr  >
  					 <td style="width:2%" align="left"  ><b>产品名称：</b></td>
  				    <td style="width:1% " align="left"  ></td>
  				    <td style="width:2%" align="left"  ><b></b></td>
  				    <td style="width:1% " align="left"  ></td>
  				</tr>
  				<tr  >
  					 <td style="width:2%" align="left"  ><b>客户名称：</b></td>
  				    <td style="width:1% " align="left"  ></td>
  				    <td style="width:2%" align="left"  ><b></b></td>
  				    <td style="width:1% " align="left"  ></td>
  				</tr>
  			
  				<tr  >
  					<td style="width:2%" align="left"  ><b>数量：</b></td>
  				    <td style="width:1% " align="left"  colspan="3" ></td>
  				   
  				</tr>
  				<tr  >
  					<td style="width:2%" align="left"  ><b>材质：</b></td>
  				    <td style="width:1% " align="left"  colspan="3" ></td>
  				   
  				</tr>
  				<tr  >
  					<td style="width:2%" align="left"  ><b>楞型：</b></td>
  				    <td style="width:1% " align="left"  colspan="3" ></td>
  				   
  				</tr>
  				<tr  >
  					<td style="width:2%" align="left"  ><b>规格：</b></td>
  				    <td style="width:1% " align="left"  colspan="3" ></td>
  				   
  				</tr>
  				<tr  >
  					<td style="width:2%" align="left"  ><b>压线：</b></td>
  				    <td style="width:1% " align="left"  colspan="3" ></td>
  				   
  				</tr>
  				<tr  >
  					<td style="width:2%" align="left"  ><b>单价：</b></td>
  				    <td style="width:1% " align="left"  colspan="3" ></td>
  				   
  				</tr>
  				<tr  >
  					<td style="width:2%" align="left"  ><b>总金额：</b></td>
  				    <td style="width:1% " align="left"  colspan="3" ></td>
  				   
  				</tr>
  				<tr  >
  					<td style="width:2%" align="left"  ><b>日期：</b></td>
  				    <td style="width:1% " align="left"  colspan="3" ></td>
  				   
  				</tr>
  				<tr  >
  					<td style="width:2%" align="left"  ><b>库区：</b></td>
  				    <td style="width:1% " align="left"  colspan="3" ></td>
  				   
  				</tr>
  				<tr  >
  					<td style="width:2%" align="left"  ><b>备注：</b></td>
  				    <td style="width:1% " align="left" height="30px" colspan="3" ></td>
  				   
  				</tr>
  			</table>
  			<!--endprint--><!--实现打印的结束标签-->
  	</div>
</table>
</div>
</body>


</html>
