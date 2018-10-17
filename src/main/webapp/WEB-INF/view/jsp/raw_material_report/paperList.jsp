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
    <!-- 导入公共样式 -->
    <script type="text/javascript" src="../../static/plugins/jquery/jquery.min.js"></script>
    <%@ include file="../ap.jsp" %>
    <title>纸张列表</title>
    <script type="text/javascript">
        $(document).ready(function(){
            //var html = $("#userDg").html();
            //console.info(html);

            //$("#userDg").click(function(a){
            //    alert(a);
            // });
        });
    </script>
</head>

<body>
<!-- layout布局 开始 -->
<div data-toggle="topjui-layout" data-options="fit:true">
    <div data-options="region:'center',title:'',fit:false,split:true,border:false,bodyCls:'border_right_bottom'">
        <!-- datagrid表格 -->
        <table data-toggle="topjui-datagrid"
               data-options="id:'userDg',
                       singleSelect:true,
					    selectOnCheck:false,
					    checkOnSelect:false,
                      url:'/PaperSet/getPaper/',
			            childTabs: [
                            {id:'eastTabs'}
                        ]">
            <thead>
            <tr>
                <th data-options="field: 'paperId', title: 'UID', checkbox: true"></th>
                <th data-options="field: 'paperName', title: '纸张名称', sortable: true"></th>
                <th data-options="field: 'paperCode', title: '代号', sortable: true"></th>
                <th data-options="field: 'paperWeight', title: '克重', sortable: true"></th>
                <th data-options="field: 'paperPrice', title: '单价', sortable: true"></th>
            </tr>
            </thead>
        </table>
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
       data-options="method:'openTab',
        extend: '#userDg-toolbar',
       tab:{
           title:'纸张登记',
            href:'/AdminController/jsp/?url=/raw_material_register/paper_set'
       }">新增</a>
    <a href="javascript:void(0)" data-toggle="topjui-menubutton"
       data-options="method: 'openTab',
            extend: '#userDg-toolbar',
            iconCls: 'fa fa-pencil',
            btnCls:'topjui-btn-blue',
            tab: {
                title:'编辑纸张',
                href: '/PaperSet/edit/?url=/raw_material_register/paper_set&paperId={paperId}'
            }">编辑</a>
    <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method:'doAjax',btnCls:'topjui-btn-brown',
       extend: '#userDg-toolbar',
       selRow:'getSelections',
       iconCls:'fa fa-trash',
       url:'/PaperSet/deletePaper/',
       <%--config: {
        pkName: 'knifeTemplateId', //数据表主键名，用于批量提交数据时获取主键值
        singleQuotesParam: true, //是否对批量提交表格选中记录的参数值使用单引号，默认为false，true:'123','456'，false:123,456
        datagrid: {
            page: 'page', //提交到后台的显示第几页的数据
            size: 'rows', //提交到后台的每页显示多少条记录
            total: 'total', //后台返回的总记录数参数名
            rows: 'rows' //后台返回的数据行对象参数名
        },
        postJson: false, //提交表单数据时以json或x-www-form-urlencoded格式提交，true为json，false为urlencoded
        appendRefererParam: false, //自动追加来源页地址上的参数值到弹出窗口的href或表格的url上，默认为false不追加
        statusCode: {
            success: 200, //执行成功返回状态码
            failure: 300 //执行失败返回状态码
        }
       },language: {
        message: {
            title: {
                operationTips: '操作提示',
        confirmTips: '确认提示'
        },
        msg: {
        success: '操作成功',
        failed: '操作失败',
        error: '未知错误',
        checkSelfGrid: '请先勾选中要操作的数据前的复选框',
        selectSelfGrid: '请先选中要操作的数据',
        selectParentGrid: '请先选中主表中要操作的一条数据',
        permissionDenied: '对不起，你没有操作权限',
        confirmDelete: '你确定要删除所选的数据吗？',
        confirmMsg: '确定要执行该操作吗？'
        }
        },
        edatagrid: {
        destroyMsg: {
        norecord: {
        title: '操作提示',
        msg: '没有选中要操作的记录！'
        },
        confirm: {
        title: '操作确认',
        msg: '确定要删除选中的记录吗？'
        }
        }
        }
        },--%>
       grid: {uncheckedMsg:'请先勾选要删除的数据',param:'paperId:paperId'}">删除</a>
    <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method:'search',
       extend: '#userDg-toolbar',
       btnCls:'topjui-btn-blue'">查询</a>
</div>


<!-- 表格工具栏结束 -->
<script type="text/javascript">
    $(function(){
        $("#treetab th").tabs({
            onClick:function(node){
                alert(node.text);
            }
        });
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

</script>
</body>
</html>