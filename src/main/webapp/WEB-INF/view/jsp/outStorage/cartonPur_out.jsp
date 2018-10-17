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
    <title>打印纸板出库单</title>
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
		<input style="width:150px;height:35px" onclick="preview()" value="打印纸板出库单" type="button" />
		<div class="codeBox"></div>
		<!--endprint-->
<div  id="">

<table   id="tab" border="0px" bordercolor="#000000" cellspacing="0px">
       <div align="left" id="tab1" >
  	
  			<!--startprint--><!--实现打印的开始标签-->
  			<table id="tab" border="0px" bordercolor="#000000" cellspacing="0px" style="width:200px;height:60px">
  				
  				
  				<tr >
  					<td colspan="4"  align="center">
  						<h4><b><strong class="str1"><font size="5">出库单</font></strong>（出库批号：36598）</b></h4>
  					</td>
  					
  				</tr>
  				
  				<tr>
  				    <td colspan="4" align="center" >
  				        <table id="tab" border="1px" bordercolor="#000000" cellspacing="0px" style="width:600px;">
		  				    <tr>
		  				       <td align="center">采购订单号：</td>
		  				       <td align="center">纸板长宽</td>
		  				       <td align="center">压线类型</td>
		  				       <td align="center">宽度压线</td>
		  				       <td align="center">楞型</td>
		  				       <td align="center">材质</td>
		  				       <td align="center">出库时间</td>
		  				       <td align="center">出库数量</td>
		  				       <td align="center">出库员</td>
		  				    </tr>
		  				     <tr>
		  				       <td align="center">3654122</td>
		  				       <td align="center"></td>
		  				       <td align="center">c</td>
		  				       <td align="center">3002</td>
		  				       <td align="center">4.52</td>
		  				       <td align="center">深咖啡</td>
		  				       <td align="center">13586</td>
		  				       <td align="center">111111</td>
		  				       <td align="center">深咖啡</td>
		  				    </tr>
		  				     <tr>
		  				       <td align="center">3654122</td>
		  				       <td align="center"></td>
		  				       <td align="center"></td>
		  				       <td align="center"></td>
		  				       <td align="center"></td>
		  				       <td align="center">深咖啡</td>
		  				       <td align="center"></td>
		  				       <td align="center"></td>
		  				       <td align="center">深咖啡</td>
		  				    </tr>
		  				     <tr>
		  				       <td align="center">3654122</td>
		  				       <td align="center"></td>
		  				       <td align="center"></td>
		  				       <td align="center"></td>
		  				       <td align="center"></td>
		  				       <td align="center">深咖啡</td>
		  				       <td align="center"></td>
		  				       <td align="center"></td>
		  				       <td align="center">深咖啡</td>
		  				    </tr>
		  				     <tr>
		  				       <td align="center">3654122</td>
		  				       <td align="center"></td>
		  				       <td align="center"></td>
		  				       <td align="center"></td>
		  				       <td align="center"></td>
		  				       <td align="center">深咖啡</td>
		  				       <td align="center"></td>
		  				       <td align="center"></td>
		  				       <td align="center">深咖啡</td>
		  				    </tr>
		  				     <tr>
		  				       <td align="center">3654122</td>
		  				       <td align="center"></td>
		  				       <td align="center"></td>
		  				       <td align="center"></td>
		  				       <td align="center"></td>
		  				       <td align="center">深咖啡</td>
		  				       <td align="center"></td>
		  				       <td align="center"></td>
		  				       <td align="center">深咖啡</td>
		  				    </tr>
		  				    <tr>
		  				       <td align="center">3654122</td>
		  				       <td align="center"></td>
		  				       <td align="center"></td>
		  				       <td align="center"></td>
		  				       <td align="center"></td>
		  				       <td align="center">深咖啡</td>
		  				       <td align="center"></td>
		  				       <td align="center"></td>
		  				       <td align="center">深咖啡</td>
		  				    </tr>
		  				    <tr>
		  				       <td align="center">3654122</td>
		  				       <td align="center"></td>
		  				       <td align="center"></td>
		  				       <td align="center"></td>
		  				       <td align="center"></td>
		  				       <td align="center">深咖啡</td>
		  				       <td align="center"></td>
		  				       <td align="center"></td>
		  				       <td align="center">深咖啡</td>
		  				    </tr>
		  				   
		  				</table>
  				    </td>
  				</tr>
  				
  			</table>
  			<!--endprint--><!--实现打印的结束标签-->
  	</div>
</table>
</div>
</body>


</html>
