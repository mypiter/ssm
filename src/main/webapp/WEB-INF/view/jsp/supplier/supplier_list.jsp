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

<body id="body">
<div data-toggle="topjui-layout" data-options="fit:true">
   
    <div   data-options="region:'center',iconCls:'icon-reload',title:'',split:true,border:false,bodyCls:'border_left' ">
        <!-- datagrid表格 -->
        <table data-toggle="topjui-datagrid"
               data-options="id:'userDg',
                      <%--url:remoteHost+'/system/user/getPageSetData',--%>
                      url:'${pageContext.request.contextPath}/json/demo/supplier.json',
                      childTabs: [
                            
                            {id:'eastTabs'}
                        ] 
                    ">
            <thead>
            <tr>
                <th data-options="field:'supplier_id',title:'UUID',checkbox:true"></th>
                <th data-options="field:'supplier_name',title:'供应商名称',sortable:true"></th>
                <th data-options="field:'unit',title:'供应商类型',sortable:true"></th>
                <th data-options="field:'supplier_address',title:'供应商地址',sortable:true"></th>
                <th data-options="field:'supplier_tel',title:'联系电话',sortable:true"></th>
                <th data-options="field:'max_length',title:'最大纸板长',sortable:true"></th>
                <th data-options="field:'max_width',title:'最大纸板宽',sortable:true"></th>
                <th data-options="field:'min_length',title:'最小纸板长',sortable:true"></th>
                <th data-options="field:'min_width',title:'最小纸板宽',sortable:true"></th>
                <th data-options="field:'unit',title:'压线条数',sortable:true"></th>
                
              <!--    <th data-options="field:'zone',title:'所属区域',sortable:true,hidden:true,formatter:function(value,row,index){return row.country+' '+row.province+' '+row.city+' '+row.district}"></th> -->
            </tr>
            </thead>
        </table>

    </div>
     <div data-options="region:'east',iconCls:'icon-chart_pie',title:'',split:true,border:false,width:'40%'">
        <div data-toggle="topjui-tabs"
             data-options="id:'eastTabs',
             fit:true,
             border:true,
             bodyCls:'border_right_none',
             parentGrid:{
                 type:'datagrid',
                 id:'userDg',
                 param:'puuid:uuid'
             }">
            <div title="供应商详情"
                 data-options="id:'eastTab0',iconCls:'fa fa-th',
					 href:'supplier_info.jsp'"></div>
        </div>
    </div>
</div>

<!-- 表格工具栏开始 -->
<div id="userDg-toolbar" class="topjui-toolbar"
     data-options="grid:{
           type:'datagrid',
           id:'userDg'
       }">
    <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method:'openDialog',
       extend: '#userDg-toolbar',
       iconCls: 'fa fa-plus',
       dialog:{
           id:'userAddDialog',
           width: 950,
           height: 620,
           href:_ctx + '/jsp/supplier/supplierAdd.jsp',
           buttonsGroup:[
               {text:'保存',url:_ctx + '/json/response/success.json',iconCls:'fa fa-plus',handler:'ajaxForm',btnCls:'topjui-btn-normal'}
           ]
       }">新增</a>
    <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method: 'openDialog',
            extend: '#userDg-toolbar',
            iconCls: 'fa fa-pencil',
            btnCls: 'topjui-btn',
            grid: {
                type: 'datagrid',
                id: 'userDg'
            },
            dialog: {
                width: 950,
                height: 620,
                href: _ctx + '/jsp/supplier/supplierEdit.jsp?uuid={uuid}',
                url: _ctx + '/jsp/supplier/json/supplierEdit.json?uuid={uuid}',
                buttonsGroup: [
                    {
                        text: '更新',
                        url: _ctx + '/json/response/success.json',
                        iconCls: 'fa fa-save',
                        handler: 'ajaxForm',
                        btnCls: 'topjui-btn'
                    }
                ]
            }">编辑</a>
    <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method:'doAjax',
       extend: '#userDg-toolbar',
       btnCls:'topjui-btn-normal',
       iconCls:'fa fa-trash',
       url:_ctx + '/json/response/success.json',
       grid: {uncheckedMsg:'请先勾选要删除的数据',param:'uuid:uuid,code:code'}">删除</a>
  <!--    <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method:'filter',
       extend: '#userDg-toolbar',
       btnCls:'topjui-btn-warm'">过滤</a>
    <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method:'search',btnCls:'topjui-btn-danger'">查询</a>
    <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method:'export',
       extend: '#userDg-toolbar',
       btnCls:'topjui-btn',
       url:_ctx + '/json/response/export.html'">导出</a>
    <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method:'openTab',
       btnCls:'topjui-btn-normal',
       tab:{
           title:'这是新的Tab窗口',
           href:_ctx + '/html/menu/openTab_index.html'
       }">打开Tab窗口</a>
    <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method:'openWindow',
       extend: '#userDg-toolbar',
       btnCls:'topjui-btn-warm',
       href:'http://www.topjui.com?uuid={uuid}'">打开新窗口</a>
    <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method:'request',
       btnCls:'topjui-btn',
       url:_ctx + '/json/response/success.json'">执行普通请求</a>
    <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="menu:'#exportSubMenu',
       btnCls:'topjui-btn-danger',
       hasDownArrow:true,
       iconCls:'fa fa-list'">更多</a>
    <div id="exportSubMenu" class="topjui-toolbar" style="width:150px;">
        <div data-toggle="topjui-menubutton"
             data-options="method:'request',
             extend: '#userDg-toolbar',
             url:_ctx + '/json/response/success.json?uuid={uuid}'">导出 PDF 报表
        </div>
        <div data-toggle="topjui-menubutton"
             data-options="method:'export',
             extend: '#userDg-toolbar',
             url: _ctx + '/json/response/export.html'">导出EXCEL列表
        </div>
        <div data-toggle="topjui-menubutton"
             data-options="method:'request',
             extend: '#userDg-toolbar',
             url:_ctx + '/json/response/success.json?uuid={uuid}'">导出EXCEL报表
        </div>
        <div data-toggle="topjui-menubutton"
             data-options="method:'request',
             extend: '#userDg-toolbar',
             url:_ctx + '/json/response/success.json?uuid={uuid}'">导出WORD报表
        </div>
    </div>-->
</div>
<!-- 表格工具栏结束 -->
<script type="text/javascript">
    
	$(function(){
		$('#queryBtn').iMenubutton({
            method: 'query',
            iconCls: 'fa fa-search',
            btnCls: 'topjui-btn-danger',
            form: {id: 'queryForm'},
            grid: {type: 'datagrid', 'id': 'productDg'}
        });
       // var body = $("#body").html();
       // console.info(body);
	});
	<%--$.ajax({
	     url:remoteHost+'/system/organization/getListByCodeSetIdAndLevelId?codeSetId=A&levelId=1',
	     data:null,
	     type:"post",
	     dataType:"json",
	     success:function(data){
	        //console.info(JSON.stringify(data));
	          
	     }
	});
	$.ajax({
	     url:remoteHost+'/system/user/getPageSetData',//remoteHost+'/system/user/getPageSetData',//remoteHost+'/system/organization/getListByPid?pid=3',
	     data:null,
	     type:"post",
	     dataType:"json",
	     success:function(data){
	        console.info(JSON.stringify(data));
	     }
	});    --%>
	
</script>
</body>
</html>
