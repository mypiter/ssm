<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title></title>
   <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
	<meta name="renderer" content="webkit">
	 <%@ include file="../ap.jsp" %>

  </head>
   <style type="text/css">
    //生产单样式
      
      .tab{margin-top: 0px; width: 900px;}
      .ttb{margin-top:0px;width: 900px;}     
      .td1{
       	padding:0px;
      	border: 1px solid black;
      	width:65px;
      	height:20px;  
      	margin: 0px;   	
      }
       .td2{
       	padding:0px;
      	border: 1px solid black;
      	width:115px;
      	height:20px;
      }
       .td3{
       	padding:0px;
      	border: 1px solid black;
      	width:60px;
      	height:20px;
      }
       .td4{
       	padding:0px;
      	border: 1px solid black;
      	width:110px;
      	height:20px;
      }
       .td5{
       	padding:0px;
      	border: 1px solid black;
      	width:55px;
      	height:20px;
      }
       .td6{
       	padding:0px;
      	border: 1px solid black;
      	width:55px;
      	height:20px;
      }
       .td7{
       	padding:0px;
      	border: 1px solid black;
      	width:60px;
      	height:20px;
      }
      .td8{
       	padding:0px;
      	border: 1px solid black;
      	width:75px;
      	height:20px;
      }
      .td9{
       	padding:0px;
      	border: 1px solid black;
      	width:55px;
      	height:20px;
      }
      .td10{
       	padding:0px;
      	border: 1px solid black;
      	width:80px;
      	height:20px;
      }
      .td11{
       	padding:0px;
      	border: 1px solid black;
      	width:55px;     
      }
      .td12{
       	padding:0px;
      	border: 1px solid black;
      	width:55px;     
      }
     
      .toolbar{
        margin-left:450px;
      } 
      .t1{
       	padding:0px;
      	border: 0px solid black;
      	height:20px;     
      }
      .t2{
       	padding:0px;
      	border: 0px solid black;
      	height:20px;    
      	border-left:1px solid black;
      }
     
     .t3{
       	padding:0px;
      	border: 0px solid black;
      	height:20px;    
      	border-left:1px solid black;
      }
      .t4{
       	padding:0px;
      	border: 0px solid black;
      	height:20px;
      	border-left:1px solid black;   
      }
      .t5{
       	padding:0px;
      	border: 0px solid black;
      	height:20px;
      	border-left:1px solid black;   
      }
      .t6{
       	padding:0px;
      	border: 0px solid black;
      	height:20px;  
      	border-left:1px solid black;
      	border-right:1px solid black;   
      }
    .t7{
       	padding:0px;
      	border: 0px solid black;
      	height:20px;  
      	border-left:1px solid black;
      	border-right:1px solid black;   
      }
      .t8{
       	padding:0px;
      	border: 0px solid black;
      	height:20px;  
      	border-left:1px solid black;
      	border-right:1px solid black;   
      }
      .t9{
       	padding:0px;
      	border: 0px solid black;
      	height:20px;  
      	border-left:1px solid black;
      	border-right:1px solid black;   
      }
       //订单表样式
    	#tabs{margin-top:20px;width: 880px;}
    	.ttb{margin-top:0px;width: 880px;}
    	.d1{
       	padding:0px;
      	border: 1px solid black;
      	width:60px;
      	height:20px;  
      	margin: 0px;   	
      }
      .d2{
       	padding:0px;
      	border: 1px solid black;
      	width:50px;
      	height:20px;  
      	margin: 0px;   	
      }
      .d3{
       	padding:0px;
      	border: 1px solid black;
      	width:60px;
      	height:20px;  
      	margin: 0px;   	
      }
      .d4{
       	padding:0px;
      	border: 1px solid black;
      	width:85px;
      	height:20px;  
      	margin: 0px;   	
      }
      .d5{
       	padding:0px;
      	border: 1px solid black;
      	width:60px;
      	height:20px;  
      	margin: 0px;   	
      }
      .d6{
       	padding:0px;
      	border: 1px solid black;
      	width:80px;
      	height:20px;  
      	margin: 0px;   	
      }
      .d7{
       	padding:0px;
      	border: 1px solid black;
      	width:60px;
      	height:20px;  
      	margin: 0px;   	
      }
      .d8{
       	padding:0px;
      	border: 1px solid black;
      	width:50px;
      	height:20px;  
      	margin: 0px;   	
      }
      .d9{
       	padding:0px;
      	border: 1px solid black;
      	width:50px;
      	height:20px;  
      	margin: 0px;   	
      }
      .d10{
       	padding:0px;
      	border: 1px solid black;
      	width:65px;
      	height:20px;  
      	margin: 0px;   	
      }
      .d11{
       	padding:0px;
      	border: 1px solid black;
      	width:60px;
      	height:20px;  
      	margin: 0px;   	
      }
      .d12{
       	padding:0px;
      	border: 1px solid black;
      	width:55px;
      	height:20px;  
      	margin: 0px;   	
      }
      .tt1{
       	padding:0px;
      	border: 0px solid black;
      	height:100px;     
      }
      .tt2{
       	padding:0px;
      	border: 0px solid black;
      	height:100px;    
      	border-left:1px solid black;
      }
     
      .tt5{
       	padding:0px;
      	border: 0px solid black;
      	height:100px;
      	border-left:1px solid black;   
      }
      .tt6{
       	padding:0px;
      	border: 0px solid black;
      	height:100px;  
      	border-left:1px solid black;
      	border-right:1px solid black;   
      }
      //采购单样式
      	*{margin: 0px;padding: 0px;}
	  	.purchase{margin-left: 5px;}
	  	.purchase .purchase_from{margin-bottom: 10px;}
	  	.purchase .purchase_from div{display: inline-block;}
	  	.purchase .purchase_from .purchase_order_ORnumber{margin-top: 5px;}
	  	.purchase .purchase_table{width: 900px;margin-right: 5px;}	  	
	
	  .button1{
	     margin-left:490px;
	  }
	  input[type="checkbox"] {
		  height: 20px;  
		  vertical-align: middle;
		  width: 15px;
	 }
	 
    </style>
  <body>
<table class="purchase_table" border="1">
	    		<tr>
	    			<td colspan="3" style="font-weight: bold;font-size: 16px;">众品鑫</td>
	    			<td colspan="9" style="font-weight: bold;font-size: 16px;">采购单号：C201806050001</td>
	    		</tr>
	    		<tr>
	    			<td style="width: 15%"><strong>订单号</strong></td>
	    			<td style="width: 9%"><strong>客户名称</strong></td>
	    			<td style="width: 10%"><strong>产品名称</strong></td>
	    			<td style="width: 6%"><strong>订单数量</strong></td>
	    			<td style="width: 7%" ><strong>采购数量</strong></td>
	    			<td style="width: 6%"><strong>单价</strong></td>
	    			<td style="width: 7%"><strong>总金额</strong></td>
	    			<td style="width: 12%"><strong>材质/楞型</strong></td>	    			
	    			<td style="width: 9%"><strong>纸板尺寸</strong></td>
	    			<td style="width: 8%"><strong>压线规格</strong></td>
	    			<td style="width: 6%"><strong>压线类型</strong></td>
	    			
	    		</tr>
	    		<tr>
	    			<td style="font-weight: bold;">D201806050001</td>
	    			<td style="font-weight: bold;">阿龙</td>
	    			<td style="font-weight: bold;">淘宝箱</td>
	    			<td style="font-weight: bold;">1000</td>
	    			<td style="font-weight: bold;"></td>
	    			<td style="font-weight: bold;">0.00</td>
	    			<td style="font-weight: bold;">0.00</td>
	    			<td style="font-weight: bold;">K323K</td>	   
	    			<td style="font-weight: bold;"></td>
	    			<td style="font-weight: bold;">18.5</td>
	    			<td style="font-weight: bold;">暗线</td>	    			
	       			
	    		</tr>
	    		<tr>
	    			<td style="font-weight: bold;width: 9%" >面纸尺寸</td>
	    			<td style="font-weight: bold;width: 9%" >面纸材质</td>
	    			<td style="font-weight: bold;width: 9%" >面纸单价</td>
	    			<td style="font-weight: bold;width: 9%" >面纸总价</td>
	    			<td style="font-weight: bold;width: 9%"  rowspan="2">采购备注</td>
	    			<td style="font-weight: bold;"colspan="7"  rowspan="2"></td>
	    		</tr>
	    		<tr>
	    			<td style="font-weight: bold;"></td>
	    			<td style="font-weight: bold;"></td>
	    			<td style="font-weight: bold;">0.00</td>
	    			<td style="font-weight: bold;">0.00</td>
	    			
	    		</tr>
	    	</table>
  </body>
</html>
