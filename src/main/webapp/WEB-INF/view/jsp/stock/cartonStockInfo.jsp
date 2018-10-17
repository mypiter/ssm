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
    <title>库区位置</title>
    <!-- 导入公共样式 -->
    <%@ include file="../ap.jsp" %>
   
</head>
<style>
   
</style>
<body>
	<table class="editTable">
	<tr>
        <td class="label">日期</td>
        <td>
            	操作数目
        </td>
    </tr>
    <tr>
        <td class="label">2018-06-08</td>
        <td>
            	入库300	
        </td>
    </tr>
    <tr>
    	 <td class="label">2018-06-09</td>
        <td>
            	入库700
        </td>
    </tr>
    <tr>
    	 <td class="label">2018-06-09</td>
        <td>
            	出库1000
        </td>
    </tr>
</table>

<script>
   var place=request('plan_num');
         //获取传入id
   function request(paras) {
            var url = location.href;
            var paraString = url.substring(url.indexOf("?") + 1, url.length).split("&");
            var paraObj = { };
            for (var i = 0; j = paraString[i]; i++) {
                paraObj[j.substring(0, j.indexOf("=")).toLowerCase()] = j.substring(j.indexOf("=") + 1, j.length);
            }
            var returnValue = paraObj[paras.toLowerCase()]; 
            if (typeof (returnValue) == "undefined") {
                return "";
            } else {
                return returnValue;
            }
        }
</script>
</body>
</html>