<%--
  Created by IntelliJ IDEA.
  User: zjs
  Date: 2018/9/13
  Time: 10:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%--<head>--%>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>纸板采购单</title>
    <%--<link type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">--%>
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <%--<script src="${pageContext.request.contextPath}/js/jquery.min.js" type="text/javascript"></script>--%>
    <%--<script src="${pageContext.request.contextPath}/js/bootstrap.min.js" type="text/javascript"></script>--%>
    <script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.bootcss.com/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.bootcss.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script src="${pageContext.request.contextPath}/js/grhtml5-6.6-min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/grwebapp.js" type="text/javascript"></script>
    <script type="text/javascript">
        <%--function window_onload() {--%>
            <%--var reportURL = "${pageContext.request.contextPath}/grd/caigou.grf",--%>
                <%--path = window.location.pathname,--%>
                <%--index = path.lastIndexOf("/"),--%>
                <%--&lt;%&ndash;reportURL = "${pageContext.request.contextPath}/grd/1a.grf",&ndash;%&gt;--%>
                <%--&lt;%&ndash;dataURL = "${pageContext.request.contextPath}/json/DataCenter.json",&ndash;%&gt;--%>
                <%--dataURL = "/Purchase/getPurOrderList/?purchaseAccount=${purchaseAccount}&supplierId=${supplierId}",--%>
                <%--reportViewer;--%>
            <%--//创建报表显示器，参数指定其在网页中的占位标签的ID，关联的报表模板URL，关联的报表数据URL--%>
            <%--reportViewer = window.rubylong.grhtml5.insertReportViewer("report_holder", reportURL, dataURL);--%>

            <%--reportViewer.start(); //启动报表运行，生成报表--%>

            <%--window.rootURL = window.location.protocol + "//" + window.location.host;--%>
            <%----%>
        <%--}--%>

        function window_onload() {

            //创建报表显示器，参数指定其在网页中的占位标签的ID，关联的报表模板URL，关联的报表数据URL
            <%--var reportViewer = rubylong.grhtml5.insertReportViewer("report_holder", "${pageContext.request.contextPath}/grd/caigou.grf", "/Purchase/getPurOrderList/?purchaseAccount=${purchaseAccount}&supplierId=${supplierId}");--%>
            var reportViewer = rubylong.grhtml5.insertReportViewer("report_holder", "${pageContext.request.contextPath}/grd/1a.grf", "/CustomController/demo/");
            <%--var reportViewer = rubylong.grhtml5.insertReportViewer("report_holder", "${pageContext.request.contextPath}/grd/2j.grf", "/Purchase/getPurOrderList/?purchaseAccount=${purchaseAccount}&supplierId=${supplierId}&taiId=${taiId}");--%>
            reportViewer.start(); //启动报表运行，生成报表

            window.rootURL = window.location.protocol + "//" + window.location.host + '/';
        }

        //应用URL协议启动WEB报表客户端程序，根据参数 args 调用对应的功能
        function webapp(args) {
            args.baseurl = window.rootURL;
            <%--args.report = "${pageContext.request.contextPath}/grd/caigou.grf";--%>
            <%--args.report = "${pageContext.request.contextPath}/grd/2j.grf";--%>
            <%--args.data = "/Purchase/getPurOrderList/?purchaseAccount=${purchaseAccount}&supplierId=${supplierId}&taiId=${taiId}";--%>
            args.report = "${pageContext.request.contextPath}/grd/1a.grf";
            args.data = "/CustomController/demo/";

            webapp_urlprotocol_run(args);
        }



    </script>
    <style>
        #toolbar {
            display: block;
            position: fixed;
            width: 100%;
            height: 40px;
            margin: 0;
            padding: 4px 4px;
            border: solid 1px;
            background-color: #fae3e3;
        }

        #report_holder {
            padding-top: 40px;
        }

        .rdock {
            position:absolute;
            right:8px;
        }
    </style>
</head>

<body onload="window_onload()">
<div id="toolbar" class="row">
    <a class="btn btn-sm btn-primary" role="button" href='javascript:webapp({});'>打印预览</a>
    <a class="btn btn-sm btn-primary" role="button" href='javascript:webapp({"type":"print"});'>打印...</a>
    <a class="btn btn-sm btn-primary" role="button" href='javascript:webapp({"type":"print","showOptionDlg":"false"});'>直接打印</a>

    <a class="btn btn-sm btn-primary" role="button" href='javascript:webapp({"type":"pdf"});'>导出PDF</a>
    <a class="btn btn-sm btn-primary" role="button" href='javascript:webapp({"type":"xls"});'>导出Excel</a>
    <div class="btn-group btn-group-sm">
        <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">数据导出<span class="caret"></span></button>
        <ul class="dropdown-menu" role="menu">
            <li><a href='javascript:webapp({"type":"pdf"});'>PDF</a></li>
            <li><a href='javascript:webapp({"type":"xls"});'>Excel</a></li>
            <li><a href='javascript:webapp({"type":"rtf"});'>RTF</a></li>
            <li><a href='javascript:webapp({"type":"csv"});'>CSV</a></li>
            <li><a href='javascript:webapp({"type":"txt"});'>文本</a></li>
            <li><a href='javascript:webapp({"type":"img"});'>图像</a></li>
        </ul>
    </div>

    <a class="btn btn-sm btn-primary" role="button" href='javascript:webapp({"type":"grd"});'>生成报表文档</a>

    <%--<a class="btn btn-sm btn-primary rdock" role="button" href="../PlusWebApp/webapp-about.htm" target="_blank">执行任务无响应帮助</a>--%>
</div>



    <div id="report_holder"></div>
</body>


</html>
