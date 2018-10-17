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
   <script>
       function addCartonType(){  //打开对话框，添加箱型
       var html = "<div align='right'> <button class=\"layui-btn layui-btn-xs\" type='submit'>确认</button><button class=\"layui-btn layui-btn-primary layui-btn-xs\" onclick='quxiao()'>取消</button></div>";
           var htm = "<div align=\"center\"><form class=\"layui-form\" action=\"\"><div class=\"layui-form-item\"><label class=\"layui-form-label\">单行输入框</label><div class=\"layui-input-block\"><input type=\"text\" name=\"title\" lay-verify=\"required|title\" autocomplete=\"off\" required placeholder=\"请输入箱型名称\" class=\"layui-input\"></div></div>"+html+"</form></div>";
           
           layer.open({
                
                 area: ['600px','200px'],
                 title: ['添加纸箱箱型', 'text-align:center;'],
                 closeBtn: 2,
                 scrollbar: false,
                 btn:[],
                    content: htm
              });
       }  
      function quxiao(){ //关闭对话框
         layer.close(layer.index);
     
     }
     function deleteCartonType(){
          var a = $('#cartonType').iTreegrid("getChecked");
          if(a.length==0){
               layer.open({
                
                 area: '600px',
                 title: ['提示信息', 'text-align:center;'],
                 closeBtn: 2,
                 scrollbar: false,
                 btn:[],
                    content: '亲，请勾选左边箱型进行删除！'
              });
          }
          else if(a.length>1){
                layer.open({
                
                 area: '600px',
                 title: ['提示信息', 'text-align:center;'],
                 closeBtn: 2,
                 scrollbar: false,
                 btn:[],
                    content: '亲，一次只能勾选一种箱型删除呢！'
              });
          }
          else{
              
           
          }
     
     }
       $(function () {
        var productDg = {
            type: 'datagrid',
            id: 'userDg'
        };

        $("#userDg").iDatagrid({
            id: 'userDg',
            url: '${pageContext.request.contextPath}/jsp/cartontype/json/model.json',
            childTabs: [
                            
                            {id:'eastTabs'}
                        ],
            columns: [[
                {field: 'model_id', title: 'UID', checkbox: true},
               
                {field: 'user_company', title: '客户公司', sortable: true},
                {field: 'model_name', title: '纸箱名称', sortable: true},
                /* {field: 'rate', title: '完成率', sortable: true, formatter: progressFormatter} */
                {field: 'material_science', title: '材质', sortable: true},
                {field: 'pit_type', title: '坑型', sortable: true},
                {field: 'carton_spec', title: '纸箱尺寸', sortable: true},
                
                {field: 'model_type', title: '类型', sortable: true}
               // {field: 'order_time', title: '下单时间', sortable: true},
               // {field: 'delivery_time', title: '送货时间', sortable: true}
                /*{field: 'user_relation', title: '所属业务员', sortable: true}*/
                
            ]]
        });

        $("#execute").iMenubutton({
            method: 'openDialog',
            extend: '#userDg-toolbar',
            iconCls: 'fa fa-plus',
            btnCls: 'topjui-btn-warm',
            dialog: {
                id: 'userAddDialog',
                height: 400,
                href: _ctx + '/jsp/user/userAdd.jsp',
                buttonsGroup: [
                    {
                        text: '保存',
                        url: _ctx + '/json/response/success.json',
                        iconCls: 'fa fa-plus',
                        handler: 'ajaxForm',
                        btnCls: 'topjui-btn-normal'
                    }
                ]
            }
        });

        $("#edit").iMenubutton({
            method: 'openDialog',
            extend: '#productDg-toolbar',
            iconCls: 'fa fa-pencil',
            btnCls: 'topjui-btn',
            grid: productDg,
            dialog: {
                width: 950,
                height: 500,
                href: _ctx + '/jsp/user/userAdd.jsp?uuid={uuid}',
                url: _ctx + 'json/demo/userEdit.json?uuid={uuid}',
                buttonsGroup: [
                    {
                        text: '更新',
                        url: _ctx + '/json/response/success.json',
                        iconCls: 'fa fa-save',
                        handler: 'ajaxForm',
                        btnCls: 'topjui-btn'
                    }
                ]
            }
        });

        $("#delete").iMenubutton({
            method: 'doAjax',
            extend: '#productDg-toolbar',
            iconCls: 'fa fa-trash',
            btnCls: 'topjui-btn-normal',
            confirmMsg: '这个是勾选复选框实现多条数据的Ajax删除提交操作，提交grid.param中指定的参数值',
            grid: {
                type: 'datagrid',
                id: 'productDg',
                uncheckedMsg: '请先勾选要删除的数据',
                param: 'uuid:uuid,code:code'
            },
            url: _ctx + '/json/response/success.json'
        });
        $("#see").iMenubutton({
            method: 'openDialog',
            extend: '#productDg-toolbar',
            iconCls: 'fa fa-eye',
            btnCls: 'topjui-btn-danger',
            grid: productDg,
            dialog: {
                width: 700,
                height: 300,
                href: _ctx + '/jsp/outStorage/cartonPurAdd.jsp?uuid={uuid}',
                url: _ctx + '/json/demo/cartonPurEdit.json?uuid={uuid}'
            }
        });

        $("#filter").iMenubutton({
            method: 'filter',
            extend: '#productDg-toolbar',
            btnCls: 'topjui-btn-warm',
            grid: productDg
        });

        $("#search").iMenubutton({
            method: 'search',
            extend: '#productDg-toolbar',
            btnCls: 'topjui-btn-danger',
            grid: productDg
        });

        $("#import").iMenubutton({
            method:'import',
            extend: '#productDg-toolbar',
            btnCls:'topjui-btn-normal',
            uploadUrl:_ctx + '/json/response/upload.json',
            url:_ctx+'/json/response/success.json'
        });

        /* $("#export").iMenubutton({
            method: 'export',
            extend: '#productDg-toolbar',
            btnCls: 'topjui-btn',
            url: _ctx + '/json/response/export.html'
        }); */

        /* $("#openTab").iMenubutton({
            method: 'openTab',
            btnCls: 'topjui-btn-normal',
            tab: {
                title: '这是新的Tab窗口',
                href: _ctx + '/html/complex/panel_add.html'
            },
            grid: productDg
        }); */

        /* $("#openWindow").iMenubutton({
            method: 'openWindow',
            extend: '#productDg-toolbar',
            btnCls: 'topjui-btn-warm',
            href: 'http://www.topjui.com?uuid={uuid}',
            grid: productDg
        }); */

        /* $('#request').iMenubutton({
            method: 'request',
            btnCls: 'topjui-btn',
            url: _ctx + '/json/response/success.json'
        }); */

        /* $('#myFun').iMenubutton({
            btnCls: 'topjui-btn-normal',
            onClick: myQuery
        }); */

       
    });

    // 自定义方法
    /* function myQuery() {
        // 提示信息
        $.iMessager.alert('自定义方法', '自定义方法被执行了！', 'messager-info');
        // 提交参数查询表格数据
        $('#productDg').iDatagrid('reload', {
            name: $('#name').iTextbox('getValue'),
            code: $('#code').iTextbox('getValue')
        });
    } */
   </script>
<body>
<div data-toggle="topjui-layout" data-options="fit:true">
    <div data-options="region:'west',title:'',split:true,border:false,width:'15%',iconCls:'fa fa-sitemap',headerCls:'border_right',bodyCls:'border_right'">
      
        <!-- treegrid表格 -->
        <table data-toggle="topjui-treegrid"
               data-options="id:'cartonType',
			   idField:'id',
			   treeField:'text',
			   url:'${pageContext.request.contextPath}/data/test8.json',
			   
			   childGrid:{
			   	   param:'codeSetId:codeSetId,id:id',
                   grids:[
                       {type:'datagrid',id:'userDg'},
                   ]
			   }" >
            <thead>
            <tr>
                <th data-options="field:'uuid',title:'UUID',checkbox:true"></th>
                <th data-options="field:'text',title:'纸箱箱型',width:100"></th>
            </tr>
            </thead>
        </table>
        
    </div>
     
       
    <div data-options="region:'center',iconCls:'icon-reload',title:'',split:true,border:false,bodyCls:'border_left'" >
        <!-- datagrid表格 -->
        <table data-toggle="topjui-datagrid"
               data-options="id:'userDg'">
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
            <div title="模板信息"
                 data-options="id:'eastTab0',iconCls:'fa fa-comment',
					 href:'model_info.jsp'"></div>
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
       data-options="
       iconCls: 'fa fa-plus',
       btnCls:'topjui-btn-normal',
     " onclick="addCartonType()">添加箱型</a>
   <!--   <a href="javascript:void(0)"
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
            }">编辑</a>  -->
    <a 
       data-toggle="topjui-menubutton"
       data-options="
       btnCls:'topjui-btn-danger',
       iconCls:'fa fa-trash'
      " onclick="deleteCartonType()">删除箱型</a>
      <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="
       extend: '#userDg-toolbar',
       iconCls: 'fa fa-plus',
       btnCls:'topjui-btn-normal',
       method: 'openTab',
       tab: {   iconCls: 'fa fa-comment',
                title: '添加纸箱模板',
                href: '${pageContext.request.contextPath}/jsp/cartontype/add_model.jsp'
            }">添加模板</a>
       <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method:'doAjax',
       extend: '#userDg-toolbar',
       btnCls:'topjui-btn-danger',
       iconCls:'fa fa-trash',
       url:_ctx + '/json/response/success.json',
       grid: {uncheckedMsg:'请先勾选要删除的模板',param:'uuid:uuid,code:code'}">删除模板</a>
   <!--   <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method:'filter',
       extend: '#userDg-toolbar',
       btnCls:'topjui-btn-warm'">过滤</a> -->
    <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method:'search',btnCls:'topjui-btn-danger'">查询</a>
    <!--  <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method:'export',
       extend: '#userDg-toolbar',
       btnCls:'topjui-btn',
       url:_ctx + '/json/response/export.html'">导出</a>  -->
    <!--  <a href="javascript:void(0)"
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
    </div> -->
</div>
</body>
</html>