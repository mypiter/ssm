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
  <table class="tab"  border="1" cellspacing="0">
	      <tr>
	       <td class="td1" style="font-weight: bold;">生产单号</td>
	       <td class="td2" style="font-weight: bold;"></td>
	       <td class="td3" style="font-weight: bold;">产品名称</td>
	       <td class="td4" style="font-weight: bold;"></td>
	       <td class="td5" style="font-weight: bold;">客户名称</td>
	       <td class="td6" style="font-weight: bold;"></td>
	       <td class="td7" style="font-weight: bold;">下单日期</td>
	       <td class="td8" style="font-weight: bold;"></td>  
	       <td class="td9" style="font-weight: bold;">订单数量</td>
	       <td class="td10" style="font-weight: bold;"></td>      
	 	   <td class="td11" style="font-weight: bold;">印刷颜色</td>
	       <td class="td12" style="font-weight: bold;"></td>          
	      </tr>
	      <tr>
	       <td  class="td1" style="font-weight: bold;">纸板尺寸</td>
	       <td  class="td2" style="font-weight: bold;"></td>
	       <td  class="td3" style="font-weight: bold;">生产尺寸</td>
	       <td  class="td4" style="font-weight: bold;"></td>
	       <td  class="td5" style="font-weight: bold;;background-color:#FCFCFC">箱型</td>
	       <td  class="td6" style="font-weight: bold;"></td> 
	       <td  class="td7" style="font-weight: bold;">材质/楞型</td>
	       <td  class="td8" style="font-weight: bold;"></td> 
	       <td  class="td9" style="font-weight: bold;">刀模版号</td>
	       <td  class="td10" style="font-weight: bold;"></td>
	       <td  class="td11" style="font-weight: bold;">印版号</td>
	       <td  class="td12" style="font-weight: bold;"></td>             
	      </tr> 
	      <tr>
	       <td  class="td1" style="font-weight: bold;">面纸尺寸</td>
	       <td  class="td2" style="font-weight: bold;"></td>
	       <td  class="td3" style="font-weight: bold;">压线规格</td>
	       <td  class="td4" style="font-weight: bold;"></td>
	       <td  class="td5" style="font-weight: bold;">压线类型</td>
	       <td  class="td6" style="font-weight: bold;"></td> 
	       <td  class="td7" style="font-weight: bold;">结合方式</td>
	       <td  class="td8" style="font-weight: bold;"></td>      
	       <td  class="td7" style="font-weight: bold;">业务员</td>
	       <td  class="td8" style="font-weight: bold;"></td>
           <td  class="td9" style="font-weight: bold;">交货日期</td>
	       <td  class="td10" style="font-weight: bold;"></td>
	      </tr> 
	      <tr>       
	      </tr> 
	      <tr>
		   <td  class="td1" style="font-weight: bold;">工序</td>
	       <td  class="td2" style="font-weight: bold;" colspan="11">分纸<input type="checkbox" id="check1" value="123" name="name" class="check">
                                   	    印刷 <input type="checkbox" id="check1" value="123" name="name" class="check">
                                                                                              开槽<input type="checkbox" id="check1" value="123" name="name" class="check">
                                                                                             模切<input type="checkbox" id="check1" value="123" name="name" class="check">
            						   粘合<input type="checkbox" id="check1" value="123" name="name" class="check">
            						   钉箱<input type="checkbox" id="check1" value="123" name="name" class="check">
            						   打包<input type="checkbox" id="check1" value="123" name="name" class="check">
            						  入库<input type="checkbox" id="check1" value="123" name="name" class="check"></td>
	      </tr>        
	      <tr>
	    
		     <td class="td1" style="font-weight: bold;" >备注</td>
		     <td  class="td2" colspan="11"></td>
	      </tr>
	      </table>
  </body>
</html>
