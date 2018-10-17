<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- 避免IE使用兼容模式 -->
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
<meta name="renderer" content="webkit">
 <%@ include file="../ap.jsp" %>
    <title>下单</title>
   
    
    <!-- 生产单订单样式 -->
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
      	width:110px;
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
    
    
  </head>  
  <body>
		<div>
		<form>
		 <div id="divPlace">    
	      <span style="font-size: 20px;background-color:#FF9797"><strong>客户订单</strong></span>	
          <a href="#"
	       data-toggle="topjui-linkbutton"
	       data-options="id:'submitBtn',
	                   iconCls:'fa fa-save',
	                   form:{
	                       id:'formId',
	                       method:'submit',
	                       url:'/json/response/success.json',
	                       refreshRefererTab:true,
	                       closeCurrentTab:true
	                   }">打印</a>
	      <a href="#"
	       data-toggle="topjui-linkbutton"
	       data-options="id:'submitBtn',
	                   iconCls:'fa fa-save',
	                   form:{
	                       id:'formId',
	                       method:'submit',
	                       url:'/json/response/success.json',
	                       refreshRefererTab:true,
	                       closeCurrentTab:true
	                   }">继续下单</a>
	       <a href="#"
	       data-toggle="topjui-linkbutton"
	       data-options="id:'submitBtn',
	                   iconCls:'fa fa-save',
	                   form:{
	                       id:'formId',
	                       method:'submit',
	                       url:'/json/response/success.json',
	                       refreshRefererTab:true,
	                       closeCurrentTab:true
	                   }">保存</a>  
	        <button class="button1" style="background-color:#ADFF2F"><strong>刀模版库</strong></button>
	        <button class="button2" style="background-color:#ADFF2F"><strong>印版库</strong></button>           
    	</div>
    	<table id="tabs" border="1">
    	<tr>
           <td class="d1"><strong>订单号：</strong></td>
           <td class="d2" colspan="2"><input style="width: 130px;height:20px" type="text" name="userNameId" data-toggle="topjui-textbox" value="D201806050001" disabled="disabled"></td>
           <td class="d4"><strong >公司名称：</strong></td>
           <td class="d5" colspan="3"><input type="text" name="user"
                       style="height:20px"
                       data-toggle="topjui-combogrid"
                       data-options="id:'user',
	                   idField: 'userNameId',
	                   textField: 'userName',
	                   url:remoteHost+'/system/user/getPageSetData',
	                   columns:[[
	                       {field: 'userName', title: '公司名称'},
	                   ]]"></td>
           <td class="d9"><strong>地址：</strong></td>
           <td class="d10" colspan="4"> <input type="text" style="height:20px;width:113%" name="" value=""
                                   data-toggle="topjui-textbox"></td>
         </tr>
         <tr>
           <td class="d1"><strong>客户名称：</strong></td>
           <td class="d2"><input type="text" name="user"
                       style="height:20px;width:100px"
                       data-toggle="topjui-combogrid"
                       data-options="id:'user',
	                   idField: 'userNameId',
	                   textField: 'userName',
	                   url:remoteHost+'/system/user/getPageSetData',
	                   columns:[[
	                       {field: 'userName', title: '客户名称'},
	                   ]]"></td>
           <td class="d3"><strong>产品名称：</strong></td>
           <td class="d4"><input type="text" name="user"
                       style="height:20px;width:100px"
                       data-toggle="topjui-combogrid"
                       data-options="id:'user',
	                   idField: 'userNameId',
	                   textField: 'userName',
	                   url:remoteHost+'/system/user/getPageSetData',
	                   columns:[[
	                       {field: 'userName', title: '客户名称'},
	                   ]]"></td>
           <td class="d5"><strong>联系方式：</strong></td>
           <td class="d6"><input type="text"   style="height:20px;width:100px" name="" value=""
                                   data-toggle="topjui-textbox"
                                  ></td>
           <td class="d7"><strong>业务员：</strong></td>
           <td class="d8"> <input type="text"   style="height:20px;width:60px" name="" value=""
                                   data-toggle="topjui-textbox"
                                  ></td>
           <td class="d9"><strong>交货日期</strong></td>
           <td class="d10"><input type="text" name="delivery_time" data-toggle="topjui-datebox" style="width:110px;height:20px;"></td>
           <td class="d11"><strong>箱型：</strong></td>
           <td class="d12"><input type="text" name="type"
           style="height:20px;width:72px"
			                  data-toggle="topjui-combogrid"
                       data-options="id:'user',
	                   idField: 'userNameId',
	                   textField: 'userName',
	                   url:remoteHost+'/system/user/getPageSetData',
	                   columns:[[
	                       {field: 'userName', title: '箱型'},
	                   ]]"></td>
         </tr>
         <tr>
           <td class="d1"><strong>生产尺寸：</strong></td>
           <td class="d2"><input type="text"   style="height:20px;width:100px" name="" value=""
                                   data-toggle="topjui-textbox"
                                  ></td>
           <td class="d3"><strong>压线规格：</strong></td>
           <td class="d4"><input type="text"   style="height:20px;width:100px" name="" value=""
                                   data-toggle="topjui-textbox"
                                  ></td>
           <td class="d5"><strong>纸板尺寸：</strong></td>
           <td class="d6"><input type="text"   style="height:20px;width:100px" name="" value=""
                                   data-toggle="topjui-textbox"
                                  ></td>
           <td class="d7"><strong>单价：</strong></td>
           <td class="d8"><input type="text"   style="height:20px;width:60px" name="" value=""
                                   data-toggle="topjui-textbox"
                                  ></td>
           <td class="d9"><strong>材质/楞型</strong></td>
           <td class="d10"><input type="text"   style="height:20px;width:110px" name="" value=""
                                   data-toggle="topjui-textbox"
                                  ></td>
           <td class="d11"><strong>订单数量</strong></td>
           <td class="d12"><input type="text"   style="height:20px;width:72px" name="" value=""
                                   data-toggle="topjui-textbox"
                                  ></td>
         </tr>
         <tr>
           <td class="d1"><strong>刀模版号：</strong></td>
           <td class="d2"><input type="text"   style="height:20px;width:100px" name="" value=""
                                   data-toggle="topjui-textbox"
                                  ></td>
           <td class="d3"><strong>印版号：</strong></td>
           <td class="d4"><input type="text"   style="height:20px;width:100px" name="" value=""
                                   data-toggle="topjui-textbox"
                                  ></td>
           <td class="d5"><strong>印刷颜色：</strong></td>
           <td class="d6"><input type="text"   style="height:20px;width:100px" name="" value=""
                                   data-toggle="topjui-textbox"
                                  ></td>
           <td class="d7"><strong>总金额：</strong></td>
           <td class="d8"><input type="text"   style="height:20px;width:60px" name="" value=""
                                   data-toggle="topjui-textbox"
                                  ></td>
           <td class="d9"><strong>结合方式</strong></td>
           <td class="d10"><input type="text"   style="height:20px;width:110px" name="" value=""
                                   data-toggle="topjui-textbox"
                                  ></td>
           <td class="d11"><strong>压线类型</strong></td>
           <td class="d12"><input type="text" name="type"
           style="height:20px;width:72px"
			                   data-toggle="topjui-combobox"
			                   data-options="data:[
			                       {
			                           text: '明线',
			                           value: '1'
			                       },
			                       {
			                           text: '暗线',
			                           value: '2'
			                       }
			                   ]"></td>
         </tr>
          
         <tr>
           <td class="d1"><strong>面纸尺寸：</strong></td>
           <td class="d2"><input type="text"   style="height:20px;width:100px" name="" value=""
                                   data-toggle="topjui-textbox"
                                  ></td>
           <td class="d3"><strong>面纸材质：</strong></td>
           <td class="d4"><input type="text"   style="height:20px;width:100px" name="" value=""
                                   data-toggle="topjui-textbox"
                                  ></td>
            <td class="d5"><strong>是否开票：</strong></td>
           <td class="d6"><input type="text"   style="height:20px;width:100px" name="" value=""
                                   data-toggle="topjui-combobox"
			                   data-options="data:[
			                       {
			                           text: '开',
			                           value: '1'
			                       },
			                       {
			                           text: '否',
			                           value: '2'
			                       }
			                   ]"></td>
         	<td class="d7"><strong>付款方式</strong></td>
           <td class="d8"><input type="text"   style="height:20px;width:60px" name="" value=""
                                   data-toggle="topjui-combobox"
			                   data-options="data:[
			                       {
			                           text: '现金',
			                           value: '1'
			                       },
			                       {
			                           text: '转账',
			                           value: '2'
			                       }
			                   ]"></td>
           <td class="d9"><strong>合同编号</strong></td>
           <td class="d10" colspan="3"> <input type="text"   style="height:20px;width:100%" name="" value=""
                                   data-toggle="topjui-textbox"
                                  ></td>
           
         </tr>
         <tr>
           <td class="d1"><strong>工序：</strong></td>
           <td class="d2" colspan="11"><input type="text" name="tagbox2" style="height:20px;width:700px"
			                   data-toggle="topjui-tagbox"
			                   data-options="required:true,
			                               hasDownArrow:true,
			                               textField:'text',
			                               valueField:'id',
			                               data:[{
			                                   id:1,
			                                   text:'分纸'
			                               },{
			                                   id:2,
			                                   text:'印刷'
			                               },{
			                                   id:3,
			                                   text:'开槽',
			                                   selected:true
			                               },{
			                                   id:4,
			                                   text:'模切'
			                               },{
			                                   id:5,
			                                   text:'粘合'
			                               },{
			                                   id:6,
			                                   text:'钉箱'
			                               },{
			                                   id:7,
			                                   text:'打包'   
			                               },{
			                                   id:8,
			                                   text:'入库' 
			                               }]">
           </td>           
          
         </tr>
	      <tr>
		     <td colspan="12" >
		     <table class="ttb"   cellspacing="0">
		       <tr>
		       <td class="tt1" style="width:10%;height:100px;background-color:#FCFCFC" ></td>
		       <td class="tt2" style="width:10%;height:100px;background-color:#FCFCFC" ></td>
		     
		       <td class="tt5" style="width:2%;height:100px"><span style="font-size:30px" ><strong>备注</strong></span></td>
		       <td class="tt6" style="width:29%;height:100px"><textarea id="_easyui_textbox_input9" class="textbox-text validatebox-text" autocomplete="off" tabindex="" placeholder="" style="margin: 0px; width:117%;height:100%;outline:none;resize:none;"></textarea></td>
		       </tr>
		     </table>
		     </td>
	      </tr>         
        
      </table>
		</form>
		<hr/>
		
		<div class="purchase">
		 <div class="divProduction">  
	    <span style="font-size: 20px;background-color:#00FFFF"><strong>纸板采购</strong></span>	
          <a href="#"
	       data-toggle="topjui-linkbutton"
	       data-options="id:'submitBtn',
	                   iconCls:'fa fa-save',
	                   form:{
	                       id:'formId',
	                       method:'submit',
	                       url:'/json/response/success.json',
	                       refreshRefererTab:true,
	                       closeCurrentTab:true
	                   }">打印</a>
	      <a href="#"
	       data-toggle="topjui-linkbutton"
	       data-options="id:'submitBtn',
	                   iconCls:'fa fa-save',
	                   form:{
	                       id:'formId',
	                       method:'submit',
	                       url:'/json/response/success.json',
	                       refreshRefererTab:true,
	                       closeCurrentTab:true
	                   }">继续下单</a>
	       <a href="#"
	       data-toggle="topjui-linkbutton"
	       data-options="id:'submitBtn',
	                   iconCls:'fa fa-save',
	                   form:{
	                       id:'formId',
	                       method:'submit',
	                       url:'/json/response/success.json',
	                       refreshRefererTab:true,
	                       closeCurrentTab:true
	                   }">保存</a>  
    	</div>
		<div class="purchase_from">
			<div>
				<strong>采购单号</strong><input style="width: 120px;height:25px" type="text" name="userNameId" data-toggle="topjui-textbox" value="C201806050001" disabled="disabled">
			</div>
			
			<div>
				<strong>采购人</strong><input type="text" style="width: 100px;height:25px" name="nativePlace"
	                           data-toggle="topjui-combobox"
	                           data-options="panelHeight:250,
	                       valueField:'id',
	                       url:_ctx + '/json/combobox/nativePlace.json'">
			</div>
			<div>
				<strong>供应商</strong><input type="text" style="width: 150px;height:25px" name="nativePlace"
	                           data-toggle="topjui-combobox"
	                           data-options="panelHeight:250,
	                       valueField:'id',
	                       url:_ctx + '/json/combobox/nativePlace.json'">
			</div>
			<div class="purchase_order_ORnumber">
				<strong>选择订单</strong><input type="text" style="width: 150px;height:25px" name="nativePlace"
	                           data-toggle="topjui-combobox"
	                           data-options="panelHeight:250,
	                       valueField:'id',
	                       url:_ctx + '/json/combobox/nativePlace.json'">
			</div>
			<button onclick="myDialog()" style="background-color:#ADFF2F"><strong>仓库纸板库存</strong></button>
			<button onclick="myDialog()" style="background-color:#ADFF2F"><strong>供应商报价单</strong></button>
		</div>
		<div class="purchase_table">
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
	    			<td style="width: 6%"><strong>采购单价</strong></td>
	    			<td style="width: 7%"><strong>采购总额</strong></td>
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
	    			<td style="font-weight: bold;"> <input type="text"   style="height:20px;width:80px" name="" value=""
                                   data-toggle="topjui-textbox"
                                  ></td>
	    			<td style="font-weight: bold;"><input type="text"   style="height:20px;width:55px" name="" value=""
                                   data-toggle="topjui-textbox"
                                  ></td>
	    			<td style="font-weight: bold;"><input type="text"   style="height:20px;width:55px" name="" value=""
                                   data-toggle="topjui-textbox"
                                  ></td>
	    			<td style="font-weight: bold;">K323K</td>	   
	    			<td style="font-weight: bold;"><input type="text"   style="height:20px;width:85px" name="" value=""
                                   data-toggle="topjui-textbox"
                                  ></td>
	    			<td style="font-weight: bold;">18.5</td>
	    			<td style="font-weight: bold;">暗线</td>	    			
	       			
	    		</tr>
	    		<tr>
	    			<td style="font-weight: bold;width: 9%" >面纸尺寸</td>
	    			<td style="font-weight: bold;width: 9%" >面纸材质</td>
	    			<td style="font-weight: bold;width: 9%" >面纸单价</td>
	    			<td style="font-weight: bold;width: 9%" >面纸总价</td>
	    			<td style="font-weight: bold;width: 9%"  rowspan="2">采购备注</td>
	    			<td style="font-weight: bold;"colspan="7"  rowspan="2"><textarea id="_easyui_textbox_input9" class="textbox-text validatebox-text" autocomplete="off" tabindex="" placeholder="" style="margin: 0px; width:99%;height:101%;outline:none;resize:none;"></textarea></td>
	    		</tr>
	    		<tr>
	    			<td style="font-weight: bold;"></td>
	    			<td style="font-weight: bold;"></td>
	    			<td style="font-weight: bold;"><input type="text"   style="height:20px;width:85px" name="" value=""
                                   data-toggle="topjui-textbox"
                                  ></td>
	    			<td style="font-weight: bold;"><input type="text"   style="height:20px;width:75px" name="" value=""
                                   data-toggle="topjui-textbox"
                                  ></td>
	    			
	    		</tr>
	    	</table>
		</div>
	</div>
	<hr/>	
		<form>		
	    <div class="divProduction">  
	    <span style="font-size: 20px;background-color:#FFD700;font-weight: bold;">生产单</span>	
          <a href="#"
	       data-toggle="topjui-linkbutton"
	       data-options="id:'submitBtn',
	                   iconCls:'fa fa-save',
	                   form:{
	                       id:'formId',
	                       method:'submit',
	                       url:'/json/response/success.json',
	                       refreshRefererTab:true,
	                       closeCurrentTab:true
	                   }">打印</a>
	      <a href="#"
	       data-toggle="topjui-linkbutton"
	       data-options="id:'submitBtn',
	                   iconCls:'fa fa-save',
	                   form:{
	                       id:'formId',
	                       method:'submit',
	                       url:'/json/response/success.json',
	                       refreshRefererTab:true,
	                       closeCurrentTab:true
	                   }">继续下单</a>
	       <a href="#"
	       data-toggle="topjui-linkbutton"
	       data-options="id:'submitBtn',
	                   iconCls:'fa fa-save',
	                   form:{
	                       id:'formId',
	                       method:'submit',
	                       url:'/json/response/success.json',
	                       refreshRefererTab:true,
	                       closeCurrentTab:true
	                   }">保存</a>  
    	</div>
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
           <td class="td1"><strong>工序：</strong></td>
           <td class="td2" colspan="11">
           </td>           
          
         </tr>       
	      <tr>
	    
		     <td class="td1" style="font-weight: bold;" >备注</td>
		     <td  class="td2" colspan="11"></td>
	      </tr>
	      </table>
		</form>
		<hr/>
		</div>
		<script>
		function myDialog() {
			var order_number=$("#order_number").val();
			var opts={
				id:'purchase_add',
				title: '写入采购数量',
				iconCls: 'fa fa-key',
			    width: 400,
			    height: 200,
			    closed: false,
			    cache: false,
			    href: 'purchase_add.jsp?orderNumber=1',
			    modal: true,
			    buttons: [{
		            text: '确定',
		            iconCls: 'fa fa-save',
		            btnCls: 'topjui-btn-green',
		            handler: function () {
		            	alert("采购ok");
		            	$("#purchase_add").iDialog('close');
		            }
		        },{
		            text: '关闭',
		            iconCls: 'fa fa-close',
		            btnCls: 'topjui-btn-red',
		            handler: function () {
		                $("#purchase_add").iDialog('close');
		            }
		        }]
			};
			$('#' + opts.id).iDialog('openDialog', opts);
	    }
	</script>	    
  </body>
</html>
