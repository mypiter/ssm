<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
 <!-- 导入列表页面公共样式 -->
    <%@ include file="../ap.jsp" %>
    <!-- 生成出库计划面板 -->
<div>
	<table class="editTable">
    <tr>
        <td class="label">出库数量</td>
        <td>
            <input type="text" name="num" data-toggle="topjui-numberspinner" data-options="required:true">
        </td>
        <td class="label">出库时间</td>
        <td>
            <input type="text" name="time" data-toggle="topjui-datebox" data-options="required:true">
        </td>
    </tr>
    <tr>
    	<td class="label">配送方式</td>
        <td>
            <input type="text" name="making_spec"
                   data-toggle="topjui-combobox"
                   data-options="required:true,data:[
                       {
                           text: '送货上门',
                           value: '送货上门'
                       },
                       {
                           text: '亲自提货',
                           value: '亲自提货'
                       },
                       {
                           text: '快递',
                           value: '快递'
                       }
                   ]">
            <!-- <input type="text" name="spec"
                   data-toggle="topjui-combobox"
                   data-options="required:true,panelWidth:200,valueField:'code',
                   url:_ctx + '/json/dictionary/models.json'"> -->
        </td>
    </tr>
</table>
<!-- <div style="position: fixed;right: 0px; bottom: 0px;">
    <button class='layui-btn layui-btn-xs' onclick="aa()">确定</button>&nbsp;&nbsp;&nbsp;&nbsp;<button class='layui-btn layui-btn-xs layui-btn-warm' onclick="aa()">取消</button>&nbsp;&nbsp;&nbsp;&nbsp;
</div> -->
</div>

