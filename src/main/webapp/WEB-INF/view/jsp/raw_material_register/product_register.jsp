<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

    <title>产品登记</title>

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
</head>
<style>
    .globle{margin: 20px 0;}
    .globle .row{margin: 5px 0;}
    .globle .row .tou{display: inline-block; width: 70px;text-align: center}
</style>
<body>

<div data-toggle="topjui-layout" data-options="fit:true">
    <div data-toggle="topjui-panel" title="" data-options="fit:true,iconCls:'icon-ok',footer:'#footer'">
        <c:if test="${cartonId!=null}">
        <form class="hidden" method="post" enctype="multipart/form-data" data-toggle="topjui-form" data-options="id:'formId',
               url:'/ProductRegister/findById/?cartonId=${cartonId}',
               editor:[
                   {id:'remarkAddEditor',field:'remark'}
               ]">
            </c:if>
        <c:if test="${cartonId==null}">
            <form class="hidden" method="post" enctype="multipart/form-data" data-toggle="topjui-form" data-options="id:'formId',
               <%--url:'/json/form.json?uuid=123456',--%>
               editor:[
                   {id:'remarkAddEditor',field:'remark'}
               ]">
        </c:if>
            <input type="hidden" name="cartonId">
            <div class="topjui-container">
                <div class="globle">
                    <div class="row">
                        <span class="tou">&nbsp;客户名称&nbsp;</span>
                        <input type="text" name="customName"
                               data-toggle="topjui-combogrid"
                               data-options="id:'customNames',width:250,
                                                panelWidth:400,
                                               onSelect: function (index,row){
                                                    $('#customId').val(row['customId']);},
                                               idField: 'customCompary',
                                               textField: 'customCompary',
                                               fitColumns:false,
                                               url:'/CustomController/select/',
                                               columns:[[
                                                    {field: 'customCompary', title: '客户公司'},
                                                   {field: 'customName',title: '联系人'},
                                                   {field: 'customTel', title: '联系电话'}
                                               ]],prompt:'必填',required:true,validType:['maxLength[31]']">
                        <input type="hidden" id="customId" name="customId" value=""></td>
                    </div>
                    <fieldset>
                        <legend>产品信息</legend>
                    </fieldset>
                    <div class="row">
                        <span class="tou">&nbsp;产品名称&nbsp;</span>
                        <input type="text" name="cartonName" data-toggle="topjui-textbox" data-options="width:300,prompt:'必填',required:true,validType:['length[0,20]']">
                        &nbsp;箱型&nbsp;
                        <%--<input type="text" name="boxName" --%>
                               <%--data-toggle="topjui-textbox" --%>
                               <%--data-options="prompt:'必填',width:210,required:true,validType:['length[0,30]']">--%>
                        <input id="boxName" name="boxName"
                               data-toggle="topjui-combogrid"
                               data-options="width:210,required:true,validType:['length[0,30]'],
                                                                idField: 'cartonName',
                                                               textField: 'cartonName',
                                                               fitColumns:false,
                                                               url:'/CartonFormulaController/dropSelectCarton/',
                                                               onSelect: function (index,row){
                                                                 $('#carton_id').val(row['id']);
                                                                 jisuan();
                                                               },
                                                               columns:[[
                                                                   {field: 'cartonName',width:100, title: '箱型名称'}
                                                               ]]" />
                        <input type="hidden" id="carton_id" name="boxId" onchange="jisuan()">

                        <input type="text" name="sizeType" data-toggle="topjui-combobox"
                               data-options="data:[{value:1,text:'制造',selected:true},{value:2,text:'内径'},{value:3,text:'外径'}],width:70,prompt:'必填',required:true,panelHeight:100">
                        长
                        <input type="text" id="cartonLength" name="cartonLength"
                               data-toggle="topjui-numberbox"
                               data-options="onChange:function(newValue,oldValue){jisuan();},width:60,prompt:'必填',required:true,min:0,groupSeparator:'',validType:['length[0,7]'],precision:1">
                        宽
                        <input type="text" id="cartonWidth" name="cartonWidth"
                               data-toggle="topjui-numberbox"
                               data-options="onChange:function(newValue,oldValue){jisuan();},width:60,prompt:'必填',required:true,min:0,groupSeparator:'',validType:['length[0,7]'],precision:1">
                        高
                        <input type="text" id="cartonHeight" name="cartonHeight"
                               data-toggle="topjui-numberbox"
                               data-options="onChange:function(newValue,oldValue){jisuan();},width:60,required:true,prompt:'必填',min:0,groupSeparator:'',validType:['length[0,7]'],precision:1">
                        单位&nbsp;<input  id="cartonUnit" name="cartonUnit"
                                        data-toggle="topjui-combobox"
                                        data-options="data:[{text:'MM',value:'MM',selected:true},
                                                             {text:'CM',value:'CM'}],width:60,required:true,panelHeight:100"/>
                    </div>
                    <div class="row">
                        <span class="tou">&nbsp;材质&nbsp;</span>
                        <input type="text" name="materialName" data-toggle="topjui-textbox" data-options="width:150,prompt:'必填',required:true,validType:['checkMaterial','length[0,30]']">
                        楞型
                        <%--<input type="text" name="pitType"--%>
                               <%--data-toggle="topjui-textbox"--%>
                               <%--data-options="width:76,prompt:'必填',required:true,validType:['checkPitType','length[0,30]']">--%>
                        <input id="pitType" name="pitType" type="text" data-toggle="topjui-combogrid"
                               data-options="id:'user',
	  											  width:76,
								                  idField: 'name',
								                  textField: 'name',
								                  onSelect: function (index,row){
								                    $('#pit_id').val(row['id']);
								                    jisuan();
                                                    },
								                  url:'/Flut/getQ/',
								                  columns:[[
                                                    {field: 'name', title: '楞型名称'}
                                                   ]],
								                   prompt:'必填',required:true,validType:['checkPitType','length[0,30]']">
                        <input type="hidden" id="pit_id" name="pitId">
                        单价
                        <input type="text"  name="cartonPrice" data-toggle="topjui-numberbox" data-options="width:80,required:true,min:0,precision:2,groupSeparator:'',validType:['length[0,5]']">
                        长度压线
                        <input type="text" id="lengthLine" name="lengthLine" data-toggle="topjui-textbox" data-options="width:250,prompt:'必填',required:true,validType:['length[0,100]']">
                        宽度压线
                        <input type="text" id="widthLine" name="widthLine" data-toggle="topjui-textbox" data-options="width:180,prompt:'必填',required:true,validType:['length[0,100]']">
                        <input type="text" name="lineType" data-toggle="topjui-combobox" data-options="data:[{value:1,text:'明线',selected:true},{value:2,text:'暗线'}],width:70,prompt:'必填',required:true,panelHeight:70">
                    </div>
                <%--<div class="row">--%>
                    <%--<span class="tou">&nbsp;样箱图片&nbsp;</span>--%>
                    <%--<input type="file" name="file" data-options="width:100">--%>
                <%--</div>--%>
                    <div class="row">
                        <span class="tou">&nbsp;生产工序&nbsp;</span>

                        <input id="workingProcedure" value="kmyr" data-toggle="topjui-textbox"
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
                                                            data-options="width:120,prompt:'客户信息',validType:['length[0,10]']"/>
                        <span class="tou">产品规格</span><input id="cartonSpec" name="cartonSpec"
                                                            data-toggle="topjui-textbox"
                                                            data-options="width:200,prompt:'客户信息',validType:['length[0,20]']"/>
                    </div>
                    <fieldset>
                        <legend>纸箱参数</legend>
                    </fieldset>
                    <div class="row">
                        &nbsp;刀模编号&nbsp;
                        <input type="text" id="knifePlateNums" name="knifePlateNum"
                               data-toggle="topjui-combogrid"
                               data-options="
                                id:'knifePlateNum',width:100,
                                onSelect: function (index,row){
                                    $('#knifePlateNames').iTextbox('setValue',row['knifeTemplateName']);
                                    $('#knifePicture').val(row['knifePicture']);
                                },
                                idField: 'knifePlateNum',
                                textField: 'knifePlateNum',
                                fitColumns:false,
                                url:'/KnifeTemplate/KnifeTemplateSelect/',
                                columns:[[
                                    {field: 'knifePlateNum',title: '刀模编号'},
                                    {field: 'knifeTemplateName', title: '刀模名称'}
                                ]],panelWidth:200,validType:['length[0,10]']">
                        &nbsp;刀模名称&nbsp;
                        <input type="text" id="knifePlateNames" name="knifePlateName"
                               data-toggle="topjui-textbox"
                               data-options="width:100">
                        <input type="hidden" id="knifePicture" name="knifePicture">
                        <a href="javascript:openNewTab(1)" data-toggle="topjui-linkbutton"
                           data-options="width:80,text:'模版查看',iconCls:null,btnCls:'green'"></a>
                        <a href="javascript:openNewTab1(1)" data-toggle="topjui-linkbutton"
                           data-options="width:90,text:'模版上传',iconCls:null,btnCls:'green'"></a>
                        <span class="tou">&nbsp;印版编号&nbsp;</span>
                        <input type="text" id="printedIds" name="printedId"
                               data-toggle="topjui-combogrid"
                               data-options="id:'printedId',width:100,
                                onSelect: function (index,row){
                                    $('#printedNames').iTextbox('setValue',row['printName']);
                                    $('#printPicture').val(row['printPicture']);
                                },
                                idField: 'printNum',
                                textField: 'printNum',
                                fitColumns:false,
                                url:'/PrintedController/PrintedSelect/',
                                columns:[[
                                    {field: 'printNum',title: '印版编号'},
                                    {field: 'printName',title: '印版名称'}
                                ]],panelWidth:200,validType:['length[0,10]']">
                        &nbsp;印版名称&nbsp;
                        <input type="text" id="printedNames" name="printedName" data-toggle="topjui-textbox" data-options="width:100">
                        <input type="hidden" id="printPicture" name="printPicture">
                        <a href="javascript:openNewTab(2)" data-toggle="topjui-linkbutton"
                        data-options="width:80,text:'印版查看',iconCls:null,btnCls:'green'"></a>
                        <a href="javascript:openNewTab1(2)" data-toggle="topjui-linkbutton"
                        data-options="width:90,text:'印版上传',iconCls:null,btnCls:'green'"></a>

                    </div>
                    <div class="row">
                        &nbsp;纸板尺寸&nbsp;
                        <input type="text" id="cardLength" name="cardLength" data-toggle="topjui-numberbox" data-options="width:80,required:true,min:0,precision:2,groupSeparator:'',validType:['length[0,7]']">
                        X
                        <input type="text" id="cardWidth" name="cardWidth" data-toggle="topjui-numberbox" data-options="width:80,required:true,min:0,precision:2,groupSeparator:'',validType:['length[0,7]']">
                        <%--&lt;%&ndash;&nbsp;面纸克重&nbsp;
                         <input type="text" name="cartonUnit" data-toggle="topjui-textbox" data-options="required:true"
                                    style="width:110px;">&ndash;%&gt;--%>
                        <input type="hidden" id="cartonImage" name="cartonImage">
                        <a href="javascript:openNewTab(3)" data-toggle="topjui-linkbutton"
                           data-options="width:80,iconCls:null,text:'样箱照片',btnCls:'green'" ></a>
                        <a href="javascript:openNewTab1(3)" data-toggle="topjui-linkbutton"
                           data-options="width:90,text:'样箱图片上传',iconCls:null,btnCls:'green'"></a>
                        <span class="tou">&nbsp;结合方式&nbsp;</span>
                        <input type="text" name="combinationMode" data-toggle="topjui-combobox" data-options="width:70,
                                                            data:[{text:'单钉',value:'1'},
                                                            {text:'双钉',value:'2'},
                                                            {text:'粘胶',value:'3',selected:true}],prompt:'必填',required:true,panelHeight:100">
                        &nbsp;打钉数&nbsp;
                        <input type="text" name="nailingNum" data-toggle="topjui-numberbox" data-options="width:35,min:0,groupSeparator:'',validType:['length[0,10]']">

                        &nbsp;印刷颜色&nbsp;
                        <input type="text" name="colorNum" data-toggle="topjui-tagbox" data-options="width:270,required:true,textField:'text',valueField:'text',hasDownArrow:true,data:[{
                                       id:1,
                                       text:'黑色'
                                   },{
                                       id:2,
                                       text:'红色'
                                   },{
                                       id:3,
                                       text:'蓝色',
                                       selected:true
                                   },{
                                       id:4,
                                       text:'黄色'
                                   },{
                                       id:5,
                                       text:'白色'
                                   },{
                                       id:6,
                                       text:'棕色'
                                   },{
                                       id:7,
                                       text:'橙色'
                                   },{
                                       id:8,
                                       text:'天蓝色'
                        }],validType:['length[0,30]']"/>
                    </div>
                    <fieldset>
                        <legend>其他参数</legend>
                    </fieldset>
                    <div class="row">
                        <%--<span class="tou">&nbsp;落料尺寸&nbsp;</span>
                        <input type="text" name="blankingHeight" data-toggle="topjui-textbox" data-options="width:80,prompt:'长',min:0,max:5000">
                        X
                        <input type="text" name="blankingWidth" data-toggle="topjui-textbox" data-options="width:80,prompt:'宽',min:0,max:5000">
                        &nbsp;打包数&nbsp;
                        <input type="text" name="packNum" data-toggle="topjui-textbox" data-options="width:35,min:0">--%>
                        &nbsp;门幅&nbsp;
                        <input type="text" name="fabricWidth" data-toggle="topjui-numberbox" data-options="width:70,min:0,precision:2,groupSeparator:'',validType:['length[0,10]']">
                        &nbsp;门幅倍数&nbsp;
                        <input type="text" name="fabricBei" data-toggle="topjui-combobox" data-options="width:60,
                                                            data:[{text:'*2',value:'1'},
                                                            {text:'*3',value:'2'},
                                                            {text:'*4',value:'3'},
                                                            {text:'*5',value:'4'},
                                                            {text:'*6',value:'5'},
                                                            {text:'*7',value:'6'},
                                                            {text:'*8',value:'7'}]">
                        &nbsp;备注&nbsp;
                        <input type="text" name="cartonRemarks" data-toggle="topjui-textbox" data-options="width:380,validType:['length[0,255]']">
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
<div id="footer" class="hidden" style="height: 34px; padding: 5px; text-align: right;">
<c:if test="${cartonId==null}">
    <a href="#"
       data-toggle="topjui-linkbutton"
       data-options="id:'submitBtn',
                   iconCls:'fa fa-save',
                   form:{
                       id:'formId',
                       text:'产品添加',
                       method:'submit',
                       url:'/ProductRegister/AddProductRegister/',
                       <%--refreshRefererTab:true,--%>
                       <%--closeCurrentTab:true,--%>
                   }">提交</a>
    </c:if>
<c:if test="${cartonId!=null}">
    <a href="#"
       data-toggle="topjui-linkbutton"
       data-options="id:'submitBtn',
                   iconCls:'fa fa-save',
                   form:{
                       id:'formId',
                       text:'编辑产品',
                       method:'submit',
                       url:'/ProductRegister/updataProduct/',
                       refreshRefererTab:true,
                       closeCurrentTab:true,
                   }">确定</a>
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
        /*默认工序*/
        var as=$("#workingProcedure").iTextbox('getValue')
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
    });
    function openNewTab(value) {
        var title;
        // var url="http://182.61.33.21/photo/20180814195636.jpeg";
        var url="/PlaceController/jumpImageSee/?url=/sale_register/imgSee&urll=http://demo.jxxiongshi.com/";
        var imageUrl="http://demo.jxxiongshi.com/";
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
                                    // console.log(data);
                                    if(data.statusCode=='200'){
                                        if(value==1){
                                            console.log($('#knifePlateNum').iTextbox('getValue'));
                                            $('#knifePlateNums').iTextbox('setValue',$('#knifePlateNum').iTextbox('getValue'));
                                            $('#knifePlateNames').iTextbox('setValue',$('#knifeTemplateName').iTextbox('getValue'));
                                            $('#knifePicture').val(data.message);
                                        }else if(value==2){
                                            $('#printedIds').iTextbox('setValue',$('#printNum').iTextbox('getValue'));
                                            $('#printedNames').iTextbox('setValue',$('#printName').iTextbox('getValue'));
                                            $('#printPicture').val(data.message);
                                        }else{
                                            $('#cartonImage').val(data.message);
                                        }

                                        $('#businessDialog1').iDialog('close');
                                    }else{
                                        alert('保存失败!');
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
                    $("#cardLength").iNumberbox("setValue",data.cardLength);
                    $("#cardWidth").iNumberbox("setValue",data.cardWidth);
                }
            });
        }else{
            // console.log("参数不全");
        }

    }


</script>
</body>
</html>
