<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

    <title>成品退货赔偿</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <!-- 导入公共样式 -->
    <%@ include file="../ap.jsp" %>
</head>
<style>
    .gloal {
        width: 100%;
        height: 100%;
    }

    .gloal .hang {
        margin: 4px auto;
    }
</style>
<body>
<div data-toggle="topjui-layout" data-options="fit:true">
    <div data-toggle="topjui-panel" title="" data-options="fit:true,iconCls:'icon-ok',footer:'#footer'">
        <c:if test="${rejectedId!=null}">
        <form class="hidden" method="post" data-toggle="topjui-form" data-options="id:'formId',
           url:'/RejectedController/findById/?rejectedId=${rejectedId}',
           editor:[
               {id:'remarkAddEditor',field:'remark'}
           ]">
            </c:if>
            <c:if test="${rejectedId==null}">
            <form class="hidden" method="post" data-toggle="topjui-form" data-options="id:'formId',
          <%-- url:'',--%>
           editor:[
               {id:'remarkAddEditor',field:'remark'}
           ]">
                </c:if>
                <div class="hang">
                    <span>&nbsp;退赔日期&nbsp;</span><input type="text" id="compensateTime" name="compensateTime"
                                                        data-toggle="topjui-datetimebox"
                                                        data-options="width:200,required:true">
                    <span>&nbsp;仓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;库&nbsp;&nbsp;</span><input type="text" name="sex"
                                                                                          data-toggle="topjui-combobox"
                                                                                          data-options="data:[{value:1,text:'A'},{value:2,text:'B'},{value:3,text:'C'}],panelHeight:100"
                                                                                          style="width: 70px;">
                </div>
                <fieldset>
                    <legend><b>订单信息</b></legend>
                </fieldset>
                <div class="hang">
                    <span>客户名称</span>
                    <input type="text" name="customName"
                           data-toggle="topjui-combobox"
                           data-options="id:'customNames',width:200,
           idField: 'consignee',
           textField: 'consignee',
           valueField: 'consignee',
           url:'/CartonOutInfo/getList/',
           prompt:'必填',childCombobox:{
                           id:'deliveryNumber',
                           url:'/CartonOutInfo/getListByPid/?customName={parentValue}'
                       },required:true">
                    <span>&nbsp;送货单号&nbsp;</span>
                    <input type="text" name="deliveryNumber"
                           data-toggle="topjui-combobox"
                           data-options="id:'deliveryNumber',width:200,
           idField: 'deliveryNumber',
           textField: 'deliveryNumber',
           valueField: 'deliveryNumber',
           childCombobox:{
			   id:'orderAccount',
			   url:'/Cartonout/getListByPid/?deliveryNumber={parentValue}'
                       },prompt:'必填',required:true">
                    <span>&nbsp;订&nbsp;单&nbsp;号&nbsp;</span>
                    <input type="text" name="orderAccount"
                           data-toggle="topjui-combobox"
                           data-options="id:'orderAccount',width:200,
		   idField: 'orderAccount',
           textField: 'orderAccount',
           valueField: 'orderAccount',
           onSelect: function (index){
                $('#rejectedProduct').iTextbox('setValue',index['productName']);
                $('#rejectedSpec').iTextbox('setValue',index['specifications']);
                $('#materialName').iTextbox('setValue',index['materialName']);
                $('#pitType').iTextbox('setValue',index['pitTypeName']);
                $('#oderNum').iTextbox('setValue',index['orderNum']);
                $('#cartonPrice').iTextbox('setValue',index['cartonPrice']);
                $('#sss').iTextbox('setValue',index['outNum']);
                $('#rejectedCompany').val(index['customCompany']);
                $('#cartonTotal').iTextbox('setValue',(index['outNum']*index['cartonPrice']).toFixed(2));
                $('#tui').iTextbox('setValue',(index['returnNum']));
                },
           required:true,prompt:'必填'">
                    <span>&nbsp;登&nbsp;记&nbsp;人&nbsp;</span>
                    <input type="hidden" id="rejectedCompany" name="rejectedCompany">
                    <input type="text" name="staffName"
                           style="width: 200px" value="${adminName }"
                           data-toggle="topjui-textbox" data-options="readonly:true">
                </div>
                <div class="hang">
                    <span>&nbsp;产品名称&nbsp;</span><input type="text" id="rejectedProduct" name="rejectedProduct"
                                                        data-toggle="topjui-textbox" data-options="readonly:true"
                                                        data-options="" style="width:200px;">
                    <span>&nbsp;规&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;格&nbsp;&nbsp;</span><input type="text" id="rejectedSpec"
                                                                                          name="rejectedSpec"
                                                                                          data-toggle="topjui-textbox"
                                                                                          data-options="readonly:true"
                                                                                          style="width:200px;">
                    <span>&nbsp;材&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;质&nbsp;&nbsp;</span><input type="text" id="materialName"
                                                                                          name="materialName"
                                                                                          data-toggle="topjui-textbox"
                                                                                          data-options="readonly:true"
                                                                                          style="width:200px;">
                    <span>&nbsp;楞&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;型&nbsp;&nbsp;</span><input type="text" id="pitType"
                                                                                          name="pitType"
                                                                                          data-toggle="topjui-textbox"
                                                                                          data-options="readonly:true"
                                                                                          style="width:200px;">
                </div>
                <div class="hang">
                    <span>&nbsp;送货数量&nbsp;</span><input type="text" id="sss" name="sss" data-toggle="topjui-textbox"
                                                        data-options="readonly:true"
                                                        style="width:200px;">
                    <span>&nbsp;单&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;价&nbsp;&nbsp;</span><input type="text" id="cartonPrice"
                                                                                          name="cartonPrice"
                                                                                          data-toggle="topjui-textbox"
                                                                                          data-options="readonly:true"

                                                                                          style="width:200px;">
                    <span>&nbsp;金&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;额&nbsp;&nbsp;</span><input  type="text" id="cartonTotal"
                                                                                          name="cartonTotal"
                                                                                          data-toggle="topjui-textbox"
                                                                                          data-options="readonly:true"
                                                                                          style="width:200px;">
                    <input type="hidden" id="tuihuo" value="">
                </div>
                <fieldset>
                    <legend><b>处理结果</b></legend>
                </fieldset>
                <div class="hang">
                    <span>&nbsp;退货数量&nbsp;</span><input id="tui" type="text" name="rejectedNum" data-toggle="topjui-numberbox"
                                                        data-options="width:200,required:true,min:0,
                                                        onChange:function(newValue, oldValue){
                                                          if(newValue<oldValue){
                                                              alert('退货数不能大于已录退货数量！');
                                                          }
                                                       }">
                    <span>&nbsp;退货类别&nbsp;</span><input id="compensateType" name="compensateType" data-toggle="topjui-combobox" data-options="data: [{
			text: '直接赔款',
			value: '1'
		},{
			text: '补数',
			value: '2'
		}],valueField: 'value',textField: 'text',onChange:function(obj){
            var as=$('#compensateType').combobox('getValue');
		if(as=='1'){
		document.getElementById('hjlxdiv').style.display='block';
		document.getElementById('djlxdiv').style.display='none';
		}else if(as=='2'){
		document.getElementById('djlxdiv').style.display='block';
		document.getElementById('hjlxdiv').style.display='none';
		}
		}<%--,formatter: function (row) {
        var opts = $(this).combobox('options');
        return row[opts.textField]
                    }--%>" style="width:200px;">
                    <div id="hjlxdiv" style="display: none;" >
                    <span>&nbsp;退货金额&nbsp;</span><input type="text" name="compensateMoney"
                                                        data-toggle="topjui-numberbox"
                                                        data-options="id:'compensateMoney',min:0,max:9999999.99,precision:2,prompt:'保留2位小数'" style="width:200px;"></div>
                    <div id="djlxdiv" style="display: none;" >
                    <span>&nbsp;补数数量&nbsp;</span><input type="text" name="refillNum" data-toggle="topjui-numberbox"
                                                        data-options="id:'refillNum',width:200,min:0,max:99999,validType:['length[0,5]']"></div>
                </div>
                <div class="hang">
                    <span>&nbsp;备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注&nbsp;&nbsp;</span><input type="text"
                                                                                          name="rejectedRemarks"
                                                                                          data-toggle="topjui-textbox"
                                                                                          data-options="validType:['length[0,250]']"
                                                                                          style="width:730px;">
                </div>
            </form>
    </div>
</div>
<div id="footer" class="hidden" style="height: 34px; padding: 5px; text-align: right;">
    <c:if test="${printedId==null}">
        <a href="#"
           data-toggle="topjui-linkbutton"
           data-options="id:'submitBtn',
                   iconCls:'fa fa-save',
                   form:{
                       id:'formId',
                       title:'成品退货赔偿',
                       method:'submit',
                       url:'/RejectedController/addRejected/',
                       <%--refreshRefererTab:true,--%>
                       <%--closeCurrentTab:true,--%>
                   }">提交</a>
    </c:if>
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
    </c:if>
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
<script type="text/javascript">
    $(function(){
        var dat = getNowFormatDate();
        // $("#deliveryTime").iDatetimebox("setValue",dat);
        $("#compensateTime").iDatetimebox("setValue",dat);
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
