<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!-- 添加供应商 页面 -->
<style>
	#youhui,#zhiban{width: 600px;margin: 0 auto;  border: 1px solid #ccc;}
	#youhui th,#zhiban th{font-size:20px;font-family:'黑体'; height: 30px;}
	#youhui td,#zhiban td{font-size:16px; line-height: 20px;  height: 30px;}
	
</style>
	<div class="easyui-tabs" style="height: 100%;width: 99.9%;">
		<div title="基础信息" style="padding:10px">
			<table class="editTable" >
			    <tr>
			        <td class="label">供应商名称</td>
			        <td colspan="3">
			            <input type="text" name="supplier_name" data-toggle="topjui-textbox" data-options="required:true">
		            </td>
			    </tr>
			    <tr>
			        <td class="label">供应商地址</td>
			        <td  colspan="3">
			            <input type="text" name="supplier_address" data-toggle="topjui-textbox" data-options="required:true">
			        </td>
			    </tr>
			   	<tr>
			   		<td class="label">联系人</td>
			        <td><input type="text" name="supplier_tel" data-toggle="topjui-textbox" data-options="required:true"></td><!-- data-options="precision:3" 小数点 -->
			        <td class="label">联系电话</td>
			        <td><input type="text" name="supplier_tel" data-toggle="topjui-textbox" data-options="required:true"></td><!-- data-options="precision:3" 小数点 -->
			   	</tr>
			    <tr>
			      	<td class="label">最大纸板长</td>
			        <td><input type="text" name="supplier_name" data-toggle="topjui-textbox" data-options="required:true"></td><!-- data-options="precision:3" 小数点 -->
			    	<td class="label">最大纸板宽</td>
			        <td><input type="text" name="supplier_name" data-toggle="topjui-textbox" data-options="required:true"></td><!-- data-options="precision:3" 小数点 -->
			    </tr>
			    <tr>
			        <td class="label">最小纸板长</td>
			        <td><input type="text" name="supplier_name" data-toggle="topjui-textbox" data-options="required:true"></td><!-- data-options="precision:3" 小数点 -->
			    	<td class="label">最小纸板宽</td>
			        <td><input type="text" name="supplier_name" data-toggle="topjui-textbox" data-options="required:true"></td><!-- data-options="precision:3" 小数点 -->
			        </td>  
			    </tr>
			     <tr>
			    	<td class="label">压线条数</td>
			         <td><input type="text" name="supplier_name" data-toggle="topjui-textbox" data-options="required:true"></td><!-- data-options="precision:3" 小数点 -->
			     <td class="label">计量单位</td>
                     <td> <input type="text" name="nation" 
			                   data-toggle="topjui-combobox"
			                   data-options="data:[
			                       {
			                           text: 'MM',
			                           value: '1'
			                       },
			                       {
			                           text: 'CM',
			                           value: '2'
			                       }
			                   ],required:true,
			                   valueField:'2',
			                   panelHeight:'70'"></td>        
			    </tr>
			    <tr>
			    	<td class="label">供应商类型</td>
		         	<td> <input type="text" id="sf" name="type" 
			                   data-toggle="topjui-combobox"
			                   data-options="
			                   onChange:ck,
			                   data:[
			                       {
			                           text: '供应商A',
			                           value: '1'
			                       },
			                       {
			                           text: '供应商B',
			                           value: '2'
			                       }
			                   ],required:true,
			                   panelHeight:'70'"></td>
			    </tr>
			   
			</table>
		</div>
		<div title="供应商A纸板材料"  id="p1" style="padding:10px;text-align: center;">
			<table id="zhiban" border="1" >
				<tr>
					<th>操作</th>
					<th>纸质名称</th>
					<th>本公司代号</th>
					<th>材料代号</th>
					<th>单价</th>
				</tr>
				<tr id="tr1">
					<td><a href="javascript:void(0)" title="新增" onclick="add1()"><i class="fa fa-plus"></i></a></td><!-- <i class="fa fa-minus"></i> -->
				</tr>
			</table>
		</div>
		<div title="供应商B纸板材料"  id="p2" style="padding:10px;text-align: center;">
			<table id="zhiban" border="1" >
				<tr>
					<th>操作</th>
					<th>纸质名称</th>
					<th>本公司代号</th>
					<th>材料代号</th>
					<th>纸平方价</th>
					<th>特价</th>
				</tr>
				<tr id="tr11">
					<td><a href="javascript:void(0)" title="新增" onclick="add11()"><i class="fa fa-plus"></i></a></td><!-- <i class="fa fa-minus"></i> -->
				</tr>
			</table>
		</div>
		<div title="生产楞型" style="padding:10px;">
			<table class="editTable" style="width: 100%;">
			    <tr>
			        <td class="label">可生产楞型<br>（手动输入请回车）</td>
			        <td>
			            <input type="text" name="tagbox2" style="width:450px"
			                   data-toggle="topjui-tagbox"
			                   data-options="required:true,
			                               hasDownArrow:true,
			                               textField:'text',
			                               valueField:'id',
			                               data:[{
			                                   id:1,
			                                   text:'BC'
			                               },{
			                                   id:2,
			                                   text:'BA'
			                               },{
			                                   id:3,
			                                   text:'BB',
			                                   selected:true
			                               },{
			                                   id:4,
			                                   text:'CC'
			                               },{
			                                   id:5,
			                                   text:'CD'
			                               },{
			                                   id:6,
			                                   text:'DF'
			                               }]">
			        </td>
			    </tr>
			</table>
		</div>
		<div  title="优惠" style="padding:10px;text-align: center;">
			<table id="youhui"  border="1">
				<tr>
					<th>操作</th>
					<th>优惠形式</th>
					<th>优惠金额</th>
					
				</tr>
				<tr>
					<td><a href="javascript:void(0)" title="删除" onclick="delet2(this)"><i class="fa fa-minus"></i></a></td>
					<td contentEditable="true">三层箱1000平方优惠</td>
					<td contentEditable="true">0.01</td>
				</tr>
				
				<tr id="tr2">
					<td><a href="javascript:void(0)" title="新增" onclick="add2()"><i class="fa fa-plus"></i></a></td><!-- <i class="fa fa-minus"></i> -->
				</tr>
			</table>
		</div>
		<div  title="换纸" style="padding:10px;text-align: center;">
			<table id="youhui"  border="1">
				<tr>
					<th>操作</th>
					<th>换纸方式</th>
					<th>需补金额</th>
					
				</tr>
				<tr>
					<td><a href="javascript:void(0)" title="删除" onclick="delet3(this)"><i class="fa fa-minus"></i></a></td>
					<td contentEditable="true">3换5</td>
					<td contentEditable="true">单张每坪+0.06元</td>
				</tr>
				
				<tr id="tr3">
					<td><a href="javascript:void(0)" title="新增" onclick="add3()"><i class="fa fa-plus"></i></a></td><!-- <i class="fa fa-minus"></i> -->
				</tr>
			</table>
		</div>
		<div  title="加工费" style="padding:10px;text-align: center;">
			<table id="youhui"  border="1">
				<tr>
					<th>操作</th>
					<th>层&nbsp;&nbsp;数</th>
					<th>需加工费</th>
					
				</tr>
				<tr>
					<td><a href="javascript:void(0)" title="删除" onclick="delet4(this)"><i class="fa fa-minus"></i></a></td>
					<td contentEditable="true">三层</td>
					<td contentEditable="true">0.15元每平米</td>
				</tr>
				
				<tr id="tr4">
					<td><a href="javascript:void(0)" title="新增" onclick="add4()"><i class="fa fa-plus"></i></a></td><!-- <i class="fa fa-minus"></i> -->
				</tr>
			</table>
		</div>
	</div>

<script type="text/javascript">
	$(function() {
	        $("#p1,#p2").hide();  
	});
	function ck(){
	var a=$("#sf").val();  
        if(a==1)  
        {  
              $("#p1").show();
              $("#p2").hide();  
        }else  
        {  
             $("#p2").show();  
             $("#p1").hide(); 
        }         
	}
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
		html1 += "</tr>";
		$("#tr1").before(html1);
	};
	function delet1(e1){
		e1.parentElement.parentElement.remove();
	};
	/* 纸板材料 11*/
	function add11(){
		var html11="";
		html11 += "<tr>";
		html11 += "<td><a href=\"javascript:void(0)\" title=\"删除\" onclick=\"delet11(this)\"><i class=\"fa fa-minus\"></i></a></td>";
		html11 += "<td contentEditable=\"true\"></td>";
		html11 += "<td contentEditable=\"true\"></td>";
		html11 += "<td contentEditable=\"true\"></td>";
		html11 += "<td contentEditable=\"true\"></td>";
		html11 += "<td contentEditable=\"true\"></td>";
		html11 += "</tr>";
		$("#tr11").before(html11);
	};
	function delet11(e11){
		e11.parentElement.parentElement.remove();
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
    	/* 换纸 */
	function add3(){
		var html3="";
		html3 += "<tr>";
		html3 += "<td><a href=\"javascript:void(0)\" title=\"删除\" onclick=\"delet3(this)\"><i class=\"fa fa-minus\"></i></a></td>";
		html3 += "<td contentEditable=\"true\"></td>";
		html3 += "<td contentEditable=\"true\"></td>";
		html3 += "</tr>";
		$("#tr3").before(html3);
	};
	function delet3(e3){
		e3.parentElement.parentElement.remove();
	};
      	/* 加工费 */
	function add4(){
		var html4="";
		html4 += "<tr>";
		html4 += "<td><a href=\"javascript:void(0)\" title=\"删除\" onclick=\"delet4(this)\"><i class=\"fa fa-minus\"></i></a></td>";
		html4 += "<td contentEditable=\"true\"></td>";
		html4 += "<td contentEditable=\"true\"></td>";
		html4 += "</tr>";
		$("#tr4").before(html4);
	};
	function delet4(e4){
		e4.parentElement.parentElement.remove();
	};
	
</script>

