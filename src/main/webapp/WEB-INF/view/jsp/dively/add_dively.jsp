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

    <title>送货单登记</title>

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
        <c:if test="${id!=null}">
        <form class="hidden" method="post" enctype="multipart/form-data" data-toggle="topjui-form" data-options="id:'formId',
               url:'/Dively/findById/?id=${id}',
               editor:[
                   {id:'remarkAddEditor',field:'remark'}
               ]">
            </c:if>

            <c:if test="${id==null}">
            <form class="hidden" method="post" enctype="multipart/form-data" data-toggle="topjui-form" data-options="id:'formId',
               <%--url:'/json/form.json?uuid=123456',--%>
               editor:[
                   {id:'remarkAddEditor',field:'remark'}
               ]">
                </c:if>
                <input type="hidden" name="id">
                <div class="topjui-container">
                    <table class="atable">
                        <tr>
                            <div style="margin-top:30px">类别<input  id="biao" name="biao"
                                                                   data-toggle="topjui-combobox"
                                                                   data-options="data:[{text:'采购单',value:'1',selected:true},
                                                             {text:'送货单',value:'2'}],width:100,required:true,panelHeight:100"/></div>

                        </tr>
                        <tr>
                            <div style="margin-top:30px">名称<input id="name" name="name"
                                                                    data-toggle="topjui-textbox" class="easyui-validatebox"
                                                                    data-options="width:250,required:true,validType:['length[0,50]']"></div>
                        </tr>
                        <tr>
                            <div style="margin-top:30px">
                                上传文件<input type="file" id="DivelyFile" name="divelyFile" style="width:300px">
                            </div>
                        </tr>
                        <div style="margin-top:30px;width:400px">
                            <center>
                                <c:if test="${id==null}">
                                    <a data-toggle="topjui-linkbutton"
                                       data-options="id:'submitBtn',
                   iconCls:'fa fa-save',
                   form:{
                       id:'formId',
                       title:'登记',
                       method:'submit',
                       url:'/Dively/addDiv/',
                       <%--refreshRefererTab:true,--%>
                       <%--closeCurrentTab:true,--%>
                   }" class="layui-btn">保存</a>
                                </c:if>
                                <c:if test="${id!=null}">
                                    <a data-toggle="topjui-linkbutton"
                                       data-options="id:'submitBtn',
                   iconCls:'fa fa-save',
                   form:{
                       id:'formId',
                       title:'编辑',
                       method:'submit',
                       url:'/Dively/updataDively/',
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
