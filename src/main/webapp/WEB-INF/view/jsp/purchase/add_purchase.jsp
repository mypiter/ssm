<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <!-- 避免IE使用兼容模式 -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
    <meta name="renderer" content="webkit">
    <!-- TopJUI框架样式 -->
    <link type="text/css" href="../../topjui/css/topjui.core.min.css" rel="stylesheet">
    <link type="text/css" href="../../topjui/themes/default/topjui.red.css" rel="stylesheet" id="dynamicTheme"/>
    <!-- FontAwesome字体图标 -->
    <link type="text/css" href="../../static/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet"/>
    <!-- layui框架样式 -->
    <link type="text/css" href="../../static/plugins/layui/css/layui.css" rel="stylesheet"/>
    <!-- jQuery相关引用 -->
    <script type="text/javascript" src="../../static/plugins/jquery/jquery.min.js"></script>
    <script type="text/javascript" src="../../static/plugins/jquery/jquery.cookie.js"></script>
    <!-- TopJUI框架配置 -->
    <script type="text/javascript" src="../../static/public/js/topjui.config.js"></script>
    <!-- TopJUI框架核心-->
    <script type="text/javascript" src="../../topjui/js/topjui.core.min.js"></script>
    <!-- TopJUI中文支持 -->
    <script type="text/javascript" src="../../topjui/js/locale/topjui.lang.zh_CN.js"></script>
    <!-- layui框架js -->
    <script src="../../static/plugins/layui/layui.js" charset="utf-8"></script>
</head>

<body>
<style>
    .hidden {
        display: none;
    }
</style>
<div data-toggle="topjui-layout" data-options="fit:true">
    <div data-toggle="topjui-tabs"
         data-options="id:'tabs',
             fit:true,
             tabPosition:'left',
             border:true">
       
        <div title="纸板采购" data-options="region:'west',id:'tab2',type:'panel',
        iconCls:'fa fa-th',footer:'#footer1'">
 <form data-toggle="topjui-form" data-options="id:'formId'" >
    <table class="editTable">
        <tr>
            <td colspan="4">
                <div class="divider">
                    <span>基本信息</span>
                </div>
            </td>
        </tr>
         <tr>
            <td class="label">选择供应商</td>
            <td colspan="3">
                <input type="text" name="zone"
                       data-toggle="topjui-combotree"
                       data-options="required:true,
                       prompt:'必填',
                       width:'100%',
                       panelHeight:'250',
                       url:'../../data/test101.json',

                       backfill:{url:'indexselect.action?id={id}'}">
            </td>
        </tr>
        <tr>
           <td class="label">材质</td>
            <td>
               <input type="text" name="carton_type" data-toggle="topjui-textbox" data-options="required:true,id:'carton_type'">
            </td>
            <td class="label">纸板规格（长*宽*高）</td>
            <td>
                <input type="text" name="carton_type" data-toggle="topjui-textbox" data-options="required:true,id:'carton_type'">
            </td>
        </tr>
        <tr>
            <td class="label">压线尺寸</td>
            <td><input type="text" name="carton_height" data-toggle="topjui-textbox" data-options="required:true,id:'carton_height'"></td>
            <td class="label">数量</td>
            <td><input type="text" name="spec_type" data-toggle="topjui-textbox" data-options="required:true,id:'spec_type'"></td>
        </tr>
        <tr>
            <td class="label">联系电话</td>
            <td><input type="text" name="carton_type" data-toggle="topjui-textbox" data-options="required:true,id:'carton_type'"></td>
            <td class="label">坑型</td>
            <td><input type="text" name="carton_width" data-toggle="topjui-textbox" data-options="required:true,id:'carton_width'"></td>
            
        </tr>
        <tr>
            <td class="label">订货单位</td>
            <td><input type="text" name="carton_length" data-toggle="topjui-textbox" data-options="required:true,id:'carton_length'"></td>
            <td class="label">送货地址</td>
            <td><input type="text" name="model_name" data-toggle="topjui-textbox" data-options="required:true,id:'model_name'" ></td>
        </tr>
        <tr>
         	<td class="label">下单时间</td>
        	<td>
            	<input type="text" name="time" data-toggle="topjui-datebox" data-options="required:true">
        	</td>
        	<td class="label">交货时间</td>
        	<td>
            	<input type="text" name="time" data-toggle="topjui-datebox" data-options="required:true">
        	</td>
        </tr>

       
    </table>
    

</form>

             <div id="footer1"  style="padding: 5px;text-align: right;">
               
                <a href="#"
                   data-toggle="topjui-linkbutton"
                   data-options="id:'submitBtn',
                   iconCls:'fa fa-save',
                   form:{
                       id:'formId',
                       method:'submit',
                       url:'/json/response/success.json',
                       refreshRefererTab:true,
                       refreshCurrentTab:true
                   }">提交</a>
                <a href="#"
                   data-toggle="topjui-linkbutton"
                   data-options="id:'submitBtn',
                   iconCls:'fa fa-exchange',
                   btnCls:'topjui-btn-warm',
                   form:{
                       id:'formId',
                       method:'reset'
                   }">重置</a>
                <a href="#"
                   data-toggle="topjui-linkbutton"
                   data-options="id:'submitBtn',
                   iconCls:'fa fa-trash',
                   btnCls:'topjui-btn-danger',
                   form:{
                       id:'formId',
                       method:'clear'
                   }">清空</a>
                   
            </div> 
            
          
        </div> 
        <div title="通用物材下单" data-options="id:'tab3',type:'panel',
        iconCls:'fa fa-th',footer:'#footer3'">
          <form data-toggle="topjui-form" data-options="id:'formId3'" >
     <table class="editTable">
        <tr>
            <td colspan="4">
                <div class="divider">
                    <span>基本信息</span>
                </div>
            </td>
        </tr>
        <tr>
           <td class="label">物材名称</td>
            <td>
               <input type="text" name="carton_type" data-toggle="topjui-textbox" data-options="id:'carton_type'">
            </td>
            <td class="label">规格</td>
            <td>
                <input type="text" name="carton_type" data-toggle="topjui-textbox" data-options="id:'carton_type'">
            </td>
        </tr>
        <tr>
            <td class="label">单价</td>
            <td><input type="text" name="carton_height" data-toggle="topjui-textbox" data-options="readonly:true,id:'carton_height'"></td>
            <td class="label">数量</td>
            <td><input type="text" name="spec_type" data-toggle="topjui-textbox" data-options="readonly:true,id:'spec_type'"></td>
        </tr>
        <tr>
            <td class="label">供应商名称</td>
            <td><input type="text" name="carton_type" data-toggle="topjui-textbox" data-options="readonly:true,id:'carton_type'"></td>
            
            
        </tr>
    </table>
</form>
      <div id="footer3"  style="padding: 5px;text-align: right;">
               
                <a href="#"
                   data-toggle="topjui-linkbutton"
                   data-options="id:'submitBtn',
                   iconCls:'fa fa-save',
                   form:{
                       id:'formId3',
                       method:'submit',
                       url:'/json/response/success.json',
                       refreshRefererTab:true,
                       refreshCurrentTab:true
                   }">提交</a>
                <a href="#"
                   data-toggle="topjui-linkbutton"
                   data-options="id:'submitBtn',
                   iconCls:'fa fa-exchange',
                   btnCls:'topjui-btn-warm',
                   form:{
                       id:'formId3',
                       method:'reset'
                   }">重置</a>
                <a href="#"
                   data-toggle="topjui-linkbutton"
                   data-options="id:'submitBtn',
                   iconCls:'fa fa-trash',
                   btnCls:'topjui-btn-danger',
                   form:{
                       id:'formId3',
                       method:'clear'
                   }">清空</a>
                   
            </div> 
                  
         
        </div>
        
    </div>
</div>

<script>
   /*$.ajax({
        url:remoteHost+'/system/codeItem/getListByCodeSetIdAndLevelId?codeSetId=AGA&levelId=3',//remoteHost+'/system/codeItem/getListByPid?pid={id}',
        dataType:"json",
        type:"post",
        success:function(data){
           // console.info(data);
        }
    
    });
     /*$.ajax({
        url:remoteHost+'/system/codeItem/getListByPid?pid=71A1A800E8BC4BE99E7EDF6591E88244',
        dataType:"json",
        type:"post",
        success:function(data){
            //console.info(data);
        }
    
    });
  $.ajax({
        url:remoteHost+'/system/user/getZoneFillbackData?id=71A1A800E8BC4BE99E7EDF6591E88244',
        dataType:"JSONP",
        type:"post",
        success:function(data){
            console.info(data);
        }
    
    }); */
    function progressFormatter(value, rowData, rowIndex) {
        var htmlstr = '<div id="p" class="easyui-progressbar progressbar" data-options="value:' + value + '" style="width: 398px; height: 26px;">';
        htmlstr += '<div class="progressbar-text" style="width: 398px; height: 26px; line-height: 26px;">' + value + '%</div>';
        htmlstr += '<div class="progressbar-value" style="width: ' + value + '%; height: 26px; line-height: 26px;">';
        htmlstr += '<div class="progressbar-text" style="width: 398px; height: 26px; line-height: 26px;">' + value + '%</div>';
        htmlstr += '</div>';
        htmlstr += '</div>';
        return htmlstr;
    }

    // 自定义方法
    function myQuery() {
        // 提示信息
        $.iMessager.alert('自定义方法', '自定义方法被执行了！', 'messager-info');
        // 提交参数查询表格数据
        $('#productDg').iDatagrid('reload', {
            name: $('#name').iTextbox('getValue'),
            code: $('#code').iTextbox('getValue')
        });
    }
    //自定义下单
    function down1(){
  
        $("#down1").removeAttr('onclick');//opacity
        $("#down1").css('opacity','0.3');
        $("#down").attr('onclick','down()');//opacity
        $("#down").css('opacity','1');
        document.getElementById("formId").style.display="none";
        document.getElementById("formId1").style.display="block";
        document.getElementById("fy").style.display="none";
        document.getElementById("fy1").style.display="block";
     /*  $('#line_type1').iCombobox({
       url:'../../data/test101.json',
       valueField:'id',
       textField:'text'
});
        //console.info($("#line_type1"));
       /* $("#carton_type,#model_name,#carton_length,#carton_width,#carton_height,#spec_type,#material_science,#pit_type,#carton_color,#pack_num,#line_type,#fabric_width,#carton_price").iTextbox({
            readonly:false
        });; */   
        
        //console.info($("#carton_type"));
    }
    //选择模板下单
    function down(){
      
       $("#down").removeAttr('onclick');//opacity
       $("#down").css('opacity','0.3');
       $("#down1").attr('onclick','down1()');//opacity
       $("#down1").css('opacity','1');
       document.getElementById("fy1").style.display="none";
       document.getElementById("fy").style.display="block";
       document.getElementById("formId1").style.display="none";
       document.getElementById("formId").style.display="block";
       

       
    }
</script>
<script type="text/javascript" src="../../static/plugins/ueditor/ueditor.config.js"></script>
<script type="text/javascript" src="../../static/plugins/ueditor/ueditor.all.min.js"></script>
</body>
</html>