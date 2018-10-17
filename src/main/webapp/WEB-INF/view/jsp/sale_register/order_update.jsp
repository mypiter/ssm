<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>订单单价修改</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
     <link type="text/css" href="${pageContext.request.contextPath}/topjui/css/topjui.core.min.css" rel="stylesheet">
    <link type="text/css" href="${pageContext.request.contextPath}/topjui/themes/default/topjui.red.css" rel="stylesheet" id="dynamicTheme"/>
    <!-- FontAwesome字体图标 -->
    <link type="text/css" href="${pageContext.request.contextPath}/static/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet"/>
    <!-- layui框架样式 -->
    <link type="text/css" href="${pageContext.request.contextPath}/static/plugins/layui/css/layui.css" rel="stylesheet"/>
    <!-- jQuery相关引用 -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/plugins/jquery/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/plugins/jquery/jquery.cookie.js"></script>
    <!-- TopJUI框架配置 -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/public/js/topjui.config.js"></script>
    <!-- TopJUI框架核心-->
    <script type="text/javascript" src="${pageContext.request.contextPath}/topjui/js/topjui.core.min.js"></script>
    <!-- TopJUI中文支持 -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/topjui/js/locale/topjui.lang.zh_CN.js"></script>
    <!-- layui框架js -->
    
    <style type="text/css">
      .atable{
        width:1000px;
      }
      
      .atable tr td{
         text-align:center;
         border:1px solid black;
         height:30px;
      }
    </style> 
  </head>
  
  <body>
    
    <form id="formId">
    
    
      <div id="bdiv">
            <a href="#" data-toggle="topjui-linkbutton" data-options="text:'保存',iconCls:null,btnCls:'green'"></a>
            <a href="#"
				       data-toggle="topjui-linkbutton"
				       data-options="id:'submitBtn',
				                   iconCls:null,
				                   btnCls:'green',
				                   form:{
				                       id:'formId',
				                       method:'reset'
				                   }">重置</a>
         </div>
         
         <table class="atable">
         
         
           <tr>
             <td style="width:80px">生产单号</td>
             <td><input data-toggle="topjui-textbox" data-options="width:100"/></td>
             <td style="width:80px">下单日期</td>
             <td><input data-toggle="topjui-textbox" data-options="width:140,disabled:true"/></td>
             <td style="width:80px">客户名称</td>
             <td><input data-toggle="topjui-textbox" data-options="width:200,disabled:true"/></td>
             <td style="width:80px">材质</td>
             <td><input data-toggle="topjui-textbox" data-options="width:60,disabled:true"/></td>
             <td style="width:80px">产品名称</td>
             <td><input data-toggle="topjui-textbox" data-options="width:100,disabled:true"/></td>
           </tr>
           
           
           <tr>
             <td colspan='10'>
               <table style="border-width:0px;border-style:hidden;border-collapse:collapse">
                 <tr>
                     <td style="width:60px">楞型</td>
		             <td><input data-toggle="topjui-textbox" data-options="width:140,disabled:true"/></td>
		             <td style="width:80px">产品规格</td>
		             <td><input data-toggle="topjui-textbox" data-options="width:120,disabled:true"/></td>
		             <td style="width:80px">订单数量</td>
		             <td><input data-toggle="topjui-textbox" data-options="width:80,disabled:true"/></td>
		             <td style="width:60px">平方价</td>
		             <td><input data-toggle="topjui-textbox" data-options="width:80,disabled:true"/></td>
		             <td style="width:60px">单价</td>
		             <td><input data-toggle="topjui-textbox" data-options="width:80,disabled:true"/></td>
		             <td style="width:140px">总金额</td>
		             <td><input data-toggle="topjui-textbox" data-options="width:80,disabled:true"/></td>
                 </tr>
               </table>
             </td>
           </tr>
           
           
           <tr>
             <td colspan='10'>
               <table style="border-width:0px;border-style:hidden;border-collapse:collapse">
                 <tr>
                     <td style="width:100px">新平方价</td>
		             <td><input data-toggle="topjui-textbox" data-options="width:200"/></td>
		             <td style="width:100px">新单价</td>
		             <td><input data-toggle="topjui-textbox" data-options="width:300"/></td>
		             <td style="width:100px">新总金额</td>
		             <td><input data-toggle="topjui-textbox" data-options="width:200"/></td>
                 </tr>
               </table>
             </td>
           </tr>
           
           
         </table>
    </form>
  </body>
</html>
            