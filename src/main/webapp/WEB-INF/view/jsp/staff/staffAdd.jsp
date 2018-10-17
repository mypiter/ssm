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
    <input type="hidden" id="staffId" name="staffId" value="">
    <div class="topjui-row">
        <div class="topjui-col-sm5">
            <label class="topjui-form-label">姓名</label>
            <div class="topjui-input-block">
                <input type="text" name="staffName"
                       data-toggle="topjui-textbox"
                       data-options="required:true,validType:['length[0,20]']">
            </div>
        </div>
        <div class="topjui-col-sm5">
            <label class="topjui-form-label">年龄</label>
            <div class="topjui-input-block">
                <input type="text" name="staffAge" data-toggle="topjui-numberbox" data-options="required:true,min:1,max:60,prompt:'输入范围1到60之间'">

            </div>
        </div>
    </div>
    <div class="topjui-row">
        <div class="topjui-col-sm5">
            <label class="topjui-form-label">性别</label>
            <div class="topjui-input-block">
                <input name="sex"
                       data-toggle="topjui-combobox"
                       data-options="data:[{text:'男',value:'男',selected:true},{text:'女',value:'女'}]"/>
            </div>
        </div>
        <div class="topjui-col-sm5">
            <label class="topjui-form-label">工资结算方式</label>
            <div class="topjui-input-block">
                <input name="mode"
                       data-toggle="topjui-combobox"
                       data-options="data:[{text:'微信',value:'微信',selected:true},{text:'支付宝',value:'支付宝'},{text:'银行转账',value:'银行转账'}]"/>
            </div>
        </div>
    </div>

    <div class="topjui-row">
        <div class="topjui-col-sm5">
            <label class="topjui-form-label">电话</label>
            <div class="topjui-input-block">
                <input type="text" name="staffTel"
                       data-toggle="topjui-numberbox"
                       data-options="required:true,groupSeparator:'',validType:'telephone'">
            </div>
        </div>
        <div class="topjui-col-sm5">
            <label class="topjui-form-label">职务</label>
            <div class="topjui-input-block">
                <input type="text" name="staffPost"
                       data-toggle="topjui-textbox"
                       data-options="validType:['length[0,20]']">
            </div>
        </div>
    </div>

    <div class="topjui-row">
        <div class="topjui-col-sm5">
            <label class="topjui-form-label">工资</label>
            <div class="topjui-input-block">
                <input type="text" name="staffSalary"
                       data-toggle="topjui-numberbox"
                       data-options="groupSeparator:'',min:0,validType:['length[0,20]']">
            </div>
        </div>
        <div class="topjui-col-sm5">
            <label class="topjui-form-label">所属部门</label>
            <div class="topjui-input-block">
                <input name="isSalesman" data-toggle="topjui-combobox" data-options="data:[{text:'业务部门',value:1},{text:'生产部门',value:2},{text:'物流部门',value:3}]"/>
            </div>
        </div>

    </div>
    <div class="topjui-row">
        <div class="topjui-col-sm5">
            <label class="topjui-form-label">提成</label>
            <div class="topjui-input-block">
                <input type="text" name="extract"
                       data-toggle="topjui-numberbox"
                       data-options="min:0<%--,precision:2,--%>,groupSeparator:'',validType:['length[0,8]']">
            </div>
        </div>

        <div class="topjui-col-sm5">
            <label class="topjui-form-label">入职时间</label>
            <div class="topjui-input-block">
                <input type="text" name="staffTime" data-toggle="topjui-datebox" data-options="">
            </div>
        </div>

    </div>

    <div class="topjui-row">
        <div class="topjui-col-sm10">
            <label class="topjui-form-label">现地址</label>
            <div class="topjui-input-block">
                <input name="staffAddress" data-toggle="topjui-textbox" data-options="required:true,id:'staffAddressAddEditor',validType:['length[0,50]']">
            </div>
        </div>
    </div>
    <div class="topjui-row">
        <div class="topjui-col-sm10">
            <label class="topjui-form-label">身份证号</label>
            <div class="topjui-input-block">
                <input name="idNumber" data-toggle="topjui-textbox" data-options="validType:['length[0,50]']">
            </div>
        </div>
    </div>
    <div class="topjui-row">
        <div class="topjui-col-sm10">
            <label class="topjui-form-label">家庭地址</label>
            <div class="topjui-input-block">
                <input name="homeAddress" data-toggle="topjui-textbox" data-options="validType:['length[0,150]']">
            </div>
        </div>
    </div>
    <div class="topjui-row">
        <div class="topjui-col-sm10">
            <label class="topjui-form-label">开户行</label>
            <div class="topjui-input-block">
                <input name="openBank" data-toggle="topjui-textbox" data-options="validType:['length[0,150]']">
            </div>
        </div>
    </div>
    <div class="topjui-row">
        <div class="topjui-col-sm10">
            <label class="topjui-form-label">账号</label>
            <div class="topjui-input-block">
                <input name="account" data-toggle="topjui-textbox" data-options="validType:['length[0,50]']">
            </div>
        </div>
    </div>
    <div class="topjui-row">
        <div class="topjui-col-sm10">
            <label class="topjui-form-label">备注</label>
            <div class="topjui-input-block">
                <input name="remarks" data-toggle="topjui-textbox" data-options="validType:['length[0,150]']">
            </div>
        </div>
    </div>
</form>
</body>
</html>