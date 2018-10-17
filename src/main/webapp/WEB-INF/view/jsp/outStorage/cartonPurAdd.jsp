<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<input type="hidden" id="uuid" name="uuid">
<table class="editTable">
    <tr>
        <td class="label">订单号</td>
        <td>
            <input type="text" name="order_account" data-toggle="topjui-textbox" data-options="required:true">
        </td>
        <td class="label"> 客户公司</td>
        <td>
        	<input type="text" name="corporate_name" data-toggle="topjui-textbox">
        </td>
    </tr>
    <tr>
        <td class="label">供应商</td>
        <td>
            <input type="text" name="suppier_name" data-toggle="topjui-textbox" data-options="required:true">
        </td>
        <td class="label"> 材质</td>
        <td>
        	<input type="text" name="material" data-toggle="topjui-textbox" data-options="required:true">
        </td>
    </tr>
    <tr>
        <td class="label">楞型</td>
        <td>
            <input type="text" name="pit_type" data-toggle="topjui-textbox" data-options="required:true">
        </td>
        <td class="label">纸板规格(长*宽)</td>
        <td>
        	<input type="text" name="spec" data-toggle="topjui-textbox" data-options="required:true">
        </td>
    </tr>
    <tr>
        <td class="label">单平方</td>
        <td>
            <input type="text" name="square" data-toggle="topjui-numberspinner" data-options="required:true,precision:2">
        </td>
        <td class="label">总平方</td>
        <td>
        	<input type="text" name="square_sum" data-toggle="topjui-numberspinner" data-options="required:true,precision:2">
        </td>
    </tr>
    
    
    <tr>
        <td class="label">时间</td>
        <td><input type="text" name="time" data-toggle="topjui-datebox" data-options="required:true"></td><!-- data-options="precision:3" 小数点 -->
        <td class="label">数量</td>
        <td><input type="text" name="num" data-toggle="topjui-numberspinner" data-options="required:true"></td><!-- data-options="precision:3" 小数点 -->
    </tr>
    <tr>
    	<td class="label">纸平方价</td>
    	
        <td>
        	<input type="text" name="price" data-toggle="topjui-numberspinner" data-options="required:true" data-options="precision:2">
        <td class="label">总价</td>
        <td >
        	<input type="text" name="total" data-toggle="topjui-numberspinner" data-options="required:true" >
        </td>
    </tr>
    <tr>
        <td class="label">纸板类型</td>
        <td >
            <input type="text" name="mold"
                   data-toggle="topjui-combobox"
                   data-options="required:true,data:[
                       {
                           text: '普通纸板',
                           value: '普通纸板'
                       },
                       {
                           text: '通用纸板',
                           value: '通用纸板'
                       }
                   ]">
        </td>
        <td class="label">类型</td>
        <td >
            <input type="text" name="type"
                   data-toggle="topjui-combobox"
                   data-options="required:true,data:[
                       {
                           text: '入库',
                           value: '入库'
                       },
                       {
                           text: '出库',
                           value: '出库'
                       },
                       {
                           text: '借出',
                           value: '借出'
                       }
                   ]">
                   </td><!-- data-options="precision:3" 小数点 -->
    </tr>
    <tr>
    	 <td class="label">库区位置</td>
        <td >
            <input type="text" name="storage_name"
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
    </tr>
    
</table>
