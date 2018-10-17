<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<input type="hidden" id="uuid" name="uuid">
<table class="editTable">
    <tr>
        <td class="label">订单号</td>
        <td>
            <input type="text" name="order_account" data-toggle="topjui-textbox" data-options="required:true">
        </td>
        <td class="label">纸箱名称</td>
        <td>
         <input type="text" name="carton_type" data-toggle="topjui-textbox" data-options="required:true">
            <!-- <input type="text" name="carton_type"
                   data-toggle="topjui-combobox"
                   data-options="required:true,data:[
                       {
                           text: '天地箱',
                           value: '天地箱'
                       },
                       {
                           text: '摇盖箱',
                           value: '摇盖箱'
                       },
                       {
                           text: '防水箱',
                           value: '防水箱'
                       }
                   ]"> -->
            <!-- <input type="text" name="spec"
                   data-toggle="topjui-combobox"
                   data-options="required:true,panelWidth:200,valueField:'code',
                   url:_ctx + '/json/dictionary/models.json'"> -->
        </td>
    </tr>
    <tr>
        <td class="label">纸箱规格</td>
        <td><input type="text" name="carton_spec" data-toggle="topjui-textbox" data-options="required:true"></td><!-- data-options="precision:3" 小数点 -->
        <td class="label">客户公司名称</td>
        <td >
            <input type="text" name="user_company" data-toggle="topjui-textbox" >
        </td>
    </tr>
    <tr>
        <td class="label">坑型</td>
        <td><input type="text" name="pit_type" data-toggle="topjui-textbox" data-options="required:true"></td><!-- data-options="precision:3" 小数点 -->
        <td class="label">材质</td>
        <td >
            <input type="text" name="material"
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
        </td>
    </tr>
    <tr>
        <td class="label">出库数量</td>
        <td><input type="text" name="num" data-toggle="topjui-numberspinner" data-options="required:true"></td><!-- data-options="precision:3" 小数点 -->
        <td class="label">出库时间</td>
        <td><input type="text" name="time" data-toggle="topjui-datebox" data-options="required:true"></td><!-- data-options="precision:3" 小数点 -->
    </tr>
    <tr>
        <td class="label">单价</td>
        <td><input type="text" name="price" data-toggle="topjui-numberspinner" data-options="required:true"></td><!-- data-options="precision:3" 小数点 -->
        <td class="label">总价</td>
        <td><input type="text" name="total" data-toggle="topjui-numberspinner" data-options="required:true"></td><!-- data-options="precision:3" 小数点 -->
    </tr>
    <tr>
        <td class="label">出库或入库</td>
        <td><input type="text" name="type" data-toggle="topjui-textbox" data-options="required:true"></td><!-- data-options="precision:3" 小数点 -->
    	<td class="label">类型</td>
        <td><input type="text" name="mold"
                   data-toggle="topjui-combobox"
                   data-options="required:true,data:[
                       {
                           text: '通用纸箱',
                           value: '通用纸箱'
                       },
                       {
                           text: '普通纸箱',
                           value: '普通纸箱'
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
                   </td><!-- data-options="precision:3" 小数点 -->
        <!-- <td class="label">录入人</td>
        <td >
            <input type="text" name="out_user_name"
                   data-toggle="topjui-combobox"
                   data-options="required:true,panelWidth:200,valueField:'code',
                   url:_ctx + '/json/demo/salesman.json'">
        </td> -->
    </tr>
   
    
</table>
