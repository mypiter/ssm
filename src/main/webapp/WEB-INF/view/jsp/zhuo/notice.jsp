<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
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
    </head>

<body>
<input type="hidden" id="uuid" name="uuid">
<input type="hidden" name="visitNums">

<table class="editTable">
    <tr>
    	<td class="label">公告标题</td>
    	<td>
    		<input type="text" name="age" data-toggle="topjui-textbox"  data-options="required:true,width:278,prompt:'必填'">
    	</td>
    </tr>
    <tr>
        <td  valign="top" align="right">发送内容</td>
        <td colspan="3">
            <textarea name="content" data-toggle="topjui-ueditor" data-options="id:'contentAddEditor'"></textarea>
        </td>
    </tr>
</table>
<!-- Ueditor编辑器插件 -->
<script type="text/javascript" src="../../static/plugins/ueditor/ueditor.config.js"></script>
<script type="text/javascript" src="../../static/plugins/ueditor/ueditor.all.min.js"></script>
</body>
</html>