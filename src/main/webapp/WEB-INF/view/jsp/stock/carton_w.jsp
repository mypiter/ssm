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
<script>
    //初始化加载所有权限（默认加载管理员）
   
   $(function () {
    /* $.ajax({
          type: 'POST',
          url: '${pageContext.request.contextPath}/indextree.action',
          contentType: "application/json; charset=utf-8",
          data: "json",
          success: function (data) {
            var tree = JSON.parse(data);
            $('#org2').iTree({
            width: 450,
            labelPosition: 'top',
            url: remoteHost + '/system/organization/getListByCodeSetIdAndLevelId?codeSetId=A&levelId=1',
            expandUrl: remoteHost + '/system/organization/getListByPid?pid={id}',
            idField: 'id',
            treeField: 'text',
           
        });
          },
          error: function () {

          }
      }); */
    //动态生成选择框
       
}); 
function opens(){
 console.info("11111");
}
function openEnd(){
  console.info("22222");
}


</script>
<body>
  <form class="hidden" method="post" data-toggle="topjui-form" data-options="id:'formId'">
    <input type="hidden" id="uuid" name="uuid">
    <input type="hidden" id="time" name="time">
    <table class="editTable">
        <tr>
            <td colspan="4">
                <div class="divider">
                    <span>录入预警信息</span>
                </div>
            </td>
        </tr>
        <tr>
            <td class="label">预警箱型</td>
            <td><input type="text" name="user"
	                       data-toggle="topjui-combogrid"
	                       data-options="required:true,
	                       id:'user',
	                   idField: 'userNameId',
	                   textField: 'userName',
	                   url:remoteHost+'/system/user/getPageSetData',
	                   columns:[[
	                       {field: 'userName', title: '箱型'},
	                   ]]"></td>
            <td class="label">预警数量</td>
            <td><input type="text" name="admin_account" value="" data-toggle="topjui-textbox"
                       data-options="required:true,width:278,prompt:'必填'"></td>
        </tr>
        
    </table>
</form>
</body>
</html>