<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page contentType="text/html;charset=UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>报表 </title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta http-equiv="keywords" content="报表">
    <meta http-equiv="description" content="报表">
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
<script language="javascript" type="text/javascript">
    var data=getQueryString("custom");
    //用打印显示控件展现报表，从URL“../grf/1a.grf”获取报表膜板定义，从URL“../data/DataCenter.jsp?data=Customer”获取XML形式的报表数据，${pageContext.request.contextPath}/json/song.json
    CreatePrintViewerEx("100%", "100%", "${pageContext.request.contextPath}/js/cang.grf", "/Mian/selectCs/?cust="+encodeURI(data), true, "");
    /*获取地址栏参数的方法实现*/
    function getQueryString(name) {
        var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
        var r = window.location.search.substr(1).match(reg);
        if (r != null) {
            return decodeURI(r[2]); //return unescape(r[2]);
        }
        return null;
    }
    /*获取地址栏参数的方法实现*/
</script>

</body>
</html>



