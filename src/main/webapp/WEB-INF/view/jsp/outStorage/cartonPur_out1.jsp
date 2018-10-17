<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <link href="${pageContext.request.contextPath}/style/common.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/bootstrap/bootstrap.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/bootstrap/css/table_common.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap-responsive.css" rel="stylesheet">
	<script src="${pageContext.request.contextPath}/bootstrap/js/jQuery.js"></script>
	<script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.js"></script>
	<script src="${pageContext.request.contextPath}/js/checkboxJs.js"></script>
	<script src="${pageContext.request.contextPath}/js/waitDailog.js"></script>
	<link href="//netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"><!-- font图标的使用 -->
	<title>出库单</title>
	

	
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
	    a{
	    cursor:pointer;
	    }
		body{font-family: "微软雅黑"; margin-top: 50px;}
		.str1{color: red;}
		table{width:800px;height:auto;align:left;}
		td{font-size:15px;line-height:30px;}
		b{font-size: 16px;}

		#img{height:230px;width: 500px;border:1px solid;}
		
		.demo{
		padding: 2em 0;
		background: linear-gradient(to right, #2c3b4e, #4a688a, #2c3b4e);
		  }
		  .progress{
			  height: 16px;
			  background: #262626;
			  padding: 5px;
			  overflow: visible;
			  border-radius: 20px;
			  border-top: 1px solid #000;
			  border-bottom: 1px solid #7992a8;
			  margin-bottom: 0px;
		  }
		  .progress .progress-bar{
			  border-radius: 20px;
			  position: relative;
			  animation: animate-positive 2s;
		  }
		  .progress .progress-value{
			  display: block;
			  padding: 3px 7px;
			  font-size: 13px;
			  color: #fff;
			  border-radius: 4px;
			  background: #191919;
			  border: 1px solid #000;
			  position: absolute;
			  top: -40px;
			  right: -10px;
		  }
		  .progress .progress-value:after{
			  content: "";
			  border-top: 10px solid #191919;
			  border-left: 10px solid transparent;
			  border-right: 10px solid transparent;
			  position: absolute;
			  bottom: -6px;
			  left: 26%;
		  }
		  .progress-bar.active{
			  animation: reverse progress-bar-stripes 0.40s linear infinite, animate-positive 2s;
		  }
		  @-webkit-keyframes animate-positive{
			  0% { width: 0; }
		  }
		  @keyframes animate-positive{
			  0% { width: 0; }
		  }
			#tab2{
				position: fixed;
				bottom: 12px;
				left: 7px;
			}	
			#tab2 a{
				color: #fff;
			}	
			#tab2 a:hover{
				text-decoration: none;
				color: #000;
			}	  
		
	</style>

  </head>
  
  <body>
  
  
  
  	<h3 align="left" style="">出库单</h3><br>

  	<div align="left" id="tab1" >
  			<table id="tab" border="1px" bordercolor="#000000" cellspacing="0px" >
  				<tr >
  					<td colspan="4"  align="left">
  						订单号：
  					</td>
  					
  				</tr>
  				<tr  >
  					<td style="width:15%" align="left"  ><b>订单数量</b></td>
  				    <td style="width:18% " align="left"  colspan=3" >      </td>
  				</tr>
  				<tr >
  					<td style="width:15%" align="left"><b>纸板长</b></td>
  				    <td style="width:18% " align="left"></td>
  				    <td style="width:15%" align="left"><b>纸板宽</b></td>
  				    <td style="width:18% " align="left"></td>
  				  
  					
  				</tr>
  				
  				<tr >
  					 <td style="width:15%" align="left"  ><b>压线类型</b></td>
  				    <td style="width:18% " align="left"></td>
  					<td style="width:15%" align="left"><b>宽度压线</b></td>
  					<td style="width:18%" align="left"></td>
  					
  				</tr>
  				<tr >
  					 <td style="width:15%" align="left"><b>楞型</b></td>
  					<td style="width:18%" align="left"></td>
  					<td style="width:15%" align="left"><b>材质</b></td>
  				    <td style="width:18% " align="left"></td>

  				</tr>
  				<tr >
  					 <td style="width:15%" align="left"><b>出库时间</b></td>
  				    <td style="width:18% " align="left"></td>
  				    <td style="width:15%" align="left"><b>出库数量</b></td>
  					<td style="width:18%" align="left"></td>
  				</tr>
  				<tr >
  					<td style="width:15%" align="left"><b>出库员</b></td>
  					<td style="width:18%" align="left" colspan="3"></td>
  				  
  				</tr>
  				
  			</table>
  		
  	</div>
  	
  	
  </body>
</html>

