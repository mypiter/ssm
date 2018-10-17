<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<input type="hidden" id="uuid" name="uuid">
<table class="editTable">
    <tr>
        <td class="label">物材名称</td>
        <td>
            <input type="text" name="making_name" data-toggle="topjui-textbox" data-options="required:true">
        </td>
        <td class="label">物材规格</td>
        <td>
            <input type="text" name="storage_spec"
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
                   ]">
            <!-- <input type="text" name="spec"
                   data-toggle="topjui-combobox"
                   data-options="required:true,panelWidth:200,valueField:'code',
                   url:_ctx + '/json/dictionary/models.json'"> -->
        </td>
    </tr>
    <tr>
    	<td class="label">供应商名称</td>
        <td>
            <input type="text" name="supplier_name" data-toggle="topjui-textbox" data-options="required:true">
        </td>
        <td class="label">出库数量</td>
        <td><input type="text" name="num" data-toggle="topjui-numberspinner" data-options="required:true"></td><!-- data-options="precision:3" 小数点 -->
    </tr>
    <tr>
        <td class="label">出库时间</td>
        <td><input type="text" name="time" data-toggle="topjui-datebox" data-options="required:true"></td><!-- data-options="precision:3" 小数点 -->
        <td class="label">单价</td>
        <td><input type="text" name="price" data-toggle="topjui-numberspinner" data-options="required:true,precision:2" ></td><!-- data-options="precision:3" 小数点 -->
    </tr>
    <tr>
    	
        <td class="label">总价</td>
        <td><input type="text" name="total" data-toggle="topjui-numberspinner" data-options="required:true,precision:2"></td><!-- data-options="precision:3" 小数点 -->
    	<td class="label">物材类型</td>
        <td><input type="text" name="mold"
                   data-toggle="topjui-combobox"
                   data-options="required:true,data:[
                       {
                           text: '普通物材',
                           value: '普通物材'
                       },
                       {
                           text: '通用物材',
                           value: '通用物材'
                       }
                   ]">
                   </td>
    </tr>
    <tr>
    	<td class="label">所属库名</td>
        <td><input type="text" name="storage_name"
                   data-toggle="topjui-combobox"
                   data-options="required:true,data:[
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
                   ]">
                   </td>
        <td class="label">出库/入库</td>
        <td >
            <input type="text" name="type"
                   data-toggle="topjui-combobox"
                   data-options="required:true,panelWidth:200,valueField:'code',
                   url:_ctx + '/json/demo/salesman.json'">
              
        </td>
    </tr>
    
    
</table>
