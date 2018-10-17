<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>财务登记</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <!--
    <link rel="stylesheet" type="text/css" href="styles.css">
    -->
    <!-- 导入公共样式 -->
    <%@ include file="../ap.jsp" %>
    <!-- layui框架js -->
</head>

<body>
<div data-toggle="topjui-layout" data-options="fit:true">
    <div data-toggle="topjui-panel" title="" data-options="fit:true,iconCls:'icon-ok',footer:'#footer'">
<c:if test="${financialRegistrationId==null}">
        <form class="hidden" method="post" data-toggle="topjui-form" data-options="id:'formId',
               <%--url:'/json/form.json?uuid=123456',--%>
               editor:[
                   {id:'remarkAddEditor',field:'remark'}
               ]">
            </c:if>
                <c:if test="${financialRegistrationId!=null}">
                <form class="hidden" method="post" data-toggle="topjui-form" data-options="id:'formId',
               url:'/FinancialRegistration/findById/?financialRegistrationId=${financialRegistrationId}',
               editor:[
                   {id:'remarkAddEditor',field:'remark'}
               ]">
                    </c:if>
                        <input type="hidden" id="financialRegistrationId" name="financialRegistrationId">
            <div class="topjui-container">
                <table class="atable">
                    <tr><div style="margin-top:30px">使用对象<input name="financePeople" data-toggle="topjui-textbox"
                                                            data-options="width:200,required:true,validType:['length[0,20]']"></div></tr>
                    <tr><div style="margin-top:30px">&nbsp;&nbsp;&nbsp;登记人<input type="text" name="financeRegister"
                                                           data-toggle="topjui-textbox"
                                                           data-options="width:200,prompt:'必填',required:true,readonly:true" value="${adminName }"></div></tr>
                    <tr><div style="margin-top:30px">&nbsp;&nbsp;&nbsp;日期&nbsp;&nbsp;&nbsp;<input id="financeDate" name="financeDate"
                                                                         data-toggle="topjui-datebox"
                                                                         data-options="width:200">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;金额<input id="financeMoney" name="financeMoney"
                                                                 data-toggle="topjui-numberbox"
                                                                 data-options="width:100,min:0,precision:2,validType:['length[0,12]']">
                    </div></tr>
                    <tr><div style="margin-top:30px">
                        &nbsp;&nbsp;&nbsp;单价&nbsp;&nbsp;&nbsp;<input name="financePrice" data-toggle="topjui-numberbox" data-options="width:200,min:0,precision:2,max:999.99">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;数量<input name="financeNum" data-toggle="topjui-numberbox"
                                                                 data-options="width:100,min:0,validType:['length[0,10]']">
                    </div></tr>
                    <tr><div style="margin-top:30px">
                        &nbsp;&nbsp;&nbsp;备注&nbsp;&nbsp;&nbsp;<input name="financeRemarks" data-toggle="topjui-textbox"
                                                                     data-options="width:600,validType:['length[0,50]']">
                    </div>
                    </tr>
                   <%-- <div style="width:600px;margin-top:30px">
                        <center>
                            <a data-toggle="topjui-linkbutton"
                               data-options="id:'submitBtn',
                   iconCls:'fa fa-save',
                   form:{
                       id:'formId',
                       title:'财务登记',
                       method:'submit',
                       url:'/FinancialRegistration/AddFinancial/',
                       &lt;%&ndash;refreshRefererTab:true,&ndash;%&gt;
                       &lt;%&ndash;closeCurrentTab:true,&ndash;%&gt;
                   }" class="layui-btn">保存</a>
                        </center>
                    </div>--%>
                </table>
            </div>
        </form>
    </div>
</div>
<div id="footer" class="hidden" style="height: 34px; padding: 5px; text-align: right;">
    <c:if test="${financialRegistrationId==null}">
    <a href="#"
       data-toggle="topjui-linkbutton"
       data-options="id:'submitBtn',
                   iconCls:'fa fa-save',
                   form:{
                       id:'formId',
                       title:'财务登记添加',
                       method:'submit',
                       url:'/FinancialRegistration/AddFinancial/',
                       <%--refreshRefererTab:true,--%>
                       <%--closeCurrentTab:true,--%>
                   }">提交</a>
    </c:if>
    <c:if test="${financialRegistrationId!=null}">
        <a href="#"
           data-toggle="topjui-linkbutton"
           data-options="id:'submitBtn',
                 iconCls:'fa fa-save',
                 form:{
                     id:'formId',
                     title:'财务登记编辑',
                     method:'submit',
                     url:'/FinancialRegistration/updataFinancial/',
                     refreshRefererTab:true,
                     closeCurrentTab:true,
                 }">编辑</a>
    </c:if>
    <a href="#"
       data-toggle="topjui-linkbutton"
       data-options="id:'submitBtn',
                   iconCls:'fa fa-exchange',
                   btnCls:'topjui-btn-black',
                   form:{
                       id:'formId',
                       method:'reset'
                   }">重置</a>
    <a href="#"
       data-toggle="topjui-linkbutton"
       data-options="id:'submitBtn',
                   iconCls:'fa fa-trash',
                   btnCls:'topjui-btn-red',
                   form:{
                       id:'formId',
                       method:'clear'
                   }">清空</a>
</div>
</body>
</html>
