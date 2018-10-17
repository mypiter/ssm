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
    <title>纸板库存记录</title>
</head>
<body>
<!-- layout布局 开始 -->
<div data-toggle="topjui-layout" data-options="fit:true">
    <div data-options="region:'center',title:'',fit:false,split:true,border:false,bodyCls:'border_right_bottom'"
         style="height:60%">
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
                        url:'/PurchaseStock/findByPurStock/',
			            childTab: [{id:'southTabs'}]">
            <thead>
            <tr>
                <th data-options="field:'stockId',title:'stockId',checkbox:true"></th>
                <th data-options="field:'orderAccount',title:'订单号',sortable:true"></th>
                <th data-options="field:'customName',title:'客户名称'"></th>
                <th data-options="field:'cartonName',title:'产品名称'"></th>
                <th data-options="field:'test',title:'实际库存数',sortable:true,
                        formatter:function(value,row,index){
                                    var test=Number(row['stockNum']-row['outNum']-row['n']);
                                    return test;
                                }"></th>
                <th data-options="field:'stockNum',title:'总库存数',sortable:true"></th>
                <th data-options="field:'outNum',title:'出库数',sortable:true"></th>
                <th data-options="field:'n',title:'借调数',sortable:true"></th>
                <th data-options="field:'price',title:'单价',sortable:true"></th>
                <th data-options="field:'materialScience',title:'材质'"></th>
                <th data-options="field:'fluteType',title:'楞型'"></th>
                <th data-options="field:'purchaseSpec',title:'尺寸',sortable:true"></th>
                <th data-options="field:'widthLine',title:'宽压线'"></th>
                <th data-options="field:'lineType',title:'压线类型',sortable:true,
                                formatter:function(value,row,index){
                                if (value == '1') {
                                return '明线';
                                } else if (value == '2') {
                                return '暗线';
                                } else {
                                return '';
                                }
                                }"></th>
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
                 param:'orderAccount:orderAccount'
             }">
            <div title="入库详情" data-options="id:'tab0',iconCls:'fa fa-th'">
                <!-- datagrid表格 -->
                <table data-toggle="topjui-datagrid"
                       data-options="id:'southTab0',
                               initCreate: false,
                               fitColumns:true,
						       url:'/CardboardEnter/getPurEnter/?type=1'">
                    <thead>
                    <tr>
                        <th data-options="field:'purId',title:'id',checkbox:true"></th>
                        <th data-options="field:'orderAccount',title:'采购单号',sortable:true"></th>
                        <th data-options="field:'batch',title:'批号',sortable:true"></th>
                        <th data-options="field:'orderId',title:'订单号',sortable:true"></th>
                        <th data-options="field:'supplierName',title:'供应商'"></th>
                        <th data-options="field:'purchaseNumber',title:'采购数',sortable:true"></th>
                        <th data-options="field:'singular',title:'开单数',sortable:true"></th>
                        <th data-options="field:'num',title:'入库数',sortable:true"></th>
                        <th data-options="field:'difference',title:'少数',sortable:true"></th>
                        <th data-options="field:'returnNumber',title:'退货数',sortable:true"></th>
                        <th data-options="field:'palletNumber',title:'托盘数',sortable:true"></th>
                        <th data-options="field:'price',title:'单价',sortable:true"></th>
                        <th data-options="field:'time',title:'入库日期',sortable:true"></th>
                        <th data-options="field:'supperSpec',title:'供方材质'"></th>
                        <th data-options="field:'materialScience',title:'材质'"></th>
                        <th data-options="field:'pitType',title:'楞型'"></th>
                        <th data-options="field:'size',title:'尺寸',sortable:true"></th>
                        <th data-options="field:'widthLine',title:'宽压线'"></th>
                        <th data-options="field:'lineType',title:'压线类型',sortable:true,
                                        formatter:function(value,row,index){
                                        if (value == '1') {
                                        return '明线';
                                        } else if (value == '2') {
                                        return '暗线';
                                        } else {
                                        return '';
                                        }
                                        }"></th>
                        <th data-options="field:'customName',title:'客户名称'"></th>
                        <th data-options="field:'cartonName',title:'产品名称'"></th>
                    </tr>
                    </thead>
                </table>
            </div>
            <div title="出库详情" data-options="id:'tab1',iconCls:'fa fa-th'">
                <!-- datagrid表格 -->
                <table data-toggle="topjui-datagrid"
                       data-options="id:'southTab1',
                               initCreate: false,
                               fitColumns:true,
						       url:'/OutStorage/findByPurOut/?type=1'">
                    <thead>
                    <tr>
                        <th data-options="field:'purId',title:'id',checkbox:true"></th>
                        <th data-options="field:'purNumber',title:'出库单号',sortable:true"></th>
                        <th data-options="field:'orderAccount',title:'订单号',sortable:true"></th>
                        <th data-options="field:'customName',title:'客户名称'"></th>
                        <th data-options="field:'cartonName',title:'产品名称'"></th>
                        <th data-options="field:'num',title:'出库数量',sortable:true"></th>
                        <th data-options="field:'time',title:'出库时间',sortable:true"></th>
                        <th data-options="field:'leader',title:'领料人'"></th>
                        <th data-options="field:'adminName',title:'出库员'"></th>
                        <th data-options="field:'materialScience',title:'材质'"></th>
                        <th data-options="field:'pitType',title:'楞型'"></th>
                        <th data-options="field:'cardboardLength',title:'纸板长',sortable:true"></th>
                        <th data-options="field:'cardboardWidth',title:'纸板宽',sortable:true"></th>
                        <th data-options="field:'widthLine',title:'宽压线'"></th>
                        <th data-options="field:'lineType',title:'压线类型',sortable:true,
                                formatter:function(value,row,index){
                                if (value == '1') {
                                return '明线';
                                } else if (value == '2') {
                                return '暗线';
                                } else {
                                return '';
                                }
                                }"></th>
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
						       url:'/CardboardLoan/findByCardLoan/?type=1'">
                    <thead>
                    <tr>
                        <th data-options="field:'cardboardLoanId',title:'UUID',checkbox:true"></th>
                        <th data-options="field:'orderAccounts',title:'被借调订单号',sortable:true"></th>
                        <th data-options="field:'orderAccount',title:'借调订单',sortable:true"></th>
                        <th data-options="field:'orderAccountsNum',title:'借调数',sortable:true"></th>
                        <th data-options="field:'cartonLoanTime',title:'借调时间',sortable:true"></th>
                        <th data-options="field:'material',title:'材质'"></th>
                        <th data-options="field:'fluteType',title:'楞型'"></th>
                        <th data-options="field:'size',title:'尺寸',sortable:true"></th>
                        <th data-options="field:'widthLine',title:'宽压线'"></th>
                        <th data-options="field:'lineType',title:'压线类型',
                                formatter:function(value,row,index){
                                if (value == '1') {
                                return '明线';
                                } else if (value == '2') {
                                return '暗线';
                                } else {
                                return '';
                                }
                                }"></th>
                        <th data-options="field:'price',title:'单价',sortable:true"></th>
                        <th data-options="field:'orderAccountsConter',title:'备注'"></th>
                    </tr>
                    </thead>
                </table>
            </div>
            <div title="库存调整详情" data-options="id:'tab3',iconCls:'fa fa-th'">
                <!-- datagrid表格 -->
                <table data-toggle="topjui-datagrid"
                       data-options="id:'southTab3',
                               initCreate: false,
                               fitColumns:true,
						       url:'/CardboardEdit/findByPurEdit/?type=1'">
                    <thead>
                    <tr>
                        <th data-options="field:'cardboardEditId',title:'UUID',checkbox:true"></th>
                        <th data-options="field:'orderAcount',title:'调整订单号',sortable:true"></th>
                        <th data-options="field:'editPrice',title:'调整前单价',sortable:true"></th>
                        <th data-options="field:'editOutNum',title:'调整前出库数',sortable:true"></th>
                        <th data-options="field:'editLoan',title:'调整前被借调数',sortable:true"></th>
                        <th data-options="field:'editNum',title:'调整前库存数',sortable:true"></th>
                        <th data-options="field:'editPrices',title:'调整后单价',sortable:true"></th>
                        <th data-options="field:'editOutNums',title:'调整后出库数',sortable:true"></th>
                        <th data-options="field:'editLoans',title:'调整后被借调数',sortable:true"></th>
                        <th data-options="field:'editNums',title:'调整后库存数',sortable:true"></th>
                        <th data-options="field:'editTime',title:'调整时间',sortable:true"></th>
                        <th data-options="field:'editRemark',title:'调整备注'"></th>
                        <th data-options="field:'editName',title:'调整人'"></th>
                        <th data-options="field:'editTye',title:'调整类型'"></th>
                    </tr>
                    </thead>
                </table>
            </div>
            <div title="退货赔偿详情" data-options="id:'tab4',iconCls:'fa fa-th'">
                <!-- datagrid表格 -->
                <table data-toggle="topjui-datagrid"
                       data-options="id:'southTab4',
                               initCreate: false,
                               fitColumns:true,
						       url:'/PurRejected/findByPurReturn/?type=1'">
                    <thead>
                    <tr>
                        <th data-options="field:'rejectedId',title:'id',checkbox:true"></th>
                        <th data-options="field:'orderAccount',title:'订单号',sortable:true"></th>
                        <th data-options="field:'batchNumber',title:'批号',sortable:true"></th>
                        <th data-options="field:'purPrice',title:'单价',sortable:true"></th>
                        <th data-options="field:'materialsNumber',title:'来料数',sortable:true"></th>
                        <th data-options="field:'rejectedNum',title:'退货数量',sortable:true"></th>
                        <th data-options="field:'compensateMoney',title:'补数',sortable:true"></th>
                        <th data-options="field:'money',title:'直接赔款',sortable:true"></th>
                        <th data-options="field:'causeOfReturn',title:'退货原因'"></th>
                        <th data-options="field:'rejectedTime',title:'退货时间',sortable:true"></th>
                        <th data-options="field:'supplierName',title:'供应商名称'"></th>
                        <th data-options="field:'supperSpec',title:'供方材质'"></th>
                        <th data-options="field:'materialName',title:'材质'"></th>
                        <th data-options="field:'pitType',title:'楞型'"></th>
                        <th data-options="field:'blankingSize',title:'尺寸',sortable:true"></th>
                        <th data-options="field:'widthLine',title:'宽压线'"></th>
                        <th data-options="field:'lineType',title:'压线类型',sortable:true,
                                formatter:function(value,row,index){
                                if (value == '1') {
                                return '明线';
                                } else if (value == '2') {
                                return '暗线';
                                } else {
                                return '';
                                }
                                }"></th>
                    </tr>
                    <th data-options="field:'rejectedRemarks',title:'备注'"></th>
                    <th data-options="field:'registrant',title:'经手人'"></th>
                    </tr>
                    </thead>
                </table>
            </div>
            <%--<div title="Panel面板"--%>
                 <%--data-options="id:'tab8',--%>
                         <%--iconCls:'fa fa-th',--%>
                         <%--href:'https://www.topjui.com?uuid={uuid}'"></div>--%>
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
       iconCls: 'fa fa-plus',
       btnCls: 'topjui-btn-green',
       tab:{
           title:'入库',
           href:'/AdminController/jsp/?url=/raw_material_register/raw_material'
       }">入库</a>
    <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method:'openTab',
       extend: '#userDg-toolbar',
       iconCls: 'fa fa-minus',
       btnCls:'topjui-btn-orange',
       tab:{
           title:'出库',
           href:'/AdminController/jsp/?url=/raw_material_register/raw_material_out'
       }">出库</a>
    <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method:'openTab',
       extend: '#userDg-toolbar',
       iconCls: 'fa fa-mail-forward',
       btnCls:'topjui-btn-black',
       tab:{
           title:'借调',
           href:'/AdminController/jsp/?url=/raw_material_register/raw_material_use_adjustment'
       }">借调</a>
    <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method:'openTab',
       extend: '#userDg-toolbar',
       btnCls:'topjui-btn-purple',
       tab:{
           title:'调整',
           href:'/AdminController/jsp/?url=/raw_material_register/raw_material_store_adjustment'
       }">调整</a>
    <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method:'doAjax',
       extend: '#userDg-toolbar',
       btnCls:'topjui-btn-brown',
       iconCls:'fa fa-trash',
       url:'/PurchaseStock/deleteByPurStock/',
       grid: {uncheckedMsg:'请先勾选要删除的数据',param:'stockId:stockId,orderAccount:orderAccount,stockNum:stockNum,outNum:outNum,n:n'}">删除</a>
    <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method:'search',
       extend: '#userDg-toolbar',
       btnCls:'topjui-btn-blue'">查询</a>
</div>
<!-- 表格工具栏结束 -->

<!-- 可编辑表格工具栏 -->
<%--<div id="southTab1-toolbar" data-options="grid:{--%>
           <%--type:'edatagrid',--%>
           <%--id:'southTab1'--%>
       <%--},parentGrid:{--%>
           <%--type:'datagrid',--%>
           <%--id:'userDg'--%>
       <%--}" class="topjui-toolbar">--%>
    <%--<a href="javascript:void(0)"--%>
       <%--data-toggle="topjui-menubutton"--%>
       <%--data-options="method:'edatagrid',--%>
       <%--extend: '#southTab1-toolbar',--%>
       <%--iconCls:'fa fa-plus',--%>
       <%--btnCls:'topjui-btn-green',--%>
       <%--type:'addRow'">新增</a>--%>
    <%--<a href="javascript:void(0)"--%>
       <%--data-toggle="topjui-menubutton"--%>
       <%--data-options="method:'edatagrid',--%>
       <%--extend: '#southTab1-toolbar',--%>
       <%--iconCls:'fa fa-save',--%>
       <%--btnCls:'topjui-btn-brown',--%>
       <%--type:'saveRow'">保存</a>--%>
    <%--<a href="javascript:void(0)"--%>
       <%--data-toggle="topjui-menubutton"--%>
       <%--data-options="method:'edatagrid',--%>
       <%--extend: '#southTab1-toolbar',--%>
       <%--iconCls:'fa fa-remove',--%>
       <%--btnCls:'topjui-btn-black',--%>
       <%--type:'cancelRow'">取消</a>--%>
    <%--<a href="javascript:void(0)"--%>
       <%--data-toggle="topjui-menubutton"--%>
       <%--data-options="method:'doAjax',--%>
       <%--extend: '#southTab1-toolbar',--%>
       <%--iconCls:'fa fa-remove',--%>
       <%--btnCls:'topjui-btn-blue',--%>
       <%--url:_ctx + '/json/response/delete.json'">删除</a>--%>
    <%--<a href="javascript:void(0)"--%>
       <%--data-toggle="topjui-menubutton"--%>
       <%--data-options="method:'filter',--%>
       <%--extend: '#southTab1-toolbar',--%>
       <%--btnCls:'topjui-btn-black'">过滤</a>--%>
    <%--<a href="javascript:void(0)"--%>
       <%--data-toggle="topjui-menubutton"--%>
       <%--data-options="method:'search',--%>
       <%--extend: '#southTab1-toolbar',--%>
       <%--btnCls:'topjui-btn-blue'">查询</a>--%>
<%--</div>--%>

<script>
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