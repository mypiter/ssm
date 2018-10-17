<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

    <title>箱型公式列表</title>

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
                       	url:'/CartonFormulaController/findCartonForAll/',
			            childTab: [{id:'southTabs'}]">
            <thead>
            <tr>
                <th data-options="field: 'id', title: 'UID', checkbox: true"></th>
                <th data-options="field: 'cartonNumber', title: '箱型编号'"></th>
                <th data-options="field: 'cartonName', title: '箱型名称'"></th>
                <th data-options="field: 'cartonType', title: '类型'"></th>
                <th data-options="field: 'mouthType', title: '搭口类型'"></th>
                <%--<th data-options="field: 'customType', title: '客户账期类型', sortable: true,--%>
                        <%--formatter:function(value,row,index){--%>
                                    <%--if (value == '1') {--%>
                                        <%--return '额度用户';--%>
                                    <%--} else if (value == '2') {--%>
                                        <%--return '预付款';--%>
                                    <%--} else if (value == '3') {--%>
                                        <%--return '账期';--%>
                                    <%--} else {--%>
                                        <%--return '';--%>
                                    <%--}--%>
                                <%--}"></th>--%>
                <th data-options="field: 'lengthLine', title: '长度压线'"></th>
                <th data-options="field: 'widthLine', title: '宽度压线'"></th>
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
                 param:'id:id'
             }">

            <div title="楞型系数" data-options="id:'tab1',iconCls:'fa fa-th'">
                <!-- datagrid表格 -->
                <table data-toggle="topjui-edatagrid"
                       data-options="id:'southTab1',
                       initCreate: false,
                       fitColumns:true,
                       url:'/CartonPitRelation/findByCartonId/',
                       <%--saveUrl:'/ReceivingAddress/addReceivingAddr/?customId={parent.id}',--%>
                       updateUrl:'/CartonPitRelation/updateCartonPit/',
                       <%--destroyUrl:'/ReceivingAddress/deleteReceivingAdderss/',--%>
                       onEdit:onEdit">
                    <thead>
                    <tr>
                        <th data-options="field:'id',title:'UUID',checkbox:true"></th>
                        <th data-options="field:'pitName',title:'楞型名称'"></th>
                        <th data-options="field:'coefficient',title:'系数',editor:{type:'numberbox',options:{required:true,height:30,validType:['length[0,20]'],min:0,groupSeparator:'',precision:2}}"></th>
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
           title:'箱型新增',
            href:'<%--/AdminController/jsp/?url=/user/customAdd--%>/AdminController/jsp/?url=/sale_register/carton_formula'
       }">新增</a>
    <!--  <input style="width:115px;height:35px" id="add" name="sub" onclick="addCartonType()" value="录入订单" type="button" /> -->
    <a href="javascript:void(0)" data-toggle="topjui-menubutton"
       data-options="method: 'openTab',
            extend: '#userDg-toolbar',
            iconCls: 'fa fa-pencil',
            btnCls:'topjui-btn-blue',
            tab: {
                title:'箱型修改',
                href: '/CartonFormulaController/jumpEditView/?url=/sale_register/carton_formula&ids={id}'
            }">编辑</a>
    <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method:'doAjax',btnCls:'topjui-btn-brown',
       extend: '#userDg-toolbar',
       iconCls:'fa fa-trash',
       url:'/CartonFormulaController/delete/',
       grid: {uncheckedMsg:'请先勾选要删除的数据',param:'id:id'}">删除</a>
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
    <%--<a href="javascript:void(0)"--%>
       <%--data-toggle="topjui-menubutton"--%>
       <%--data-options="method:'edatagrid',--%>
       <%--extend: '#southTab1-toolbar',--%>
       <%--iconCls:'fa fa-plus',--%>
       <%--btnCls:'topjui-btn-green',--%>
       <%--type:'addRow'">新增</a>--%>
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
    <%--<a href="javascript:void(0)"--%>
       <%--data-toggle="topjui-menubutton"--%>
       <%--data-options="method:'doAjax',--%>
       <%--extend: '#southTab1-toolbar',--%>
       <%--iconCls:'fa fa-remove',--%>
       <%--btnCls:'topjui-btn-blue',--%>
       <%--url:'/ReceivingAddress/deleteReceivingAdderss/',--%>
       <%--grid: {uncheckedMsg:'请先勾选要删除的数据',param:'id:id'}">删除</a>--%>
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