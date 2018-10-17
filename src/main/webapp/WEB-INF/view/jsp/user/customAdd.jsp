<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


<input type="hidden" id="customId" name="customId">
<div class="easyui-tabs" style="height: 100%;width: 99.9%;">
    <div title="基础信息" style="padding:10px">
<table class="editTable">
    <tr>
        <td class="label">客户联系人</td>
        <td ><!-- colspan="3" -->
            <input type="text" name="customName" data-toggle="topjui-textbox" data-options="">
        </td>
         <td class="label">客户公司</td>
        <td ><!-- colspan="3" -->
            <input type="text" name="customCompary" data-toggle="topjui-textbox" data-options="">
        </td>
        
    </tr>
    <tr>
        <td class="label">电话</td>
        <td ><!-- colspan="3" -->
            <input type="text" name="customTel" data-toggle="topjui-textbox" data-options="">
        </td>
        <td class="label">用户结账类型</td>
        <td >
            <input type="text" name="customType"
                   data-toggle="topjui-combobox"
                   data-options="data:[
                       {
                           text: '额度用户',
                           value: '1'
                       },
                       {
                           text: '预付款',
                           value: '2'
                       },
                       {
                           text: '账期',
                           value: '3'
                       }
                   ],required:true">
        </td>
    </tr>
    
    <tr>
        <td class="label">用户额度</td>
        <td ><!-- colspan="3" -->
            <input type="text" name="customQuota" data-toggle="topjui-numberspinner">
        </td>
        <td class="label">用户余额</td>
        <td ><!-- colspan="3" -->
            <input type="text" name="customerBalance" data-toggle="topjui-numberspinner">
        </td>
    </tr>
    <tr>
        <td class="label">账期天数</td>
        <td ><!-- colspan="3" -->
            <input type="text" name="zday" data-toggle="topjui-numberspinner">
        </td>
        <td class="label">送货距离/公里</td>
        <td ><!-- colspan="3" -->
            <input type="text" name="deliveryDistance" data-toggle="topjui-numberspinner">
        </td>
    </tr>
    
    <tr>
        <td class="label">授信天数</td>
        <td ><!-- colspan="3" -->
            <input type="text" name="creditDay" data-toggle="topjui-numberspinner">
        </td>
        <td class="label">所属业务员</td>
        <td ><!-- colspan="3" -->
            <input type="text" name="staffId"
                   data-toggle="topjui-combogrid"
                   data-options="id:'staffName',width:200,
           onSelect: function (index,row){
                $('#staffName').val(row['staffName']);
                $('#staffId').val(row['staffId']);},
           idField: 'staffId',
           textField: 'staffName',
           fitColumns:true,
           url:'/StaffTable/dropSelect/',
           columns:[[
               {field: 'staffName',title: '姓名'}
           ]],prompt:'必填',required:true"
                   >
        </td>
    </tr>
 
    <tr>
             <td class="label">微信</td>
	        <td ><!-- colspan="3" -->
	            <input type="text" name="wechat" data-toggle="topjui-textbox">
	        </td>
	         <td class="label">qq</td>
	        <td ><!-- colspan="3" -->
	            <input type="text" name="customQq" data-toggle="topjui-textbox">
	        </td>
    </tr>
    
       <tr>
        <td class="label">地址</td>
        <td colspan="3">
            <input type="text" name="customAddress" data-toggle="topjui-textbox"   style="width:430px;">
        </td>
       
    </tr>
    <tr>
    <td class="label">付款是否含税</td>
	        <td ><!-- colspan="3" -->
	            <div data-toggle="topjui-radio">
	                <input type="radio" name="isShui" value="1" label="是" checked="checked">
	                <input type="radio" name="isShui" value="2" label="否">
	            </div>
	        </td>
    </tr>
</table>
    </div>
</div>