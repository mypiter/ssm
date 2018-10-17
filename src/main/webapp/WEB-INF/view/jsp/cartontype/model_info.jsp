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

    
       
        
      <!--    <div align="center">
                   <a 
                   data-toggle="topjui-linkbutton"
                   data-options="iconCls:'fa fa-exchange',
                   btnCls:'topjui-btn-normal'" style="opacity:0.4;" id="down" onclick="down()">选择模板下单</a>
                    <a 
                   data-toggle="topjui-linkbutton"
                   data-options="
                   iconCls:'fa fa-exchange',
                   btnCls:'topjui-btn-warm'   
                  "  onclick="down1()" id="down1">自定义下单</a>  
                   
                </div>  -->
 <form data-toggle="topjui-form" data-options="id:'formId'" >
    <table class="editTable">
        <tr>
            <td colspan="4">
                <div class="divider">
                    <span>客户信息</span>
                </div>
            </td>
        </tr>
        <tr>
            <td class="label">客户</td>
            <td><input type="text" name="user" data-toggle="topjui-textbox" data-options="id:'user',required:true" value="小张"></td>
            <td class="label">客户公司</td>
            <td><input type="text" name="user_company" data-toggle="topjui-textbox" data-options="id:'user_company',required:true" value="美宝时光"></td>
            <td class="label">纸箱名称</td>
            <td><input type="text" name="user" data-toggle="topjui-textbox" data-options="id:'user',required:true" value="鸡蛋箱"></td>
            
        </tr>
       
        <tr>
            <td colspan="4">
                <div class="divider">
                    <span>产品信息</span>
                </div>
            </td>
        </tr>
        <tr>
            <td class="label">箱型</td>
            <td><input type="text" name="carton_type" data-toggle="topjui-textbox" data-options="id:'carton_type',required:true" value=""></td>
            <td class="label">纸箱编号</td>
            <td><input type="text" name="model_number" data-toggle="topjui-textbox" data-options="id:'model_number'" value=""></td>
            <td class="label">坑型</td>
            <td><input type="text" name="pit_type" data-toggle="topjui-textbox" data-options="id:'pit_type',required:true" value=""></td>
            
        </tr>
        <tr>
            <td class="label">本公司材质</td>
            <td><input type="text" name="material" data-toggle="topjui-textbox" data-options="id:'material',required:true" value=""></td>
            <td class="label">客户公司材质</td>
            <td><input type="text" name="k_material" data-toggle="topjui-textbox" data-options="id:'k_material',required:true" value=""></td>
            <td class="label">计量单位</td>
            <td><input type="text" name="model_unit" data-toggle="topjui-textbox" data-options="id:'model_unit',required:true" value=""></td>
            
        </tr>
        <tr>
            <td class="label">长</td>
            <td><input type="text" name="carton_length" data-toggle="topjui-textbox" data-options="id:'carton_length',required:true" value=""></td>
            <td class="label">宽</td>
            <td><input type="text" name="carton_width" data-toggle="topjui-textbox" data-options="id:'carton_width',required:true" value=""></td>
            <td class="label">高</td>
            <td><input type="text" name="carton_height" data-toggle="topjui-textbox" data-options="id:'carton_height',required:true" value=""></td>
            
        </tr>
        <tr>
            <td class="label">压线长</td>
            <td><input type="text" name="carton_length" data-toggle="topjui-textbox" data-options="id:'line_length',required:true" value=""></td>
            <td class="label">压线宽</td>
            <td><input type="text" name="carton_width" data-toggle="topjui-textbox" data-options="id:'line_width',required:true" value=""></td>
            <td class="label">压线高</td>
            <td><input type="text" name="carton_height" data-toggle="topjui-textbox" data-options="id:'line_height',required:true" value=""></td>
            
        </tr>
        <tr>
            <td class="label">纸板长</td>
            <td><input type="text" name="cardboard_length" data-toggle="topjui-textbox" data-options="id:'cardboard_length',required:true" value=""></td>
            <td class="label">纸板宽</td>
            <td><input type="text" name="cardboard_width" data-toggle="topjui-textbox" data-options="id:'cardboard_width',required:true" value=""></td>
            <td class="label">厚度</td>
            <td><input type="text" name="model_land" data-toggle="topjui-textbox" data-options="id:'model_land',required:true" value=""></td>  
        </tr>
        <tr>
            <td class="label">结合方式</td>
            <td><div data-toggle="topjui-radio">
                <input type="radio" name="combine_type" label="粘胶" >
                <input type="radio" name="combine_type" label="打钉" checked="checked">
            </div></td>
            <td class="label">打钉类型</td>
            <td><input type="text" name="nail_type" data-toggle="topjui-textbox" data-options="id:'nail_type'" value=""></td>
            <td class="label">打钉数</td>
            <td><input type="text" name="nail_num" data-toggle="topjui-textbox" data-options="id:'nail_num'" value=""></td>  
        </tr>
        <tr>
            <td class="label">打包数</td>
            <td><input type="text" name="pack_num" data-toggle="topjui-textbox" data-options="id:'pack_num',required:true" value=""></td>
            <td class="label">颜色数</td>
            <td><input type="text" name="color_num" data-toggle="topjui-textbox" data-options="id:'color_num',required:true" value=""></td>
            <td class="label">门幅</td>
            <td><input type="text" name="fabric_width" data-toggle="topjui-textbox" data-options="id:'fabric_width',required:true" value=""></td>  
        </tr>
        <tr>
            <td class="label">印版号</td>
            <td><input type="text" name="plate_account" data-toggle="topjui-textbox" data-options="id:'plate_account',required:true"></td>
            <td class="label">模版号</td>
            <td><input type="text" name="plates_account" data-toggle="topjui-textbox" data-options="id:'plates_account',required:true"></td>
            <td class="label">单价(元)</td>
            <td><input type="text" name="model_price" data-toggle="topjui-textbox" data-options="id:'model_price',required:true"></td>
            
            
        </tr>
        <tr>
            <td colspan="4">
                <div class="divider">
                    <span>图片信息</span>
                </div>
            </td>
        </tr>
        
        <tr>
            <td class="label">纸箱图片</td>
            <td><input type="text" name="model_image" data-toggle="topjui-filebox" data-options="buttonIcon:'fa fa-folder',id:'model_image',width:'153px'"></td>
            <td colspan="4">
            <img style="border:1xp solid;width:300px;height:150px;"></img>
            </td>   
        </tr>
        <tr>
            <td class="label">印刷图片</td>
            <td><input type="text" name="print_image" data-toggle="topjui-filebox" data-options="buttonIcon:'fa fa-folder',id:'print_image',width:'153px'"></td>
            <td colspan="4">
            <img style="border:1xp solid;width:300px;height:150px;"></img>
            </td>   
        </tr>
        <tr>
            <td colspan="4">
                <div class="divider">
                    <span>工序信息</span>
                </div>
            </td>
        </tr>
        <tr>
            <td colspan="4">
                <div data-toggle="topjui-checkbox">
                <input type="checkbox" name="tz" label="分压"  >
                <input type="checkbox" name="tz" label="裱糊"  >
                <input type="checkbox" name="tz" label="印刷"  >
                <input type="checkbox" name="tz" label="开槽"  >
                <input type="checkbox" name="tz" label="模切"  >
            </div>
            </td>
        </tr>
        <tr id="fu1">
            <td colspan="4">
                <div class="divider">
                    <span>附件信息(根据需要添加)</span><a class="layui-btn layui-btn-xs layui-btn-normal" onclick="add()">+</a><a class="layui-btn layui-btn-xs layui-btn-normal" onclick="dele()">-</a>
                </div>
            </td>
        </tr>
       
        <tr id="fu2">
            <td class="label">备注</td>
            <td colspan="3">
                    <textarea name="order_remarks" style="height:300px;"
                              data-toggle="topjui-textarea"
                              data-options="id:'remarkAddEditor'"></textarea>
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
    function add(){ //添加附件
        var html = "<tr><td class=\"label\">附件名称</td>"+
            "<td><span class=\"textbox textbox-invalid\" style=\"width: 151px; height: 32px;\"><input id=\"_easyui_textbox_input4\" type=\"text\" class=\"textbox-text validatebox-text validatebox-invalid textbox-prompt\" autocomplete=\"off\" tabindex=\"\"placeholder=\"\" style=\"margin: 0px; padding-top: 0px; padding-bottom: 0px; height: 32px; line-height: 32px; width: 143px;\"><input type=\"hidden\" class=\"textbox-value\" name=\"carton_type\" value=\"\"></span></td>"+
            "<td class=\"label\">规格</td>"+
            "<td><span class=\"textbox textbox-invalid\" style=\"width: 151px; height: 32px;\"><input id=\"_easyui_textbox_input4\" type=\"text\" class=\"textbox-text validatebox-text validatebox-invalid textbox-prompt\" autocomplete=\"off\" tabindex=\"\"placeholder=\"\" style=\"margin: 0px; padding-top: 0px; padding-bottom: 0px; height: 32px; line-height: 32px; width: 143px;\"><input type=\"hidden\" class=\"textbox-value\" name=\"carton_type\" value=\"\"></span></td>"+
            "<td class=\"label\">数量</td>"+
            "<td><span class=\"textbox textbox-invalid\" style=\"width: 151px; height: 32px;\"><input id=\"_easyui_textbox_input4\" type=\"text\" class=\"textbox-text validatebox-text validatebox-invalid textbox-prompt\" autocomplete=\"off\" tabindex=\"\"placeholder=\"\" style=\"margin: 0px; padding-top: 0px; padding-bottom: 0px; height: 32px; line-height: 32px; width: 143px;\"><input type=\"hidden\" class=\"textbox-value\" name=\"carton_type\" value=\"\"></span></td></tr>";
         $("#fu1").after(html);//在fu1节点后面添加子节点
    
    }
    function dele(){//删除附件
        var f = $("#fu1").next().attr("ID");//获取fu1下一个节点的id
        if(f!='fu2'){
        $("#fu1").next().remove();
        }
    
    }
    function add1(){ //添加附件
        var html = "<tr><td class=\"label\">附件名称</td>"+
            "<td><span class=\"textbox textbox-invalid\" style=\"width: 151px; height: 32px;\"><input id=\"_easyui_textbox_input4\" type=\"text\" class=\"textbox-text validatebox-text validatebox-invalid textbox-prompt\" autocomplete=\"off\" tabindex=\"\"placeholder=\"\" style=\"margin: 0px; padding-top: 0px; padding-bottom: 0px; height: 32px; line-height: 32px; width: 143px;\"><input type=\"hidden\" class=\"textbox-value\" name=\"carton_type\" value=\"\"></span></td>"+
            "<td class=\"label\">规格</td>"+
            "<td><span class=\"textbox textbox-invalid\" style=\"width: 151px; height: 32px;\"><input id=\"_easyui_textbox_input4\" type=\"text\" class=\"textbox-text validatebox-text validatebox-invalid textbox-prompt\" autocomplete=\"off\" tabindex=\"\"placeholder=\"\" style=\"margin: 0px; padding-top: 0px; padding-bottom: 0px; height: 32px; line-height: 32px; width: 143px;\"><input type=\"hidden\" class=\"textbox-value\" name=\"carton_type\" value=\"\"></span></td>"+
            "<td class=\"label\">数量</td>"+
            "<td><span class=\"textbox textbox-invalid\" style=\"width: 151px; height: 32px;\"><input id=\"_easyui_textbox_input4\" type=\"text\" class=\"textbox-text validatebox-text validatebox-invalid textbox-prompt\" autocomplete=\"off\" tabindex=\"\"placeholder=\"\" style=\"margin: 0px; padding-top: 0px; padding-bottom: 0px; height: 32px; line-height: 32px; width: 143px;\"><input type=\"hidden\" class=\"textbox-value\" name=\"carton_type\" value=\"\"></span></td></tr>";
         $("#fu3").after(html);//在fu1节点后面添加子节点
    
    }
    function dele1(){//删除附件
        var f = $("#fu3").next().attr("ID");//获取fu1下一个节点的id
        if(f!='fu4'){
        $("#fu1").next().remove();
        }
    
    }
</script>
<script type="text/javascript" src="../../static/plugins/ueditor/ueditor.config.js"></script>
<script type="text/javascript" src="../../static/plugins/ueditor/ueditor.all.min.js"></script>
</body>
</html>