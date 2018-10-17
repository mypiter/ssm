<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

    <title>供应商信息登记</title>

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
<style>
    .hang {
        margin: 4px 0;
    }

    .hang span {
    }

    #zhiban {
        width: 600px;
        margin: 0 auto;
        border: 1px solid #ccc;
    }

    #zhiban th {
        font-size: 20px;
        font-family: '黑体';
        height: 30px;
    }

    #zhiban td {
        font-size: 16px;
        line-height: 20px;
        height: 30px;
    }

    #zhiban td a {
        margin-left: 30px;
    }

</style>
<body>
<div data-toggle="topjui-layout" data-options="fit:true">


    <div data-toggle="topjui-panel" title="" data-options="fit:true,iconCls:'icon-ok',footer:'#footer'">
    <form data-options="region:'west',title:'',split:true,border:false,width:'70%',iconCls:'fa fa-sitemap',headerCls:'border_right',bodyCls:'border_right'">
        <!-- treegrid表格 -->


        <fieldset>
            <legend><b>基本信息</b></legend>
        </fieldset>
        <div style=" width: 1070px; margin: 0 auto;">
            <div class="topjui-row">
                <div class="topjui-col-sm4">
                    <label class="topjui-form-label">单位名称</label>
                    <div class="topjui-input-block">
                        <input type="text" name="userName" data-toggle="topjui-textbox"
                               data-options="required:true, value:''">
                    </div>
                </div>
                <div class="topjui-col-sm4">
                    <label class="topjui-form-label">简称</label>
                    <div class="topjui-input-block">
                        <input type="text" name="userName" data-toggle="topjui-textbox"
                               data-options="required:true, value:''">
                    </div>
                </div>
                <div class="topjui-col-sm4">
                    <label class="topjui-form-label">结算单位</label>
                    <div class="topjui-input-block">
                        <input type="text" name="userName" data-toggle="topjui-textbox"
                               data-options="required:true, value:''">
                    </div>
                </div>

            </div>
            <div class="topjui-row">
                <div class="topjui-col-sm4">
                    <label class="topjui-form-label">速记码</label>
                    <div class="topjui-input-block">
                        <input type="text" name="userName" data-toggle="topjui-textbox"
                               data-options="required:true, value:''">
                    </div>
                </div>
                <div class="topjui-col-sm4">
                    <label class="topjui-form-label">联系人</label>
                    <div class="topjui-input-block">
                        <input type="text" name="userName" data-toggle="topjui-textbox"
                               data-options="required:true, value:''">
                    </div>
                </div>
                <div class="topjui-col-sm4">
                    <label class="topjui-form-label">联系电话</label>
                    <div class="topjui-input-block">
                        <input type="text" name="userName" data-toggle="topjui-textbox"
                               data-options="required:true, value:''">
                    </div>
                </div>


            </div>
            <div class="topjui-row">
                <div class="topjui-col-sm4">
                    <label class="topjui-form-label">送货单</label>
                    <div class="topjui-input-block">
                        <input type="text" name="userName" data-toggle="topjui-textbox"
                               data-options="required:true, value:''">
                    </div>
                </div>
                <div class="topjui-col-sm8">
                    <label class="topjui-form-label">地址</label>
                    <div class="topjui-input-block">
                        <input type="text" name="userName" data-toggle="topjui-textbox"
                               data-options="required:true, value:''">
                    </div>
                </div>
            </div>
            <div class="topjui-row">
                <div class="topjui-col-sm4">
                    <label class="topjui-form-label">开户行</label>
                    <div class="topjui-input-block">
                        <input type="text" name="userName" data-toggle="topjui-textbox"
                               data-options="required:true, value:''">
                    </div>
                </div>
                <div class="topjui-col-sm4">
                    <label class="topjui-form-label">电话</label>
                    <div class="topjui-input-block">
                        <input type="text" name="userName" data-toggle="topjui-textbox"
                               data-options="required:true, value:''">
                    </div>
                </div>
                <div class="topjui-col-sm4">
                    <label class="topjui-form-label">账号</label>
                    <div class="topjui-input-block">
                        <input type="text" name="userName" data-toggle="topjui-textbox"
                               data-options="required:true, value:''">
                    </div>
                </div>

            </div>
            <div class="topjui-row">
                <div class="topjui-col-sm6">
                    <label class="topjui-form-label">传真</label>
                    <div class="topjui-input-block">
                        <input type="text" name="userName" data-toggle="topjui-textbox"
                               data-options="required:true, value:''">
                    </div>
                </div>
                <div class="topjui-col-sm6">
                    <label class="topjui-form-label">纳税人识别号</label>
                    <div class="topjui-input-block">
                        <input type="text" name="userName" data-toggle="topjui-textbox"
                               data-options="required:true, value:''">
                    </div>
                </div>
            </div>
            <div class="topjui-row">
                <div class="topjui-col-sm3">
                    <label class="topjui-form-label">付款方式</label>
                    <div class="topjui-input-block">
                        <input type="text" name="degree"
                               data-toggle="topjui-combobox"
                               data-options="required:true,
                       valueField:'id',
                       textField:'text',
                       data:[{id:1,text:'账期'},{id:2,text:'现金'},{id:3,text:'转账'},{id:4,text:'微信'}]">
                    </div>
                </div>
                <span>&nbsp;最大纸板长&nbsp;</span><input type="text" name="userNameId" data-toggle="topjui-textbox"
                                                     style="width:100px;">
                <span>&nbsp;最大纸板宽&nbsp;</span><input type="text" name="userNameId" data-toggle="topjui-textbox"
                                                     style="width:100px;">
                <span>&nbsp;最小纸板长&nbsp;</span><input type="text" name="userNameId" data-toggle="topjui-textbox"
                                                     style="width:100px;">
                <span>&nbsp;最小纸板宽&nbsp;</span><input type="text" name="userNameId" data-toggle="topjui-textbox"
                                                     style="width:100px;">

            </div>
            <div class="topjui-row">
                <div class="topjui-col-sm3">
                    <label class="topjui-form-label">纸板层数</label>
                    <div class="topjui-input-block">
                        <input type="text" name="degree"
                               data-toggle="topjui-combobox"
                               data-options="required:true,
                       valueField:'id',
                       textField:'text',
                       data:[{id:1,text:'三层'},{id:2,text:'五层'},{id:3,text:'七层'}]">
                    </div>
                </div>
                <div class="topjui-col-sm5">
                    <label class="topjui-form-label">生产瓦楞</label>
                    <div class="topjui-input-block">
                        <input type="text" name="tagbox2" data-toggle="topjui-textbox"
                               data-options="required:true"/>
                    </div>
                </div>
                <div class="topjui-col-sm2">
                    <label class="topjui-form-label">供应品类</label>
                    <div class="topjui-input-block">
                        <input type="text" name="degree"
                               data-toggle="topjui-combobox"
                               data-options="required:true,
                       valueField:'id',
                       textField:'text',
                       data:[{id:1,text:'纸板'},{id:2,text:'面纸'},{id:3,text:'油漆'},{id:4,text:'其他辅料'}]">
                    </div>
                </div>
            </div>
        </div>
        <div class="topjui-row">
            <div class="topjui-col-sm10">
                <label class="topjui-form-label">备注</label>
                <div class="topjui-input-block">
                    <input type="text" name="userName" data-toggle="topjui-textbox"
                           data-options="required:true, value:''">
                </div>
            </div>
        </div>
    </form>
    </div>
</div>


    <div data-options="region:'center',iconCls:'icon-reload',title:'',split:true,border:false,bodyCls:'border_left'">
        <div data-toggle="topjui-tabs"
             data-options="id:'centerTabs',
             fit:true,
             border:false,
             parentGrid:{
                 type:'treegrid',
                 id:'orgnizationTg',
                 param:'codeSetId:codeSetId,id:id'
             }">
            <div title="供应商材质" data-options="id:'tab1',iconCls:'fa fa-th'">
                <!-- datagrid表格 -->
                <table id="configEdatagrid" data-toggle="topjui-edatagrid"
                       data-options="id:'configEdatagrid',
						   idField:'uuid',
						   reloadAfterSave:true,
						   url:'../../json/config/config_1.json',
						   saveUrl:_ctx + '/json/response/save.json',
						   updateUrl:_ctx + '/json/response/update.json',
						   destroyUrl:_ctx + '/json/response/delete.json'">
                    <thead>
                    <tr>
                        <th data-options="field:'type',title:'材质名称',sortable:true,editor:{type:'textbox',options:{required:true,height:30}}"></th>
                        <th data-options="field:'sort',title:'供应商代号',sortable:true,editor:{type:'numberspinner',options:{required:true,height:30}}"></th>
                        <th data-options="field:'name',title:'本公司代号',sortable:true,editor:{type:'textbox',options:{required:true,height:30}}"></th>
                    </tr>
                    </thead>
                </table>

            </div>
            <div title="供应商优惠" data-options="id:'tab2',iconCls:'fa fa-th'">
                <!-- datagrid表格 -->
                <table id="configEdatagrid" data-toggle="topjui-edatagrid"
                       data-options="id:'configEdatagrid',
						   idField:'uuid',
						   reloadAfterSave:true,
						   url:'../../json/config/config_1.json',
						   saveUrl:_ctx + '/json/response/save.json',
						   updateUrl:_ctx + '/json/response/update.json',
						   destroyUrl:_ctx + '/json/response/delete.json'">
                    <thead>
                    <tr>
                        <th data-options="field:'type',title:'层数',sortable:true,editor:{type:'textbox',options:{required:true,height:30}}"></th>
                        <th data-options="field:'sort',title:'优惠方式',sortable:true,editor:{type:'numberspinner',options:{required:true,height:30}}"></th>
                        <th data-options="field:'name',title:'优惠金额',sortable:true,editor:{type:'textbox',options:{required:true,height:30}}"></th>
                    </tr>
                    </thead>
                </table>
            </div>
            <div title="供应商换纸" data-options="id:'tab3',iconCls:'fa fa-th'">
                <!-- datagrid表格 -->
                <table id="configEdatagrid" data-toggle="topjui-edatagrid"
                       data-options="id:'configEdatagrid',
						   idField:'uuid',
						   reloadAfterSave:true,
						   url:'../../json/config/config_1.json',
						   saveUrl:_ctx + '/json/response/save.json',
						   updateUrl:_ctx + '/json/response/update.json',
						   destroyUrl:_ctx + '/json/response/delete.json'">
                    <thead>
                    <tr>
                        <th data-options="field:'type',title:'换纸方式',sortable:true,editor:{type:'textbox',options:{required:true,height:30}}"></th>
                        <th data-options="field:'sort',title:'加价',sortable:true,editor:{type:'numberspinner',options:{required:true,height:30}}"></th>
                    </tr>
                    </thead>
                </table>
            </div>
            <div title="供应商设备" data-options="id:'tab4',iconCls:'fa fa-th'">
                <!-- datagrid表格 -->
                <table id="configEdatagrid" data-toggle="topjui-edatagrid"
                       data-options="id:'configEdatagrid',
						   idField:'uuid',
						   reloadAfterSave:true,
						   url:'../../json/config/config_1.json',
						   saveUrl:_ctx + '/json/response/save.json',
						   updateUrl:_ctx + '/json/response/update.json',
						   destroyUrl:_ctx + '/json/response/delete.json'">
                    <thead>
                    <tr>
                        <th data-options="field:'type',title:'设备名称',sortable:true,editor:{type:'textbox',options:{required:true,height:30}}"></th>
                        <th data-options="field:'sort',title:'最大门幅',sortable:true,editor:{type:'numberspinner',options:{required:true,height:30}}"></th>
                        <th data-options="field:'name',title:'最小门幅',sortable:true,editor:{type:'textbox',options:{required:true,height:30}}"></th>
                        <th data-options="field:'name',title:'压线条数',sortable:true,editor:{type:'textbox',options:{required:true,height:30}}"></th>
                        <th data-options="field:'name',title:'最小修边',sortable:true,editor:{type:'textbox',options:{required:true,height:30}}"></th>
                        <th data-options="field:'name',title:'最大开数',sortable:true,editor:{type:'textbox',options:{required:true,height:30}}"></th>
                    </tr>
                    </thead>
                </table>
            </div>
        </div>
    </div>
</div>
<!-- 表格工具栏开始 -->
<div id="southTab1-toolbar" class="topjui-toolbar" data-options="grid:{
           type:'datagrid',
           id:'southTab1'
       }">
    <a href="javascript:void(0)" onclick="addTr()">新增</a>
    <a href="javascript:void(0)" data-toggle="topjui-menubutton" data-options="method: 'openDialog',
            extend: '#southTab1-toolbar',
            iconCls: 'fa fa-pencil',
            btnCls: 'topjui-btn-green',
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
                        btnCls: 'topjui-btn-green'
                    }
                ]
            }">编辑</a>
    <a href="javascript:void(0)" data-toggle="topjui-menubutton" data-options="method:'doAjax',
       extend: '#southTab1-toolbar',
       btnCls:'topjui-btn-brown',
       iconCls:'fa fa-trash',
       url:_ctx + '/json/response/success.json',
       grid: {uncheckedMsg:'请先勾选要删除的数据',param:'uuid:uuid,code:code'}">删除</a>
    <a href="javascript:void(0)" data-toggle="topjui-menubutton" data-options="method:'filter',
       extend: '#southTab1-toolbar',
       btnCls:'topjui-btn-black'">过滤</a>
    <a href="javascript:void(0)" data-toggle="topjui-menubutton" data-options="method:'search',
       extend: '#southTab1-toolbar',
       btnCls:'topjui-btn-blue'">查询</a>
    <a href="javascript:void(0)" data-toggle="topjui-menubutton" data-options="method:'export',
       extend: '#southTab1-toolbar',
       btnCls:'topjui-btn-green',
       url:_ctx + '/json/response/export.html'">导出</a>
</div>
<!-- 表格工具栏结束 -->
</body>


</html>