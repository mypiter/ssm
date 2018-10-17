<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

    <title>成品库存借调</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <!-- 导入公共样式 -->
    <%@ include file="../ap.jsp" %>
</head>
<style>
    .gloal{width: 100%;height: 100%;}
    .gloal .hang{margin: 4px auto;}
</style>
<body>
<div data-toggle="topjui-layout" data-options="fit:true">
    <div data-toggle="topjui-panel" title="" data-options="fit:true,iconCls:'icon-ok',footer:'#footer'">
        <form class="hidden" method="post" data-toggle="topjui-form" data-options="id:'formId',
          <%-- url:'',--%>
           editor:[
               {id:'remarkAddEditor',field:'remark'}
           ]">
            <div class="hang">
                <span>&nbsp;借调日期&nbsp;</span><input type="text" id="cartonLoanTime" name="cartonLoanTime" data-toggle="topjui-datetimebox" data-options="width:200,required:true">
            </div>
            <fieldset>
                <legend><b>被借调客户</b></legend>
            </fieldset>
            <div class="hang">
                <span>客户名称</span>
                <input type="text" name="bSecondedCustomer"
                       data-toggle="topjui-combobox"
                       data-options="id:'customName',width:200,required:true,
           idField: 'customerName',
           textField: 'customerName',
           valueField: 'customerName',
           url:'/Mian/selectBylist/',
           prompt:'必填',childCombobox:{
                           id:'orderAccounts',
                           url:'/CartonStock/findByCustom/?customName={parentValue}'
                       }">
                <span>&nbsp;订&nbsp;单&nbsp;号&nbsp;</span>
                <input type="text" name="bOrderAccount"
                       style="width: 200px"
                       data-toggle="topjui-combobox"
                       data-options="id:'orderAccounts',width:200,required:true,
           onSelect: function (index){
                $('#rejectedProduct').iTextbox('setValue',index['productName']);
                $('#rejectedSpec').iTextbox('setValue',index['size']);
                $('#materialName').iTextbox('setValue',index['materialScience']);
                $('#pitType').iTextbox('setValue',index['pitType']);
                $('#bStockNum').iTextbox('setValue',index['stockNum']);
                 },

           idField: 'orderAccount',
           textField: 'orderAccount',
           valueField: 'orderAccount',
           <%--fitColumns:true,--%>
           <%--url:'/PlaceController/select/',--%><%--
           columns:[[
               {field: 'orderAccount',width:100, title: '订单号'},
               {field: 'customName', title: '客户'}
           ]],--%>prompt:'必填'">
                <span>&nbsp;登&nbsp;记&nbsp;人&nbsp;</span>
                <input type="text" name="staffName" value="${adminName }"
                       style="width: 200px"
                       data-toggle="topjui-textbox"
                       data-options="width:200,prompt:'必填',required:true">
                <span>&nbsp;库存数量&nbsp;&nbsp;</span><input type="text" id="bStockNum" name="bStockNum" data-toggle="topjui-textbox" data-options="readonly:true"  style="width:200px;">

            </div>
            <div class="hang">
                <span>&nbsp;产品名称&nbsp;</span><input type="text" id="rejectedProduct" name="bProductName" data-toggle="topjui-textbox" data-options="readonly:true" style="width:200px;">
                <span>&nbsp;规&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;格&nbsp;&nbsp;</span><input type="text" id="rejectedSpec" name="size" data-toggle="topjui-textbox" data-options="readonly:true"  style="width:200px;">
                <span>&nbsp;材&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;质&nbsp;&nbsp;</span><input type="text" id="materialName" name="material" data-toggle="topjui-textbox" data-options="readonly:true" style="width:200px;">
                <span>&nbsp;楞&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;型&nbsp;&nbsp;</span><input type="text" id="pitType" name="fluteType" data-toggle="topjui-textbox" data-options="readonly:true" style="width:200px;">
            </div>
            <fieldset>
                <legend><b>目标客户</b></legend>
            </fieldset>
            <div class="hang">
                <span>客户名称</span>
                <input type="text" name="secondedCustomer"
                       data-toggle="topjui-combobox"
                       data-options="id:'customNames',width:200,required:true,
           idField: 'customerName',
           textField: 'customerName',
           valueField: 'customerName',
           url:'/Mian/selectBylist/',
           prompt:'必填',childCombobox:{
                           id:'order',
                           url:'/CartonStock/findByCustom/?customName={parentValue}'
                       }">
                <span>&nbsp;订&nbsp;单&nbsp;号&nbsp;</span>
                <input type="text" name="orderAccount"
                       style="width: 200px"
                       data-toggle="topjui-combobox"
                       data-options="id:'order',width:200,required:true,
           idField: 'orderAccount',
           textField: 'orderAccount',
           valueField: 'orderAccount',
           <%--fitColumns:true,--%>
           <%--url:'/PlaceController/select/',--%><%--
           columns:[[
               {field: 'orderAccount',width:100, title: '订单号'},
               {field: 'customName', title: '客户'}
           ]],--%>prompt:'必填'">
                <span>借调数量</span>
                <input id="cartonLoanNum" type="text" name="cartonLoanNum"
                       style="width: 200px"
                       data-toggle="topjui-textbox"
                       data-options="width:200,prompt:'必填',required:true ,
                       onChange:function(newValue, oldValue){
                          var bStockNum=Number($('#bStockNum').iTextbox('getValue'));
                          if(bStockNum!='' && bStockNum<newValue){
                            alert('借调数不能大于被借调订单的库存数量！');
                            $('#cartonLoanNum').iTextbox('setValue','');
                          }
                       }">
            </div>
            <div class="hang">
                <span>&nbsp;备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注&nbsp;&nbsp;</span><input type="text" name="cent" data-toggle="topjui-textbox"  data-options="validType:['length[0,255]']" style="width:730px;">
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
			                       url:'/CartonLoan/addLoan/',
			                   }">提交</a>
    </div>
</div>
<script type="text/javascript">
    $(function(){
        var dat = getNowFormatDate();
        // $("#deliveryTime").iDatetimebox("setValue",dat);
        $("#cartonLoanTime").iDatetimebox("setValue",dat);
    });


    /*获取当前时间yyyy-MM-dd HH:MM:SS 开始*/
    function getNowFormatDate() {
        var date = new Date();
        var seperator1 = "-";
        var seperator2 = ":";
        var month = date.getMonth() + 1;
        var strDate = date.getDate();
        if (month >= 1 && month <= 9) {
            month = "0" + month;
        }
        if (strDate >= 0 && strDate <= 9) {
            strDate = "0" + strDate;
        }
        var currentdate = date.getFullYear() + seperator1 + month + seperator1 + strDate
            + " " + date.getHours() + seperator2 + date.getMinutes()
            + seperator2 + date.getSeconds();
        return currentdate;
    }
    /*获取当前时间yyyy-MM-dd HH:MM:SS 结束*/
</script>
</body>
</html>
