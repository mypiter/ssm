<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <%@ include file="../ap.jsp" %>
    <title>公司信息列表</title>
</head>

<body>
<!-- layout布局 开始 -->
<div data-toggle="topjui-layout" data-options="fit:true">
    <div data-options="region:'center',iconCls:'icon-reload',title:'',split:true,border:false,bodyCls:'border_left_right'">
        <!-- datagrid表格 -->
        <table data-toggle="topjui-datagrid"
               data-options="id:'userDg',
                        singleSelect:true,
					    selectOnCheck:false,
					    checkOnSelect:false,
                       	url:'/CompanyInformation/findList/',
			            childTabs: [
                            {id:'eastTabs'}
                        ]">
            <thead>
            <tr>
                <th data-options="field: 'id', title: 'UID', checkbox: true"></th>
                <th data-options="field:'companyName', title: '公司名称'"></th>
                <th data-options="field:'companySui', title: '公司税号'"></th>
                <th data-options="field:'companyAddress', title: '公司地址'"></th>
                <th data-options="field:'companyTel', title: '公司电话'"></th>
                <th data-options="field:'openingBank', title: '开户行'"></th>
                <th data-options="field:'companyAccount', title: '公司账号'"></th>
                <th data-options="field:'contacts', title: '联系人'"></th>
                <th data-options="field:'contactsTel', title: '联系人电话'"></th>
                <th data-options="field:'faName', title: '法人'"></th>
                <th data-options="field:'faTel', title: '法人电话'"></th>
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
       data-options="method:'openDialog',
        extend: '#userDg-toolbar',
       iconCls: 'fa fa-plus',
       dialog:{
           width: 700,
           height: 450,
           id:'userAddDialog',
            href:'/AdminController/jsp/?url=/sale_report/company_information_add_edit',
           buttonsGroup:[
               {text:'保存',url:'/CompanyInformation/addCompanyInformation/',iconCls:'fa fa-plus',handler:'ajaxForm',btnCls:'topjui-btn-brown'}
           ]
       }">新增</a>
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
                height: 450,
                href: '/AdminController/jsp/?url=/sale_report/company_information_add_edit',
                url: '/CompanyInformation/findById/?id={id}',//这里是根据选中数据的id查询改记录地址
                buttonsGroup: [
                    {
                        text: '更新',
                        url: '/CompanyInformation/updateCompanyInformation/',
                        iconCls: 'fa fa-save',
                        handler: 'ajaxForm',
                        btnCls: 'topjui-btn-green'
                    }
                ]
            }">编辑</a>
    <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method:'doAjax',
       extend: '#userDg-toolbar',
       btnCls:'topjui-btn-brown',
       iconCls:'fa fa-trash',
       <%--confirmMsg:'这个是勾选复选框实现多条数据的Ajax删除提交操作，提交grid.param中指定的参数值',--%>
       grid: {uncheckedMsg:'请先勾选要删除的数据',param:'id:id'},
       url: '/CompanyInformation/deleteCompanyInformation/'">删除</a>
    <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method:'search',
       extend: '#userDg-toolbar',
       btnCls:'topjui-btn-blue'">查询</a>


</div>



<script type="text/javascript">
    $(function(){
    });
</script>
</body>
</html>