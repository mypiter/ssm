<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

	<title>原材料退货赔偿</title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!-- 导入公共样式 -->
	<%@ include file="../ap.jsp" %>

	<style type="text/css">
		.globle{margin: 20px 0;}
		.globle .row{margin: 5px 0;}
		.globle .row .tou{display: inline-block; width: 70px;text-align: center}
	</style>

</head>

<body>
<div data-toggle="topjui-panel" title="" data-options="fit:true,iconCls:'icon-ok',footer:'#footer'">
	<form class="hidden" method="post" data-toggle="topjui-form" data-options="id:'formId',
               <%--url:_ctx + '/json/response/form.json?uuid=123456',--%>
               editor:[
                   {id:'remarkAddEditor',field:'remark'}
               ]">
		<div class="topjui-container">
			<div class="globle">
				<div class="row">
					<span class="tou">退赔日期</span><input id="rejectedTime" name="rejectedTime"
														data-toggle="topjui-datebox"
														data-options="width:168"/>
				</div>
				<fieldset>
					<legend>采购信息</legend>
				</fieldset>
				<div class="row">
					<span class="tou">入库批号</span><input id="batchNumber" name="batchNumber" type="text"
														data-toggle="topjui-combogrid"
														data-options="id:'user',
																  width:180,
																  panelWidth:450,
																  idField: 'batch',
																  textField: 'batch',
																  fitColumns:false,<%--列宽自适应属性 搭配列属性中的width:100使用--%>
																  onSelect: function (index,row){
																  		<%--console.log(row);--%>
																		<%--console.log(index+','+row['supplierType']);--%>
																		$('#orderAccount').iTextbox('setValue',row['orderId']);
																		$('#supplierName').iTextbox('setValue',row['supplierName']);
																		$('#supperSpec').iTextbox('setValue',row['supperSpec']);
																		$('#materialName').iTextbox('setValue',row['materialScience']);
																		$('#pitType').iTextbox('setValue',row['pitType']);
																		$('#blankingSize').iTextbox('setValue',row['size']);
																		$('#widthLine').iTextbox('setValue',row['widthLine']);
																		$('#lineType').iTextbox('setValue',row['lineType']);
																		$('#purPrice').iTextbox('setValue',row['price']);
																		$('#materialsNumber').iTextbox('setValue',row['singular']);
																		$('#returnNumber').iTextbox('setValue',row['returnNumber']);},
																  url:'/CardboardEnter/dropSelectPurEnter/',
																  onChange:function(newValue,oldValue){
																		$('#orderAccount').iTextbox('setValue','');
																		$('#supplierName').iTextbox('setValue','');
																		$('#supperSpec').iTextbox('setValue','');
																		$('#materialName').iTextbox('setValue','');
																		$('#pitType').iTextbox('setValue','');
																		$('#blankingSize').iTextbox('setValue','');
																		$('#widthLine').iTextbox('setValue','');
																		$('#lineType').iTextbox('setValue','');
																		$('#purPrice').iTextbox('setValue','');
																		$('#materialsNumber').iTextbox('setValue','');
																		$('#returnNumber').iTextbox('setValue','');
																   },
																  columns:[[
																  	{field: 'batch',width:100, title: '批号'},
																	  {field: 'orderId',width:100, title: '订单号'},
																	  {field: 'customName', title: '客户名字'},
																	  {field: 'returnNumber' ,title: '退货数'}
																  ]],required:true">
					<span class="tou">订单号</span><input id="orderAccount" name="orderAccount" type="text"
													   data-toggle="topjui-textbox"
													   data-options="width:180,readonly:true,required:true">
					<span class="tou">供应商名</span><input id="supplierName" name="supplierName"
														data-toggle="topjui-textbox"
														data-options="width:300,readonly:true"/>
					<span class="tou">供方材质</span><input id="supperSpec" name="supperSpec"
														data-toggle="topjui-textbox"
														data-options="width:90,readonly:true"/>

				</div>
				<div class="row">
					<span class="tou">材质</span><input id="materialName" name="materialName"
													  data-toggle="topjui-textbox"
													  data-options="width:90,readonly:true"/>
					&nbsp;楞型&nbsp;<input id="pitType" name="pitType"
										 data-toggle="topjui-textbox"
										 data-options="width:85,readonly:true"/>
					&nbsp;尺寸&nbsp;<input id="blankingSize" name="blankingSize"
										 data-toggle="topjui-textbox"
										 data-options="width:181,readonly:true"/>
					<span class="tou">宽度压线</span><input id="widthLine" name="widthLine"
														data-toggle="topjui-textbox"
														data-options="width:300,readonly:true"/>
					<span class="tou">压线类型</span><input id="lineType" name="lineType"
														data-toggle="topjui-textbox"
														data-options="width:90,readonly:true"/>
				</div>
				<div class="row">
					<span class="tou">单价</span><input id="purPrice" name="purPrice"
													  data-toggle="topjui-textbox"
													  data-options="width:90,readonly:true"/>
					<span class="tou">来料数</span><input id="materialsNumber" name="materialsNumber"
													   data-toggle="topjui-textbox"
													   data-options="width:90,readonly:true"/>
					<span class="tou">退货数</span><input id="returnNumber" name="returnNumber"
													   data-toggle="topjui-textbox"
													   data-options="width:90,readonly:true,
																onChange:function(newValue,oldValue){
                                                                    $('#rejectedNum').iNumberbox('setValue',newValue);
																}"/>
				</div>
				<fieldset>
					<legend>处理结果</legend>
				</fieldset>
				<div class="row">
					<span class="tou">退货数量</span><input id="rejectedNum" name="rejectedNum"
														data-toggle="topjui-numberbox"
														data-options="width:90,required:true,min:0,groupSeparator:'',validType:['length[0,10]']"/>
					<span class="tou">补数</span><input id="compensateMoney" name="compensateMoney"
														data-toggle="topjui-numberbox"
														data-options="width:90,min:0,groupSeparator:'',validType:['length[0,8]']"/>
					<span class="tou">直接退赔</span><input id="money" name="money"
														data-toggle="topjui-numberbox"
														data-options="width:90,min:0,precision:2,groupSeparator:'',validType:['length[0,8]']"/>
					<span class="tou">经手人</span><input id="registrant" name="registrant" value="${adminName}"
													   data-toggle="topjui-textbox"
													   data-options="width:90,validType:['length[0,10]']"/>
				</div>
				<div class="row" >
					<span class="tou">退货原因</span><input id="causeOfReturn" name="causeOfReturn"
														data-toggle="topjui-textbox"
														data-options="width:300,validType:['length[0,30]']"/>
					<span class="tou">备注</span><input id="rejectedRemarks" name="rejectedRemarks"
													  data-toggle="topjui-textbox"
													  data-options="width:500,validType:['length[0,250]']"/>
				</div>
			</div>
		</div>
	</form>
</div>

<div id="footer" class="hidden" style="height: 34px; padding: 5px; text-align: right;">
	<a href="#"
	   data-toggle="topjui-linkbutton"
	   data-options="id:'submitBtn',
			                   iconCls:'fa fa-save',
			                   form:{
			                       id:'formId',
			                       method:'submit',
			                       url:'/PurRejected/addPurRejected/',
			                       <%--refreshRefererTab:true,--%>
			                       <%--closeCurrentTab:true--%>
			                   }">提交</a>
</div>

<script type="text/javascript">

    $(function(){
        var dat = new Date().Format("yyyy-MM-dd");
        // $("#deliveryTime").iDatetimebox("setValue",dat);
        $("#rejectedTime").iDatebox("setValue",dat);
    });



</script>
</body>
</html>
