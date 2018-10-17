<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<style>
	.quanju{ width: 96%; height: 99%; margin: 5px auto 0;}
	fieldset{border: none;border-top: 1px solid #eee; padding-left: 25px; color: #999;}
	fieldset legend{font-size: 16px; font-family:'黑体';}
	
	#youhui,#zhiban{width: 600px;margin: 10px auto 20px;  border: 1px solid #ccc; text-align: center;}
	#youhui th,#zhiban th{font-size:17px;font-family:'黑体'; height: 25px;}
	#youhui td,#zhiban td{font-size:13px; line-height: 23px;  height: 23px;}
</style>
<div class="quanju">
	<div>
		<fieldset>
        	<legend>&nbsp;&nbsp;基本信息&nbsp;&nbsp;</legend>
    	</fieldset>
		<table class="editTable" >
		    <tr>
		        <td class="label">供应商名称</td>
		        <td>
		            <input type="text" name="supplier_name" data-toggle="topjui-textbox" data-options="required:true">
		        </td>
		        <td class="label">供应商地址</td>
		        <td>
		            <input type="text" name="supplier_address" data-toggle="topjui-textbox" data-options="required:true">
		        </td>
		    	<td class="label">联系电话</td>
		        <td><input type="text" name="supplier_tel" data-toggle="topjui-textbox" data-options="required:true"></td><!-- data-options="precision:3" 小数点 -->
		    </tr>
		    <tr>
		    	<td class="label">最大纸板长</td>
		        <td><input type="text" name="max_length" data-toggle="topjui-numberspinner" data-options="required:true"></td><!-- data-options="precision:3" 小数点 -->
		    	<td class="label">最大纸板宽</td>
		        <td><input type="text" name="max_width" data-toggle="topjui-numberspinner" data-options="required:true"></td><!-- data-options="precision:3" 小数点 -->
		        <td class="label">最小纸板长</td>
		        <td><input type="text" name="min_length" data-toggle="topjui-numberspinner" data-options="required:true"></td><!-- data-options="precision:3" 小数点 -->
		    </tr>
		    <tr>
		    	<td class="label">最小纸板宽</td>
		        <td><input type="text" name="min_width" data-toggle="topjui-numberspinner" data-options="required:true"></td><!-- data-options="precision:3" 小数点 -->
		        <td class="label">计量单位</td>
		        <td><input type="text" name="unit"
	                   data-toggle="topjui-combobox"
	                   data-options="data:[
	                       {
	                           text: 'mm',
	                           value: '1'
	                       },
	                       {
	                           text: 'cm',
	                           value: '2'
	                       },
	                       {
	                           text: 'dm',
	                           value: '3'
	                       },
	                       {
	                           text: 'm',
	                           value: '4'
	                       }
	                   ]"></td><!-- data-options="precision:3" 小数点 -->
		    </tr>
		</table>
	</div>
	<div>
		<fieldset>
        	<legend>&nbsp;&nbsp;纸板材料&nbsp;&nbsp;</legend>
    	</fieldset>
    	<table id="zhiban" border="1" >
				<tr>
					<th>操作</th>
					<th>纸质</th>
					<th>定量</th>
					<th>材料代号</th>
					<th>纸平方价</th>
					<th>质量等级</th>
					<th>特价</th>
				</tr>
				<tr>
					<td><a href="javascript:void(0)" title="删除" onclick="delet3(this)"><i class="fa fa-minus"></i></a></td>
					<td contentEditable="true"></td>
					<td contentEditable="true"></td>
					<td contentEditable="true">B636C</td>
					<td contentEditable="true">5.26元</td>
					<td contentEditable="true"></td>
					<td contentEditable="true"></td>
				</tr>
				<tr>
					<td><a href="javascript:void(0)" title="删除" onclick="delet3(this)"><i class="fa fa-minus"></i></a></td>
					<td contentEditable="true"></td>
					<td contentEditable="true"></td>
					<td contentEditable="true">B636C</td>
					<td contentEditable="true">5.26元</td>
					<td contentEditable="true"></td>
					<td contentEditable="true"></td>
				</tr>
				<tr id="tr3">
					<td><a href="javascript:void(0)" title="新增" onclick="add3()"><i class="fa fa-plus"></i></a></td><!-- <i class="fa fa-minus"></i> -->
				</tr>
			</table>
		
	</div>
	<div>
		<fieldset>
        	<legend>&nbsp;&nbsp;优惠&nbsp;&nbsp;</legend>
    	</fieldset>
    	<table id="youhui"  border="1">
			<tr>
				<th>操作</th>
				<th>箱型</th>
				<th>1000平米以上</th>
				<th>2000平米以上</th>
				<th>3000平米以上</th>
			</tr>
			<tr>
				<td><a href="javascript:void(0)" title="删除" onclick="delet4(this)"><i class="fa fa-minus"></i></a></td>
				<td contentEditable="true">三层箱</td>
				<td contentEditable="true">0.01</td>
				<td contentEditable="true">0.02</td>
				<td contentEditable="true">0.04</td>
			</tr>
			<tr>
				<td><a href="javascript:void(0)" title="删除" onclick="delet4(this)"><i class="fa fa-minus"></i></a></td>
				<td contentEditable="true">五层箱</td>
				<td contentEditable="true">0.02</td>
				<td contentEditable="true">0.03</td>
				<td contentEditable="true">0.04</td>
			</tr>
			<tr>
				<td><a href="javascript:void(0)" title="删除" onclick="delet4(this)"><i class="fa fa-minus"></i></a></td>
				<td contentEditable="true">七层箱</td>
				<td contentEditable="true">0.03</td>
				<td contentEditable="true">0.04</td>
				<td contentEditable="true">0.05</td>
			</tr>
			<tr id="tr4">
				<td><a href="javascript:void(0)" title="新增" onclick="add4()"><i class="fa fa-plus"></i></a></td><!-- <i class="fa fa-minus"></i> -->
			</tr>
		</table>
		
	</div>
</div>
<script type="text/javascript">
	$(function() {
	});
	
	/* 纸板材料 */
	function add3(){
		var html="";
		html += "<tr>";
		html += "<td><a href=\"javascript:void(0)\" title=\"删除\" onclick=\"delet3(this)\"><i class=\"fa fa-minus\"></i></a></td>";
		html += "<td contentEditable=\"true\"></td>";
		html += "<td contentEditable=\"true\"></td>";
		html += "<td contentEditable=\"true\"></td>";
		html += "<td contentEditable=\"true\"></td>";
		html += "<td contentEditable=\"true\"></td>";
		html += "<td contentEditable=\"true\"></td>";
		html += "</tr>";
		$("#tr3").before(html);
	};
	function delet3(e3){
		e3.parentElement.parentElement.remove();
	};
	
	/* 优惠 */
	function add4(){
		var html="";
		html += "<tr>";
		html += "<td><a href=\"javascript:void(0)\" title=\"删除\" onclick=\"delet4(this)\"><i class=\"fa fa-minus\"></i></a></td>";
		html += "<td contentEditable=\"true\"></td>";
		html += "<td contentEditable=\"true\"></td>";
		html += "<td contentEditable=\"true\"></td>";
		html += "<td contentEditable=\"true\"></td>";
		html += "</tr>";
		$("#tr4").before(html);
	};
	function delet4(e4){
		e4.parentElement.parentElement.remove();
	};

	
</script>

