<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">

    <title>货款回笼登记</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <!--
    <link rel="stylesheet" type="text/css" href="styles.css">
    -->
    <link type="text/css" href="${pageContext.request.contextPath}/topjui/css/topjui.core.min.css" rel="stylesheet">
    <link type="text/css" href="${pageContext.request.contextPath}/topjui/themes/default/topjui.red.css"
          rel="stylesheet" id="dynamicTheme"/>
    <!-- FontAwesome字体图标 -->
    <link type="text/css" href="${pageContext.request.contextPath}/static/plugins/font-awesome/css/font-awesome.min.css"
          rel="stylesheet"/>
    <!-- layui框架样式 -->
    <link type="text/css" href="${pageContext.request.contextPath}/static/plugins/layui/css/layui.css"
          rel="stylesheet"/>
    <!-- jQuery相关引用 -->
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/static/plugins/jquery/jquery.min.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/static/plugins/jquery/jquery.cookie.js"></script>
    <!-- TopJUI框架配置 -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/public/js/topjui.config.js"></script>
    <!-- TopJUI框架核心-->
    <script type="text/javascript" src="${pageContext.request.contextPath}/topjui/js/topjui.core.min.js"></script>
    <!-- TopJUI中文支持 -->
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/topjui/js/locale/topjui.lang.zh_CN.js"></script>
    <!-- layui框架js -->
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
        <form class="hidden" method="post" data-toggle="topjui-form" data-options="id:'formId',
               <%--url:'/json/form.json?uuid=123456',--%>
               editor:[
                   {id:'remarkAddEditord',field:'remark'}
               ]">
            <div class="topjui-container">
                <table class="atable">
                    <tr>
                        <div style="margin-top:30px">回款日期<input name="receiptAcceptanceDate" data-toggle="topjui-datetimebox"
                                                                data-options="width:200,required:true"></div>
                    </tr>
                    <tr>
                        <div style="margin-top:30px">客户名称<input type="text" name="customName"
                                                                data-toggle="topjui-combogrid"
                                                                data-options="id:'customNames',width:200,
           onSelect: function (index,row){
                $('#customTel').iTextbox('setValue',row['customTel']);
                $('#customId').iTextbox('setValue',row['customId']);
                $('#staffName').iTextbox('setValue',row['staffName']);
                $('#staffId').val(row['staffId']);
                $('#customName').val(row['customName']);},
           idField: 'customName',
           textField: 'customName',
           fitColumns:true,
           url:'/CustomController/select/',
           columns:[[
               {field: 'customName',width:100, title: '姓名'},
               {field: 'customTel', title: '办公电话'}<%--,
               {field: 'staffName', title: '电子邮箱'}--%>
           ]],prompt:'必填',required:true">
                            <input type="hidden" id="staffId" name="staffId" value="">
                            <%--<input type="hidden" id="customName" name="customName">--%>
                            <%--<input type="hidden" id="customTel" name="customTel">--%></div>
                    </tr>
                    <tr>
                        <div style="margin-top:30px">&nbsp;&nbsp;&nbsp;业务员<input id="staffName" name="staffName"
                                                                                 data-toggle="topjui-textbox"
                                                                                 data-options="width:200,readonly:true">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;联系电话<input id="customTel" name="customTel"
                                                                     data-toggle="topjui-textbox"
                                                                     data-options="width:100,readonly:true">
                        </div>
                    </tr>
                    <tr>
                        <div style="margin-top:30px">
                            回款方式<input name="receiptType" data-toggle="topjui-combobox" data-options="width:200,valueField:'id',
                       textField:'text',data:[{id:1,text:'账期'},{id:2,text:'现金'},{id:3,text:'转账'},{id:4,text:'微信'}],required:true">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;回款金额<input name="receiptMoney" data-toggle="topjui-numberbox"
                                                                     data-options="width:100,min:0,precision:2,required:true,validType:['length[0,12]']">
                        </div>
                    </tr>
                    <tr>
                        <div style="margin-top:30px">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;备注<input name="receiptRemarks"
                                                                         data-toggle="topjui-textbox"
                                                                         data-options="width:600,validType:['length[0,50]']">
                        </div>
                    </tr>
                    <tr>
                        <div style="margin-top:30px">
                            &nbsp;&nbsp;&nbsp;登记人<input name="financeRegister" data-toggle="topjui-textbox"
                                                        data-options="width:200,readonly:true,<%--valueField:'text',
                       textField:'text',data:[{text:'张三',value:'1'},{text:'李四',value:'2'}],--%>required:true" value="${adminName }">
                        </div>
                    </tr>
                    <div style="width:600px;margin-top:30px">
                        <center>
                            <a data-toggle="topjui-linkbutton"
                               data-options="id:'submitBtn',
                   iconCls:'fa fa-save',
                   form:{
                       id:'formId',
                       title:'货款回笼登记',
                       method:'submit',
                       url:'/LoanBack/AddLoan/',
                       <%--refreshRefererTab:true,--%>
                       <%--closeCurrentTab:true,--%>
                   }" class="layui-btn">保存</a>
                        </center>
                    </div>

                </table>
            </div>
        </form>
    </div>
</div>


</body>
</html>
