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
    <!-- 避免IE使用兼容模式 -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
    <meta name="renderer" content="webkit">
    <title>桌面</title>
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
    
    <script src="../../bootstrap/js/bootstrap.js" charset="utf-8"></script>
    
    <link type="text/css" href="../../bootstrap/bootstrap.css" rel="stylesheet">
</head>
<style>
	.hang{
		display:inline-block;
		text-align: center;
	}
</style>
<body>
<div style="display: none;"> 
	<!-- 库存预警 -->
	<div id="warning" class="topjui-iDialog" closed="true"></div>
	<div id="warningb">
			<a href="#" class="l-btn topjui-btn-normal l-btn-small" style="position: static; display: inline-block; left: auto; height: 34px;"><span class="l-btn-left l-btn-icon-left" style="margin-top: 5px;"><span class="l-btn-text">确定</span><span class="l-btn-icon fa fa-plus">&nbsp;</span></span></a>
			<a href="#" class="closeDialog l-btn topjui-btn-danger l-btn-small" onclick="javascript:$('#warning').dialog('close')" id="301410" style="position: static; display: inline-block; left: auto; height: 34px;"><span class="l-btn-left l-btn-icon-left" style="margin-top: 5px;"><span class="l-btn-text">关闭</span><span class="l-btn-icon fa fa-close">&nbsp;</span></span></a>
	</div>
	<!-- 发送公告 -->
	<div id="notice" class="topjui-iDialog" closed="true"></div>
	<div id="noticeb">
			<a href="#" class="l-btn topjui-btn-normal l-btn-small" style="position: static; display: inline-block; left: auto; height: 34px;"><span class="l-btn-left l-btn-icon-left" style="margin-top: 5px;"><span class="l-btn-text">发送</span><span class="l-btn-icon fa fa-sign-out">&nbsp;</span></span></a>
			<a href="#" class="closeDialog l-btn topjui-btn-danger l-btn-small" onclick="javascript:$('#notice').dialog('close')" id="301410" style="position: static; display: inline-block; left: auto; height: 34px;"><span class="l-btn-left l-btn-icon-left" style="margin-top: 5px;"><span class="l-btn-text">关闭</span><span class="l-btn-icon fa fa-close">&nbsp;</span></span></a>
	</div>
	<!-- 发送消息 -->
	<div id="news" class="topjui-iDialog" closed="true"></div>
	<div id="newsb">
			<a href="#" class="l-btn topjui-btn-normal l-btn-small" style="position: static; display: inline-block; left: auto; height: 34px;"><span class="l-btn-left l-btn-icon-left" style="margin-top: 5px;"><span class="l-btn-text">发送</span><span class="l-btn-icon fa fa-sign-out">&nbsp;</span></span></a>
			<a href="#" class="closeDialog l-btn topjui-btn-danger l-btn-small" onclick="javascript:$('#news').dialog('close')" id="301410" style="position: static; display: inline-block; left: auto; height: 34px;"><span class="l-btn-left l-btn-icon-left" style="margin-top: 5px;"><span class="l-btn-text">关闭</span><span class="l-btn-icon fa fa-close">&nbsp;</span></span></a>
	</div>
	<!-- 添加工序 -->
	<div id="gong" class="topjui-iDialog" closed="true"></div>
	<div id="gongb">
			<a href="#" class="l-btn topjui-btn-normal l-btn-small" style="position: static; display: inline-block; left: auto; height: 34px;"><span class="l-btn-left l-btn-icon-left" style="margin-top: 5px;"><span class="l-btn-text">发送</span><span class="l-btn-icon fa fa-sign-out">&nbsp;</span></span></a>
			<a href="#" class="closeDialog l-btn topjui-btn-danger l-btn-small" onclick="javascript:$('#gong').dialog('close')" id="301410" style="position: static; display: inline-block; left: auto; height: 34px;"><span class="l-btn-left l-btn-icon-left" style="margin-top: 5px;"><span class="l-btn-text">关闭</span><span class="l-btn-icon fa fa-close">&nbsp;</span></span></a>
	</div>
</div>
<div class="hang">
	<div>
		<button onclick="notice()" type="button" class="btn btn-default btn-lg">
		  <i class="fa fa-bullhorn"></i>
		</button>
	</div>
	<span>系统变量</span>
</div>
<div class="hang">
	<div>
	 <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method:'openDialog',
       size:50,
       btnCls:'topjui-btn-green',
       dialog:{
           id:'formDialog',
            href:_ctx + '/jsp/stock/jiecun.jsp',
           height:250,
           width:900,
           buttonsGroup:[
               {text:'结存',url: _ctx + '/json/response/success.json',iconCls:'fa fa-plus',handler:'ajaxForm'}
           ]
       }">数据结存</a>
		
	</div>
	<span></span> 
</div>
<div class="hang">
	<div>
		<button onclick="gon()" type="button" class="btn btn-default btn-lg">
		  <i class="fa fa-plus"></i>
		</button>
	</div>
	<span>下拉列表数据设置</span>
</div>
<script type="text/javascript">
  $(function(){
		$('#queryBtn').iMenubutton({
         method: 'query',
         iconCls: 'fa fa-search',
         btnCls: 'topjui-btn-danger',
         form: {id: 'queryForm'},
         grid: {type: 'datagrid', 'id': 'productDg'}
     });
	});
	//库存预警
	function warning(){
		$('#warning').iDialog({
		    title: '设置库存预警',
		    width: 650,
		    height: 200,
		    closed: false,
		    cache: false,
		    href: 'warning.jsp',
		    modal: true
		});
   	}
   	//发送公告
	function notice(){
    	$("#notice").iDialog({
            title: '发送公告',
            iconCls: "fa fa-envelope", 
            width: 850,
            height: 600,
            closed: false,
            cache: false,
            content:"<iframe scrolling='auto' frameborder='0' src='notice.jsp' style='width:100%; height:100%; display:block;'></iframe>",
            /* href:"editor.jsp", */
            modal: true,
            //头部按钮组
            //toolbar:'#tt'
           /*  toolbar: [{
			 text : '编辑',
			 iconCls : 'icon-edit',
			 handler : function () {
			 alert('edit');
			 },
			}, {}], */
            //底部按钮组
            buttons:'#noticeb'
            /* buttons : [{
			 text : '保存',
			 iconCls : 'icon-ok',
			 handler : function () {
			 //点击保存执行的方法
			 // alert('save');
			 }
			},{}] */
       });
   	}
   	//发送消息
	function news(){
    	$("#news").iDialog({
            title: '发送消息',
            iconCls: "fa fa-envelope-o", 
            width: 850,
            height: 600,
            closed: false,
            cache: false,
            content:"<iframe scrolling='auto' frameborder='0' src='news.jsp' style='width:100%; height:100%; display:block;'></iframe>",
            /* href:'news.jsp', */
            modal: true,
            
            //头部按钮组
            //toolbar:'#tt'
           /*  toolbar: [{
			 text : '编辑',
			 iconCls : 'icon-edit',
			 handler : function () {
			 alert('edit');
			 },
			}, {}], */
            //底部按钮组
            buttons:'#newsb'
            /* buttons : [{
			 text : '保存',
			 iconCls : 'icon-ok',
			 handler : function () {
			 //点击保存执行的方法
			 // alert('save');
			 }
			},{}] */
       });
   	}
   	//添加工序
	function gon(){
    	$("#news").iDialog({
            title: '添加工序',
            iconCls: "fa fa-plus", 
            width: 900,
            height: 400,
            closed: false,
            cache: false,
            content:"<iframe scrolling='auto' frameborder='0' src='add_gong.jsp' style='width:100%; height:100%; display:block;'></iframe>",
            /* href:'news.jsp', */
            modal: true,
            
            //头部按钮组
            //toolbar:'#tt'
           /*  toolbar: [{
			 text : '编辑',
			 iconCls : 'icon-edit',
			 handler : function () {
			 alert('edit');
			 },
			}, {}], */
            //底部按钮组
            buttons:'#gongb'
            /* buttons : [{
			 text : '保存',
			 iconCls : 'icon-ok',
			 handler : function () {
			 //点击保存执行的方法
			 // alert('save');
			 }
			},{}] */
       });
   	}
</script>

 



<!--[if lte IE 8]>
<div id="ie6-warning">
    <p>您正在使用低版本浏览器，在本页面可能会导致部分功能无法使用，建议您升级到
        <a href="http://www.microsoft.com/china/windows/internet-explorer/" target="_blank">IE9或以上版本的浏览器</a>
        或使用<a href="http://se.360.cn/" target="_blank">360安全浏览器</a>的极速模式浏览
    </p>
</div>
<![endif]-->


</body>
</html>

