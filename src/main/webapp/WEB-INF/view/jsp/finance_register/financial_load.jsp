<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>财务应收款调整</title>

      <meta http-equiv="pragma" content="no-cache">
      <meta http-equiv="cache-control" content="no-cache">
      <meta http-equiv="expires" content="0">
      <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
      <meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
      <!-- 导入公共样式 -->
      <%@ include file="../ap.jsp" %>
    <!-- layui框架js -->
  </head>
  
  <body>
  <div data-toggle="topjui-layout" data-options="fit:true">
      <div data-toggle="topjui-panel" title="" data-options="fit:true,iconCls:'icon-ok',footer:'#footer'">
          <c:if test="${receiptRecordId!=null}">
        <form class="hidden" method="post" data-toggle="topjui-form" data-options="id:'formId',
           url:'/LoanBack/findById/?receiptRecordId=${receiptRecordId}',
           editor:[
               {id:'remarkAddEditor',field:'remark'}
           ]">
            <input type="hidden" id="receiptRecordId" name="receiptRecordId">
            </c:if>
                <c:if test="${paymentRecordId!=null}">
                <form class="hidden" method="post" data-toggle="topjui-form" data-options="id:'formId',
           url:'/PayLoad/findById/?paymentRecordId=${paymentRecordId}',
           editor:[
               {id:'remarkAddEditor',field:'remark'}
           ]">
                    <input type="hidden" id="paymentRecordId" name="paymentRecordId">
                    </c:if>
            <div class="topjui-container">
                <table class="atable">
         <div style="margin-top:30px">
             <c:if test="${receiptRecordId!=null}">
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="text-align:center;">客户名称</span><input name="customName" data-toggle="topjui-textbox"
	  								data-options="width:150,readonly:true">
                 </c:if>
                 <c:if test="${paymentRecordId!=null}">
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;产品名称<input name="cartonName"  data-toggle="topjui-textbox" data-options="width:150,readonly:true"/>
             </c:if>
             <%--订单号<input name="orderAccount"  data-toggle="topjui-combobox" data-options="id:'orderAccount',onSelect: function (index){
                                                  $('#financeDate').iTextbox('setValue',index['orderTime']);
                                                  $('#receivableAdjustmentPrice').iTextbox('setValue',index['cartonPrice']);
                                                  $('#receivableAdjustmentTotal').iTextbox('setValue',index['cartonTotal']);},width:150,idField: 'orderAccount',
								                  textField: 'orderAccount',
								                  valueField: 'orderAccount'"/>--%>
         </div>
            <fieldset>
                <legend><b>调整前</b></legend>
            </fieldset>
            <div style="margin-top:30px">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="text-align:center;">时间</span><input id="financeDate" name="financeDate"data-toggle="topjui-textbox"
                                                        data-options="width:150,readonly:true">
                    <%--单价<input id="receivableAdjustmentPrice" name="receivableAdjustmentPrice" type="text" data-toggle="topjui-textbox"
                             data-options="width:150,readonly:true">--%>
                    总金额<input id="receivableAdjustmentTotal" name="receivableAdjustmentTotal" data-toggle="topjui-textbox"
                             data-options="width:150,readonly:true">

            </div>
            <fieldset>
                <legend><b>需调整</b></legend>
            </fieldset>
         <div style="margin-top:30px">
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="text-align:center;">调整时间</span><input name="receivableAdjustmentDate" data-toggle="topjui-datetimebox"
                      data-options="width:150">
             <%--调整单价<input name="receivableAdjustmentAfterPrice" type="text" data-toggle="topjui-numberbox"
                        data-options="min:0,precision:2,width:150">--%>
             调整金额<input name="receivableAdjustmentAfterTotal"  data-toggle="topjui-numberbox" data-options="min:0,precision:2,width:150,validType:['length[0,12]']"/>
             &nbsp;&nbsp;&nbsp;类别<input name="receivableAdjustmentType" data-toggle="topjui-combobox" data-options="width:150,data: [{
			text: '盘盈',
			value: '1'
		},{
			text: '盘亏',
			value: '2'
		}]"/>
         </div>   
         <div style="margin-top:30px">
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="text-align:center;">备注</span><input name="receivableAdjustmentRemarks" data-toggle="topjui-textbox" data-options="width:600,validType:['length[0,50]']"/>
         </div>
         <div style="margin-top:30px">
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="text-align:center;">调整人</span><input name="financeRegisters" data-toggle="topjui-textbox" data-options="width:150,readonly:true" value="${adminName}"/>
         </div>
        <%-- <div style="text-align:center;margin-top:20px;width:600px">
             <a data-toggle="topjui-linkbutton"
                data-options="id:'submitBtn',
                   iconCls:'fa fa-save',
                   form:{
                       id:'formId',
                       title:'财务应收款调整',
                       method:'submit',
                       url:'/PayLoad/AddPay/',
                       &lt;%&ndash;refreshRefererTab:true,&ndash;%&gt;
                       &lt;%&ndash;closeCurrentTab:true,&ndash;%&gt;
                   }" class="layui-btn">保存</a>
            &lt;%&ndash;<button class="layui-btn" type="submit">保存</button>&ndash;%&gt;
         </div>--%>
                </table>
            </div>
       </form>
      </div>
  </div>
  <div id="footer" class="hidden" style="height: 34px; padding: 5px; text-align: right;">
      <%--<c:if test="${printedId==null}">--%>
          <a href="#"
             data-toggle="topjui-linkbutton"
             data-options="id:'submitBtn',
                   iconCls:'fa fa-save',
                   form:{
                       id:'formId',
                       title:'调整',
                       method:'submit',
                       url:'/ReceivableAdjustmentController/AddReceivable/',
                       refreshRefererTab:true,
                       closeCurrentTab:true,
                   }">提交</a>
      <%--</c:if>
      <c:if test="${printedId!=null}">
          <a href="#"
             data-toggle="topjui-linkbutton"
             data-options="id:'submitBtn',
                   iconCls:'fa fa-save',
                   form:{
                       id:'formId',
                       title:'编辑成品退货赔偿',
                       method:'submit',
                       url:'/RejectedController/updataRejected/',
                       refreshRefererTab:true,
                       closeCurrentTab:true,
                   }">编辑</a>
      </c:if>--%>
      <a href="#"
         data-toggle="topjui-linkbutton"
         data-options="id:'submitBtn',
                   iconCls:'fa fa-exchange',
                   btnCls:'topjui-btn-black',
                   form:{
                       id:'formId',
                       method:'reset'
                   }">重置</a>
      <a href="#"
         data-toggle="topjui-linkbutton"
         data-options="id:'submitBtn',
                   iconCls:'fa fa-trash',
                   btnCls:'topjui-btn-red',
                   form:{
                       id:'formId',
                       method:'clear'
                   }">清空</a>
  </div>
  </body>
</html>
