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
    <%@ include file="../ap.jsp" %>
    <title>成品送货记录</title>
</head>

<body>
<!-- layout布局 开始 -->
<div data-toggle="topjui-layout" data-options="fit:true">
    <div data-options="region:'center',title:'',fit:false,split:true,border:false,bodyCls:'border_right_bottom'"
         style="height:60%">
        <!-- datagrid表格 -->
        <table data-toggle="topjui-datagrid"
               data-options="id:'userDg',
                        idField:'uuid',
                        treeField:'taskType',
                        pagination:true,
                        striped:true,
                        fitColumns:false,
                        rownumbers: true,
                        url:'/CartonOutInfo/findAll/',
			            childTab: [{id:'southTabs'}]">
            <thead>
            <tr>
            	<th data-options="field:'id',title:'UUID',checkbox:true"></th>
                <th data-options="field:'deliveryNumber',title:'送货单号',sortable:true,formatter: openNewTabTwo"></th>
                <th data-options="field:'customCompany',title:'客户名称',sortable:true"></th>
                <th data-options="field:'deliTime',title:'送货日期',sortable:true"></th>
                <th data-options="field:'deliName',title:'送货人',sortable:true"></th>
                <th data-options="field:'car',title:'车牌号',sortable:true"></th>
                <th data-options="field:'consignee',title:'收货人',sortable:true"></th>
                <th data-options="field:'consigneeContact',title:'收货人联系电话',sortable:true"></th>
                <th data-options="field:'allPrice',title:'总金额',sortable:true"></th>
                <th data-options="field:'start',title:'送货状态',sortable:true,
                formatter:function(value,row,index){
                                    if (value == '1') {
                                        return '<font color=\'#1E9FFF\'>配送中</font>';
                                    } else if (value == '2') {
                                        return '<font color=\'#FF5722\'>已签收</font>';
                                    }else {
                                        return '';
                                    }
                                }"></th>
                <th data-options="field:'remarks',title:'备注',sortable:true"></th>
                <th data-options="field:'deliveryStyle',title:'送货单格式',sortable:true"></th>
                <th data-options="field:'coid',title:'本公司信息编号',sortable:true"></th>
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
                 param:'deliveryNumber:deliveryNumber'
             }">
            <div title="客户配送详情" data-options="id:'tab1',iconCls:'fa fa-th'">
                <!-- datagrid表格 -->
                <table data-toggle="topjui-datagrid"
                       data-options="id:'southTab1',
                               initCreate: false,
                               fitColumns:false,
						       url:'/Cartonout/findByNum/'">
                    <thead>
                    <tr>
                    <th data-options="field:'deliveryNumber',title:'配送单号',checkbox:true"></th>
                    <th data-options="field:'orderAccount',title:'订单号',sortable:true"></th>
                    <th data-options="field:'customCompany',title:'客户名称',sortable:true"></th>
                    <th data-options="field:'staffId',title:'业务员',sortable:true"></th>
                    <th data-options="field:'productName',title:'产品名称',sortable:true"></th>
                    <th data-options="field:'specifications',title:'规格',sortable:true"></th>
                    <th data-options="field:'materialName',title:'材质',sortable:true"></th>
                    <th data-options="field:'pitTypeName',title:'楞型',sortable:true"></th>
                    <th data-options="field:'cartonPrice',title:'单价',sortable:true"></th>
                    <th data-options="field:'allPrice',title:'金额',sortable:true"></th>
                    <th data-options="field:'outNum',title:'配送数',sortable:true"></th>
                    <th data-options="field:'outTime',title:'配送时间',sortable:true"></th>
                    <th data-options="field:'consigneeNum',title:'签收数',sortable:true"></th>
                    <th data-options="field:'minorityNum',title:'少数',sortable:true"></th>
                    <th data-options="field:'returnNum',title:'退货数',sortable:true"></th>
                    <th data-options="field:'isconsignee',title:'退货原因',sortable:true"></th>
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
       tab:{
           title:'新增送货单',
           href:'/AdminController/jsp/?url=/production_register/finished_delivery'
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
                width: 450,
                height: 300,
                href:'/CartonOutInfo/Eidt/?url=/production_report/eidt_delivery&uuid={id}',
                url:'',
                buttonsGroup: [
                    {
                        text: '更新',
                        url:'/CartonOutInfo/updateByNum/',
                        iconCls: 'fa fa-save',
                        handler: 'ajaxForm',
                        btnCls: 'topjui-btn-green'
                    }
                ]
            }">编辑送货单格式</a>
    <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method:'search',
       extend: '#userDg-toolbar',
       btnCls:'topjui-btn-blue'">查询</a>
    <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method:'openWindow',
        extend: '#userDg-toolbar',
        grid: {uncheckedMsg:'请先勾选要打印的数据'},
        btnCls:'topjui-btn-black',
        iconCls:'fa fa-pencil',
        windowHref:'/AdminController/jsp/?url=baobiao/productionReport&deliveryNumber={multiple.deliveryNumber}&deliveryStyle={multiple.deliveryStyle}&coid={multiple.coid}'">打印送货单</a>
    <form id="queryForm" class="search-box">
        <span>对账单格式</span>
        <input id="durl" type="text" name="name"
               data-toggle="topjui-combobox"
               data-options="id:'customName',width:150,required:false,
               idField: 'id',
               textField: 'name',
               valueField: 'url',
               url:'/Duizhang/getList/',
               prompt:''">
        <span>本公司信息</span>
        <input id="coid" name="coid" type="text" data-toggle="topjui-combobox"
               data-options="id:'user',
                  width:180,
                  idField: 'id',
                  textField: 'companyName',
                  valueField:'id',
                  url:'/CompanyInformation/getList/',
                  required:false,
                 onLoadSuccess: function (res) {
                // 下拉框默认选择第一项
                if (res) {
                    var val = $(this).iCombobox('getData');
                    $(this).iCombobox('select', val[0]['companyName']); //这个数据根据自己情况来设定
                }
                }">
        <span>客户名称</span>
        <input id="cus" type="text" name="bSecondedCustomer"
               data-toggle="topjui-combobox"
               data-options="id:'customName',width:200,required:true,
           idField: 'id',
           textField: 'customCompany',
           valueField: 'customCompany',
           url:'/Mian/selectByq/',
           prompt:'配送完成客户名称'">
        <input id="start" type="text" name="startTime" data-toggle="topjui-datebox" data-options="width:120,required:true,prompt:'开始时间'">
        <input id="end" type="text" name="endTime" data-toggle="topjui-datebox" data-options="width:120,required:true,prompt:'结束时间'">
        <a href="javascript:void(0)"
           data-toggle="topjui-menubutton"
           data-options="method:'query',
           iconCls:'fa fa-search',
           btnCls:'topjui-btn-blue',
           form:{id:'queryForm'},
           grid:{type:'datagrid','id':'userDg'}">查询</a>
        <a id="btn" href="#" data-toggle="topjui-menubutton" data-options="btnCls:'topjui-btn-black'">打印对账单</a>
    </form>
</div>
<!-- 表格工具栏结束 -->

<div id="southTab1-toolbar" data-options="grid:{
           type:'datagrid',
           id:'southTab1'
       },parentGrid:{
           type:'datagrid',
           id:'userDg'
       }" class="topjui-toolbar">
    <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method:'doAjax',
       extend: '#southTab1-toolbar',
       btnCls:'topjui-btn-brown',
       iconCls:'fa fa-trash',
       url:_ctx + '/json/response/success.json',
       grid: {uncheckedMsg:'请先勾选要删除的数据',param:'uuid:uuid,code:code'}">删除</a>
</div>
<!-- 表格工具栏结束 -->
<script type="text/javascript">
    $(function(){
        $('#btn').bind('click', function(){
            var custom=$('#cus').iCombobox('getValue');
            var startTime=$('#start').iDatebox('getValue');
            var endTime=$('#end').iDatebox('getValue');
            var durl=$('#durl').iCombobox('getValue');
            var coid=$('#coid').iCombobox('getValue');
            //alert(custom+"/"+startTime+"="+endTime);
            window.open("/Mian/show/?url=/baobiao/statementReport&custom="+encodeURI(custom)+"&startTime="+startTime+"&endTime="+endTime+"&durl="+durl+"&coid="+coid);
        });
    });
    function openNewTabTwo(value, row, index) {
        return '<a style="color:blue" href=\"javascript:openNewTabTwo1(\'' + value + '\')\">' + value + '</a>';
    }
    function openNewTabTwo1(value) {
        var url="/CartonOutInfo/jumpCartonInfo/?url=/production_report/cartonOutInfoInfo&deliveryNumber="+value;
        $('#handleBtn').iDialog('openDialog', {
            id: 'businessDialog',
            title: '配送详情',
            iconCls: 'fa fa-key',
            href: url,
            height:650,
            width:1000,
            buttons: [
                {
                    text: '关闭',
                    iconCls: 'fa fa-close',
                    btnCls: 'topjui-btn-red',
                    handler: function () {
                        $('#businessDialog').iDialog('close');
                    }
                }],
        });
    }
</script>
</body>
</html>
