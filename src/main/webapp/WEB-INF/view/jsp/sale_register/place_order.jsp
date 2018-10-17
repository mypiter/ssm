<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>下单</title>

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
    <style type="text/css">
        .atable{
            border:1px solid black;
            width:1000px;
        }
        .atable tr td{
            border:1px solid black;
            margin:0;
            padding:0;
            text-align:center;
        }
        .btable{
            border:1px solid black;
            width:900px;
        }
        .btable tr td{
            border:1px solid black;
            margin:0;
            padding:0;
            text-align:center;
        }

        .globle{margin: 20px 0;}
        .globle .row{margin: 5px 0;}
        .globle .row .tou{display: inline-block; width: 70px;text-align: center}

    </style>
</head>
<body>
<div data-toggle="topjui-layout" data-options="fit:true">
    <div data-toggle="topjui-panel" title="" data-options="fit:true,iconCls:'icon-ok',footer:'#footer'">
        <c:if test="${placeId!=null}">
            <form class="hidden" method="post" data-toggle="topjui-form" data-options="id:'formId',
               url:'/PlaceController/from/?placeId=${placeId}',
               editor:[
                   {id:'remarkAddEditor',field:'remark'}
               ]">
                <input type="hidden" name="id">
        </c:if>
        <c:if test="${placeId==null}">
        <form class="hidden" method="post" data-toggle="topjui-form" data-options="id:'formId',
           editor:[
               {id:'remarkAddEditor',field:'remark'}
           ]">
        </c:if>

            <div class="topjui-container">
                <div class="globle">
                    <div class="row">
                        <span class="tou">客户名称</span><input type="text" id="customCompany" name="customCompany"
                                                            data-toggle="topjui-combogrid"
                                                            data-options="id:'customNames1',width:300,panelWidth:400,
                                                           <%--onChange:function(newValue,oldValue){filling(newValue);},--%>
                                                           onSelect: function (index,row){
                                                           <%--$('#Cust').combogrid('grid').datagrid('loadData', source);--%>
                                                           <%--$('#cartonName').combogrid('grid').datagrid({url:'/ProductRegister/dropSelect/'});--%>
                                                                <%--console.log(index+','+row['customCompany']);--%>
                                                                $('#customName').iTextbox('setValue',row['customName']);
                                                                $('#deliveryAddress').iTextbox('setValue',row['customAddress']);
                                                                <%--$('#customId').iTextbox('setValue',row['customId']);--%>
                                                                $('#staffId').iTextbox('setValue',row['staffId']);
                                                                $('#customTel').val(row['customTel']);
                                                                $('#customId').val(row['customId']);},
                                                           idField: 'customCompary',
                                                           textField: 'customCompary',
                                                           fitColumns:true,
                                                           url:'/CustomController/select/',
                                                           columns:[[
                                                                {field: 'customCompary',width:100, title: '客户公司'},
                                                               {field: 'customName',width:100, title: '联系人'},
                                                               {field: 'customTel',width:100, title: '联系电话'}
                                                           ]],prompt:'必填',required:true,validType:['length[0,30]']">
                                                        <input type="hidden" id="customTel" name="customTel">
                                                        <input type="hidden" id="customId" name="customId">
                        <span class="tou">业务员</span><input type="text" id="staffId" name="staffId"
                                                                   data-toggle="topjui-combogrid"
                                                                   data-options="id:'staffNames',width:100,
                                                                       idField: 'staffName',
                                                                       textField: 'staffName',
                                                                       fitColumns:true,
                                                                       url:'/StaffTable/findByBusiness/?type=1',
                                                                       columns:[[
                                                                           {field: 'staffName',width:100, title: '业务员姓名'}
                                                                       ]],validType:['length[0,10]']">
                        <span class="tou">联系人</span><input type="text" id="customName" name="customName" data-toggle="topjui-textbox" data-options="width:380,validType:['length[0,50]']"/>
                    </div>
                    <fieldset>
                        <legend>订单信息</legend>
                    </fieldset>

                    <div class="row">
                        <span class="tou">订单号</span><input type="text" id="orderAccount" name="orderAccount" data-toggle="topjui-textbox" data-options="width:150,readonly:true"/>
                    </div>
                    <c:if test="${placeId==null}">
                        <script type="text/javascript">
                            $(function () {
                                //生成当前订单的订单号
                                $.ajax({
                                    url:'/PlaceController/generateOrderAccount/',
                                    dataType:'json',
                                    success:function(data){
                                        $("#orderAccount").iTextbox("setValue",data.orderAccount);
                                    }
                                });
                                    var dat = new Date().Format("yyyy-MM-dd");
                                    // $("#deliveryTime").iDatetimebox("setValue",dat);
                                    $("#orderTime").iDatebox("setValue",dat);
                                    /*默认工序*/
                                    var as=$("#workingProcedure").iTextbox('getValue');
                                    var sss='';
                                    if(as!=''){
                                        $.ajax({
                                            type: 'GET',
                                            url: '/WorkingProcedure/finds/',
                                            data: {newValue:as},
                                            dataType: 'json',
                                            success: function(data){

                                                for(var i=0;i<data.length;i++){
                                                    sss+=data[i].name+',';
                                                }
                                                $('#ns').iTextbox('setValue',sss);
                                            }
                                        });
                                    }
                                    $('#cuttingNum').iCombobox('setValue','1*1');
                            });
                        </script>
                    </c:if>
                    <div class="row">
                        <span class="tou">产品名称</span><input type="text" id="cartonName" name="cartonName"
                                               data-toggle="topjui-combogrid"
                                               data-options="id:'customNames2',width:300,panelWidth:450,
                                                               <%--onChange:function(newValue,oldValue){filling(newValue);},--%>
                                                               onSelect: function (index,row){
                                                                    <%--console.log(row);--%>
                                                                    <%--console.log(index+','+row['customCompany']);--%>
                                                                    $('#cartonType').iCombogrid('setValue',row['boxName']);
                                                                    $('#sizeType').iCombobox('setValue',row['sizeType']);
                                                                    $('#cartonLength').iNumberbox('setValue',row['cartonLength']);
                                                                    $('#cartonWidth').iNumberbox('setValue',row['cartonWidth']);
                                                                    $('#cartonHeight').iNumberbox('setValue',row['cartonHeight']);
                                                                    $('#materialScience').iTextbox('setValue',row['materialName']);
                                                                    $('#pitType').iCombogrid('setValue',row['pitType']);
                                                                    $('#cartonPrice').iNumberbox('setValue',row['cartonPrice']);
                                                                    $('#lengthLine').iTextbox('setValue',row['lengthLine']);
                                                                    $('#widthLine').iTextbox('setValue',row['widthLine']);
                                                                    $('#lineType').iCombobox('setValue',row['lineType']);
                                                                    $('#cartonColor').iTagbox('setValue',row['colorNum']);
                                                                    $('#workingProcedure').val(row['workingProcedure']);
                                                                    $('#cardboardLength').iNumberbox('setValue',row['cardLength']);
                                                                    $('#cardboardWidth').iNumberbox('setValue',row['cardWidth']);
                                                                    $('#blankingLength').iNumberbox('setValue',row['cardLength']);
                                                                    $('#blankingWidth').iNumberbox('setValue',row['cardWidth']);
                                                                    $('#plateId').iTextbox('setValue',row['knifePlateNum']);
                                                                    $('#plateName').iCombogrid('setValue',row['knifePlateName']);
                                                                    $('#platesId').iTextbox('setValue',row['printedId']);
                                                                    $('#platesName').iCombogrid('setValue',row['printedName']);
                                                                    $('#combinationMode').iCombobox('setValue',row['combinationMode']);
                                                                    $('#nailingNum').iNumberbox('setValue',row['nailingNum']);
                                                                    $('#cartonImage').val(row['cartonImage']);
                                                                    $('#cartonplantModel2Id').val(row['cartonId']);
                                                                    $('#cartonImage').val(row['cartonImage']);
                                                                    $('#carton_id').val(row['boxId']);
                                                                    $('#pit_id').val(row['pitId']);
                                                                    $('#knifePicture').val(row['knifePicture']);
                                                                    $('#printPicture').val(row['printPicture']);
                                                                    $('#cartonNumber').iTextbox('setValue',row['cartonNumber']);
                                                                    $('#cartonSpec').iTextbox('setValue',row['cartonSpec']);
                                                                    <%--$('#customName').val(row['customName']);--%>
                                                                    <%--$('#customTel').val(row['customTel']);--%>
                                                                    },
                                                               idField: 'cartonName',
                                                               textField: 'cartonName',
                                                               fitColumns:true,
                                                               url:'/ProductRegister/dropSelect/',
                                                               columns:[[
                                                                   {field: 'cartonName',width:100, title: '产品名称'},
                                                                   {field: 'boxName',width:70, title: '箱型'},
                                                                   {field: 'customName',width:100, title: '客户名称'}
                                                               ]],prompt:'必填',required:true,validType:['length[0,20]']">
                                                                <input type="hidden" id="cartonplantModel2Id" name="cartonplantModel2Id">
                        &nbsp;箱型&nbsp;<input id="cartonType" name="cartonType"
                                                             data-toggle="topjui-combogrid"
                                                             data-options="width:150,required:true,validType:['length[0,50]'],
                                                                idField: 'cartonName',
                                                               textField: 'cartonName',
                                                               fitColumns:true,
                                                               url:'/CartonFormulaController/dropSelectCarton/',
                                                               onSelect: function (index,row){
                                                                 $('#carton_id').val(row['id']);
                                                                 jisuan();
                                                               },
                                                               columns:[[
                                                                   {field: 'cartonName',width:100, title: '箱型名称'}
                                                               ]]" />
                                                                <input type="hidden" id="carton_id" name="cartonId" onchange="jisuan()">
                        &nbsp;<input  id="sizeType" name="sizeType"
                                                             data-toggle="topjui-combobox"
                                                             data-options="data:[{text:'制造',value:'1',selected:true},
                                                             {text:'内径',value:'2'},
                                                             {text:'外径',value:'3'}],width:70,prompt:'必填',required:true,panelHeight:100"/>
                        长&nbsp;<input id="cartonLength" name="cartonLength"
                                            data-toggle="topjui-numberbox"
                                            data-options="onChange:function(newValue,oldValue){jisuan();},width:80,prompt:'长',required:true,min:0,groupSeparator:'',validType:['length[0,7]'],precision:1"/>
                        宽&nbsp;<input id="cartonWidth" name="cartonWidth"
                                            data-toggle="topjui-numberbox"
                                            data-options="onChange:function(newValue,oldValue){jisuan();},width:80,prompt:'宽',required:true,min:0,groupSeparator:'',validType:['length[0,7]'],precision:1"/>
                        高&nbsp;<input id="cartonHeight" name="cartonHeight"
                                            data-toggle="topjui-numberbox"
                                            data-options="onChange:function(newValue,oldValue){jisuan();},width:80,prompt:'高',required:true,min:0,groupSeparator:'',validType:['length[0,7]'],precision:1"/>
                        单位&nbsp;<input  id="cartonUnit" name="cartonUnit"
                                data-toggle="topjui-combobox"
                                data-options="data:[{text:'MM',value:'MM',selected:true},
                                                             {text:'CM',value:'CM'}],width:80,required:true,panelHeight:100"/>
                    </div>
                    <div class="row">
                        <span class="tou">材质</span><input id="materialScience" name="materialScience"
                                             data-toggle="topjui-textbox"
                                             data-options="width:150,prompt:'必填',required:true,validType:['checkMaterial','length[0,30]']"/>
                        &nbsp;楞型&nbsp;
                        <input id="pitType" name="pitType"
                               data-toggle="topjui-combogrid"
                               data-options="width:120,required:true,
                                                                idField: 'name',
                                                               textField: 'name',
                                                               fitColumns:true,
                                                               url:'/Flut/getQ/',
                                                               onSelect: function (index,row){
                                                                 $('#pit_id').val(row['id']);
                                                                 jisuan();
                                                               },
                                                               columns:[[
                                                                   {field: 'name', title: '楞型名称'}
                                                               ]]" />
                                                            <input type="hidden" id="pit_id" name="pitId">
                        <span class="tou">订单数</span><input  id="orderNum" name="orderNum" style="display: none"
                                                            data-toggle="topjui-numberbox"
                                                            data-options="width:100,prompt:'必填',required:true,min:0,
                                                            onChange:function(newValue,oldValue){
                                                                        var price = $('#cartonPrice').iNumberbox('getValue');//单价
                                                                        var openNumber = $('#openNumber').iNumberbox('getValue');//开数
                                                                        if(price!=''){
                                                                            var cartonTotal = newValue*price;
                                                                            $('#cartonTotal').iNumberbox('setValue',cartonTotal);
                                                                        }
                                                                        if(openNumber!=''&&openNumber!=0){
                                                                            $('#numberOfSpareParts').iNumberbox('setValue',Math.ceil(newValue/openNumber));
                                                                        }
                                                                    },min:0,groupSeparator:'',validType:['length[0,10]']"/>
                        &nbsp;单价&nbsp;<input  id="cartonPrice" name="cartonPrice"
                                              data-toggle="topjui-numberbox"
                                              data-options="width:80,prompt:'必填',required:true,min:0,precision:2,
                                              onChange:function(newValue,oldValue){
                                                        var orderNum = $('#orderNum').iNumberbox('getValue');
                                                        if(orderNum!=''){
                                                            var cartonTotal = newValue*orderNum;
                                                            $('#cartonTotal').iNumberbox('setValue',cartonTotal);
                                                        }
                                                        },groupSeparator:'',validType:['length[0,7]']"/>
                        &nbsp;金额&nbsp;<input  id="cartonTotal" name="cartonTotal"
                                              data-toggle="topjui-numberbox"
                                              data-options="width:110,prompt:'必填',required:true,min:0,precision:2,readonly:true,groupSeparator:'',validType:['length[0,10]']"/>
                        <span style="font-weight: bolder;font-size: 22px;">不含税</span>
                    </div>
                    <div class="row">
                        <span class="tou">长度压线</span><input id="lengthLine" name="lengthLine"
                                                            data-toggle="topjui-textbox"
                                                            data-options="width:250,prompt:'必填',required:true,validType:['length[0,100]'],
                                                                onChange:function(newValue,oldValue){
                                                                    var chang = 0;
                                                                    if(newValue!=''){
                                                                        var strk = newValue.split('|');
                                                                        for(var i=0;i<strk.length;i++){
                                                                            chang = Number(chang+Number(strk[i]));
                                                                        }
                                                                        $('#cardboardLength').iNumberbox('setValue',chang);
                                                                    }else{
                                                                        $('#cardboardLength').iNumberbox('setValue','');
                                                                    }
                                                                }"/>
                        宽度压线<input id="widthLine" name="widthLine"
                                                            data-toggle="topjui-textbox"
                                                            data-options="width:200,prompt:'必填',required:true,validType:['length[0,100]'],
                                                                onChange:function(newValue,oldValue){
                                                                    var kuan = 0;
                                                                    if(newValue!=''){
                                                                        var strk = newValue.split('|');
                                                                        for(var i=0;i<strk.length;i++){
                                                                            kuan = Number(kuan+Number(strk[i]));
                                                                        }
                                                                        $('#cardboardWidth').iNumberbox('setValue',kuan);
                                                                    }else{
                                                                        $('#cardboardWidth').iNumberbox('setValue','');
                                                                    }
                                                                }"/>
                        压线类型<input id="lineType" name="lineType"
                                                            data-toggle="topjui-combobox"
                                                            data-options="data:[{text:'明线',value:'1',selected:true},
                                                            {text:'暗线',value:'2'}],width:70,prompt:'必填',required:true,panelHeight:70"/>
                        颜色<!--<input id="cartonColor" name="cartonColor"
                                             data-toggle="topjui-tagbox"
                                             data-options="textField:'text',valueField:'text',hasDownArrow:true,
                                             data:[
                                             {id:1,text:'红'},
                                             {id:2,text:'黄'},
                                             {id:3,text:'蓝'},
                                             {id:4,text:'黑'},
                                             {id:3,text:'白'}],width:270,required:true,validType:['length[0,50]']"/>-->
                                            <input id="cartonColor" name="cartonColor" type="text" data-toggle="topjui-tagbox"
                                                   data-options="width:270,
                                                                      idField: 'id',
                                                                      textField: 'color',
                                                                      valueField:'color',
                                                                      hasDownArrow:true,
                                                                      url:'/Color/getList/',
                                                                      required:true,validType:['length[0,50]']"><a href="javascript:openNewTab1(4)" data-toggle="topjui-linkbutton"
                                                                                                                   data-options="text:'新增颜色',iconCls:null,btnCls:'green'"></a>
                    </div>
                    <div class="row">
                        <span class="tou">工序</span><input id="workingProcedure" value="kmyr" data-toggle="topjui-textbox"
                                                   data-options="width:430,prompt:'必填',required:true,
                                                   onChange:function(newValue,oldValue){
                                                        var sss='';
                                                        if(newValue!=''){
                                                            $.ajax({
                                                             type: 'GET',
                                                                        url: '/WorkingProcedure/finds/',
                                                                        data: {newValue:newValue},
                                                                        dataType: 'json',
                                                                        success: function(data){

                                                                        for(var i=0;i<data.length;i++){
                                                                        sss+=data[i].name+',';
                                                                        }
                                                                        console.log(sss);
                                                                        $('#ns').iTextbox('setValue',sss);
                                                                       }
                                                              });

                                                        }
                                                        }"/>
                                        <input id="ns" name="workingProcedure"  data-toggle="topjui-textbox"
                                               data-options="width:500,prompt:'必填',readonly:true"/>
                    </div>
                    <div class="row">
                        <span class="tou">产品编号</span><input id="cartonNumber" name="cartonNumber"
                                                            data-toggle="topjui-textbox"
                                                            data-options="width:80,prompt:'客户信息',validType:['length[0,10]']"/>
                        <span class="tou">合同编号</span><input id="contractNumber" name="contractNumber"
                                                            data-toggle="topjui-numberbox"
                                                            data-options="width:289,min:0,validType:['length[0,150]']"/>
                        <span class="tou">下单日期</span><input id="orderTime" name="orderTime"
                                                            data-toggle="topjui-datebox"
                                                            data-options="width:190,validType:['checkOrderTime']"/>
                        <span class="tou">交货日期</span><input id="deliveryTime" name="deliveryTime"
                                                            data-toggle="topjui-datebox"
                                                            data-options="width:168,required:true,validType:['checkDeliveryTime']"/>
                    </div>
                    <div class="row">
                        <%--<span class="tou">送货地址</span><input id="deliveryAddress" name="deliveryAddress"
                                                            data-toggle="topjui-textbox"
                                                            data-options="width:500,prompt:'必填',required:true,validType:['length[0,50]']"/>--%>
                        <span class="tou">产品规格</span><input id="cartonSpec" name="cartonSpec"
                                                            data-toggle="topjui-textbox"
                                                            data-options="width:120,prompt:'客户信息',validType:['length[0,20]']"/>
                        <span class="tou">送货备注</span><input id="deliveryRemarks" name="deliveryRemarks"
                                                            data-toggle="topjui-textbox"
                                                            data-options="width:555,validType:['length[0,255]']"/>
                        打包数<input id="packNum" name="packNum"
                                                            data-toggle="topjui-numberbox"
                                                            data-options="width:50,groupSeparator:'',validType:['length[0,10]']"/>
                            <input type="checkbox"  name="tz" value="1">更新
                            <input type="checkbox"  name="tz" value="2">录入
                    </div>
                    <fieldset>
                        <legend>纸板采购</legend>
                    </fieldset>
                    <div class="row">
                        <span class="tou">开数</span><input id="openNumber" name="openNumber" value="1"
                                                           data-toggle="topjui-numberbox"
                                                           data-options="width:45,prompt:'最大值20',required:true,min:0,
                                                                        onChange:function(newValue,oldValue){
                                                                        if(newValue!=''){
                                                                            var num = $('#orderNum').iNumberbox('getValue');//订单数
                                                                            if(num>0 && num!=''){
                                                                                $('#numberOfSpareParts').iNumberbox('setValue',Math.ceil(num/newValue));
                                                                            }
                                                                        }
                                                                        }"/>
                        <span class="tou">纸板尺寸</span>
                        <input id="cardboardLength" name="cardboardLength"
                               data-toggle="topjui-numberbox"
                               data-options="onChange:function(newValue,oldValue){
                                    if(newValue!=''){
                                        var longEdge=$('#longEdge').iNumberbox('getValue');
                                        var cuttingNum = $('#cuttingNum').iCombobox('getValue');
                                        var chang = cuttingNum.substring(0,cuttingNum.indexOf('*'));
                                        var luoliaochang = Number(newValue*chang+Number(longEdge)).toFixed(2);
                                        $('#blankingLength').iNumberbox('setValue',luoliaochang);
                                    }else{
                                        $('#blankingLength').iNumberbox('setValue','');
                                    }
                               },width:80,prompt:'长',prompt:'必填',required:true,min:0,groupSeparator:'',validType:['length[0,7]'],precision:2"/>
                        X
                        <input id="cardboardWidth" name="cardboardWidth"
                               data-toggle="topjui-numberbox"
                               data-options="onChange:function(newValue,oldValue){
                                    if(newValue!=''){
                                        var cuttingNum = $('#cuttingNum').iCombobox('getValue');
                                        var wideEdge=$('#wideEdge').iNumberbox('getValue');
                                        var kuan = cuttingNum.substring(cuttingNum.indexOf('*')+1);
                                        var luoliaokuan = Number(newValue*kuan+Number(wideEdge)).toFixed(2);
                                        $('#blankingWidth').iNumberbox('setValue',luoliaokuan);
                                    }else{
                                        $('#blankingWidth').iNumberbox('setValue','');
                                    }
                               },width:80,prompt:'宽',prompt:'必填',required:true,min:0,groupSeparator:'',validType:['length[0,7]'],precision:2"/>
                        <span class="tou">落料尺寸</span>
                        <input id="blankingLength" name="blankingLength"
                               data-toggle="topjui-numberbox"
                               data-options="width:80,prompt:'长',prompt:'必填',required:true,min:0,groupSeparator:'',validType:['length[0,7]'],precision:2"/>
                        X
                        <input id="blankingWidth" name="blankingWidth"
                               data-toggle="topjui-numberbox"
                               data-options="width:80,prompt:'宽',prompt:'必填',required:true,min:0,groupSeparator:'',validType:['length[0,7]'],precision:2"/>
                        &nbsp;模切数&nbsp;<input id="cuttingNum" name="cuttingNum"
                                               data-toggle="topjui-combobox"
                                               data-options="width:80,prompt:'必填',
                                               onChange:function(newValue,oldValue){
                                                    var cardboardLength = $('#cardboardLength').iNumberbox('getValue');
                                                    var cardboardWidth = $('#cardboardWidth').iNumberbox('getValue');
                                                    var longEdge=$('#longEdge').iNumberbox('getValue');
                                                    var wideEdge=$('#wideEdge').iNumberbox('getValue');
                                                    if(cardboardLength!=''){
                                                        var chang = newValue.substring(0,newValue.indexOf('*'));
                                                        var luoliaochang = Number(cardboardLength*chang+Number(longEdge)).toFixed(2);
                                                        $('#blankingLength').iNumberbox('setValue',luoliaochang);
                                                    }
                                                    if(cardboardWidth!=''){
                                                        var kuan = newValue.substring(newValue.indexOf('*')+1);
                                                        var luoliaokuan = Number(cardboardWidth*kuan+Number(wideEdge)).toFixed(2);
                                                        $('#blankingWidth').iNumberbox('setValue',luoliaokuan);
                                                    }
                                               },
                                                data:[{text:'1*1',value:'1*1'},
                                                {text:'1*2',value:'1*2'},
                                                {text:'2*1',value:'2*1'},
                                                {text:'2*2',value:'2*2'},
                                                {text:'1*3',value:'1*3'},
                                                {text:'3*1',value:'3*1'},
                                                {text:'3*3',value:'3*3'}],required:true" />
                        &nbsp;备料数&nbsp;<input id="numberOfSpareParts" name="numberOfSpareParts"
                                                           data-toggle="topjui-numberbox"
                                                           data-options="width:85,prompt:'必填',required:true,min:0,groupSeparator:'',validType:['length[0,10]']"/>
                        是否样箱&nbsp;<input  id="isSampleBox" name="isSampleBox"
                                                            data-toggle="topjui-combobox"
                                                            data-options="data:[{text:'否',value:'1',selected:true},
                                                                             {text:'是',value:'2'}],width:80,prompt:'必填',required:true,panelHeight:70"/>
                    </div>
                    <div class="row">
                        <span class="tou">门幅</span><input id="fabricWidth" name="fabricWidth"
                                                          data-toggle="topjui-numberbox"
                                                          data-options="width:70,min:0,groupSeparator:'',validType:['length[0,10]'],precision:2"/>
                        <span class="tou">门幅倍数</span><input id="fabricBei" name="fabricBei"
                                                            data-toggle="topjui-combobox"
                                                            data-options="width:60,
                                                            data:[{text:'*2',value:'1'},
                                                            {text:'*3',value:'2'},
                                                            {text:'*4',value:'3'},
                                                            {text:'*5',value:'4'},
                                                            {text:'*6',value:'5'},
                                                            {text:'*7',value:'6'},
                                                            {text:'*8',value:'7'}],prompt:'必填'"/>
                        <span class="tou">长加边</span><input id="longEdge" name="longEdge"
                                                           data-toggle="topjui-numberbox"
                                                           data-options="onChange:function(newValue,oldValue){
                                                                var cardboardLength = $('#cardboardLength').iNumberbox('getValue');
                                                                var blankingLength = $('#blankingLength').iNumberbox('getValue');
                                                                if(cardboardLength!=''){
                                                                    if(newValue==''){
                                                                        <%--var cha = Number(newValue-oldValue).toFixed(2);--%>
                                                                        $('#blankingLength').iNumberbox('setValue',Number(Number(blankingLength)-Number(oldValue)).toFixed(2));
                                                                    }else{
                                                                        var cha = Number(newValue-oldValue).toFixed(2);
                                                                        $('#blankingLength').iNumberbox('setValue',Number(Number(blankingLength)+Number(cha)).toFixed(2));
                                                                    }
                                                                }
                                                           },width:60,min:0,precision:2,groupSeparator:'',validType:['length[0,7]']"/>
                        <span class="tou">宽加边</span><input id="wideEdge" name="wideEdge"
                                                           data-toggle="topjui-numberbox"
                                                           data-options="onChange:function(newValue,oldValue){
                                                                var cardboardWidth = $('#cardboardWidth').iNumberbox('getValue');
                                                                var blankingWidth = $('#blankingWidth').iNumberbox('getValue');
                                                                if(cardboardWidth!=''){
                                                                    if(newValue==''){
                                                                         <%--var cha = Number(newValue-oldValue).toFixed(2);--%>
                                                                        $('#blankingWidth').iNumberbox('setValue',Number(Number(blankingWidth)-Number(oldValue)).toFixed(2));
                                                                    }else{
                                                                        var cha = Number(newValue-oldValue).toFixed(2);
                                                                        $('#blankingWidth').iNumberbox('setValue',Number(Number(blankingWidth)+Number(cha)).toFixed(2));
                                                                    }
                                                                }

                                                           },width:60,min:0,precision:2,groupSeparator:'',validType:['length[0,7]']"/>

                        <span class="tou">采购备注</span><input id="purchaseRemarks" name="purchaseRemarks"
                                                          data-toggle="topjui-textbox"
                                                          data-options="width:380,validType:['length[0,255]']"/>
                    </div>
                    <fieldset>
                        <legend>纸箱参数</legend>
                    </fieldset>
                    <div class="row">
                        <span class="tou">模板编号</span>
                        <input id="plateId" name="plateId"
                               data-toggle="topjui-textbox"
                               data-options="width:100"/>
                        <input id="plateName" name="plateName" type="text" data-toggle="topjui-combogrid"
                               data-options="id:'plateNamesss',width:100,
                                           <%--onChange:function(newValue,oldValue){filling(newValue);},--%>
                                           onSelect: function (index,row){
                                                <%--console.log(index+','+row['customCompany']);--%>
                                                $('#plateId').iTextbox('setValue',row['knifePlateNum']);
                                                $('#knifePicture').val(row['knifePicture']);},
                                           idField: 'knifeTemplateName',
                                           textField: 'knifeTemplateName',
                                           fitColumns:true,
                                           url:'/KnifeTemplate/KnifeTemplateSelect/',
                                           columns:[[
                                               {field: 'knifePlateNum',width:100, title: '编号'},
                                               {field: 'knifeTemplateName',width:100, title: '名称'}
                                           ]],prompt:'必填',panelWidth:200">
                        <input type="hidden" id="knifePicture" name="knifePicture">
                        <a href="javascript:openNewTab(1)" data-toggle="topjui-linkbutton"
                           data-options="text:'模版查看',iconCls:null,btnCls:'green'"></a>
                        <a href="javascript:openNewTab1(1)" data-toggle="topjui-linkbutton"
                           data-options="text:'模版上传',iconCls:null,btnCls:'green'"></a>
                        <span class="tou">印版编号</span>
                        <input id="platesId" name="platesId"
                               data-toggle="topjui-textbox"
                               data-options="width:100"/><%--,readonly:true--%>
                        <input id="platesName" name="platesName" type="text" data-toggle="topjui-combogrid"
                               data-options="id:'customNames',width:100,
                                           <%--onChange:function(newValue,oldValue){filling(newValue);},--%>
                                           onSelect: function (index,row){
                                                <%--console.log(index+','+row['customCompany']);--%>
                                                $('#platesId').iTextbox('setValue',row['printNum']);
                                                $('#printPicture').val(row['printPicture']);},
                                           idField: 'printName',
                                           textField: 'printName',
                                           fitColumns:true,
                                           url:'/PrintedController/PrintedSelect/',
                                           columns:[[
                                               {field: 'printNum',width:100, title: '编号'},
                                               {field: 'printName',width:100, title: '名称'}
                                           ]],prompt:'必填',panelWidth:200">
                        <input type="hidden" id="printPicture" name="printingImage">
                        <a href="javascript:openNewTab(2)" data-toggle="topjui-linkbutton"
                           data-options="text:'印版查看',iconCls:null,btnCls:'green'"></a>
                        <a href="javascript:openNewTab1(2)" data-toggle="topjui-linkbutton"
                           data-options="text:'印版上传',iconCls:null,btnCls:'green'"></a>
                    </div>
                    <div class="row">
                        <span class="tou">结合方式</span><input id="combinationMode" name="combinationMode"
                                                            data-toggle="topjui-combobox"
                                                            data-options="width:70,
                                                            data:[{text:'单钉',value:'1'},
                                                            {text:'双钉',value:'2'},
                                                            {text:'粘胶',value:'3',selected:true}],prompt:'必填',required:true,panelHeight:100"/>
                        &nbsp;钉数&nbsp;<input id="nailingNum" name="nailingNum"
                                             data-toggle="topjui-numberbox"
                                             data-options="width:35,min:0,validType:['length[0,10]']"/>
                        <input type="hidden" id="cartonImage" name="cartonImage">
                        <a href="javascript:openNewTab(3)" data-toggle="topjui-linkbutton"
                           data-options="iconCls:null,text:'样箱照片',btnCls:'green'" ></a>
                        <a href="javascript:openNewTab1(3)" data-toggle="topjui-linkbutton"
                           data-options="text:'样箱图片上传',iconCls:null,btnCls:'green'"></a>
                        <span class="tou">生产备注</span><input id="makerRemarks" name="makerRemarks"
                                                            data-toggle="topjui-textbox"
                                                            data-options="width:380,validType:['length[0,255]']"/>
                    </div>
                    <fieldset>
                        <legend>附件信息</legend>
                    </fieldset>
                    <div class="row">
                    <span class="tou">已下单附件</span><input type="text" id="fujian" name="name"
                                                        data-toggle="topjui-combogrid"
                                                        data-options="id:'customNames1',width:300,panelWidth:400,
                                                           idField: 'customCompary',
                                                           textField: 'customCompary',
                                                           fitColumns:true,
                                                           url:'/CustomController/select/',
                                                           columns:[[
                                                                {field: 'customCompary',width:100, title: '订单号'},
                                                               {field: 'customName',width:100, title: '附件名称'},
                                                               {field: 'customTel',width:100, title: '尺寸'}
                                                           ]],prompt:'必填',required:true,validType:['length[0,30]']">

                        <a href="javascript:openNewTab1(5)"  data-toggle="topjui-linkbutton"
                           data-options="text:'附件下单',iconCls:null,btnCls:'green'"></a>
                    </div>

                    </div>
                </div>



            </div>
        </form>
    </div>
</div>

<div id="footer" class="hidden" style="height: 34px; padding: 5px; text-align: right;">
    <c:if test="${placeId==null}">
    <a href="#" id="tijiao1" style="display: none;"
       data-toggle="topjui-linkbutton"
       data-options="id:'submitBtn',
                   iconCls:'fa fa-save',
                   form:{
                       id:'formId',
                       title:'订单提交',
                       method:'submit',
                       url:'/PlaceController/addPlace/',
                       <%--refreshRefererTab:true,--%>
                       <%--closeCurrentTab:true,--%>
                   }">提交</a>
        <a href="javascript:check(1)"
           data-toggle="topjui-linkbutton"
           data-options="iconCls:'fa fa-save'">保存</a>
    </c:if>
    <c:if test="${placeId!=null}">
        <a href="#" id="tijiao2" style="display: none;"
           data-toggle="topjui-linkbutton"
           data-options="id:'submitBtn',
                   iconCls:'fa fa-save',
                   form:{
                       id:'formId',
                       title:'订单修改',
                       method:'submit',
                       url:'/PlaceController/updatePlace/',
                       refreshRefererTab:true,
                       closeCurrentTab:true,
                   }">提交</a>
        <a href="javascript:check(2)"
           data-toggle="topjui-linkbutton"
           data-options="iconCls:'fa fa-save'">保存</a>
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
    <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method:'openTab',
       extend: '#productDg-toolbar',
       btnCls:'topjui-btn-purple',
       tab:{
           title:'原材料采购',
           href:'/AdminController/jsp/?url=/raw_material_register/purchase'
       }">进入下个操作</a>
</div>
<script type="text/javascript">
    //往cookie里面记录上次单击事件时间
    $.cookie('time',themeName, {
        expires: 7,
        path: '/'
    });
    function check(test) {
        var lastBtnClickTime = $.cookie("time");
        var nowTime = new Date().getTime();
        if ((nowTime - lastBtnClickTime) >= 2000) {
            $.cookie("time", new Date().getTime());

            if(test==1){
                $("#tijiao1").click();
            }else{
                $("#tijiao2").click();
            }
            $(this).attr("disabled","disabled");
        }else {
            $.iMessager.show({
                title: '温馨提示',
                msg: '操作过快，请稍后重试！'
            });
        }

    }
    function openNewTab(value) {
        var title;
        // var url="http://182.61.33.21/photo/20180814195636.jpeg";
        var url="/PlaceController/jumpImageSee/?url=/sale_register/imgSee&urll=http://demo.jxxiongshi.com/";
        var imageUrl = "http://demo.jxxiongshi.com/";
        if(value==1){
            title="模板查看";
            var knifePicture = $("#knifePicture").val();
            if(knifePicture==""){
                alert("未选择模板或者模板图片为空!");
                return;
            }else{
                var knifePictures = knifePicture.substring(10);
                // alert(knifePictures);
                url+="photo"+knifePictures;
                imageUrl+="photo"+knifePictures;
            }
        }else if(value==2){
            title="印板查看";
            var printPicture = $("#printPicture").val();
            if(printPicture==""){
                alert("未选择印版或者印版图片为空!");
                return;
            }else{
                var printPictures = printPicture.substring(10);
                url+="print"+printPictures;
                imageUrl+="print"+printPictures;
            }
        }else{
            title="样箱查看";
            var cartonImage = $("#cartonImage").val();
            if(cartonImage==""){
                alert("未选择产品或者产品样箱图片为空!");
                return;
            }else{
                var cartonImages = cartonImage.substring(12);
                url+="product"+cartonImages;
            }

        }

        $('#handleBtn').iDialog('openDialog', {
            id: 'businessDialog',
            title: title,
            iconCls: 'fa fa-binoculars',
            href: url,
            height:600,
            width:800,
            buttons: [
                {
                     text: '打印',
                     iconCls: 'fa fa-save',
                     btnCls: 'topjui-btn-green',
                     handler: function () {
                         //这里图片打印逻辑
                         window.open(imageUrl);
                         $('#businessDialog').iDialog('close');

                     }
                 },
                {
                    text: '关闭',
                    iconCls: 'fa fa-close',
                    btnCls: 'topjui-btn-red',
                    handler: function () {
                        $('#businessDialog').iDialog('close');
                    }
                }],
            // onLoad: function () {
            //     //加载表单数据
            //     $.getJSON(detailUrl, function (data) {
            //         $('#businessDialog').form('load', data);
            //     });
            // }
        });
    }

    function openNewTab1(value){
        var href,url;
        if(value==1){
            href='/AdminController/jsp/?url=/sale_register/knife_upload';
            url='/KnifeTemplate/addKnife/';
        }else if(value==2){
            href='/AdminController/jsp/?url=/sale_register/printing_upload';
            url='/PrintedController/addPrinted/';
        }else if(value==4){
            href='/AdminController/jsp/?url=/sale_register/add_color';
            url='/Color/addColor/';
        }else if(value==5){//附件添加
            href='/AdminController/jsp/?url=/sale_register/add_fujian';
            url='/Color/addColor/';
        }else{
            href='/AdminController/jsp/?url=/sale_register/carton_upload';
            url='/PlaceController/cartonUpload/';
        }
        $('#handleBtns').iDialog('openDialog', {
            id: 'businessDialog1',
            title: '新增上传',
            iconCls: 'fa fa-binoculars',
            href: href,
            height:400,
            width:400,
            buttons: [
                    {
                    text: '保存',
                    iconCls: 'fa fa-save',
                    btnCls: 'topjui-btn-green',
                    handler: function () {
                        var b = $('#form1').form("validate");//获取当前form的校验结果，false或true
                        if(b){
                            var form = new FormData(document.getElementById('form1'));
                            $.ajax({
                                type:'post',
                                url:url,
                                data:form,
                                processData:false,
                                contentType:false,
                                dataType:'json',
                                success:function(data){
                                    //console.log(data);
                                    if(data.statusCode=='200'){
                                        if(value==1){
                                            $('#plateId').iTextbox('setValue',$('#knifePlateNum').iTextbox('getValue'));
                                            $('#plateName').iTextbox('setValue',$('#knifeTemplateName').iTextbox('getValue'));
                                            $('#knifePicture').val(data.message);
                                        }else if(value==2){
                                            $('#platesId').iTextbox('setValue',$('#printNum').iTextbox('getValue'));
                                            $('#platesName').iTextbox('setValue',$('#printName').iTextbox('getValue'));
                                            $('#printPicture').val(data.message);
                                        }else if(value==4){
                                            $('#cartonColor').iTagbox('reload');
                                            alert(data.message);
                                        }else{
                                            $('#cartonImage').val(data.message);
                                            // console.log(data);
                                        }

                                        $('#businessDialog1').iDialog('close');
                                    }else if(data.statusCode=='500'){
                                        alert(data.message);
                                    }else{
                                        alert("保存失败！")
                                    }
                                }
                            });
                        }else{
                            alert('请填写完整！');
                        }
                    }
                },
                {
                    text: '关闭',
                    iconCls: 'fa fa-close',
                    btnCls: 'topjui-btn-red',
                    handler: function () {
                        $('#businessDialog1').iDialog('close');
                        // $('#plateId').iTextbox('setValue','12');
                    }
                }],
            // onLoad: function () {
            //     //加载表单数据
            //     $.getJSON(detailUrl, function (data) {
            //         $('#businessDialog').form('load', data);
            //     });
            // }
        });
    }

    /*计算压线和纸板尺寸*/
    function jisuan() {
        var pit_id=$("#pit_id").val();
        var carton_id=$("#carton_id").val();
        var cartonLength=$("#cartonLength").iNumberbox("getValue");
        var cartonWidth=$("#cartonWidth").iNumberbox("getValue");
        var cartonHeight=$("#cartonHeight").iNumberbox("getValue");
        if(pit_id!="" && carton_id!="" && cartonLength!="" && cartonWidth!="" && cartonHeight!=""){
            // console.log("可以计算公式了");
            $.ajax({
                type:'post',
                url:'/CartonFormulaController/operation/',
                data:{"pit_id":pit_id,"carton_id":carton_id,"cartonLength":cartonLength,"cartonWidth":cartonWidth,"cartonHeight":cartonHeight},
                dataType:'json',
                success:function (data) {
                    // console.log(data);
                    $("#lengthLine").iTextbox("setValue",data.LengthLine);
                    $("#widthLine").iTextbox("setValue",data.WidthLine);
                    $("#cardboardLength").iNumberbox("setValue",data.cardLength);
                    $("#cardboardWidth").iNumberbox("setValue",data.cardWidth);
                }
            });
        }else{
            // console.log("参数不全");
        }

    }

    function checkTime() {

        //后选日期不能在前选日期之前，也不能在当前系统日期之后
        $("#orderTime").iDatebox({
            onSelect : function(beginDate){
                $('#deliveryTime').iDatebox().iDatebox('calendar').calendar({
                    validator: function(date){
                        var now = new Date();
                        var d1 = new Date(now.getFullYear(),now.getMonth(),now.getDate());
                        return beginDate <= date && d1 >= date;
                    }
                });
            }
        });
    }





</script>
</body>
</html>
