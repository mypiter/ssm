

<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
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
    <script src="${pageContext.request.contextPath}/static/plugins/layui/layui.js" charset="utf-8"></script>
</head>

<body>
<input type="hidden" id="uuid" name="transaction_id">
<table class="editTable">
    <tr>
        <td class="label">金额</td>
        <td>
            <input type="text" name="order_account" data-toggle="topjui-textbox" data-options="required:true">
        </td>
        <td class="label">使用对象</td>
        <td >
            <input type="text" name="pay_money"
                   data-toggle="topjui-textbox"
                   data-options="required:true">
        </td>
    </tr>
    <tr>
        <td class="label">登记人</td>
        <td><input type="text" name="no_pay_money" data-toggle="topjui-textbox" data-options="required:true"></td><!-- data-options="precision:3" 小数点 -->
        <td class="label">日期</td>
        <td> <input type="text" name="delivery_time" data-toggle="topjui-datebox" data-options="required:true"></td>
        
    </tr>
    <tr>
    	<td class="label">单价</td>
        <td><input type="text" name="user_name" data-toggle="topjui-textbox" data-options="required:true"></td><!-- data-options="precision:3" 小数点 -->
        <td class="label">数量</td>
        <td>
           <input type="text" name="user_lockTime" data-toggle="topjui-numberspinner" data-options="required:true"> 
        </td>
    </tr>
     <tr>
    	<td class="label">备注</td>
        <td colspan="3"><textarea  id="_easyui_textbox_input7" class="textbox-text validatebox-text" 
                        autocomplete="off" tabindex="" placeholder="" style="margin: 0px; height:60px;width:550px;" data-options="required:true"></textarea>
       </td>
    </tr>
</table>
<script type="text/javascript">
	//alert(uuid);
</script>
</body>
</html>

