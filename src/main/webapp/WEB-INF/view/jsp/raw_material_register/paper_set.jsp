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

    <title>纸张设置</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <!--
    <link rel="stylesheet" type="text/css" href="styles.css">
    -->
    <%@ include file="../ap.jsp" %>
    <style type="text/css">
        .atable {
            margin: 0 auto;
            width: 1000px;
        }

        .atable tr td {
            text-align: center;
            border: 1px solid black;
        }
    </style>
</head>

<body>
<div data-toggle="topjui-layout" data-options="fit:true">
    <div data-toggle="topjui-panel" title="" data-options="fit:true,iconCls:'icon-ok',footer:'#footer'">
    <c:if test="${paperId!=null}">
        <form class="hidden" method="post" data-toggle="topjui-form" data-options="id:'formId',
               url:'/PaperSet/findById/?paperId=${paperId}',
               editor:[
                   {id:'remarkAddEditor',field:'remark'}
               ]">
            </c:if>
                <c:if test="${paperId==null}">
                <form class="hidden" method="post" enctype="multipart/form-data" data-toggle="topjui-form" data-options="id:'formId',
               <%--url:'/json/form.json?uuid=123456',--%>
               editor:[
                   {id:'remarkAddEditor',field:'remark'}
               ]">
                    </c:if>
                    <input type="hidden" name="paperId">
            <div class="topjui-container">
                <table class="atable">
                    <tr>
                        <div style="margin-top:30px">纸张名称&nbsp;&nbsp;<input name="paperName" data-toggle="topjui-textbox"
                                                                            data-options="width:150,required:true,validType:['length[0,10]']"></div>
                    </tr>
                    <tr>
                        <div style="margin-top:30px">代号&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input name="paperCode" data-toggle="topjui-textbox"
                                                                                                              data-options="width:150,required:true,validType:['length[0,10]']"></div>
                    </tr>
                    <tr>
                        <div style="margin-top:30px"> 克重(g/㎡)<input type="text" name="paperWeight"
                                                                    data-toggle="topjui-numberbox" data-options="width:150,required:true,min:0,max:1000000,validType:['length[0,10]']" style="width:150px">
                        </div>
                    </tr>
                    <tr>
                        <div style="margin-top:30px"> 单价(元/㎡)<input type="text" name="paperPrice"
                                                                    data-toggle="topjui-numberbox" data-options="width:150,required:false,min:0,max:999.99,precision:2" style="width:150px">
                        </div>
                    </tr>

                    <div style="margin-top:30px;width:400px">
                        <center>
                            <c:if test="${paperId==null}">
                            <a data-toggle="topjui-linkbutton"
                               data-options="id:'submitBtn',
                       iconCls:'fa fa-save',
                       form:{
                           id:'formId',
                           title:'纸张设置',
                           method:'submit',
                           url:'/PaperSet/addPaper/',
                           <%--refreshRefererTab:true,--%>
                           <%--closeCurrentTab:true,--%>
                       }" class="layui-btn">保存</a>
                        </c:if>
                        <c:if test="${paperId!=null}">
                            <a data-toggle="topjui-linkbutton"
                               data-options="id:'submitBtn',
                   iconCls:'fa fa-save',
                   form:{
                       id:'formId',
                       title:'编辑纸张',
                       method:'submit',
                       url:'/PaperSet/updatePaper/',
                       refreshRefererTab:true,
                       closeCurrentTab:true,
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
