<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
    <title>管理添加</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <!-- 导入公共样式 -->
    <%@ include file="../ap.jsp" %>
   <%-- <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <!-- 避免IE使用兼容模式 -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
    <meta name="renderer" content="webkit">
    <!-- TopJUI框架样式 -->
    <link type="text/css" href="${pageContext.request.contextPath}/topjui/css/topjui.core.min.css" rel="stylesheet">
    <link type="text/css" href="${pageContext.request.contextPath}/topjui/themes/default/topjui.red.css" rel="stylesheet" id="dynamicTheme"/>
    <!-- FontAwesome字体图标 -->
    <link type="text/css" href="${pageContext.request.contextPath}/static/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet"/>
    <!-- layui框架样式 -->
    <link type="text/css" href="${pageContext.request.contextPath}/static/plugins/layui/css/layui.css" rel="stylesheet"/>
    <!-- jQuery相关引用 -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/plugins/jquery/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/plugins/jquery/jquery.cookie.js"></script>
    <!-- TopJUI框架配置 -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/public/js/topjui.config.js"></script>
    <!-- TopJUI框架核心-->
    <script type="text/javascript" src="${pageContext.request.contextPath}/topjui/js/topjui.core.min.js"></script>
    <!-- TopJUI中文支持 -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/topjui/js/locale/topjui.lang.zh_CN.js"></script>
    <!-- layui框架js -->
    <script src="${pageContext.request.contextPath}/static/plugins/layui/layui.js" charset="utf-8"></script>--%>
</head>
<style type="text/css">
.user{
   width:400px;
   height:400px;
   border:2px red solid;
   text-align: right;
   float:right;
  
}
span{
  color: #fff;
  }
</style>
<body>
<div data-toggle="topjui-layout" data-options="fit:true">
    <div data-toggle="topjui-panel" title="" data-options="fit:true,iconCls:'icon-ok',footer:'#footer'">
        <c:if test="${adminNamed==null}">
  <form class="hidden" method="post" data-toggle="topjui-form" data-options="id:'formId',
               <%--url:'/PlaceController/from/?placeId=${placeId}',--%>
               onChang:{

               },
               editor:[
                   {id:'remarkAddEditor',field:'remark'}
               ]">
      </c:if>
      <c:if test="${adminNamed!=null}">
      <form class="hidden" method="post" data-toggle="topjui-form" data-options="id:'formId',
               url:'/AdminController/getAdmin/?adminId=${adminId}',
               editor:[
                   {id:'remarkAddEditor',field:'remark'}
               ]">
          <input type="hidden" id="adminId" name="adminId">
          </c:if>
    <table class="editTable">
        
        <tr>
            <td class="label">管理员名称</td>
            <td><input type="text" name="adminName" value="" data-toggle="topjui-textbox"
                       data-options="required:true,width:300,validType:['length[0,30]']"></td>
            <td class="label">管理员账号</td>
            <td><input type="text" name="adminAccount" value="" data-toggle="topjui-textbox"
                       data-options="required:true,width:300,validType:['length[0,30]']"></td>
        </tr>
        <tr>
            <td class="label">密码</td>
            <td>
                <input type="text" id="adminPassword" name="adminPassword" data-toggle="topjui-textbox" data-options="width:300,required:true,validType:['length[0,30]']">
            </td>
            <td class="label">重复密码</td>
            <td><input type="text" id="adminPasswordTwo" name="adminPasswordTwo" data-toggle="topjui-textbox" data-options="width:300,required:true"></td>
        </tr>
        <tr>
             <td class="label">权限等级</td>
            <td><input name="level" data-toggle="topjui-switchbutton"
                                   data-options="id:'level',width:300,required:true,onText:'普通管理员',
		offText:'超级管理员'"></td>
        </tr>
    </table>
</form>
    </div>
</div>
<div id="footer" class="hidden" style="height: 34px; padding: 5px; text-align: right;">
    <c:if test="${adminNamed==null}">
        <a href="#"
           data-toggle="topjui-linkbutton"
           data-options="id:'submitBtn',
                   iconCls:'fa fa-save',
                   form:{
                       id:'formId',
                       title:'管理提交',
                       method:'submit',
                       url:'/AdminController/AddAdmin/',
                       <%--refreshRefererTab:true,--%>
                       <%--closeCurrentTab:true,--%>
                   }">提交</a>
    </c:if>
    <c:if test="${adminNamed!=null}">
        <a href="#"
           data-toggle="topjui-linkbutton"
           data-options="id:'submitBtn',
                   iconCls:'fa fa-save',
                   form:{
                       id:'formId',
                       title:'管理修改',
                       method:'submit',
                       url:'/AdminController/updataAdmin/',
                       refreshRefererTab:true,
                       closeCurrentTab:true,
                   }">确定</a>
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
<script type="text/javascript">
    $(function () {
        $('#adminPassword').iPasswordbox({
            required: true,
            validType: 'minLength[6]'
        });
        $('#adminPasswordTwo').iPasswordbox({
            required: true,
            validType: "equals['#adminPassword']"
        });
    });
</script>
</body>
</html>