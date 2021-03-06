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
    <script src="../../layer-v3.1.1/layer/layer.js" ></script>
    <script src="../../static/plugins/layui/layui.js" charset="utf-8"></script>
</head>
   <body>

<div data-toggle="topjui-layout" data-options="fit:true">
    
    <div data-options="region:'center',iconCls:'icon-reload',title:'',split:true,border:false,bodyCls:'border_left_right'">
        <!-- datagrid表格 -->
        <table data-toggle="topjui-datagrid"
               data-options="id:'userDg',
                    singleSelect:true,
				    selectOnCheck:false,
				    checkOnSelect:false,
                    url:'placelist.action',
                    childTab: [{id:'eastTabs'}],
                    filter: [{
                        field: 'userName',
                        type: 'textbox',
                        op: ['contains', 'equal', 'notequal', 'less', 'greater']
                    },{
                        field: 'sex',
                        type: 'combobox',
                        options: {
                            valueField: 'value',
                            textField: 'label',
                            data: [{
                                label: '男',
                                value: '1'
                            }, {
                                label: '女',
                                value: '2'
                            }]
                        },
                        op: ['contains', 'equal', 'notequal', 'less', 'greater']
                    },{
                        field: 'post',
                        type: 'combobox',
                        options: {
                            valueField: 'value',
                            textField: 'label',
                            multiple: true,
                            data: [{
                                label: 'CEO',
                                value: 'CEO'
                            }, {
                                label: 'COO',
                                value: 'COO'
                            }, {
                                label: 'CTO',
                                value: 'CTO'
                            }]
                        },
                        op: ['contains', 'equal', 'notequal', 'less', 'greater']
                    }]">
            <thead>
            <tr>
                <th data-options="field:'id',title:'UID',checkbox:true"></th>
                <th data-options="field:'plan_num',title:'客户公司',sortable:true"></th>
                <th data-options="field:'style',title:'长',sortable:true"></th>
                <th data-options="field:'style',title:'宽',sortable:true"></th>
                <th data-options="field:'style',title:'高',sortable:true"></th>
                <th data-options="field:'style',title:'尺寸类型',sortable:true"></th>
                <th data-options="field:'customer',title:'产品名称',sortable:true"></th>
                <th data-options="field:'style',title:'箱型',sortable:true"></th>
                <th data-options="field:'style',title:'材质',sortable:true"></th>
                <th data-options="field:'style',title:'楞型',sortable:true"></th>
                <th data-options="field:'style',title:'长度压线',sortable:true"></th>
                <th data-options="field:'style',title:'宽度压线',sortable:true"></th>
                <th data-options="field:'style',title:'压线类型',sortable:true"></th>
                <th data-options="field:'style',title:'单价',sortable:true"></th>
            <!--     <th data-options="field:'style',title:'落料尺寸',sortable:true"></th>
                <th data-options="field:'style',title:'开数',sortable:true"></th>
                <th data-options="field:'style',title:'工序',sortable:true"></th>
                <th data-options="field:'style',title:'打包数',sortable:true"></th>
                <th data-options="field:'style',title:'打钉数',sortable:true"></th>
                <th data-options="field:'style',title:'印版号',sortable:true"></th>
                <th data-options="field:'style',title:'模板号',sortable:true"></th>
                <th data-options="field:'style',title:'颜色数',sortable:true"></th> 
                <th data-options="field:'style',title:'门幅',sortable:true"></th>
                <th data-options="field:'style',title:'门幅倍数',sortable:true"></th>
                <th data-options="field:'style',title:'产品备注',sortable:true"></th>
                <th data-options="field:'style',title:'印刷图片',sortable:true"></th>-->
               <!--  <th data-options="field:'state',title:'状态',sortable:true,
                    formatter:function(value,row,index){
                        if (value == '1') {
                            return '<font color=\'orange\'>待生产</font>';
                        } else if (value == '2') {
                            return '<font color=\'red\'>生产中</font>';
                        } else if(value=='3'){
                            return '<font color=\'green\'>生产完成</font>';
                        } else{
                           return '';
                        }
                    }"></th> -->
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
            <div title="产品信息"
                 data-options="id:'eastTab0',iconCls:'fa fa-comment',
					 href:'${pageContext.request.contextPath}/jsp/product/product_info.jsp'"></div>
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
           width: 1000,
           height: 700,
           id:'userAddDialog',
            href:_ctx + '/jsp/product/add_product.jsp',
           buttonsGroup:[
               {text:'保存',url:'placeadd.action',iconCls:'fa fa-plus',handler:'ajaxForm',btnCls:'topjui-btn-brown'}
           ]
       }">添加产品模板</a>
		<!--  <input style="width:115px;height:35px" id="add" name="sub" onclick="addCartonType()" value="录入订单" type="button" /> -->
		<a href="javascript:void(0)" data-toggle="topjui-menubutton"
			data-options="method: 'openDialog',
            extend: '#userDg-toolbar',
            iconCls: 'fa fa-pencil',
            btnCls: 'topjui-btn-green',
            grid: {
                type: 'datagrid',
                id: 'userDg'
            },
            dialog: {
                width: 750,
                height: 400,
                href: 'add_place1.jsp?id={id}',
                url: 'placefindInfo.action?id={id}',
                buttonsGroup: [
                    {
                        text: '更新',
                        url: 'placeupdate.action',
                        iconCls: 'fa fa-save',
                        handler: 'ajaxForm',
                        btnCls: 'topjui-btn-green'
                    }
                ]
            }">编辑产品模板</a>
       <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method:'doAjax',btnCls:'topjui-btn-brown',
       extend: '#userDg-toolbar',
       iconCls:'fa fa-trash',
       url:'placedelete.action',
       grid: {uncheckedMsg:'请先勾选要删除的数据',param:'id:id,plan_num:plan_num'}">删除产品模板</a>
	   <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method:'search',
       extend: '#userDg-toolbar',
       btnCls:'topjui-btn-blue'">查询产品模板</a>
	   <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method:'filter',
       extend: '#userDg-toolbar',
       btnCls:'topjui-btn-black'">过滤产品模板</a>
  
	</div>

</body>
</html>