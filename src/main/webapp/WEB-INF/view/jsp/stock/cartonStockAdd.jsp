<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<input type="hidden" id="uuid" name="uuid">
<table class="editTable">
    <tr>
        <td class="label">订单号</td>
        <td>
            <input type="text" name="order_account"
                   data-toggle="topjui-combobox"
                   data-options="required:true,panelHeight:110,valueField:'code',
                   url:_ctx + '/json/dictionary/models.json',
                   onChange:function(newValue,oldValue){
                   		demo();
                   		console.log(newValue);
                   		console.log(oldValue);
                   		}"><!-- newValue:改变后的值，oldValue：改变前的值 -->
        </td>
        <td class="label">客户名称</td>
        <td>
            <input type="text" id="name" name="corporate_name" data-toggle="topjui-textbox" disabled="disabled" data-options="required:true">
        </td>
    </tr>
    <tr>
    	<td class="label">业务员</td>
        <td>
            <input type="text" name="model_name" data-toggle="topjui-textbox" disabled="disabled" data-options="required:true">
        </td>
        <td class="label">材质/楞型</td>
        <td>
            <input type="text" name="material"
            		disabled="disabled"
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
    	<td class="label">纸箱尺寸</td>
        <td>
            <input type="text" name="carton_spec" disabled="disabled" data-toggle="topjui-textbox" data-options="required:true">
        </td>
    	<td class="label">订单数量</td>
        <td><input type="text" name="order_num" disabled="disabled" data-toggle="topjui-numberspinner" data-options="required:true"></td><!-- data-options="precision:3" 小数点 -->
    </tr>
    <tr>
    	<td class="label">纸箱单价</td>
        <td><input type="text" name="price"  data-toggle="topjui-numberspinner" data-options="precision:2"></td><!-- data-options="precision:3" 小数点 -->
    	<td class="label">入库数量</td>
        <td><input type="text" name="storage_num" data-toggle="topjui-numberspinner" data-options="required:true"></td><!-- data-options="precision:3" 小数点 -->
    </tr>
    <tr>
        <td class="label">库区</td>
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
    <tr>
    	<td class="label">备注</td>
        <td colspan="3">
            <input type="text" name="description" data-toggle="topjui-textarea">
        </td>
        
    </tr>
</table>
<script type="text/javascript">
	function demo(){
		console.log(";;");
		$("#name").val("demo");
	}
</script>
