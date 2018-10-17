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
    <script type="text/javascript" src="../../bootstrap/js/jQuery.js"></script>
    <script type="text/javascript" src="../../static/plugins/jquery/jquery.cookie.js"></script>
    <!-- TopJUI框架配置 -->
    <script type="text/javascript" src="../../static/public/js/topjui.config.js"></script>
    <!-- TopJUI框架核心-->
    <script type="text/javascript" src="../../topjui/js/topjui.core.min.js"></script>
    <!-- TopJUI中文支持 -->
    <script type="text/javascript" src="../../topjui/js/locale/topjui.lang.zh_CN.js"></script>
    <!-- layui框架js -->
    <script src="../../static/plugins/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript">
         $(document).ready(function(){
         //var html = $("#userDg").html();
         //console.info(html);
           
              //$("#userDg").click(function(a){
              //    alert(a);
             // });
         });
        function  read(){//判断是否只选择一个
           var nu = $("table input[type='checkbox']");
           
           var j = 0;
           for(var i=0;i<nu.length;i++){
                if(j>1){
                   alert("只能选择一个");
                   return ;
                }
                if(nu[i ].checked){
                    j++;
                }
           }
           return true;
        }
    </script>
</head>

<body>
<!-- layout布局 开始 -->
<div data-toggle="topjui-layout" data-options="fit:true">
    <div data-options="region:'center',iconCls:'icon-reload',title:'',split:true,border:false">
        <div data-toggle="topjui-layout" data-options="fit:true">
            <div data-options="region:'center',title:'',fit:false,split:true,border:false,bodyCls:'border_right_bottom'"
                 style="height:80%">
                <!-- datagrid表格 -->
                <table data-toggle="topjui-datagrid"
                       data-options="id:'userDg',
                        idField:'uuid',treeField:'taskType',
                        pagination:true,
                        striped:true,
                        fitColumns:true,
                        rownumbers: true,
                        url:'${pageContext.request.contextPath}/json/demo/checkOrder.json',
			            childTabs: [
                            
                            {id:'eastTabs'}
                        ]">
                    <thead>
                    <tr>
                        <th data-options="field: 'uuid', title: 'UID', checkbox: true"></th>
                        <th data-options="field:'order_account', title: '订单号', sortable: true"></th>
                        <th data-options="field:'user_company', title: '客户公司', sortable: true"></th>
                        <th data-options="field:'user_tel', title: '联系电话', sortable: true"></th>
                        <th data-options="field:'model_name', title: '纸箱名称', sortable: true"></th>
                        <th data-options="field:'material_science', title: '材质', sortable: true"></th>
                        <th data-options="field:'pit_type', title: '坑型 ', sortable: true"></th>
                        <th data-options="field:'carton_spec', title: '纸箱尺寸', sortable: true"></th>
                        <th data-options="field:'order_num', title: '订单数量', sortable: true"></th>
                        <th data-options="field:'carton_price', title: '单价（元）', sortable: true"></th>
                        <th data-options="field:'order_time', title: '下单时间', sortable: true"></th>
                        <th data-options="field:'delivery_time', title: '送货时间', sortable: true"></th>
                    </tr>
                    </thead>
                </table>
            </div>
            
        </div>
    </div>
    <div data-options="region:'east',iconCls:'icon-chart_pie',title:'',split:true,border:false,width:'25%'">
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
            <div title="订单详情"
                 data-options="id:'eastTab0',iconCls:'fa fa-th',
					 href:'indexinfo.action?uuid={uuid}'"></div>
            
        </div>
    </div>
</div>
<!-- layout布局 结束 -->

<!-- 表格工具栏开始 -->
<div id="userDg-toolbar" class="topjui-toolbar"
     data-options="grid:{
           type:'datagrid',
           id:'userDg'
       }">
     <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method:'doAjax',
       extend: '#userDg-toolbar',
       btnCls:'topjui-btn-normal',
       iconCls:'fa fa-share',
       url:_ctx + '/json/response/success.json',
       grid: {uncheckedMsg:'请先勾选要审核的数据',param:'uuid:uuid,code:code'}" >审核通过</a>
    <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method: 'doAjax',
            extend: '#userDg-toolbar',
            iconCls: 'fa fa-trash',
            btnCls: 'topjui-btn',
            url:_ctx + '/json/response/success.json',
            grid: {uncheckedMsg:'请先勾选要审核的订单',param:'uuid:uuid,code:code'}">审核不通过</a>
   
    <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method: 'doAjax',
       extend: '#userDg-toolbar',
       btnCls:'topjui-btn-warm',
       url:_ctx + '/json/response/success.json',
       grid: {uncheckedMsg:'请先勾选要修改的订单',param:'uuid:uuid,code:code'}">修改单价</a>
    <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method:'search',
       extend: '#userDg-toolbar',
       btnCls:'topjui-btn-danger',
       ">查询</a>
    
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
    </div>
</div>
<!-- 表格工具栏结束 -->
</body>
</html>