<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<input type="hidden" id="uuid" name="uuid">
<table class="editTable">
    <tr>
        <td class="label">订单号</td>
        <td>
            <input type="text" name="order_account"
            		disabled="disabled"
                   data-toggle="topjui-combobox"
                   data-options="required:true,panelHeight:110,valueField:'code',
                   url:_ctx + '/json/dictionary/models.json'"><!-- panelWidth:200, -->
                   <!-- <input type="text" onchange="demo()"> -->
        </td>
        <td class="label">出库数量</td>
        <td>
            <input type="text" name="corporate_name" data-toggle="topjui-textbox" data-options="required:true">
        </td>
        <td class="label">备注</td>
        <td>
            <input type="text" name="description" data-toggle="topjui-textbox">
        </td>
    </tr>
    <tr>
    	<td class="label">订单号</td>
        <td>
            <input type="text" name="order_account"
            		disabled="disabled"
                   data-toggle="topjui-combobox"
                   data-options="required:true,panelHeight:110,valueField:'code',
                   url:_ctx + '/json/dictionary/models.json'"><!-- panelWidth:200, -->
                   <!-- <input type="text" onchange="demo()"> -->
        </td>
        <td class="label">出库数量</td>
        <td>
            <input type="text" name="corporate_name" data-toggle="topjui-textbox" data-options="required:true">
        </td>
        <td class="label">备注</td>
        <td>
            <input type="text" name="description" data-toggle="topjui-textbox">
        </td>
    </tr>
</table>

