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
      	border-left:0px solid black;   
      }
      .tt6{
       	padding:0px;
      	border: 0px solid black;
      	height:100px;  
      	border-left:0px solid black;
      	border-right:0px solid black;   
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
   <table id="tabs" border="1">
    	<tr>
           <td class="d1"><strong>公司名称：</strong></td>
           <td class="d2" colspan="3"></td>
           <td class="d5"><strong>客户名称：</strong></td>
           <td class="d6" ></td>
           <td class="d7"><strong >产品名称：</strong></td>
           <td class="d8" colspan="3"></td>
           <td class="d11"><strong>面纸材质：</strong></td>
           <td class="d12" ></td>
         </tr>
         <tr>
           <td class="d1"><strong>生产尺寸：</strong></td>
           <td class="d2"></td>
           <td class="d3"><strong>压线规格：</strong></td>
           <td class="d4"></td>
           <td class="d5"><strong>纸板尺寸：</strong></td>
           <td class="d6"></td>
           <td class="d7"><strong>单价：</strong></td>
           <td class="d8"></td>
           <td class="d9"><strong>材质/楞型</strong></td>
           <td class="d10"></td>
           <td class="d11"><strong>箱型：</strong></td>
           <td class="d12">一叶成型</td>
         </tr>
       
         <tr>
           <td class="d1"><strong>刀模版号：</strong></td>
           <td class="d2"></td>
           <td class="d3"><strong>印版号：</strong></td>
           <td class="d4"></td>
           <td class="d5"><strong>印刷颜色：</strong></td>
           <td class="d6"></td>
           <td class="d7"><strong>结合方式：</strong></td>
           <td class="d8"></td>
           <td class="d9"><strong>压线类型</strong></td>
           <td class="d10"></td>
           <td class="d11"><strong>面纸尺寸：</strong></td>
           <td class="d12"></td>
         </tr>
          
       
	      <tr>
		     <td colspan="12" >
		     <table class="ttb"   cellspacing="0">
		       <tr>
		       <td class="tt1" style="width:10%;height:100px;background-color:#FCFCFC" ></td>
		       <td class="tt2" style="width:10%;height:100px;background-color:#FCFCFC" ></td>		     
		      
		       </tr>
		     </table>
		     </td>
	      </tr>         
        
      </table>
  </body>
</html>
