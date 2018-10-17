<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!-- 添加发票 页面 -->
<style>
	#youhui,#zhiban{width: 600px;margin: 0 auto;  border: 1px solid #ccc;}
	#youhui th,#zhiban th{font-size:20px;font-family:'黑体'; height: 30px;}
	#youhui td,#zhiban td{font-size:16px; line-height: 20px;  height: 30px;}
	
</style>
	<div class="easyui-tabs" style="height: 100%;width: 99.9%;">
		<div title="" style="padding:10px">
			<table class="editTable" >
			    <tr>
			        <td class="label">发票编号</td>
			        <td>
			            <input type="text" name="supplier_name" data-toggle="topjui-textbox" data-options="required:true">
			       <td class="label">开票名称</td>
			        <td><input type="text" name="supplier_tel" data-toggle="topjui-textbox" data-options="required:true"></td><!-- data-options="precision:3" 小数点 -->
			    </tr>
			   
			    <tr>
			    	<td class="label">购买方名称</td>
			        <td><input type="text" name="supplier_name" data-toggle="topjui-textbox" data-options="required:true"></td><!-- data-options="precision:3" 小数点 -->
			        <td class="label">销售方名称</td>
			        <td><input type="text" name="supplier_name" data-toggle="topjui-textbox" data-options="required:true"></td><!-- data-options="precision:3" 小数点 -->
			    </tr>
			    <tr>
			    	<td class="label">开票时间</td>
			        <td><input type="text" name="delivery_time" data-toggle="topjui-datebox" data-options="required:true"></td><!-- data-options="precision:3" 小数点 -->
			        </td>
			       
			    </tr>
			    
			    <tr>
			        <td class="label">备注</td>
			        <td  colspan="3">
			            <input type="text" name="supplier_address" data-toggle="topjui-textbox" data-options="required:true">
			        </td>
			        
			    </tr>
			   
			</table>
		</div>
		<div title="货物名称" style="padding:10px;text-align: center;">
			<table id="zhiban" border="1" >
				<tr>
					<th>操作</th>
					<th>货物名称</th>
					<th>规格型号</th>
					<th>单位</th>
					<th>单价</th>
					<th>数量</th>
					<th>金额</th>
					<th>税率</th>
					<th>税额</th>
				</tr>
				<tr id="tr1">
					<td><a href="javascript:void(0)" title="新增" onclick="add1()"><i class="fa fa-plus"></i></a></td><!-- <i class="fa fa-minus"></i> -->
				</tr>
			</table>
		</div>
        <div title="" style="padding:10px">
			<table class="editTable" >
			    <tr>
			        <td class="label">合计金额</td>
			        <td>
			            <input type="text" name="supplier_name" data-toggle="topjui-textbox" data-options="required:true">
			       <td class="label">价税合计</td>
			        <td><input type="text" name="supplier_tel" data-toggle="topjui-textbox" data-options="required:true"></td><!-- data-options="precision:3" 小数点 -->
			    </tr>
   
			</table>
		</div>
		
	</div>

<script type="text/javascript">
	$(function() {
	});
	
	/* 纸板材料 */
	function add1(){
		var html1="";
		html1 += "<tr>";
		html1 += "<td><a href=\"javascript:void(0)\" title=\"删除\" onclick=\"delet1(this)\"><i class=\"fa fa-minus\"></i></a></td>";
		html1 += "<td contentEditable=\"true\"></td>";
		html1 += "<td contentEditable=\"true\"></td>";
		html1 += "<td contentEditable=\"true\"></td>";
		html1 += "<td contentEditable=\"true\"></td>";
		html1 += "<td contentEditable=\"true\"></td>";
		html1 += "<td contentEditable=\"true\"></td>";
		html1 += "<td contentEditable=\"true\"></td>";
		html1 += "<td contentEditable=\"true\"></td>";
		html1 += "</tr>";
		$("#tr1").before(html1);
	};
	function delet1(e1){
		e1.parentElement.parentElement.remove();
	};
	
	/* 优惠 */
	function add2(){
		var html2="";
		html2 += "<tr>";
		html2 += "<td><a href=\"javascript:void(0)\" title=\"删除\" onclick=\"delet2(this)\"><i class=\"fa fa-minus\"></i></a></td>";
		html2 += "<td contentEditable=\"true\"></td>";
		html2 += "<td contentEditable=\"true\"></td>";
		html2 += "</tr>";
		$("#tr2").before(html2);
	};
	function delet2(e2){
		e2.parentElement.parentElement.remove();
	};

	
</script>

