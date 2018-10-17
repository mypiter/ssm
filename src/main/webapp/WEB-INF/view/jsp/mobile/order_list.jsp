<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>订单列表</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
    <link type="text/css" href="http://cdn.amazeui.org/amazeui/2.7.2/css/amazeui.min.css" rel="stylesheet"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/bootstrap/js/jQuery.js"></script>
    <script type="text/javascript" src="http://cdn.amazeui.org/amazeui/2.7.2/js/amazeui.min.js"></script>
    <script type="text/javascript" src="http://cdn.amazeui.org/amazeui/2.7.2/js/amazeui.ie8polyfill.min.js"></script>
    <script type="text/javascript" src="http://cdn.amazeui.org/amazeui/2.7.2/js/amazeui.widgets.helper.min.js"></script>
  </head>
 
  <body>
  <div class="am-panel-group">
  <div class="am-panel am-panel-success" >
  <div class="am-panel-hd">生产中订单</div>
  <div class="am-panel-bd">
    <div class="am-scrollable-horizontal">
  <table class="am-table am-table-bordered am-table-striped am-text-nowrap">
   <tr>
   <th>订单号</th>
   <th>客户公司</th>
   <th>纸箱名称</th>
   <th>规格</th>
   <th>材质</th>
   <th>坑型</th>
   <th>完成数量</th>
   <th>损耗数量</th>
   <th>操作</th>
   </tr>
   <tr>
   <td>18020600005</td>
   <td>美宝时光</td>
   <td>鸡蛋箱</td>
   <td>52.5*45*36.5(cm)</td>
   <td>B625C</td>
   <td>BC</td>
   <td>1500</td>
   <td>200</td>
   <td><button class="am-btn  am-btn-success am-btn-xs">更新</button>&nbsp;&nbsp;<button class="am-btn am-btn-danger am-btn-xs">完成</button></td>
   </tr>
   <tr>
   <td>18020600005</td>
   <td>美宝时光</td>
   <td>鸡蛋箱</td>
   <td>52.5*45*36.5(cm)</td>
   <td>B625C</td>
   <td>BC</td>
   <td>1500</td>
   <td>200</td>
   <td><button class="am-btn  am-btn-success am-btn-xs">更新</button>&nbsp;&nbsp;<button class="am-btn am-btn-danger am-btn-xs">完成</button></td>
   </tr>
   <tr>
   <td>18020600005</td>
   <td>美宝时光</td>
   <td>鸡蛋箱</td>
   <td>52.5*45*36.5(cm)</td>
   <td>B625C</td>
   <td>BC</td>
   <td>1500</td>
   <td>200</td>
   <td><button class="am-btn  am-btn-success am-btn-xs">更新</button>&nbsp;&nbsp;<button class="am-btn am-btn-danger am-btn-xs">完成</button></td>
   </tr>
   <tr>
   <td>18020600005</td>
   <td>美宝时光</td>
   <td>鸡蛋箱</td>
   <td>52.5*45*36.5(cm)</td>
   <td>B625C</td>
   <td>BC</td>
   <td>1500</td>
   <td>200</td>
   <td><button class="am-btn  am-btn-success am-btn-xs">更新</button>&nbsp;&nbsp;<button class="am-btn am-btn-danger am-btn-xs">完成</button></td>
   </tr>
   <tr>
   <td>18020600005</td>
   <td>美宝时光</td>
   <td>鸡蛋箱</td>
   <td>52.5*45*36.5(cm)</td>
   <td>B625C</td>
   <td>BC</td>
   <td>1500</td>
   <td>200</td>
   <td><button class="am-btn  am-btn-success am-btn-xs">更新</button>&nbsp;&nbsp;<button class="am-btn am-btn-danger am-btn-xs">完成</button></td>
   </tr>
   <tr>
   <td>18020600005</td>
   <td>美宝时光</td>
   <td>鸡蛋箱</td>
   <td>52.5*45*36.5(cm)</td>
   <td>B625C</td>
   <td>BC</td>
   <td>1500</td>
   <td>200</td>
   <td><button class="am-btn  am-btn-success am-btn-xs">更新</button>&nbsp;&nbsp;<button class="am-btn am-btn-danger am-btn-xs">完成</button></td>
   </tr>
   <tr>
   <td>18020600005</td>
   <td>美宝时光</td>
   <td>鸡蛋箱</td>
   <td>52.5*45*36.5(cm)</td>
   <td>B625C</td>
   <td>BC</td>
   <td>1500</td>
   <td>200</td>
   <td><button class="am-btn  am-btn-success am-btn-xs">更新</button>&nbsp;&nbsp;<button class="am-btn am-btn-danger am-btn-xs">完成</button></td>
   </tr>
  </table>
</div>
  </div>
  </div>
 <div class="am-panel am-panel-danger" >
  <div class="am-panel-hd">已完成订单</div>
  <div class="am-panel-bd">
    <div class="am-scrollable-horizontal">
  <table class="am-table am-table-bordered am-table-striped am-text-nowrap">
   <tr>
   <th>订单号</th>
   <th>客户公司</th>
   <th>纸箱名称</th>
   <th>规格</th>
   <th>材质</th>
   <th>坑型</th>
   <th>完成数量</th>
   <th>损耗量</th>
   </tr>
   <tr>
   <td>18020600005</td>
   <td>美宝时光</td>
   <td>鸡蛋箱</td>
   <td>52.5*45*36.5(cm)</td>
   <td>B625C</td>
   <td>BC</td>
   <td>1500</td>
   <td>0</td>
   </tr>
   <tr>
   <td>18020600005</td>
   <td>美宝时光</td>
   <td>鸡蛋箱</td>
   <td>52.5*45*36.5(cm)</td>
   <td>B625C</td>
   <td>BC</td>
   <td>1500</td>
   <td>0</td>
   </tr>
   <tr>
   <td>18020600005</td>
   <td>美宝时光</td>
   <td>鸡蛋箱</td>
   <td>52.5*45*36.5(cm)</td>
   <td>B625C</td>
   <td>BC</td>
   <td>1500</td>
   <td>0</td>
   </tr>
   <tr>
   <td>18020600005</td>
   <td>美宝时光</td>
   <td>鸡蛋箱</td>
   <td>52.5*45*36.5(cm)</td>
   <td>B625C</td>
   <td>BC</td>
   <td>1500</td>
   <td>0</td>
   </tr>
   <tr>
   <td>18020600005</td>
   <td>美宝时光</td>
   <td>鸡蛋箱</td>
   <td>52.5*45*36.5(cm)</td>
   <td>B625C</td>
   <td>BC</td>
   <td>1500</td>
   <td>0</td>
   </tr>
  
  </table>

  <ul class="am-pagination am-pagination-centered">
  <li class="am-disabled"><a href="#">&laquo;</a></li>
  <li class="am-active"><a href="#">1</a></li>
  <li><a href="#">2</a></li>
  <li><a href="#">3</a></li>
  <li><a href="#">&raquo;</a></li>
</ul>

</div>
  </div>
  </div>
  </div>
  </body>
</html>
