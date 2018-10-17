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
    <title>成品仓库</title>
</head>
<body>
<!-- layout布局 开始 -->
<div data-toggle="topjui-layout" data-options="fit:true">
    <div data-options="region:'center',title:'',fit:false,split:true,border:false,bodyCls:'border_right_bottom'"
         style="height:50%">
        <!-- datagrid表格 -->
        <table data-toggle="topjui-datagrid"
               data-options="id:'userDg',
                        idField:'stockId',<%--指明哪一个字段是标识字段。--%>
                        treeField:'taskType',
                        pagination:true,<%--如果为true，则在DataGrid控件底部显示分页工具栏。--%>
                        striped:true,<%--是否显示斑马线效果。--%>
                        fitColumns:true,<%--真正的自动展开/收缩列的大小，以适应网格的宽度，防止水平滚动。--%>
                        rownumbers: true,<%--如果为true，则显示一个行号列。--%>

                        singleSelect:true,<%--如果为true，则只允许选择一行。--%>
					    selectOnCheck:false,<%--如果为true，单击复选框将永远选择行。如果为false，选择行将不选中复选框。--%>
					    checkOnSelect:false,<%--如果为true，当用户点击行的时候该复选框就会被选中或取消选中。如果为false，当用户仅在点击该复选框的时候才会呗选中或取消。--%>
                        url:'/CartonStock/findA/',
			            childTab: [{id:'southTabs'}]">
            <thead>
            <tr>
                <th data-options="field:'stockId',title:'stockId',checkbox:true"></th>
                <th data-options="field:'orderAccount',title:'订单号',sortable:true,formatter: openNewTabFox"></th>
                <th data-options="field:'customerName',title:'客户名称'"></th>
                <th data-options="field:'productName',title:'产品名称'"></th>
                <th data-options="field:'size',title:'规格',sortable:true"></th>
                <th data-options="field:'materialScience',title:'材质',sortable:true"></th>
                <th data-options="field:'pitType',title:'楞型',sortable:true"></th>
                <th data-options="field:'stockNum',title:'库存数',sortable:true"></th>
                <th data-options="field:'palletNumber',title:'托盘数',sortable:true"></th>
                <th data-options="field:'price',title:'单价',sortable:true"></th>
                <th data-options="field:'total',title:'总价',sortable:true"></th>
            </thead>
        </table>
    </div>
    <div data-options="region:'south',fit:false,split:true,border:false"
         style="height:50%">
        <div data-toggle="topjui-tabs"
             data-options="id:'southTabs',
             fit:true,
             border:false,
             parentGrid:{
                 type:'datagrid',
                 id:'userDg',
                 param:'orderAccount:orderAccount'
             }">
            <div title="入库详情" data-options="id:'tab0',iconCls:'fa fa-th'">
                <!-- datagrid表格 -->
                <table data-toggle="topjui-datagrid"
                       data-options="id:'southTab0',
                               initCreate: false,
                               fitColumns:true,
						       url:'/Cartonwarehousing/findA/'">
                    <thead>
                    <tr>
                        <th data-options="field:'rkId',checkbox:true,sortable:true"></th>
                        <th data-options="field:'rkPihao',title:'入库单号',sortable:true"></th>
                        <th data-options="field:'orderAccount',title:'订单号',sortable:true"></th>
                        <th data-options="field:'customName',title:'客户名称'"></th>
                        <th data-options="field:'productName',title:'产品名称',sortable:true"></th>
                        <th data-options="field:'staffId',title:'业务员',sortable:true"></th>
                        <th data-options="field:'materialName',title:'材质',sortable:true"></th>
                        <th data-options="field:'cartonLength',title:'长',sortable:true"></th>
                        <th data-options="field:'cartonWidth',title:'宽',sortable:true"></th>
                        <th data-options="field:'cartonHeight',title:'高',sortable:true"></th>
                        <th data-options="field:'pitTypeName',title:'楞型',sortable:true"></th>
                        <th data-options="field:'cartonPrice',title:'单价'"></th>
                        <th data-options="field:'rkNum',title:'纸板入库数量'"></th>
                        <th data-options="field:'number',title:'成品入库数量'"></th>
                        <th data-options="field:'rkTime',title:'入库时间',sortable:true"></th>
                        <th data-options="field:'reservoir',title:'备注'"></th>
                    </tr>
                    </thead>
                </table>
            </div>
            <div title="配送详情" data-options="id:'tab1',iconCls:'fa fa-th'">
                <!-- datagrid表格 -->
                <table data-toggle="topjui-datagrid"
                       data-options="id:'southTab1',
                               initCreate: false,
                               fitColumns:true,
						       url:'/Cartonout/findByTopjui/'">
                    <thead>
                    <tr>
                        <th data-options="field:'id',title:'id',checkbox:true"></th>
                        <th data-options="field:'deliveryNumber',title:'配送单号',sortable:true"></th>
                        <th data-options="field:'orderAccount',title:'订单号'"></th>
                        <th data-options="field:'customCompany',title:'客户名称',sortable:true"></th>
                        <th data-options="field:'productName',title:'产品名称'"></th>
                        <th data-options="field:'materialName',title:'材质',sortable:true"></th>
                        <th data-options="field:'pitTypeName',title:'楞型',sortable:true"></th>
                        <th data-options="field:'orderNum',title:'订单数量'"></th>
                        <th data-options="field:'outNum',title:'出库数量'"></th>
                        <th data-options="field:'outTime',title:'出库时间'"></th>
                        <th data-options="field:'reservoir',title:'备注',sortable:true"></th>
                        <th data-options="field:'cartonPrice',title:'单价',sortable:true"></th>
                        <th data-options="field:'consigneeNum',title:'签收数量'"></th>
                        <th data-options="field:'isconsigneeNum',title:'未签收数量'"></th>
                        <th data-options="field:'returnNum',title:'退货数'"></th>
                    </tr>
                    </thead>
                </table>
            </div>
            <div title="借调详情" data-options="id:'tab2',iconCls:'fa fa-th'">
                <!-- datagrid表格 -->
                <table data-toggle="topjui-datagrid"
                       data-options="id:'southTab2',
                               initCreate: false,
                               fitColumns:true,
						       url:'/CartonLoan/findByNum/'">
                    <thead>
                    <tr>
                        <th data-options="field:'cartonLoanId',title:'UUID',checkbox:true"></th>
                        <th data-options="field:'bSecondedCustomer',title:'被借调客户',sortable:true"></th>
                        <th data-options="field:'secondedCustomer',title:'借调客户',sortable:true"></th>
                        <th data-options="field:'bOrderAccount',title:'被借调订单号',sortable:true"></th>
                        <th data-options="field:'bProductName',title:'被借调产品名称',sortable:true"></th>
                        <th data-options="field:'orderAccount',title:'借调订单',sortable:true"></th>
                        <th data-options="field:'cartonLoanNum',title:'借调数',sortable:true"></th>
                        <th data-options="field:'cartonLoanTime',title:'借调时间',sortable:true"></th>
                        <th data-options="field:'material',title:'材质'"></th>
                        <th data-options="field:'fluteType',title:'楞型'"></th>
                        <th data-options="field:'size',title:'尺寸',sortable:true"></th>
                        <th data-options="field:'orderAccountsConter',title:'备注'"></th>
                    </tr>
                    </thead>
                </table>
            </div>
        </div>
    </div>
</div>
<!-- layout布局 结束 -->
<!--入库记录工具栏开始-->
<div id="southTab0-toolbar" data-options="grid:{
           type:'edatagrid',
           id:'southTab0'
       },parentGrid:{
           type:'datagrid',
           id:'userDg'
       }" class="topjui-toolbar">
    <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method:'openWindow',
        extend: '#southTab0-toolbar',
        grid: {uncheckedMsg:'请先勾选要打印的数据'},
        btnCls:'topjui-btn-black',
        iconCls:'fa fa-pencil',
        windowHref:'/Cartonwarehousing/jumpLabel/?url=production_report/finishedLabel&rkId={multiple.rkId}'">打印入库标签</a>
    <a id="btnt" href="#" data-toggle="topjui-menubutton" data-options="btnCls:'topjui-btn-black'">打印无数据标签</a>
</div>
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
       iconCls: 'fa fa-plus',
       btnCls: 'topjui-btn-green',
       tab:{
           title:'入库',
           href:'/AdminController/jsp/?url=/production_register/finished_product'
       }">入库</a>
    <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method:'openTab',
       extend: '#userDg-toolbar',
       iconCls: 'fa fa-minus',
       btnCls:'topjui-btn-orange',
       tab:{
           title:'配送',
           href:'/AdminController/jsp/?url=/production_register/finished_delivery'
       }">配送</a>
    <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method:'openTab',
       extend: '#userDg-toolbar',
       iconCls: 'fa fa-mail-forward',
       btnCls:'topjui-btn-black',
       tab:{
           title:'借调',
           href:'/AdminController/jsp/?url=/production_report/carton_loan'
       }">借调</a>
    <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method:'openTab',
       extend: '#userDg-toolbar',
       btnCls:'topjui-btn-purple',
       tab:{
           title:'调整',
           href:'/AdminController/jsp/?url=/production_register/finished_stock_adjustment'
       }">调整</a>
    <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method:'search',
       extend: '#userDg-toolbar',
       btnCls:'topjui-btn-blue'">查询</a>
    <form id="queryForm" class="search-box">
        <span>客户名称</span>
        <input id="cus" type="text" name="customer"
               data-toggle="topjui-combobox"
               data-options="id:'customName',width:200,required:false,
           idField: 'stockId',
           textField: 'customerName',
           valueField: 'customerName',
           url:'/Mian/selectBylist/'
           ">
        <input id="stime" type="text" name="stime" data-toggle="topjui-datebox" data-options="width:200,required:false,prompt:'时间点'">
        <a href="javascript:void(0)"
           data-toggle="topjui-menubutton"
           data-options="method:'query',
           iconCls:'fa fa-search',
           btnCls:'topjui-btn-blue',
           form:{id:'queryForm'},
           grid:{type:'datagrid','id':'userDg'}">查询时间点库存</a>
        <!--<a id="btn" href="#" data-toggle="topjui-menubutton" data-options="btnCls:'topjui-btn-black'">导出Excel报表</a>-->
        <a href="javascript:void(0)"
           data-toggle="topjui-menubutton"
           data-options="method:'export',
           extend: '#userDg-toolbar',
           iconCls:'fa fa-cloud-download',
           btnCls:'topjui-btn-red',
           url:'/Mian/export/'">导出Excel报表</a>
    </form>
</div>
<script>
    $(function(){
        $('#btn').bind('click', function(){
            var custom=$('#cus').iCombobox('getValue');
            window.open("/Mian/showCs/?url=/baobiao/cangReport&custom="+encodeURI(custom));
        });
        $('#btnt').bind('click', function(){
            //alert(custom+"/"+startTime+"="+endTime);
            window.open("/AdminController/jsp/?url=/production_report/NullLabel");
        });
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
    function openNewTabFox(value, row, index) {
        console.log(value);
        console.log(row);
        console.log(index);
        return '<a style="color:blue" href=\"javascript:openNewTabFox1(\'' + value + '\')\">' + value + '</a>';
    }
    function openNewTabFox1(value) {
        console.log(value);
        var url="/CartonStock/jumpCartonInfo/?url=/production_report/cartonStockInfo&orderAccount="+value;
        $('#handleBtn').iDialog('openDialog', {
            id: 'businessDialog',
            title: '成品仓库详情',
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