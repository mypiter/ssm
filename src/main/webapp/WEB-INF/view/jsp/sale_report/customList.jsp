<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

    <title>客户列表</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <!--
    <link rel="stylesheet" type="text/css" href="styles.css">
    -->
    <!-- 导入公共样式 -->
    <%@ include file="../ap.jsp" %>
</head>
<body>
<!-- layout布局 开始 -->
<div data-toggle="topjui-layout" data-options="fit:true">
    <div data-options="region:'center',title:'',fit:false,split:true,border:false,bodyCls:'border_right_bottom'"
         style="height:60%">
        <!-- datagrid表格 -->
        <table data-toggle="topjui-datagrid"
               data-options="id:'userDg',
                        idField:'supplierId',
                        treeField:'taskType',
                        pagination:true,
                        striped:true,
                        fitColumns:true,
                        rownumbers: true,
                        singleSelect:true,
					    selectOnCheck:false,
					    checkOnSelect:false,
                       	url:'/CustomController/CustomList/',
			            childTab: [{id:'southTabs'}]">
            <thead>
            <tr>
                <th data-options="field: 'customId', title: 'UID', checkbox: true"></th>
                <th data-options="field: 'customName', title: '客户名称', sortable: true"></th>
                <th data-options="field: 'customCompary', title: '客户公司', sortable: true"></th>
                <th data-options="field: 'staffId', title: '业务员', sortable: true"></th>
                <th data-options="field: 'customTel', title: '联系方式', sortable: true"></th>
                <th data-options="field: 'customType', title: '客户账期类型', sortable: true,
                        formatter:function(value,row,index){
                                    if (value == '1') {
                                        return '额度用户';
                                    } else if (value == '2') {
                                        return '预付款';
                                    } else if (value == '3') {
                                        return '账期';
                                    } else {
                                        return '';
                                    }
                                }"></th>
                <th data-options="field: 'customQuota', title: '客户额度', sortable: true"></th>
                <th data-options="field: 'creditDay', title: '授信天数', sortable: true,
                        formatter:function(value,row,index){
                                    if (value == '1') {
                                        return '10天';
                                    } else if (value == '2') {
                                        return '20天';
                                    } else if (value == '3') {
                                        return '一个月';
                                    } else {
                                        return '';
                                    }
                                }"></th>
                <th data-options="field: 'wechat', title: '微信', sortable: true"></th>
                <th data-options="field: 'customQq', title: 'QQ', sortable: true"></th>
                <th data-options="field: 'deliveryDistance', title: '送货距离/公里', sortable: true"></th>
                <th data-options="field: 'customSale', title: '货款打折', sortable: true"></th>
                <th data-options="field: 'deliveryStyle', title: '送货单方式', sortable: true,
                        formatter:function(value,row,index){
                                    if (value == '1') {
                                        return '默认';
                                    } else if (value == '2') {
                                        return '格式1';
                                    } else {
                                        return '';
                                    }
                                }"></th>
                <th data-options="field: 'isShui', title: '是否含付税款', sortable: true,
                        formatter:function(value,row,index){
                                    if (value == '1') {
                                        return '是';
                                    } else if (value == '2') {
                                        return '否';
                                    } else {
                                        return '';
                                    }
                                }"></th>
                <th data-options="field: 'customAddress', title: '地址', sortable: true"></th>
            </tr>
            </thead>
        </table>
    </div>
    <div data-options="region:'south',fit:false,split:true,border:false"
         style="height:40%">
        <div data-toggle="topjui-tabs"
             data-options="id:'southTabs',
             fit:true,
             border:false,
             parentGrid:{
                 type:'datagrid',
                 id:'userDg',
                 param:'customId:customId'
             }">

            <div title="收货地址" data-options="id:'tab1',iconCls:'fa fa-th'">
                <!-- datagrid表格 -->
                <table data-toggle="topjui-edatagrid"
                       data-options="id:'southTab1',
                       initCreate: false,
                       fitColumns:true,
                       url:'/ReceivingAddress/findByCusId/',
                       saveUrl:'/ReceivingAddress/addReceivingAddr/?customId={parent.customId}',
                       updateUrl:'/ReceivingAddress/updateReceivingAdderss/',
                       destroyUrl:'/ReceivingAddress/deleteReceivingAdderss/',
                       onEdit:onEdit">
                    <thead>
                    <tr>
                        <th data-options="field:'id',title:'UUID',checkbox:true"></th>
                        <th data-options="field:'receivingAddress',title:'收货地址',editor:{type:'textbox',options:{required:true,height:30,validType:['length[0,100]']}}"></th>
                        <th data-options="field:'consignee',title:'收货人',editor:{type:'textbox',options:{required:true,height:30,validType:['length[0,20]']}}"></th>
                        <th data-options="field:'consigneeTel',title:'联系方式',sortable:true,editor:{type:'textbox',options:{required:true,height:30,validType:'telephone'}}"></th>
                    </tr>
                    </thead>
                </table>
            </div>
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
       data-options="method:'openTab',
        extend: '#userDg-toolbar',
       tab:{
           title:'客户登记',
            href:'<%--/AdminController/jsp/?url=/user/customAdd--%>/AdminController/jsp/?url=/sale_register/user_register'
       }">新增</a>
    <!--  <input style="width:115px;height:35px" id="add" name="sub" onclick="addCartonType()" value="录入订单" type="button" /> -->
    <a href="javascript:void(0)" data-toggle="topjui-menubutton"
       data-options="method: 'openTab',
            extend: '#userDg-toolbar',
            iconCls: 'fa fa-pencil',
            btnCls:'topjui-btn-blue',
            tab: {
                title:'客户修改',
                href: '/CustomController/edit/?url=/sale_register/user_register&customId={customId}'
            }">编辑</a>
    <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method:'doAjax',btnCls:'topjui-btn-brown',
       extend: '#userDg-toolbar',
       iconCls:'fa fa-trash',
       url:'/CustomController/deleteCustom/',
       grid: {uncheckedMsg:'请先勾选要删除的数据',param:'customId:customId,customName:customName'}">删除</a>
    <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method:'search',
       extend: '#userDg-toolbar',
       btnCls:'topjui-btn-blue'">查询</a>
</div>
<!-- 表格工具栏结束 -->

<!-- 可编辑表格工具栏 -->
<!--材质-->
<div id="southTab1-toolbar" data-options="grid:{
           type:'edatagrid',
           id:'southTab1'
       },parentGrid:{
           type:'datagrid',
           id:'userDg'
       }" class="topjui-toolbar">
    <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method:'edatagrid',
       extend: '#southTab1-toolbar',
       iconCls:'fa fa-plus',
       btnCls:'topjui-btn-green',
       type:'addRow'">新增</a>
    <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method:'edatagrid',
       extend: '#southTab1-toolbar',
       iconCls:'fa fa-save',
       btnCls:'topjui-btn-brown',
       type:'saveRow'">保存</a>
    <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method:'edatagrid',
       extend: '#southTab1-toolbar',
       iconCls:'fa fa-remove',
       btnCls:'topjui-btn-black',
       type:'cancelRow'">取消</a>
    <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method:'doAjax',
       extend: '#southTab1-toolbar',
       iconCls:'fa fa-remove',
       btnCls:'topjui-btn-blue',
       url:'/ReceivingAddress/deleteReceivingAdderss/',
       grid: {uncheckedMsg:'请先勾选要删除的数据',param:'id:id'}">删除</a>
    <!--<a href="javascript:void(0)"
      data-toggle="topjui-menubutton"
      data-options="method:'filter',
      extend: '#southTab1-toolbar',
      btnCls:'topjui-btn-black'">过滤</a>
   <a href="javascript:void(0)"
      data-toggle="topjui-menubutton"
      data-options="method:'search',
      extend: '#southTab1-toolbar',
      btnCls:'topjui-btn-blue'">查询</a>-->
</div>
<script>
    $(function(){
    });

    var rowEditingIndex = 0;

    function onEdit(index, row) {
        rowEditingIndex = index;
    }

    function onSelect(record) {
        setGridFieldsValue("southTab1", rowEditingIndex, ["id", "mobile"], ["email", "mobile"], record, "mobile");
    }

    function onBeforeLoad(param) {
        var row = getSelectedRowData('datagrid', 'userDg');
        param.email = row.email;
    }
</script>

</body>
</html>