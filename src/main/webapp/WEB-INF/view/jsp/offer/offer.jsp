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
    <title>纸板库存明细</title>
    <!-- 导入公共样式 -->
    <%@ include file="../ap.jsp" %>
</head>

<body>
<!-- layout布局 开始 -->

<div data-toggle="topjui-layout" data-options="fit:true">
    <div data-options="region:'center',title:'',fit:true,split:true,border:false">
        <!-- datagrid表格 -->
        <table data-toggle="topjui-datagrid"
                data-options="id:'productDg',
                        idField:'supplierId',
                        treeField:'taskType',
                        pagination:true,
                        striped:true,
                        fitColumns:true,
                        rownumbers: true,
                        url:'/Mian/baojia/',
			            childTab: [{id:'southTabs'}]">
        <thead>
        <tr>
            <th data-options="field:'supplierId',title:'UUID',checkbox:true"></th>
            <th data-options="field:'supplierName',title:'供应商名称',sortable:true"></th>
            <th data-options="field:'abbreviation',title:'供应商简称',sortable:true"></th>
            <th data-options="field:'shorthandCode',title:'速记码',sortable:true"></th>
            <th data-options="field:'supplierTel',title:'联系电话',sortable:true"></th>
            <th data-options="field:'supplierType',title:'类型',sortable:true,
                        formatter:function(value,row,index){
                            if (value == '1') {
                                return 'A类供应商';
                            } else if (value == '2') {
                                return 'B类供应商';
                            } else {
                                return '';
                            }
                        }"></th>
            <th data-options="field:'supplierAddress',title:'地址',sortable:true"></th>
            <th data-options="field:'fax',title:'传真',sortable:true"></th>
            <th data-options="field:'cust',title:'联系人',sortable:true"></th>
            <th data-options="field:'unit',title:'计量单位',sortable:true,
                   formatter:function(value,row,index){
                    if (value == '1') {
                    return '毫米';
                } else if (value == '2') {
                return '厘米';
                } else  if (value == '3'){
                return '英寸';
                }else{
                    return '未知单位';
                    }
                }"></th>
            <th data-options="field:'paymentMethod',title:'付款方式',sortable:true,
                formatter:function(value,row,index){
                    if (value == '1') {
                    return '账期';
                } else if (value == '2') {
                return '转账';
                } else  if (value == '3'){
                return '微信';
                }else{
                    return '其他支付方式';
                    }
                }

"></th>
            <th data-options="field:'name',title:'供应商材质',sortable:true"></th>
            <th data-options="field:'offer',title:'报价',sortable:true"></th>
        </tr>
        </thead>
    </table>
    </div>
</div>
<!-- layout布局 结束 -->

<!-- 表格工具栏开始 -->
<div id="productDg-toolbar" class="topjui-toolbar"
     data-options="grid:{
           type:'datagrid',
           id:'productDg'
       }">
    <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method:'filter',
       extend: '#productDg-toolbar',
       btnCls:'topjui-btn-black'">过滤</a>




    <form id="queryForm" class="search-box">
        <input type="text" name="name" data-toggle="topjui-textbox"
               data-options="id:'name',prompt:'材质名称',width:100,height:30">
        <input type="text" name="code" data-toggle="topjui-textbox"
               data-options="id:'code',prompt:'材质楞型',width:100,height:30">
        <a href="javascript:void(0)"
           data-toggle="topjui-menubutton"
           data-options="method:'query',
           iconCls:'fa fa-search',
           btnCls:'topjui-btn-blue',
           form:{id:'queryForm'},
           grid:{type:'datagrid','id':'productDg'}">查询报价</a>
    </form>
</div>
<!-- 表格工具栏结束 -->

<script>
    function saveSuccess(data) {
        console.log(data);
    }

    function deleteSuccess(data) {
        console.log(data);
    }

    function progressFormatter(value, row, index) {
        var htmlstr = '<div id="p" class="topjui-progressbar progressbar" data-options="value:' + value + '" style="width: 398px; height: 26px;">';
        htmlstr += '<div class="progressbar-text" style="width: 398px; height: 26px; line-height: 26px;">' + value + '%</div>';
        htmlstr += '<div class="progressbar-value" style="width: ' + value + '%; height: 26px; line-height: 26px;">';
        htmlstr += '<div class="progressbar-text" style="width: 398px; height: 26px; line-height: 26px;">' + value + '%</div>';
        htmlstr += '</div>';
        htmlstr += '</div>';
        return htmlstr;
    }

    function operateFormatter(value, row, index) {
        var htmlstr = '<button class="layui-btn layui-btn-xs" onclick="openEditDiag(\'' + row.uuid + '\')">编辑</button>';
        htmlstr += '<button class="layui-btn layui-btn-xs layui-btn-danger" onclick="deleteRow(\'' + row.uuid + '\')">删除</button>';
        return htmlstr;
    }

    function openEditDiag(uuid) {
        var $editDialog = $('<form></form>');
        $editDialog.iDialog({
            title: '编辑数据',
            width: 950,
            height: 500,
            closed: false,
            cache: false,
            href: _ctx + '/html/complex/dialog_edit.html?uuid=' + uuid,
            modal: true,
            buttons: [{
                text: '保存',
                iconCls: 'fa fa-save',
                btnCls: 'topjui-btn-blue',
                handler: function () {
                    // 提示信息
                    $.iMessager.alert('操作提示', '请根据具体情况编写代码，如ajax更新请求，请求失败提示，请求成功提示，请求成功后关闭窗口并刷新表格等！', 'messager-info');
                }
            }, {
                text: '关闭',
                iconCls: 'fa fa-close',
                btnCls: 'topjui-btn-red',
                handler: function () {
                    $editDialog.iDialog('close');
                }
            }],
            onLoad: function () {
                //加载表单数据
                $.getJSON(_ctx + '/json/product/detail.json?uuid=' + uuid, function (data) {
                    $editDialog.form('load', data);
                });
            }
        });
    }

    function deleteRow(uuid) {
        $.iMessager.alert('操作提示', '请根据具体情况编写代码，如ajax删除请求，请求失败提示，请求成功提示，请求成功后刷新表格等！', 'messager-info');
    }

    // 自定义方法
    function myQuery() {
        // 提示信息
        $.iMessager.alert('自定义方法', '自定义方法被执行了！', 'messager-info');

        var checkedRows = $('#productDg').iDatagrid('getChecked');
        console.log(checkedRows);

        var selectedRow = $('#productDg').iDatagrid('getSelected');
        console.log(selectedRow);

        // 提交参数查询表格数据
        $('#productDg').iDatagrid('reload', {
            name: $('#name').iTextbox('getValue'),
            code: $('#code').iTextbox('getValue')
        });
    }
</script>
</body>
</html>