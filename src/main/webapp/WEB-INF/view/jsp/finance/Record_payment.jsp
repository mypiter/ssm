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
    <script src="../../static/plugins/layui/layui.js" charset="utf-8"></script>
</head>

<body>
<div data-toggle="topjui-layout" data-options="fit:true">
    <div data-options="region:'center',iconCls:'icon-reload',title:'',split:true,border:false,bodyCls:'border_left_right'">
        <!-- datagrid表格 -->
         <table data-toggle="topjui-datagrid"
               data-options="id:'userDg',
                        <!-- singleSelect:true, -->
						selectOnCheck:false,
						checkOnSelect:false,
                    url:'${pageContext.request.contextPath}/json/product/list.json',
                    childTabs: [{id:'eastTabs'}],
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
		        <th data-options="field:'receivables_id',title:'ID',checkbox:true"></th>
		        <th data-options="field:'transaction_id',title:'订单号'"></th>
		        <th data-options="field:'transaction_id',title:'客户名称'"></th>
		        <th data-options="field:'transaction_id',title:'产品名称'"></th>
		        <th data-options="field:'time',title:'楞型'"></th>
		        <th data-options="field:'money',title:'材质'"></th>
		        <th data-options="field:'type',title:'尺寸'"></th>
		        <th data-options="field:'is_tecket',title:'订单数量'"></th>
		        <th data-options="field:'is_tecket',title:'单价'"></th>
		        <th data-options="field:'is_han',title:'总金额'"></th>		        
   			 </tr>
            </thead>
        </table>
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
       data-options="method: 'openDialog',
       extend: '#userDg-toolbar',
       iconCls: 'fa fa-cog',
       btnCls: 'topjui-btn-red',
       grid: {
           type: 'datagrid',
           id: 'userDg',
           param:'uuid:uuid,code',
           uncheckedMsg:'请先选择你要调整的订单'
       },
       dialog: {
           title: '这里填写要调整的内容',
           href: 'payable_adjustment.jsp',
           buttonsGroup: [
               {
                   text: '提交',
                   url: _ctx + '/json/response/success.json',
                   iconCls: 'fa fa-cog',
                   handler: 'multiAjaxForm',
                   btnCls: 'topjui-btn-green'
               }
           ]
       }">批量调整</a>
    <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method:'filter',
       extend: '#userDg-toolbar',
       btnCls:'topjui-btn-black'">过滤</a>
    <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method:'search',
       extend: '#userDg-toolbar',
       btnCls:'topjui-btn-blue'">查询</a>

    </div>

<!-- 表格工具栏结束 -->
</body>
</html>