<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">

    <title>印版登记</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <!--
    <link rel="stylesheet" type="text/css" href="styles.css">
    -->
    <%@ include file="../ap.jsp" %>
</head>

<body>

<div data-toggle="topjui-layout" data-options="fit:true">
    <div data-toggle="topjui-panel" title="" data-options="fit:true,iconCls:'icon-ok',footer:'#footer'">
        <c:if test="${printedId!=null}">
        <form class="hidden" method="post" enctype="multipart/form-data" data-toggle="topjui-form" data-options="id:'formId',
               url:'/PrintedController/findById/?printedId=${printedId}',
               editor:[
                   {id:'remarkAddEditor',field:'remark'}
               ]">
            </c:if>
            <c:if test="${printedId==null}">
                <form class="hidden" method="post" enctype="multipart/form-data" data-toggle="topjui-form" data-options="id:'formId',
               <%--url:'/json/form.json?uuid=123456',--%>
               editor:[
                   {id:'remarkAddEditor',field:'remark'}
               ]">
            </c:if>
                <input type="hidden" name="printedId">
            <div class="topjui-container">
                <table class="atable">
                    <tr><div style="margin-top:30px">印版名称<input name="printName" data-toggle="topjui-textbox"
                                                            data-options="width:150,required:true,validType:['length[0,30]']"></div></tr>
                    <tr><div style="margin-top:30px">印版编号<input name="printNum" data-toggle="topjui-textbox"
                                                                data-options="width:150,required:true,prompt:'只限数字',min:0,validType:['length[0,10]']"></div></tr>
                    <tr><div style="margin-top:30px">
                        上传照片<input type="file" id="printPictureFile" name="printPictureFile" <%--data-toggle="topjui-textbox"--%>
                                   <%--data-options="&lt;%&ndash;buttonIcon:'fa fa-folder',&ndash;%&gt;required:true"--%> style="width:300px">
                    </div></tr>
                    <div style="margin-top:30px;width:400px">
                        <center>
<c:if test="${printedId==null}">
                            <a data-toggle="topjui-linkbutton"
                               data-options="id:'submitBtn',
                   iconCls:'fa fa-save',
                   form:{
                       id:'formId',
                       title:'印版登记提交',
                       method:'submit',
                       url:'/PrintedController/addPrinted/'
                       <%--refreshRefererTab:true,--%>
                       <%--closeCurrentTab:true,--%>
                   }" class="layui-btn">保存</a>
                            </c:if>
                            <c:if test="${printedId!=null}">
                                <a data-toggle="topjui-linkbutton"
                                   data-options="id:'submitBtn',
                   iconCls:'fa fa-save',
                   form:{
                       id:'formId',
                       title:'编辑印版',
                       method:'submit',
                       url:'/PrintedController/updataPrinted/',
                       refreshRefererTab:true,
                       closeCurrentTab:true
                   }" class="layui-btn">确定</a>
                            </c:if>
                        </center>
                    </div>
                </table>
            </div>
        </form>
    </div>
</div>


</body>
</html>
