<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
    <title>公司信息新增</title>

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
<form class="hidden" method="post" data-toggle="topjui-form" data-options="id:'formId'">
    <input type="hidden" id="id" name="id">
    <div class="topjui-row" style="margin-top: 20px;">
        <div class="topjui-col-sm10">
            <label class="topjui-form-label">公司名称</label>
            <div class="topjui-input-block">
                <input type="text" name="companyName"
                       data-toggle="topjui-textbox"
                       data-options="required:true,validType:['length[0,50]']">
            </div>
        </div>

    </div>
    <div class="topjui-row">
        <div class="topjui-col-sm10">
            <label class="topjui-form-label">公司税号</label>
            <div class="topjui-input-block">
                <input type="text" name="companySui" data-toggle="topjui-textbox" data-options="required:true,validType:['checkMaterial','length[0,50]']">

            </div>
        </div>
    </div>
    <div class="topjui-row">
        <div class="topjui-col-sm10">
            <label class="topjui-form-label">公司地址</label>
            <div class="topjui-input-block">
                <input type="text" name="companyAddress" data-toggle="topjui-textbox" data-options="required:true,validType:['length[0,150]']">

            </div>
        </div>
    </div>
    <div class="topjui-row">
        <div class="topjui-col-sm6">
            <label class="topjui-form-label">公司电话</label>
            <div class="topjui-input-block">
                <input type="text" name="companyTel"
                       data-toggle="topjui-textbox"
                       data-options="required:true,validType:'telephone'">
            </div>
        </div>
    </div>

    <div class="topjui-row">
        <div class="topjui-col-sm10">
            <label class="topjui-form-label">开户行</label>
            <div class="topjui-input-block">
                <input type="text" name="openingBank"
                       data-toggle="topjui-textbox"
                       data-options="required:true,validType:['length[0,50]']">
            </div>
        </div>
    </div>
    <div class="topjui-row">
        <div class="topjui-col-sm10">
            <label class="topjui-form-label">账号</label>
            <div class="topjui-input-block">
                <input type="text" name="companyAccount"
                       data-toggle="topjui-numberbox"
                       data-options="required:true,groupSeparator:'',validType:['length[0,50]']">
            </div>
        </div>
    </div>
    <div class="topjui-row">
        <div class="topjui-col-sm5">
            <label class="topjui-form-label">联系人</label>
            <div class="topjui-input-block">
                <input type="text" name="contacts"
                       data-toggle="topjui-textbox"
                       data-options="required:true,validType:['length[0,20]']">
            </div>
        </div>
        <div class="topjui-col-sm5">
            <label class="topjui-form-label">联系人电话</label>
            <div class="topjui-input-block">
                <input type="text" name="contactsTel"
                       data-toggle="topjui-textbox"
                       data-options="required:true,validType:['telephone']">
            </div>
        </div>
    </div>
    <div class="topjui-row">
        <div class="topjui-col-sm5">
            <label class="topjui-form-label">法人</label>
            <div class="topjui-input-block">
                <input type="text" name="faName"
                       data-toggle="topjui-textbox"
                       data-options="required:true,validType:['length[0,20]']">
            </div>
        </div>
        <div class="topjui-col-sm5">
            <label class="topjui-form-label">法人电话</label>
            <div class="topjui-input-block">
                <input type="text" name="faTel"
                       data-toggle="topjui-textbox"
                       data-options="required:true,validType:['telephone']">
            </div>
        </div>
    </div>
</form>
</body>
</html>