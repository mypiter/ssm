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
    <script src="../../layer-v3.1.1/layer/layer.js" ></script>
    <script src="../../static/plugins/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript">
         $(document).ready(function(){
         //var html = $("#userDg").html();
         //console.info(html);
           
              //$("#userDg").click(function(a){
              //    alert(a);
             // });
         });
        function progressFormatter(value, rowData, rowIndex) {
        var htmlstr = '<div id="p" class="easyui-progressbar progressbar" data-options="value:' + value + '" style="width: 100px; height: 26px;">';
        htmlstr += '<div class="progressbar-text" style="width: 100px; height: 26px; line-height: 26px;">' + value + '%</div>';
        htmlstr += '<div class="progressbar-value" style="width: ' + value + '%; height: 26px; line-height: 26px;">';
        htmlstr += '<div class="progressbar-text" style="width: 100px; height: 26px; line-height: 26px;">' + value + '%</div>';
        htmlstr += '</div>';
        htmlstr += '</div>';
        return htmlstr;
    }
     function storage(){  //入库
         var a = $('#userDg').iDatagrid("getChecked");
       
          if(a.length!=0){  //打开该订单各工序详情
              var htm2="";
             var htm = "<form id=\"form1\" class=\"layui-form\"><div align='center'><table style=\"font-size:20px;width:100%;\">";  //onsubmit=\"return checkForm("+a.length+")\"
            // var htm3 = "<tr><td><input type=\"text\" required  lay-verify=\"required\" placeholder=\"请输入车牌号\" style='width:150px;' autocomplete=\"off\" class=\"layui-input\"></td><td><input type=\"text\" style='width:150px;' required  lay-verify=\"required\" placeholder=\"请输入司机名称\"  autocomplete=\"off\" class=\"layui-input\"></td><td><input style='width:150px;' type=\"text\" required id='time' readonly lay-verify=\"required\" placeholder=\"配送时间\"  autocomplete=\"off\" class=\"layui-input\"><td></tr>";
             var htm1="</table></div><div align='right' style='margin-top:10px;'><button class=\"layui-btn\" lay-submit>确定</button><button type=\"button\" class=\"layui-btn layui-btn-primary\" onclick='quxiao();return false;'>取消</button></div></form>";
             
             for(var i=0;i<a.length;i++){

                htm2 = htm2+"<tr><td>订单号:"+a[i].order_account+"&nbsp;&nbsp;</td><td>可入库数量:"+a[i].num+"&nbsp;&nbsp;</td><td><input type=\"text\" required  lay-verify=\"required\" placeholder=\"请输入入库数量\"  autocomplete=\"off\" class=\"layui-input\"></td><td><input type=\"text\" required  lay-verify=\"required\" placeholder=\"请输入入库区域\"  autocomplete=\"off\" class=\"layui-input\"></td></tr>";
             }
             
             layer.open({
                
                 area: '600px',
                 title: ['请输入入库信息', 'text-align:center;'],
                 closeBtn: 2,
                 scrollbar: false,
                 btn:[],

                 content: htm+htm2+htm1
              });
          }
          else{
              layer.open({
                 closeBtn: 2,
                 area: '600px',
                 title: ['提示信息', 'text-align:center;']
               ,content: '<h3>未勾选订单！<h3>'
              });
          }

         
     }  
     
     function quxiao(){ //关闭对话框
         layer.close(layer.index);
     
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
                        url:'${pageContext.request.contextPath}/json/demo/stayOrder.json',
			            childTabs: [
                            
                            {id:'eastTabs'}
                        ]">
                    <thead>
                    <tr>
                        <th data-options="field: 'uuid', title: 'UID', checkbox: true"></th>
                        <th data-options="field:'order_account', title: '订单号', sortable: true"></th>
                        <th data-options="field:'company_name', title: '客户公司', sortable: true"></th>
                        <th data-options="field:'model_name', title: '纸箱名称', sortable: true"></th>
                        <th data-options="field:'material', title: '材质', sortable: true"></th>
                        <th data-options="field:'pit_type', title: '坑型 ', sortable: true"></th>
                        <th data-options="field:'carton_spec', title: '纸箱尺寸', sortable: true"></th>
                        <th data-options="field:'num', title: '待入库数量', sortable: true"></th>
                       
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
    <!--  <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method:'openDialog',
       extend: '#userDg-toolbar',
       iconCls: 'fa fa-plus',
       dialog:{
           id:'userAddDialog',
           href:_ctx + '/html/complex/dialog_add.html',
           buttonsGroup:[
               {text:'保存',url:_ctx + '/json/response/success.json',iconCls:'fa fa-plus',handler:'ajaxForm',btnCls:'topjui-btn-normal'}
           ]
       }">录入数据</a>-->
    <!--  <a href="javascript:void(0)"
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
                height: 500,
                href: _ctx + '/html/complex/user_edit.html?uuid={uuid}',
                url: _ctx + '/json/product/detail.json?uuid={uuid}',
                buttonsGroup: [
                    {
                        text: '更新',
                        url: _ctx + '/json/response/success.json',
                        iconCls: 'fa fa-save',
                        handler: 'ajaxForm',
                        btnCls: 'topjui-btn'
                    }
                ]
            }">编辑</a>-->
       <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method:'search',
       extend: '#userDg-toolbar',
       btnCls:'topjui-btn-danger'">查询</a>
   <!--   <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method:'doAjax',
       extend: '#userDg-toolbar',
       btnCls:'topjui-btn-normal',
       iconCls:'fa fa-trash',
       url:_ctx + '/json/response/success.json',
       grid: {uncheckedMsg:'请先勾选要删除的数据',param:'uuid:uuid,code:code'}">删除</a>
    <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method:'filter',
       extend: '#userDg-toolbar',
       btnCls:'topjui-btn-warm'">过滤</a>  -->
       
     <!--  <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method:'',
       extend: '#userDg-toolbar',
       iconCls: 'fa fa-caret-square-o-right',
       btnCls:'topjui-btn-normal'">暂停生产</a>
       <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method:'',
       extend: '#userDg-toolbar',
       iconCls: 'fa fa-unlock',
       btnCls:'topjui-btn'">恢复生产</a> -->
       <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method:'',
       extend: '#userDg-toolbar',
       iconCls: 'fa fa-share ',
       btnCls:'topjui-btn-warm'"
       onclick="storage()">入库</a>
       <!--  
       <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method:'',
       extend: '#userDg-toolbar',
       iconCls: 'fa fa-comment',
       btnCls:'topjui-btn-normal'">查看工序信息</a>-->
   <!-- 
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
       iconCls:'fa fa-list'">更多</a> -->
    <!--  <div id="exportSubMenu" class="topjui-toolbar" style="width:150px;">
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
    </div> -->
</div>
<!-- 表格工具栏结束 -->
</body>
</html>