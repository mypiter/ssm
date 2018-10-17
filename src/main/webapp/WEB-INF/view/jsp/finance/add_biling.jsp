<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<input type="hidden" id="uuid" name="uuid">
<table class="editTable">
    <tr>
        <td class="label">订单号</td>
        <td>
            <input type="text" name="schedule" data-toggle="topjui-textbox" data-options="required:true">
        </td>
        <td class="label">发票编号</td>
        <td>
            <input type="text" name="order_account" data-toggle="topjui-textbox" data-options="required:true">
        </td>
    </tr>
    <tr>
    	<td class="label">客户名称</td>
        <td>
            <input type="text" name="company_name" data-toggle="topjui-textbox" data-options="required:true">
        </td>
        <td class="label">开票名称</td>
        <td>
            <input type="text" name="model_name" data-toggle="topjui-textbox" data-options="required:true">
        </td>
    </tr>
    <tr>
        <td class="label">开票金额</td>
        <td>
            <input type="text" name="carton_spec" data-toggle="topjui-textbox" data-options="required:true">
        </td>
        <td class="label">产品名称</td>
        <td><input type="text" name="num" data-toggle="topjui-numberspinner" data-options="required:true"></td><!-- data-options="precision:3" 小数点 -->
    </tr>
    <tr>
        <td class="label">单价</td>
        <td><input type="text" name="price" data-toggle="topjui-numberspinner" data-options="required:true,precision:2"></td><!-- data-options="precision:3" 小数点 -->
        
    	<td class="label">数量</td>
        <td><input type="text" name="total" data-toggle="topjui-numberspinner" data-options="precision:2"></td><!-- data-options="precision:3" 小数点 -->
    </tr>
    <tr>
        <td class="label">开票时间</td>
        <td>
            <input type="text" name="time" data-toggle="topjui-datebox" data-options="required:true">
        </td>
        <td class="label">总价</td>
        <td >
            <input type="text" name=user_name data-toggle="topjui-textbox" data-options="required:true">
        </td>
    </tr>
   <tr>
        <td class="label">交易类型</td>
        <td >
           <input type="text" name=user_name data-toggle="topjui-textbox" data-options="required:true">
        </td>
    </tr>
</table>
