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

    <title>刀模登记</title>

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
        <c:if test="${knifeTemplateId!=null}">
        <form class="hidden" method="post" enctype="multipart/form-data" data-toggle="topjui-form" data-options="id:'formId',
               url:'/KnifeTemplate/findById/?knifeTemplateId=${knifeTemplateId}',
               editor:[
                   {id:'remarkAddEditor',field:'remark'}
               ]">
            </c:if>

                <c:if test="${knifeTemplateId==null}">
                <form class="hidden" method="post" enctype="multipart/form-data" data-toggle="topjui-form" data-options="id:'formId',
               <%--url:'/json/form.json?uuid=123456',--%>
               editor:[
                   {id:'remarkAddEditor',field:'remark'}
               ]">
                    </c:if>
                        <input type="hidden" name="knifeTemplateId">
            <div class="topjui-container">
                <table class="atable">
                    <tr>
                        <div style="margin-top:30px">刀模名称<input id="knifeTemplateName" name="knifeTemplateName"
                                                                data-toggle="topjui-textbox" class="easyui-validatebox"
                                                                data-options="width:150,required:true,validType:['length[0,30]']"></div>
                    </tr>
                    <tr>
                        <div style="margin-top:30px">刀模编号<input id="knifePlateNum" name="knifePlateNum"
                                                                data-toggle="topjui-textbox"
                                                                class="easyui-validatebox"
                                                                data-options="width:150,required:true,validType:['length[0,30]']">
                        </div>
                    </tr>
                    <tr>
                        <div style="margin-top:30px">
                            上传照片<input type="file" id="knifePictureFile" name="knifePictureFile" style="width:300px">
                            <%--<input id="knifePictureFile" name="knifePictureFile" data-toggle="topjui-uploadbox"--%>
                                       <%--data-options="editable:false,--%>
                                       <%--buttonText:'上传图片',--%>
                                       <%--accept:'images',--%>
                                       <%--uploadUrl:'/json/response/upload.json',required:true" style="width:300px">--%>

                        </div>
                    </tr>
                    <div style="margin-top:30px;width:400px">
                        <center>
<c:if test="${knifeTemplateId==null}">
                            <a data-toggle="topjui-linkbutton"
                               data-options="id:'submitBtn',
                   iconCls:'fa fa-save',
                   form:{
                       id:'formId',
                       title:'刀模登记',
                       method:'submit',
                       url:'/KnifeTemplate/addKnife/',
                       <%--refreshRefererTab:true,--%>
                       <%--closeCurrentTab:true,--%>
                   }" class="layui-btn">保存</a>
</c:if>
<c:if test="${knifeTemplateId!=null}">
    <a data-toggle="topjui-linkbutton"
       data-options="id:'submitBtn',
                   iconCls:'fa fa-save',
                   form:{
                       id:'formId',
                       title:'编辑刀模',
                       method:'submit',
                       url:'/KnifeTemplate/updataKnife/',
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
