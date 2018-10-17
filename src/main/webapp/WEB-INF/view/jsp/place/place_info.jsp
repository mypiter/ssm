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
   <table id="tabs" border="1">
    	<tr>
           <td class="d1"><strong>订单号：</strong></td>
           <td class="d2" colspan="2"><input  style="width:98%;background-color:#FCFCFC"></td>
           <td class="d4"><strong >公司名称：</strong></td>
           <td class="d5" colspan="3"><input  style="width:98%;background-color:#FCFCFC"></td>
           <td class="d9"><strong>地址：</strong></td>
           <td class="d10" colspan="4"><input  style="width:98%;background-color:#FCFCFC"></td>
         </tr>
         <tr>
           <td class="d1"><strong>客户名称：</strong></td>
           <td class="d2"><input  style="width:98%;background-color:#FCFCFC"></td>
           <td class="d3"><strong>产品名称：</strong></td>
           <td class="d4"><input  style="width:98%;background-color:#FCFCFC"></td>
           <td class="d5"><strong>联系方式：</strong></td>
           <td class="d6"><input  style="width:98%;background-color:#FCFCFC"></td>
           <td class="d7"><strong>业务员：</strong></td>
           <td class="d8"><input name="name" type="text" style="width:98%;background-color:#FCFCFC"></td>
           <td class="d9"><strong>交货日期</strong></td>
           <td class="d10"><input type="text" name="delivery_time" data-toggle="topjui-datebox" style="width:110px;height:20px;background-color:#FCFCFC;"></td>
           <td class="d11"><strong>箱型：</strong></td>
           <td class="d12"><select ><option>一叶成型</option></select></td>
         </tr>
         <tr>
           <td class="d1"><strong>生产尺寸：</strong></td>
           <td class="d2"><input  style="width:98%;background-color:#FCFCFC"></td>
           <td class="d3"><strong>压线规格：</strong></td>
           <td class="d4"><input  style="width:98%;background-color:#FCFCFC"></td>
           <td class="d5"><strong>纸板尺寸：</strong></td>
           <td class="d6"><input  style="width:98%;background-color:#FCFCFC"></td>
           <td class="d7"><strong>单价：</strong></td>
           <td class="d8"><input name="name" type="text" style="width:98%;background-color:#FCFCFC"></td>
           <td class="d9"><strong>材质/楞型</strong></td>
           <td class="d10"><input type="text" name="delivery_time"  style="width:95%;background-color:#FCFCFC"></td>
           <td class="d11"><strong>订单数量</strong></td>
           <td class="d12"><input name="name" type="text" style="width:95%;background-color:#FCFCFC"></td>
         </tr>
         <tr>
           <td class="d1"><strong>刀模版号：</strong></td>
           <td class="d2"><input name="name" type="text" style="width:95%;background-color:#FCFCFC"></td>
           <td class="d3"><strong>印版号：</strong></td>
           <td class="d4"><input  style="width:98%;background-color:#FCFCFC"></td>
           <td class="d5"><strong>印刷颜色：</strong></td>
           <td class="d6"><input  style="width:98%;background-color:#FCFCFC"></td>
           <td class="d7"><strong>总金额：</strong></td>
           <td class="d8"><input name="name" type="text" style="width:98%;background-color:#FCFCFC"></td>
           <td class="d9"><strong>结合方式</strong></td>
           <td class="d10"><input type="text" name="delivery_time"  style="width:95%;background-color:#FCFCFC"></td>
           <td class="d11"><strong>压线类型</strong></td>
           <td class="d12"><select style="width:70px;" ><option><strong>明线</strong></option></select></td>
         </tr>
          <tr>
           <td class="d1"><strong>工序：</strong></td>
           <td class="d2" colspan="5">分纸<input type="checkbox" id="check1" value="123" name="name" class="check">
                                   	    印刷 <input type="checkbox" id="check1" value="123" name="name" class="check">
                                                                                              开槽<input type="checkbox" id="check1" value="123" name="name" class="check">
                                                                                             模切<input type="checkbox" id="check1" value="123" name="name" class="check">
            						   粘合<input type="checkbox" id="check1" value="123" name="name" class="check">
            						   钉箱<input type="checkbox" id="check1" value="123" name="name" class="check">
            						   打包<input type="checkbox" id="check1" value="123" name="name" class="check">
            						  入库<input type="checkbox" id="check1" value="123" name="name" class="check">
           </td>           
           <td class="d7"><strong>是否开票：</strong></td>
           <td class="d8"><select style="width:58px;"><option ><strong>否</strong></option></select></td>
           <td class="d9"><strong>合同编号</strong></td>
           <td class="d10"><input type="text" name="delivery_time"  style="width:95%;background-color:#FCFCFC"></td>
           <td class="d11"><strong>付款方式</strong></td>
           <td class="d12"><select ><option><strong>货到付款</strong></option></select></td>
         </tr>
         <tr>
           <td class="d1"><strong>面纸尺寸：</strong></td>
           <td class="d2"><input name="name" type="text" style="width:95%;background-color:#FCFCFC"></td>
           <td class="d3"><strong>面纸材质：</strong></td>
           <td class="d4"><input  style="width:98%;background-color:#FCFCFC"></td>
          <!--  <td class="d5"><strong>面纸总价：</strong></td>
           <td class="d6"><input  style="width:98%;background-color:#FCFCFC"></td>
           <td class="d7"><strong>面纸单价：</strong></td>
           <td class="d8"><input name="name" type="text" style="width:98%;background-color:#FCFCFC"></td> -->
         </tr>
	      <tr>
		     <td colspan="12" >
		     <table class="ttb"   cellspacing="0">
		       <tr>
		       <td class="tt1" style="width:10%;height:100px;background-color:#FCFCFC" ></td>
		       <td class="tt2" style="width:10%;height:100px;background-color:#FCFCFC" ></td>
		     
		       <td class="tt5" style="width:2%;height:100px"><span style="font-size:30px" ><strong>备注</strong></span></td>
		       <td class="tt6" style="width:29%;height:100px"><textarea style="width:104%;height:100%;background-color:#FCFCFC;outline:none;resize:none;"></textarea></td>
		       </tr>
		     </table>
		     </td>
	      </tr>         
        
      </table>
  </body>
</html>
