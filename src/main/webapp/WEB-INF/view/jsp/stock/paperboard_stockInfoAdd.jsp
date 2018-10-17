<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<input type="hidden" id="uuid" name="uuid">
<table class="editTable">
    <tr>
        <td class="label">关联采购纸板名称</td>
        <td>
            <input type="text" name="purchase_name" data-toggle="topjui-textbox" data-options="required:true">
        </td>
        <td class="label">订单号</td>
        <td>
            <input type="text" name="order_account" data-toggle="topjui-textbox" data-options="required:true">
        </td>
    </tr>
    <tr>
    	<td class="label">供应商</td>
        <td>
            <input type="text" name="supplier_name" data-toggle="topjui-textbox" data-options="required:true">
        </td>
        <td class="label">材质</td>
        <td>
            <input type="text" name="material_science"
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
        <td class="label">坑型</td>
        <td>
            <input type="text" name="pit_type" data-toggle="topjui-textbox" data-options="required:true">
        </td>
        <td class="label">纸板长宽</td>
        <td>
            <input type="text" name="purchase_spec" data-toggle="topjui-textbox" data-options="required:true">
        </td>
    </tr>
    <tr>
    	<td class="label">平方价</td>
        <td><input type="text" name="price" data-toggle="topjui-numberspinner" data-options="required:true,precision:2"></td><!-- data-options="precision:3" 小数点 -->
    	<td class="label">单平方</td>
        <td><input type="text" name="square" data-toggle="topjui-numberspinner" data-options="required:true"></td><!-- data-options="precision:3" 小数点 -->
    </tr>
    <tr>
    	<td class="label">总平方</td>
        <td><input type="text" name="square_sum" data-toggle="topjui-numberspinner" data-options="required:true"></td><!-- data-options="precision:3" 小数点 -->
    	<td class="label">采购数量</td>
        <td><input type="text" name="purchase_num" data-toggle="topjui-numberspinner" data-options="required:true"></td><!-- data-options="precision:3" 小数点 -->
    </tr>
    <tr>
    	<td class="label">入库数量</td>
        <td><input type="text" name="num" data-toggle="topjui-numberspinner" data-options="required:true"></td><!-- data-options="precision:3" 小数点 -->
    	<td class="label">出库数量</td>
        <td><input type="text" name="out_num" data-toggle="topjui-numberspinner" data-options="required:true"></td><!-- data-options="precision:3" 小数点 -->
    </tr>
    <tr>
        <td class="label">库存数量</td>
        <td><input type="text" name="stock_num" data-toggle="topjui-numberspinner" data-options="required:true"></td><!-- data-options="precision:3" 小数点 -->
    	<td class="label">最低库存</td>
        <td>
            <input type="text" name="min_num" data-toggle="topjui-numberspinner" >
        </td>
    </tr>
    <tr>
    	<td class="label">纸板类型</td>
        <td>
            <input type="text" name="mold"
                   data-toggle="topjui-combobox"
                   data-options="data:[
                       {
                           text: '普通纸板',
                           value: '1'
                       },
                       {
                           text: '通用纸板',
                           value: '2'
                       }
                   ]"></td>
        <td class="label">库区位置</td>
        <td>
            <input type="text" name="storage_name"
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
                   ]">
            <!-- <input type="text" name="spec"
                   data-toggle="topjui-combobox"
                   data-options="required:true,panelWidth:200,valueField:'code',
                   url:_ctx + '/json/dictionary/models.json'"> -->
        </td>
    </tr>
</table>
