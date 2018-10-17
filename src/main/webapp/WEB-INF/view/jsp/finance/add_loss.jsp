<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<input type="hidden" id="uuid" name="uuid">
<table class="editTable">
    <tr>
        <td class="label">支出名称</td>
        <td>
            <input type="text" name="schedule" data-toggle="topjui-textbox" data-options="required:true">
        </td>
        <td class="label">支出类型</td>
        <td>
            <input type="text" name="order_account" data-toggle="topjui-textbox" data-options="required:true">
        </td>
    </tr>
    <tr>
    	<td class="label">支出金额</td>
        <td>
            <input type="text" name="company_name" data-toggle="topjui-textbox" data-options="required:true">
        </td>
         <td class="label">支出时间</td>
        <td>
            <input type="text" name="time" data-toggle="topjui-datebox" data-options="required:true">
        </td>
    </tr>
    <tr>
        <td class="label">损耗人</td>
        <td >
            <input type="text" name=user_name data-toggle="topjui-textbox" data-options="required:true">
        </td>
        <td class="label"></td>
        <td>
            
        </td>
    </tr>
</table>
