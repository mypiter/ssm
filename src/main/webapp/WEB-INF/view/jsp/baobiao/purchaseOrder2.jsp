<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page contentType="text/html;charset=UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>送货单报表 </title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta http-equiv="keywords" content="报表">
    <meta http-equiv="description" content="送货单报表">
</head>
<style type="text/css">
    html,body {
        margin:0;
        height:100%;
    }
</style>
<script src="${pageContext.request.contextPath}/js/grhtml5-6.5-min.js" type="text/javascript"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/CreateControl.js" type="text/javascript"></script>
<body>
    <script type="text/javascript">
        var caigouUrl = "${caigouUrl}";
        var caigouUrls = caigouUrl.split(",");
        // alert(caigouUrls[0]);
        var purchaseAccount="${purchaseAccount}";
        if(purchaseAccount==""){
            var data = "${pageContext.request.contextPath}/json/caigoudan.json";
            CreatePrintViewerEx("100%", "100%", "${pageContext.request.contextPath}/grd"+caigouUrls[0],data , true, "");
        }else{
            CreatePrintViewerEx("100%", "100%", "${pageContext.request.contextPath}/grd"+caigouUrls[0], "/Purchase/getPurOrderList/?purchaseAccount=${purchaseAccount}&orderAccount=${orderAccount}&supplierId=${supplierId}&taiId=${taiId}", true, "");
        }
    </script>
</body>
</html>



