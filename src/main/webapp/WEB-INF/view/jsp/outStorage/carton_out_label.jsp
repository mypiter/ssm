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
    <title>打印送货单</title>
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
		<input style="width:150px;height:35px" onclick="preview()" value="打印送货单" type="button" />
		<div class="codeBox"></div>
		<!--endprint-->
<div  id="">

<table   id="tab" border="0px" bordercolor="#000000" cellspacing="0px">
       <div align="left" id="tab1" >
  	
  			<!--startprint--><!--实现打印的开始标签-->
  			<table id="tab" border="0px" bordercolor="#000000" cellspacing="0px" style="width:200px;height:360px">
  				<tr >
  					<td colspan="4"  align="center">
  						<h4><b><strong class="str1"><font size="5">江西省熊氏材料包装有限公司</font></strong></b></h4>
  					</td>
  					
  				</tr>
  				<tr >
  					<td colspan="4"  align="center">
  						<h4><b><strong class="str1">——————————————————————————————————————</strong></b></h4>
  					</td>
  					
  				</tr>
  				<tr >
  					<td colspan="2"  align="right">
  						<h4><b><strong class="str1">电话:13647000039</strong></b></h4>
  					</td>
  					<td colspan="2"  align="left">
  						<h4><b><strong class="str1">传真:0791-859589598</strong></b></h4>
  					</td>
  				</tr>
  				<tr >
  					<td colspan="4"  align="center">
  						<h4><b><strong class="str1"><font size="5">送货单</font></strong></b></h4>
  					</td>
  					
  				</tr>
  				
  				<tr  >
  					 <td colspan="2" align="left"  >&nbsp;客户：王竹大</td>
  				    
  				    <td colspan="2" align="right"  >送货单号：365478923&nbsp;</td>
  				</tr>
  				<tr  >
  					 <td colspan="2" align="left"  >&nbsp;交货地点：</td>
  				    
  				    <td colspan="2" align="right"  >&nbsp;&nbsp;单据日期：2018-04-25&nbsp;</td>
  				</tr>
  				<tr  >
  					 <td colspan="2" align="left"  >&nbsp;配送人：</td>
  				    
  				    <td colspan="2" align="right"  >&nbsp;&nbsp;配送人联系方式：15698722325&nbsp;</td>
  				</tr>
  				<tr  >
  					 <td colspan="4" align="left"  >&nbsp;配送车牌号：</td>
  				    
  				    
  				</tr>
  				<tr>
  				    <td colspan="4" align="center" >
  				        <table id="tab" border="1px" bordercolor="#000000" cellspacing="0px" style="width:600px;">
		  				    <tr>
		  				       <td align="center">产品名称</td>
		  				       <td align="center">型号规格</td>
		  				       <td align="center">单位</td>
		  				       <td align="center">数量</td>
		  				       <td align="center">单价</td>
		  				       <td align="center">金额</td>
		  				       <td align="center">备注</td>
		  				    </tr>
		  				     <tr>
		  				       <td align="center">对口箱</td>
		  				       <td align="center"></td>
		  				       <td align="center">只</td>
		  				       <td align="center">3002</td>
		  				       <td align="center">4.52</td>
		  				       <td align="center">13586</td>
		  				       <td align="center">111111111111111</td>
		  				    </tr>
		  				     <tr>
		  				       <td align="center">对口箱</td>
		  				       <td align="center"></td>
		  				       <td align="center"></td>
		  				       <td align="center"></td>
		  				       <td align="center"></td>
		  				       <td align="center"></td>
		  				       <td align="center"></td>
		  				    </tr>
		  				     <tr>
		  				       <td align="center">对口箱</td>
		  				       <td align="center"></td>
		  				       <td align="center"></td>
		  				       <td align="center"></td>
		  				       <td align="center"></td>
		  				       <td align="center"></td>
		  				       <td align="center"></td>
		  				    </tr>
		  				     <tr>
		  				       <td align="center">对口箱</td>
		  				       <td align="center"></td>
		  				       <td align="center"></td>
		  				       <td align="center"></td>
		  				       <td align="center"></td>
		  				       <td align="center"></td>
		  				       <td align="center"></td>
		  				    </tr>
		  				     <tr>
		  				       <td align="center">对口箱</td>
		  				       <td align="center"></td>
		  				       <td align="center"></td>
		  				       <td align="center"></td>
		  				       <td align="center"></td>
		  				       <td align="center"></td>
		  				       <td align="center"></td>
		  				    </tr>
		  				    <tr>
		  				       <td align="center">对口箱</td>
		  				       <td align="center"></td>
		  				       <td align="center"></td>
		  				       <td align="center"></td>
		  				       <td align="center"></td>
		  				       <td align="center"></td>
		  				       <td align="center"></td>
		  				    </tr>
		  				    <tr>
		  				       <td align="center">对口箱</td>
		  				       <td align="center"></td>
		  				       <td align="center"></td>
		  				       <td align="center"></td>
		  				       <td align="center"></td>
		  				       <td align="center"></td>
		  				       <td align="center"></td>
		  				    </tr>
		  				    <tr>
		  				       <td align="center" colspan="3">合计：壹万叁仟伍佰陆拾捌壹角整</td>
		  				       <td align="center">3002</td>
		  				       <td align="center"></td>
		  				       <td align="center">13568.1</td>
		  				       <td align="center"></td>
		  				    </tr>
		  				</table>
  				    </td>
  				</tr>
  				<tr  >
  				    <td colspan="4" align="left"  >&nbsp;&nbsp;说明：1.请收货单位认真核对所送货物.......</td>
  				</tr>
  				<tr  >
  				    <td colspan="4" align="left"  >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2.验收无误后.......</td>
  				</tr>
  				<tr  >
  				    <td colspan="4" align="left"  >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3............</td>
  				</tr>
  				<tr  >
  					 <td colspan="2" align="left"  >&nbsp;送货单位及经手人签字：</td>
  				    
  				    <td colspan="2" align="left"  >收货单位及经手人签字&nbsp;</td>
  				</tr>
  			</table>
  			<!--endprint--><!--实现打印的结束标签-->
  	</div>
</table>
</div>
</body>


</html>
