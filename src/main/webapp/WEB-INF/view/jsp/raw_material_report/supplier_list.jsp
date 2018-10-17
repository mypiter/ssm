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
    <title>供应商列表</title>
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
                      url:'${pageContext.request.contextPath}/json/data/cartonPur.json',
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
     <div data-options="region:'east',iconCls:'icon-chart_pie',title:'',split:true,border:false,width:'30%'">
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
       data-options="method:'openTab',
       tab:{
           title:'新增供应商',
           href:'./jsp/raw_material_register/supplier_register.jsp'
       }">新增</a>
    <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method: 'openDialog',
            extend: '#userDg-toolbar',
            iconCls: 'fa fa-pencil',
            btnCls: 'topjui-btn-green',
            grid: {
                type: 'datagrid',
                id: 'userDg'
            },
            dialog: {
                width: 950,
                height: 620,
                href:'../../jsp/raw_material_register/supplier_register.jsp?uuid={uuid}',
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
       btnCls:'topjui-btn-brown',
       iconCls:'fa fa-trash',
       url:_ctx + '/json/response/success.json',
       grid: {uncheckedMsg:'请先勾选要删除的数据',param:'uuid:uuid,code:code'}">删除</a>
	<a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method:'search',
       extend: '#userDg-toolbar',
       btnCls:'topjui-btn-blue'">查询</a>
	<a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method:'filter',
       extend: '#userDg-toolbar',
       btnCls:'topjui-btn-black'">过滤</a>
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
