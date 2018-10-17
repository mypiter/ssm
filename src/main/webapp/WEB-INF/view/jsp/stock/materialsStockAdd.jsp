<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<input type="hidden" id="uuid" name="uuid">
<table class="editTable">
    <tr>
    	<td class="label">供应商</td>
        <td>
            <input type="text" name="storge_name"
                   data-toggle="topjui-combobox"
                   data-options="data:[
                       {
                           text: 'A供应商',
                           value: 'A库'
                       },
                       {
                           text: 'B供应商',
                           value: 'B库'
                       },
                       {
                           text: 'C供应商',
                           value: 'C库'
                       }
                   ],panelHeight:100">
            <!-- <input type="text" name="spec"
                   data-toggle="topjui-combobox"
                   data-options="required:true,panelWidth:200,valueField:'code',
                   url:_ctx + '/json/dictionary/models.json'"> -->
        </td>
        <td class="label">物材名称</td>
        <td>
            <input type="text" name="making_name" data-toggle="topjui-textbox" data-options="required:true">
        </td>
    </tr>
    <tr>
        <td class="label">规格</td>
        <td>
            <input type="text" name="making_spec"
                   data-toggle="topjui-combobox"
                   data-options="required:true,data:[
                       {
                           text: 'A级',
                           value: 'A级'
                       },
                       {
                           text: 'B级',
                           value: 'B级'
                       },
                       {
                           text: 'C级',
                           value: 'C级'
                       }
                   ],panelHeight:100">
            <!-- <input type="text" name="spec"
                   data-toggle="topjui-combobox"
                   data-options="required:true,panelWidth:200,valueField:'code',
                   url:_ctx + '/json/dictionary/models.json'"> -->
        </td>
    	<td class="label">入库数量</td>
        <td><input type="text" name="num" data-toggle="topjui-numberspinner" data-options="required:true"></td><!-- data-options="precision:3" 小数点 -->
    </tr>
    <tr>
    	<td class="label">单价</td>
        <td><input type="text" name="price" data-toggle="topjui-numberspinner" data-options="required:true,precision:2"></td><!-- data-options="precision:3" 小数点 -->
    	<td class="label">总价</td>
        <td><input type="text" name="price" data-toggle="topjui-numberspinner" data-options="required:true,precision:2"></td><!-- data-options="precision:3" 小数点 -->
    </tr>
    <tr>
    	<td class="label">入库库区位置</td>
        <td>
            <input type="text" name="storge_name"
                   data-toggle="topjui-combobox"
                   data-options="data:[
                       {
                           text: 'A库',
                           value: 'A库'
                       },
                       {
                           text: 'B库',
                           value: 'B库'
                       },
                       {
                           text: 'C库',
                           value: 'C库'
                       }
                   ],panelHeight:100">
            <!-- <input type="text" name="spec"
                   data-toggle="topjui-combobox"
                   data-options="required:true,panelWidth:200,valueField:'code',
                   url:_ctx + '/json/dictionary/models.json'"> -->
        </td>
    </tr>
</table>
