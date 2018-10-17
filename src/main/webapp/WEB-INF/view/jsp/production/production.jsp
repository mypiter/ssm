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
   
   
       //订单表样式
    	#tabs{margin-top:20px;width:900px;}
    	
    	.d1{
       	padding:0px;
      	border: 1px solid black;
      	width:80px;
      	height:20px;  
      	margin: 0px;   	
      }
      .d2{
       	padding:0px;
      	border: 1px solid black;
      	width:80px;
      	height:20px;  
      	margin: 0px;   	
      }
      .d3{
       	padding:0px;
      	border: 1px solid black;
      	width:80px;
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
  
	 
    </style>
    
    
  </head>  
  <body>
		<div>
		<form>
		 <div id="divPlace">    
	      <span style="font-size: 20px;background-color:#FF9797"><strong>纸箱下单</strong></span>	
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
           <td class="d1"><strong>客户名称</strong></td>
           <td class="d2"><input type="text" name="user"
                       style="height:20px;width:135px"
                       data-toggle="topjui-combogrid"
                       data-options="id:'user',
	                   idField: 'userNameId',
	                   textField: 'userName',
	                   url:remoteHost+'/system/user/getPageSetData',
	                   columns:[[
	                       {field: 'userName', title: '客户名称'},
	                   ]]"></td>
           <td class="d3"><strong >公司名称</strong></td>
           <td class="d4" colspan="4"><input type="text" name="user"
                       style="height:20px"
                       data-toggle="topjui-combogrid"
                       data-options="id:'user',
	                   idField: 'userNameId',
	                   textField: 'userName',
	                   url:remoteHost+'/system/user/getPageSetData',
	                   columns:[[
	                       {field: 'userName', title: '公司名称'},
	                   ]]"></td>
           <td class="d9"><strong>送货地址</strong></td>
           <td class="d10" colspan="4"> <input type="text" style="height:20px;width:339px" name="" value=""
                                   data-toggle="topjui-textbox"></td>
         </tr>
         <tr>
           <td class="d1"><strong>产品名称</strong></td>
           <td class="d2"><input type="text" name="user"
                       style="height:20px;width:135px"
                       data-toggle="topjui-combogrid"
                       data-options="id:'user',
	                   idField: 'userNameId',
	                   textField: 'userName',
	                   url:remoteHost+'/system/user/getPageSetData',
	                   columns:[[
	                       {field: 'userName', title: '产品名称'},
	                   ]]"></td>
	      <td class="d3"><strong>长度压线</strong></td>
           <td class="d4"><input type="text"   style="height:20px;width:170px" name="" value=""
                                   data-toggle="topjui-textbox"
                                  ></td>
           <td class="d5"><strong>业务员</strong></td>
           <td class="d6"><input type="text" name="type"
           style="height:20px;width:100px"
			                  data-toggle="topjui-combogrid"
                       data-options="id:'user',
	                   idField: 'userNameId',
	                   textField: 'userName',
	                   url:remoteHost+'/system/user/getPageSetData',
	                   columns:[[
	                       {field: 'userName', title: '业务员'},
	                   ]]"></td>
           <td class="d7"><strong>箱型</strong></td>
           <td class="d8"> <input type="text" name="type"
           style="height:20px;width:100px"
			                  data-toggle="topjui-combogrid"
                       data-options="id:'user',
	                   idField: 'userNameId',
	                   textField: 'userName',
	                   url:remoteHost+'/system/user/getPageSetData',
	                   columns:[[
	                       {field: 'userName', title: '箱型'},
	                   ]]"></td>
           <td class="d9"><strong>材质/楞型</strong></td>
           <td class="d10" colspan="3"><input type="text" name="type"
           style="height:20px;width:80px"
			                  data-toggle="topjui-combogrid"
                       data-options="id:'user',
	                   idField: 'userNameId',
	                   textField: 'userName',
	                   url:remoteHost+'/system/user/getPageSetData',
	                   columns:[[
	                       {field: 'userName', title: '材质'},
	                   ]]"><input type="text" name="type"
           style="height:20px;width:80px"
			                  data-toggle="topjui-combogrid"
                       data-options="id:'user',
	                   idField: 'userNameId',
	                   textField: 'userName',
	                   url:remoteHost+'/system/user/getPageSetData',
	                   columns:[[
	                       {field: 'userName', title: '楞型'},
	                   ]]"><input type="text"   style="height:20px;width:95px" name="" value=""
                                   data-toggle="topjui-textbox"
                                  ></td>
          
         </tr>
         <tr>
           <td class="d1"><strong>产品尺寸</strong></td>
           <td class="d2"><input type="text"   style="height:20px;width:45px" name="" value="长"
                                   data-toggle="topjui-textbox"
                                  ><input type="text"   style="height:20px;width:45px" name="" value="宽"
                                   data-toggle="topjui-textbox"
                                  ><input type="text"   style="height:20px;width:45px" name="" value="高"
                                   data-toggle="topjui-textbox"
                                  ></td>
           <td class="d3"><strong>宽度压线</strong></td>
           <td class="d4"><input type="text"   style="height:20px;width:170px" name="" value=""
                                  data-toggle="topjui-textbox"
			                  ></td>
           <td class="d5"><strong>订单数量</strong></td>
           <td class="d6" colspan="4"><input type="text"   style="height:20px;width:90px" name="" value=""
                                   data-toggle="topjui-numberspinner"
                                  ><strong>单价</strong><input type="text"   style="height:20px;width:70px" name="" value=""
                                   data-toggle="topjui-textbox"
                                  ><strong>总金额</strong><input type="text"   style="height:20px;width:110px" name="" value=""
                                   data-toggle="topjui-textbox"
                                  ></td>
        
           <td class="d11" colspan="3"><strong>下单日期&nbsp;&nbsp;</strong>
           <input data-toggle="topjui-datetimebox" data-options="required:true,
                   width:190,height:20,"  readonly="readonly" value="2018-06-14 17:10:55">          
           </td>
           
         </tr>
          <tr>
            <td class="d1" colspan="3" ><strong>压线类型&nbsp;&nbsp;</strong> <input type="text" name="type"
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
			                   ]">&nbsp;&nbsp;<strong>印刷颜色&nbsp;&nbsp;</strong>
			                   <input type="text"   style="height:20px;width:60px" name="" value=""
                                   data-toggle="topjui-combobox"
			                   data-options="data:[
			                       {
			                           text: '红',
			                           value: '1'
			                       },
			                       {
			                           text: '黄',
			                           value: '2'
			                       }
			                   ]">
                                  </td>
           
           <td class="d4" colspan="4"><strong>合同编号&nbsp;&nbsp;</strong>
           <input type="text"   data-toggle="topjui-textbox" style="height:20px;width:110px" name="" value="">
           &nbsp;&nbsp;<strong>客户编号&nbsp;&nbsp;</strong>
           <input type="text"   style="height:20px;width:110px" name="" value=""
                                 data-toggle="topjui-textbox"
			                >
           </td>
          <!--  <td class="d8" colspan="2">   <div data-toggle="topjui-checkbox"  style="height:20px;width:100px">
                <input type="checkbox" name="tz" label="样箱" checked="checked"  data-options="readonly:true" style="height:20px;width:30px" >
                <input type="checkbox" name="tz" label="产品库" checked="checked"  data-options="readonly:true" style="height:20px;width:70px" >
               
            </div></td> -->
            
           <td class="8" colspan="5"><strong>交货日期&nbsp;&nbsp;</strong>
           <input data-toggle="topjui-datetimebox" data-options="
                   width:190,height:20,"   >          
           </td>
           
         </tr>
        
     
         <tr>
           <td class="d1"><strong>工序</strong></td>
           <td class="d2" colspan="5"><input type="text" name="tagbox2" style="height:20px;width:480px"
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
           <td class="d7"><strong>样箱否</strong></td>          
          <td class="d8"><input type="text"   style="height:20px;width:60px" name="" value=""
                                   data-toggle="topjui-combobox"
			                   data-options="data:[
			                       {
			                           text: '是',
			                           value: '1'
			                       },
			                       {
			                           text: '否',
			                           value: '2'
			                       }
			                   ]"></td>
          
           <td class="d11"><strong>入产品库</strong></td>
           <td class="d12"><input type="text" name="type"
           style="height:20px;width:72px"
			                   data-toggle="topjui-combobox"
			                   data-options="data:[
			                       {
			                           text: '入',
			                           value: '1'
			                       },
			                       {
			                           text: '否',
			                           value: '2'
			                       }
			                   ]"></td>
         </tr>
	      <tr>
	      	 <td class="d1"><strong>送货备注</strong></td>
		     <td class="d2" colspan="11"><textarea style="margin: 0px; width:99.9%;height:99%;outline:none;resize:none;"></textarea></td>
	      </tr>         
        
      </table>
		</form>

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
