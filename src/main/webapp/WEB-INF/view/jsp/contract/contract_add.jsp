<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
</head>
<!-- 避免IE使用兼容模式 -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
    <meta name="renderer" content="webkit">
    <!-- TopJUI框架样式 -->
    <link type="text/css" href="../../topjui/css/topjui.core.min.css" rel="stylesheet">
    <link type="text/css" href="../../topjui/themes/default/topjui.red.css" rel="stylesheet" id="dynamicTheme"/>
    <!-- FontAwesome字体图标 -->
    <link type="text/css" href="../../static/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet"/>
    <!-- layui框架样式 -->
    <link type="text/css" href="../../static/plugins/layui/css/layui.css" rel="stylesheet"/>
    <!-- jQuery相关引用 -->
    <script type="text/javascript" src="../../static/plugins/jquery/jquery.min.js"></script>
    <script type="text/javascript" src="../../static/plugins/jquery/jquery.cookie.js"></script>
    <!-- TopJUI框架配置 -->
    <script type="text/javascript" src="../../static/public/js/topjui.config.js"></script>
    <!-- TopJUI框架核心-->
    <script type="text/javascript" src="../../topjui/js/topjui.core.min.js"></script>
    <!-- TopJUI中文支持 -->
    <script type="text/javascript" src="../../topjui/js/locale/topjui.lang.zh_CN.js"></script>
    <!-- layui框架js -->
    <script src="../../static/plugins/layui/layui.js" charset="utf-8"></script>
  
  <body>
    <input type="hidden" id="uuid" name="uuid">
<table class="editTable">
    <tr>
        <td class="label">签约客户</td>
        <td colspan="3">
            <input type="text" name="contract_customers" data-toggle="topjui-textbox" data-options="required:true,width:450">
        </td>
    </tr>
    <tr>
        <td class="label">产品名称</td>
        <td>
            <input type="text" name="product_name" data-toggle="topjui-textbox" data-options="required:true,width:150">
        </td>
        <td class="label">产品数量</td>
        <td>
            <input type="text" name="product_num" data-toggle="topjui-textbox" data-options="required:true,width:150">
        </td>
    </tr>
    <tr>
        <td class="label">合作时间</td>
        <td><input type="text" name="cooperation_time" data-toggle="topjui-datebox"></td>
        <td class="label">合同时间</td>
        <td>
            <input type="text" name="contract_time" data-toggle="topjui-textbox" data-options="required:true,width:150">
        </td>
    </tr>
    <tr>
        <td class="label">合同附件1</td>
        <td colspan="3">
            <input type="text" name="contract_img1" data-toggle="topjui-upload-lay"
                   data-options="editable:false,
                       buttonText:'上传图片',
                       accept:'images',
                       uploadUrl:'/json/response/upload.json'">
        </td>
    </tr>
    <tr>
        <td class="label">合同附件2</td>
        <td colspan="3">
            <input type="text" name="contract_img2" data-toggle="topjui-upload-lay"
                   data-options="editable:false,
                       buttonText:'上传图片',
                       accept:'images',
                       uploadUrl:'/json/response/upload.json'">
        </td>
    </tr>
    
</table>
  </body>
</html>
