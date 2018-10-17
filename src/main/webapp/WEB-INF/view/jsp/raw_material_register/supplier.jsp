<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
<body>
<!-- layout布局 开始 -->
<div data-toggle="topjui-layout" data-options="fit:true">
    <div data-options="region:'center',title:'',fit:false,split:true,border:false,bodyCls:'border_right_bottom'"
         style="height:30%">
        <!-- datagrid表格 -->
        <table data-toggle="topjui-datagrid"
               data-options="id:'userDg',
                        idField:'supplierId',
                        treeField:'taskType',
                        pagination:true,
                        striped:true,
                        fitColumns:false,
                        rownumbers: true,
                        url:'/CartonSupplier/select/',
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
                            } else if (value == '3') {
                                return '混合类供应商';
                            } else {
                                return '类型异常';
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
            </tr>
            </thead>
        </table>
    </div>


    <div data-options="region:'south',fit:false,split:true,border:false"
         style="height:70%">
        <div data-toggle="topjui-tabs"
             data-options="id:'southTabs',
             fit:true,
             border:false,
             parentGrid:{
                 type:'datagrid',
                 id:'userDg',
                 param:'puuid:supplierId,type:supplierType'
             }">

            <div id="blei" title="B类供应商材质" data-options="id:'tab5',iconCls:'fa fa-th'">
                <!-- datagrid表格 -->
                <table data-toggle="topjui-edatagrid"
                       data-options="id:'southTab5',
                       initCreate: false,
                       fitColumns:false,
                       url:'/SupplierMaterialB/findById/',
                       saveUrl:'/SupplierMaterialB/addSupplierB/?puuid={parent.supplierId}&type={parent.supplierType}',
                       updateUrl:'/SupplierMaterialB/updataSupplier/',
                       destroyUrl:'/SupplierMaterialB/deleteSupplier/',
                       onEdit:onEdit">
                    <thead>
                    <tr>
                        <th data-options="field:'id',title:'UUID',checkbox:true"></th>
                        <th data-options="field:'supllierId',title:'供应商id'"></th>
                        <th data-options="field:'materialTexture',title:'纸质名称',sortable:true,editor:{type:'textbox',options:{required:true,height:30}}"></th>
                        <th data-options="field:'squarePrice',title:'平方价',sortable:true,editor:{type:'numberbox',options:{required:true,height:30,precision:2}}"></th>
                        <th data-options="field:'materialCode',title:'材料代号',sortable:true,editor:{type:'textbox',options:{required:true,height:30}}"></th>
                        <th data-options="field:'myCode',title:'本公司代号',sortable:true,editor:{type:'combobox',options:{required:true,height:30,required:true,height:30,url:'/PaperSet/select/', textField: 'paperName',
								                  valueField:'paperCode'}}"></th>
                        <th data-options="field:'specialOffer',title:'特价',sortable:true,editor:{type:'numberbox',options:{required:true,height:30,precision:2}}"></th>
                        <th data-options="field:'fluteType',title:'楞型',sortable:true,editor:{type:'combobox',options:{required:true,height:30,data:[{value:'B',text:'B'},{value:'C',text:'C'},{value:'E',text:'E'},{value:'BC',text:'BC'},{value:'BE',text:'BE'},{value:'CE',text:'CE'},{value:0,text:'无'}]}}"></th>
                    </tr>
                    </thead>
                </table>
            </div>
            <div id="alei" title="A类供应商材质" data-options="id:'tab1',iconCls:'fa fa-th'">
                <!-- datagrid表格 -->
                <table data-toggle="topjui-edatagrid"
                       data-options="id:'southTab1',
                       initCreate: false,
                       fitColumns:false,
                        url:'/SupplierMaterialA/findById/',
                       saveUrl:'/SupplierMaterialA/addSupplierA/?puuid={parent.supplierId}&type={parent.supplierType}',
                       updateUrl:'/SupplierMaterialA/updataSupplier/',
                       destroyUrl:'/SupplierMaterialA/deleteSupplier/',
                       onAfterEdit:function(row,index,changes){
                              //var dg = $('#southTab1');
                             // console.info(dg);
                             //  var ed = dg.iDatagrid('getEditor', {index:row,field:'myCode'});
                              // console.info(ed);
                               //console.info(date);

      },
               onEdit:onEdit
">
                    <thead>
                    <tr>
                        <th data-options="field:'id',title:'UUID',checkbox:true"></th>
                        <th data-options="field:'supplierId',title:'供应商id'"></th>
                        <th data-options="field:'materialTexture',title:'层数',sortable:true,editor:{type:'combobox',options:{required:true,height:30,data:[{value:2,text:'两层'},{value:3,text:'三层'},{value:4,text:'四层'},{value:5,text:'五层'},{value:6,text:'六层'},{value:7,text:'七层'},{value:8,text:'八层'},{value:9,text:'九层'}]}}"></th>
                        <th data-options="field:'materialCode',title:'纸板基价代号',sortable:true,editor:{type:'textbox',options:{required:true,height:30}}"></th>
                        <th data-options="field:'myCode',title:'本公司代号',sortable:true"></th>
                        <th data-options="field:'specialPrice',title:'单价',sortable:true,editor:{type:'numberbox',options:{required:true,height:30,precision:2}}"></th>
                        <th data-options="field:'fluteType',title:'楞型',sortable:true,editor:{type:'combobox',options:{required:false,height:30,data:[{value:'B',text:'B'},{value:'C',text:'C'},{value:'E',text:'E'},{value:'BC',text:'BC'},{value:'BE',text:'BE'},{value:'CE',text:'CE'}]}}"></th>
                    </tr>
                    </thead>
                </table>
            </div>
            <div title="A类供应商纸张" data-options="id:'tab6',iconCls:'fa fa-th'">
                <!-- datagrid表格 -->
                <table data-toggle="topjui-edatagrid"
                       data-options="id:'southTab6',
                       initCreate: false,
                       fitColumns:false,
                       url:'/PaperA/findById/',
                       saveUrl:'/PaperA/addPaperA/?puuid={parent.supplierId}&type={parent.supplierType}',
                       updateUrl:'/PaperA/updataPaperA/',
                       destroyUrl:'/PaperA/deletePaperA/',
                       onEdit:onEdit">
                    <thead>
                    <tr>
                        <th data-options="field:'id',title:'UUID',checkbox:true"></th>
                        <th data-options="field:'supllierId',title:'供应商id'"></th>
                        <th data-options="field:'texture',title:'纸张代号',sortable:true,editor:{type:'textbox',options:{required:true,height:30}}"></th>
                        <th data-options="field:'myTexture',title:'本公司代号',sortable:true,editor:{type:'combobox',options:{required:true,height:30,url:'/PaperSet/select/', textField: 'paperName',valueField:'paperCode'}}"></th>
                        <th data-options="field:'weight',title:'克重',sortable:true,editor:{type:'numberbox',options:{required:true,height:30}}"></th>
                        <th data-options="field:'paperType',title:'纸张类型',sortable:true,editor:{type:'combobox',options:{required:true,height:30,data:[{value:'箱板纸',text:'箱板纸'},{value:'瓦纸',text:'瓦纸'},{value:'芯纸',text:'芯纸'},{value:'牛卡',text:'牛卡'},{value:'白卡',text:'白卡'},{value:'高瓦',text:'高瓦'}]}}"></th>
                    </tr>
                    </thead>
                </table>
            </div>
            <div title="A类供应商换纸" data-options="id:'tab3',iconCls:'fa fa-th'">
                <!-- datagrid表格 -->
                <table data-toggle="topjui-edatagrid"
                       data-options="id:'southTab3',
                       initCreate: false,
                       fitColumns:false,
                       url:'/PaperChange/findById/',
                       saveUrl:'/PaperChange/addPaper/?puuid={parent.supplierId}&type={parent.supplierType}',
                       updateUrl:'/PaperChange/updataPaper/',
                       destroyUrl:'/PaperChange/deletePaper/',
                       onEdit:onEdit">
                    <thead>
                    <tr>
                        <th data-options="field:'paperChangeId',title:'UUID',checkbox:true"></th>
                        <th data-options="field:'supplierId',title:'供应商id'"></th>
                        <th data-options="field:'paperChangeS',title:'原纸',sortable:true,editor:{type:'textbox',options:{required:true,height:30}}"></th>
                        <th data-options="field:'paperChangeE',title:'替换',sortable:true,editor:{type:'textbox',options:{required:true,height:30}}"></th>
                        <th data-options="field:'paperChangePrice',title:'单张平方价',sortable:true,editor:{type:'numberbox',options:{required:true,height:30,precision:2}}"></th>
                    </tr>
                    </thead>
                </table>
            </div>
            <div title="供应商优惠" data-options="id:'tab2',iconCls:'fa fa-th'">
                <!-- datagrid表格 -->
                <table data-toggle="topjui-edatagrid"
                       data-options="id:'southTab2',
                       initCreate: false,
                       fitColumns:false,
                       url:'/Youhui/findById/',
                       saveUrl:'/Youhui/addYouhui/?puuid={parent.supplierId}',
                       updateUrl:'/Youhui/updataYouhui/',
                       destroyUrl:'/Youhui/deleteYouhui/',
                       onEdit:onEdit">
                    <thead>
                    <tr>
                        <th data-options="field:'id',title:'UUID',checkbox:true"></th>
                        <th data-options="field:'supplierId',title:'供应商id'"></th>
                        <th data-options="field:'youName',title:'优惠名称',sortable:true,editor:{type:'textbox',options:{required:true,width:150,height:30}}"></th>
                        <th data-options="field:'layers',title:'层数',sortable:true,editor:{type:'combobox',options:{required:false,width:80,height:30,data:[{value:2,text:'二层'},{value:3,text:'三层'},{value:4,text:'四层'},{value:5,text:'五层'},{value:6,text:'六层'},{value:7,text:'七层'}]}}"></th>
                        <th data-options="field:'form',title:'优惠形式',sortable:true,editor:{type:'combobox',options:{required:true,height:30,data:[{value:'>',text:'大于'},{value:'<',text:'小于'}]}}"></th>
                        <th data-options="field:'squareNumber',title:'平方数',sortable:true,editor:{type:'textbox',options:{required:true,height:30}}"></th>
                        <th data-options="field:'discount',title:'优惠金额',sortable:true,editor:{type:'numberbox',options:{required:true,height:30,precision:2}}"></th>
                    </tr>
                    </thead>
                </table>
            </div>
            <div title="供应商设备" data-options="id:'tab4',iconCls:'fa fa-th'">
                <!-- datagrid表格 -->
                <table data-toggle="topjui-edatagrid"
                       data-options="id:'southTab4',
                       initCreate: false,
                       fitColumns:false,
                       url:'/SupplierEquipment/findById/',
                       saveUrl:'/SupplierEquipment/addEquipment/?puuid={parent.supplierId}',
                       updateUrl:'/SupplierEquipment/updataEquipment/',
                       destroyUrl:'/SupplierEquipment/deleteEquipment/',
                       onEdit:onEdit">
                    <thead>
                    <tr>
                        <th data-options="field:'id',title:'UUID',checkbox:true"></th>
                        <th data-options="field:'supplierId',title:'供应商id'"></th>
                        <th data-options="field:'deviceName',title:'设备名称',sortable:true,editor:{type:'textbox',options:{required:true,height:30}}"></th>
                        <th data-options="field:'maxMen',title:'最大门幅',sortable:true,editor:{type:'textbox',options:{required:true,height:30}}"></th>
                        <th data-options="field:'minMen',title:'最小门幅',sortable:true,editor:{type:'textbox',options:{required:true,height:30}}"></th>
                        <th data-options="field:'numberOfStripe',title:'压线条数',sortable:true,editor:{type:'textbox',options:{required:true,height:30}}"></th>
                        <th data-options="field:'minBian',title:'最小修边',sortable:true,editor:{type:'textbox',options:{required:true,height:30}}"></th>
                        <th data-options="field:'maxKai',title:'最大开数',sortable:true,editor:{type:'textbox',options:{required:true,height:30}}"></th>
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
       data-options="method:'openDialog',
       extend: '#userDg-toolbar',
       iconCls: 'fa fa-plus',
       dialog:{
           width: 1100,
           height: 600,
           id:'userAddDialog',
           href:'/AdminController/jsp/?url=/raw_material_register/add_supplier',
           buttonsGroup:[
               {text:'保存',url:'/CartonSupplier/addSupplier/',iconCls:'fa fa-plus',handler:'ajaxForm',btnCls:'topjui-btn-brown'}
           ]
       }">新增供应商</a>
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
                width: 1150,
                height: 500,
                href:'/AdminController/jsp/?url=/raw_material_register/add_supplier&uuid={supplierId}',
                url:'/CartonSupplier/findeById/?uuid={supplierId}',
                buttonsGroup: [
                    {
                        text: '更新',
                        url:'/CartonSupplier/updataSupplier/',
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
       url:'/CartonSupplier/deleteSupplier/',
       grid: {uncheckedMsg:'请先勾选要删除的数据',param:'uuid:supplierId'}">删除</a>
    <!--<a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method:'filter',
       extend: '#userDg-toolbar',
       btnCls:'topjui-btn-black'">过滤</a>

    <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method:'search',
       extend: '#userDg-toolbar',
       btnCls:'topjui-btn-blue'">查询</a>
      <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="menu:'#exportSubMenu',
       btnCls:'topjui-btn-blue',
       hasDownArrow:true,
       iconCls:'fa fa-list'">更多</a>-->
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
       url:_ctx + '/SupplierMaterialA/deleteSupplier/',
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
<!--优惠-->
<div id="southTab2-toolbar" data-options="grid:{
           type:'edatagrid',
           id:'southTab2'
       },parentGrid:{
           type:'datagrid',
           id:'userDg'
       }" class="topjui-toolbar">
    <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method:'edatagrid',
       extend: '#southTab2-toolbar',
       iconCls:'fa fa-plus',
       btnCls:'topjui-btn-green',
       type:'addRow'">新增</a>
    <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method:'edatagrid',
       extend: '#southTab2-toolbar',
       iconCls:'fa fa-save',
       btnCls:'topjui-btn-brown',
       type:'saveRow'">保存</a>
    <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method:'edatagrid',
       extend: '#southTab2-toolbar',
       iconCls:'fa fa-remove',
       btnCls:'topjui-btn-black',
       type:'cancelRow'">取消</a>
    <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method:'doAjax',
       extend: '#southTab2-toolbar',
       iconCls:'fa fa-remove',
       btnCls:'topjui-btn-blue',
       url:'/Youhui/deleteYouhui/',
       grid: {uncheckedMsg:'请先勾选要删除的数据',param:'id:id'}
">删除</a>
    <!--<a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method:'filter',
       extend: '#southTab2-toolbar',
       btnCls:'topjui-btn-black'">过滤</a>
    <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method:'search',
       extend: '#southTab2-toolbar',
       btnCls:'topjui-btn-blue'">查询</a>-->
</div>
<!--换纸-->
<div id="southTab3-toolbar" data-options="grid:{
           type:'edatagrid',
           id:'southTab3'
       },parentGrid:{
           type:'datagrid',
           id:'userDg'
       }" class="topjui-toolbar">
    <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method:'edatagrid',
       extend: '#southTab3-toolbar',
       iconCls:'fa fa-plus',
       btnCls:'topjui-btn-green',
       type:'addRow'">新增</a>
    <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method:'edatagrid',
       extend: '#southTab3-toolbar',
       iconCls:'fa fa-save',
       btnCls:'topjui-btn-brown',
       type:'saveRow'">保存</a>
    <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method:'edatagrid',
       extend: '#southTab3-toolbar',
       iconCls:'fa fa-remove',
       btnCls:'topjui-btn-black',
       type:'cancelRow'">取消</a>
    <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method:'doAjax',
       extend: '#southTab3-toolbar',
       iconCls:'fa fa-remove',
       btnCls:'topjui-btn-blue',
       url:'/PaperChange/deletePaper/',
       grid: {uncheckedMsg:'请先勾选要删除的数据',param:'id:paperChangeId'}
      ">删除</a>
    <!--<a href="javascript:void(0)"
      data-toggle="topjui-menubutton"
      data-options="method:'filter',
      extend: '#southTab3-toolbar',
      btnCls:'topjui-btn-black'">过滤</a>
   <a href="javascript:void(0)"
      data-toggle="topjui-menubutton"
      data-options="method:'search',
      extend: '#southTab1-toolbar',
      btnCls:'topjui-btn-blue'">查询</a>-->
</div>

<!--设备-->
<div id="southTab4-toolbar" data-options="grid:{
           type:'edatagrid',
           id:'southTab4'
       },parentGrid:{
           type:'datagrid',
           id:'userDg'
       }" class="topjui-toolbar">
    <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method:'edatagrid',
       extend: '#southTab4-toolbar',
       iconCls:'fa fa-plus',
       btnCls:'topjui-btn-green',
       type:'addRow'">新增</a>
    <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method:'edatagrid',
       extend: '#southTab4-toolbar',
       iconCls:'fa fa-save',
       btnCls:'topjui-btn-brown',
       type:'saveRow'">保存</a>
    <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method:'edatagrid',
       extend: '#southTab4-toolbar',
       iconCls:'fa fa-remove',
       btnCls:'topjui-btn-black',
       type:'cancelRow'">取消</a>
    <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method:'doAjax',
       extend: '#southTab4-toolbar',
       iconCls:'fa fa-remove',
       btnCls:'topjui-btn-blue',
       url:'/SupplierEquipment/deleteEquipment/',
       grid: {uncheckedMsg:'请先勾选要删除的数据',param:'id:id'}
     ">删除</a>
    <!--<a href="javascript:void(0)"
      data-toggle="topjui-menubutton"
      data-options="method:'filter',
      extend: '#southTab4-toolbar',
      btnCls:'topjui-btn-black'">过滤</a>
   <a href="javascript:void(0)"
      data-toggle="topjui-menubutton"
      data-options="method:'search',
      extend: '#southTab4-toolbar',
      btnCls:'topjui-btn-blue'">查询</a>-->
</div>
<!--A类纸张-->
<div id="southTab6-toolbar" data-options="grid:{
           type:'edatagrid',
           id:'southTab6'
       },parentGrid:{
           type:'datagrid',
           id:'userDg'
       }" class="topjui-toolbar">
    <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method:'edatagrid',
       extend: '#southTab6-toolbar',
       iconCls:'fa fa-plus',
       btnCls:'topjui-btn-green',
       type:'addRow'">新增</a>
    <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method:'edatagrid',
       extend: '#southTab6-toolbar',
       iconCls:'fa fa-save',
       btnCls:'topjui-btn-brown',
       type:'saveRow'">保存</a>
    <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method:'edatagrid',
       extend: '#southTab6-toolbar',
       iconCls:'fa fa-remove',
       btnCls:'topjui-btn-black',
       type:'cancelRow'">取消</a>
    <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method:'doAjax',
       extend: '#southTab6-toolbar',
       iconCls:'fa fa-remove',
       btnCls:'topjui-btn-blue',
       url:'/PaperA/deletePaperA/',
       grid: {uncheckedMsg:'请先勾选要删除的数据',param:'id:id'}">删除</a>
    <!--<a href="javascript:void(0)"
      data-toggle="topjui-menubutton"
      data-options="method:'filter',
      extend: '#southTab6-toolbar',
      btnCls:'topjui-btn-black'">过滤</a>
   <a href="javascript:void(0)"
      data-toggle="topjui-menubutton"
      data-options="method:'search',
      extend: '#southTab6-toolbar',
      btnCls:'topjui-btn-blue'">查询</a>-->
</div>
<!--Blei-->
<div id="southTab5-toolbar" data-options="grid:{
           type:'edatagrid',
           id:'southTab5'
       },parentGrid:{
           type:'datagrid',
           id:'userDg'
       }" class="topjui-toolbar">
    <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method:'edatagrid',
       extend: '#southTab5-toolbar',
       iconCls:'fa fa-plus',
       btnCls:'topjui-btn-green',
       type:'addRow'">新增</a>
    <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method:'edatagrid',
       extend: '#southTab5-toolbar',
       iconCls:'fa fa-save',
       btnCls:'topjui-btn-brown',
       type:'saveRow'">保存</a>
    <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method:'edatagrid',
       extend: '#southTab5-toolbar',
       iconCls:'fa fa-remove',
       btnCls:'topjui-btn-black',
       type:'cancelRow'">取消</a>
    <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method:'doAjax',
       extend: '#southTab5-toolbar',
       iconCls:'fa fa-remove',
       btnCls:'topjui-btn-blue',
       url: '/SupplierMaterialB/deleteSupplier/',
      grid: {uncheckedMsg:'请先勾选要删除的数据',param:'id:id'}">删除</a>
    <!--<a href="javascript:void(0)"
      data-toggle="topjui-menubutton"
      data-options="method:'filter',
      extend: '#southTab5-toolbar',
      btnCls:'topjui-btn-black'">过滤</a>
   <a href="javascript:void(0)"
      data-toggle="topjui-menubutton"
      data-options="method:'search',
      extend: '#southTab5-toolbar',
      btnCls:'topjui-btn-blue'">查询</a>-->
</div>
<script>
/*
  function dd(value, row, index) {
        //console.info(row.supplierId+"=="+row.materialCode)
        $.ajax({
            url:"/PaperA/findMyCodeByCode/",
            data: {supllierId:row.supplierId,str:row.materialCode},
            success:function (date) {
                value =date;
                var ed = $(this).iEdatagrid('getEditor', {index:index,field:row.materialCode});
                console.info(ed);
            }
        });
        return value;
    }
    */
   $(function(){
       //var rows = $('#dg').datagrid('getChanges');
       //alert(rows.length+' rows are changed!');
       /*
         var sid = $("#southTab1").iDatagrid('getEditor', {index:0,field:'supplierId'});
         var s =$(sid.target).iTextbox('getValue');
         console.info(s);
         var cod = $("#southTab1").iDatagrid('getEditor', {index:0,field:'materialCode'});
         var c =$(cod.target).iTextbox('getValue');
         console.info(s);
         $.ajax({
             url:"/PaperA/findMyCodeByCode/",
             data: {supllierId:s,str:c},
             success:function (date) {
                 var mc = $("#southTab1").iDatagrid('getEditor', {index:0,field:'myCode'});
                 $(mc.target).iTextbox('setValue',date)
             }
         });
          */
   });
/***************************************************************************************************************/








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