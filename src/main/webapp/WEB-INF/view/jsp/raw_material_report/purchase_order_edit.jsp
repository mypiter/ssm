<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<input type="hidden" id="purchaseId" name="purchaseId">
<table class="editTable">
    <tr>
        <td class="label">采购单号</td>
        <td>
            <input type="text" name="purchaseAccount" data-toggle="topjui-textbox" data-options="required:true,disabled:true">
        </td>
        <td class="label">订单号</td>
        <td>
            <input type="text" name="orderAccount" data-toggle="topjui-textbox" data-options="required:true,disabled:true">
        </td>
    </tr>
    <tr>
        <td class="label">客户名称</td>
        <td><input type="text" name="customName" data-toggle="topjui-textbox" data-options="required:true,disabled:true"></td><!-- data-options="precision:3" 小数点 -->
        <td class="label">产品名称</td>
        <td >
            <input type="text" name="cartonName" data-toggle="topjui-textbox" data-options="required:true,disabled:true">
        </td>
    </tr>
    <tr>
        <td class="label">供应商名称</td>
        <td><input type="text" name="supplierName" data-toggle="topjui-textbox" data-options="required:true,disabled:true"></td><!-- data-options="precision:3" 小数点 -->
        <td class="label">单价</td>
        <td >
            <input type="text" name="singlePrice" data-toggle="topjui-textbox" data-options="required:true,disabled:true">
        </td>
    </tr>
    <tr>
        <td class="label">到料数</td>
        <td><input type="text" name="endNum" data-toggle="topjui-textbox" data-options="required:true,readonly:true"></td><!-- data-options="precision:3" 小数点 -->
        <td class="label">采购数量</td>
        <td><input type="text" name="num" data-toggle="topjui-numberspinner" data-options="required:true"></td><!-- data-options="precision:3" 小数点 -->
    </tr>
    <tr>
        <td class="label">采购日期</td>
        <td><input type="text" name="time" data-toggle="topjui-datebox" data-options="required:true"></td><!-- data-options="precision:3" 小数点 -->
        <td class="label">到货日期</td>
        <td><input type="text" name="arrivalTime" data-toggle="topjui-datebox" data-options=""></td><!-- data-options="precision:3" 小数点 -->
    </tr>
    <tr>
        <td class="label">采购单格式</td>
        <td>
            <input id="caigouName" name="caigouName" type="text" data-toggle="topjui-combobox"
                   data-options="id:'user',
                                  textField: 'name',
                                  valueField:'name',
                                  url:'/Dively/getList/?biao=1',
                                   prompt:'必填',required:true,
                                    onSelect:function(res){
                                        $('#caigouUrl').val(res['url']);
                                    }">
            <input type="hidden" id="caigouUrl" name="caigouUrl">
        </td><!-- data-options="precision:3" 小数点 -->
        <td class="label">采购单抬头</td>
        <td><input name="taiId" type="text" data-toggle="topjui-combobox"
                   data-options="id:'user',required:true,
                                    panelWidth:200,
                                  textField: 'companyName',
                                  valueField:'id',
                                  url:'/CompanyInformation/getList/',
                                onSelect:function(res){
                                    $('#consignee').iTextbox('setValue',res['contacts']);
                                    $('#consigneeAdress').iTextbox('setValue',res['companyAddress']);
                                    $('#consigneeTel').iTextbox('setValue',res['contactsTel']);
                                    $('#taiName').val(res['companyName']);
                                }">
            <input type="hidden" id="taiName" name="taiName">
        </td><!-- data-options="precision:3" 小数点 -->
    </tr>
    <tr>
        <td class="label">收货人</td>
        <td><input type="text" id="consignee" name="consignee" data-toggle="topjui-textbox" data-options=""></td><!-- data-options="precision:3" 小数点 -->
        <td class="label">收货人联系电话</td>
        <td><input type="text" id="consigneeTel" name="consigneeTel" data-toggle="topjui-textbox" data-options=""></td><!-- data-options="precision:3" 小数点 -->
    </tr>
    <tr>
        <td class="label">收货地址</td>
        <td colspan="3"><input type="text" id="consigneeAdress" name="consigneeAdress" data-toggle="topjui-textbox" data-options=""></td><!-- data-options="precision:3" 小数点 -->
    </tr>
    <tr>
        <td class="label">订单要求</td>
        <td colspan="3"><input type="text" name="orderRequirement" data-toggle="topjui-textbox" data-options=""></td>
    </tr>
    <tr>
        <td class="label">采购备注</td>
        <td colspan="3"><input type="text" name="purRequirement" data-toggle="topjui-textbox" data-options=""></td>
    </tr>
    <tr>
        <td class="label">采购人</td>
        <td colspan="3"><input type="text" name="purchaseName" data-toggle="topjui-textbox" data-options=""></td>
    </tr>


</table>
