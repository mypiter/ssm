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
    <link type="text/css" href="${pageContext.request.contextPath}/topjui/css/topjui.core.min.css" rel="stylesheet">
    <link type="text/css" href="${pageContext.request.contextPath}/topjui/themes/default/topjui.red.css" rel="stylesheet" id="dynamicTheme"/>
    <!-- FontAwesome字体图标 -->
    <link type="text/css" href="${pageContext.request.contextPath}/static/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet"/>
    <!-- layui框架样式 -->
    <link type="text/css" href="${pageContext.request.contextPath}/static/plugins/layui/css/layui.css" rel="stylesheet"/>
    <!-- jQuery相关引用 -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/plugins/jquery/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/plugins/jquery/jquery.cookie.js"></script>
    <!-- TopJUI框架配置 -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/public/js/topjui.config.js"></script>
    <!-- TopJUI框架核心-->
    <script type="text/javascript" src="${pageContext.request.contextPath}/topjui/js/topjui.core.min.js"></script>
    <!-- TopJUI中文支持 -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/topjui/js/locale/topjui.lang.zh_CN.js"></script>
    <!-- layui框架js -->
    <script src="${pageContext.request.contextPath}/static/plugins/layui/layui.js" charset="utf-8"></script>
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
       
        <div title="单品种下单" data-options="region:'west',id:'tab2',type:'panel',
        iconCls:'fa fa-th',footer:'#footer1'">
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
                    <span>下单信息</span>
                </div>
            </td>
        </tr>
        <tr>
            <td class="label">类型</td>
            <td>
            	<input type="text" name="user" data-toggle="topjui-combobox"
                       data-options="required:true,
                       valueField:'id',
                       textField:'text',
                       data:[{id:1,text:'通用'},{id:2,text:'内接'},{id:3,text:'外发'}]">
            </td>
                       <!-- <td><select name="user" class="easyui-combobox"><option value="aa">aitem1</option>
    <option>bitem2</option>
    <option>bitem3</option>
    <option>ditem4</option>
    <option>eitem5</option></select></td> --> 
            <td class="label">客户公司</td>
            <td><input type="text" name="user_company" data-toggle="topjui-textbox" data-options="id:'user_company',required:true" value="美宝时光"></td>
            <td class="label"></td>
            <td></td>
            
        </tr>
       
        <tr>
            <td colspan="4">
                <div class="divider">
                    <span>箱型信息</span>
                </div>
            </td>
        </tr>
        <tr>
            <td class="label">输入纸箱名称</td>
            <td colspan="3">
                <input type="text" name="zone"
                       data-toggle="topjui-textbox"
                       data-options="required:true">
            </td>
        </tr>
        <tr>
            <td class="label">箱型展示图片</td>
            <td colspan="3" >
                    
                    <img  style="height:150px;width:100%;boder:1px solid;"
                              data-toggle="topjui-img"
                              data-options="id:'remarkAddEditor'"></img>
                              
            </td>
        </tr>
        
        <tr>
            <td class="label">种类</td>
            <td><input type="text" name="carton_type" data-toggle="topjui-textbox" data-options="id:'carton_type'"></td>
            <td class="label">箱型</td>
            <td><input type="text" name="model_name" data-toggle="topjui-textbox" data-options="id:'model_name'"></td>
        </tr>
        <tr>
            <td class="label">长</td>
            <td><input type="text" name="carton_length" data-toggle="topjui-textbox" data-options="id:'carton_length'"></td>
            <td class="label">宽</td>
            <td><input type="text" name="carton_width" data-toggle="topjui-textbox" data-options="id:'carton_width'"></td>
        </tr>
        <tr>
            <td class="label">高</td>
            <td><input type="text" name="carton_height" data-toggle="topjui-textbox" data-options="id:'carton_height'"></td>
            <td class="label">门幅</td>
            <td><input type="text" name="fabric_width" data-toggle="topjui-textbox" data-options="id:'fabric_width'"></td>
        </tr>
        <tr>
            <td class="label">材质</td>
            <td><input type="text" name="material_science" data-toggle="topjui-textbox" data-options="id:'material_science'"></td>
            <td class="label">楞型</td>
            <td><input type="text" name="pit_type" data-toggle="topjui-textbox" data-options="id:'pit_type'"></td>
        </tr>
        <tr>
            <td class="label">颜色数</td>
            <td><input type="text" name="carton_color" data-toggle="topjui-textbox" data-options="id:'carton_color'"></td>
            <td class="label">打包数</td>
            <td><input type="text" name="pack_num" data-toggle="topjui-textbox" data-options="id:'pack_num'"></td>
        </tr>
      
        
        
        <tr>
            <td class="label">印版号</td>
            <td><input type="text" name="plate_account" data-toggle="topjui-textbox" data-options="id:'plate_account'"></td>
            <td class="label">模版号</td>
            <td><input type="text" name="plates_account" data-toggle="topjui-textbox" data-options="id:'plates_account'"></td>
        </tr>
        <tr>
            <td class="label">粘合方式</td>
            <td><input type="text" name="nail_or_iscose" data-toggle="topjui-textbox" data-options=""></td>
            <td class="label">钉条类型</td>
            <td><input type="text" name="nailing_type" data-toggle="topjui-textbox" data-options=""></td>
        </tr>
        <tr>
            <td class="label">打钉数</td>
            <td><input type="text" name="nail_num" data-toggle="topjui-textbox" data-options="id:'nail_num'"></td>
            <td class="label"></td>
            <td></td>
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
                <input type="checkbox" name="tz" label="分压" checked="checked"  data-options="">
                <input type="checkbox" name="tz" label="裱糊" checked="checked" data-options="">
                <input type="checkbox" name="tz" label="印刷" checked="checked"  data-options="">
                <input type="checkbox" name="tz" label="开槽"  checked="checked"   data-options="">
                <input type="checkbox" name="tz" label="模切"   checked="checked" data-options="">
            </div>
            </td>
        </tr>
        <tr>
            <td colspan="4">
                <div class="divider">
                    <span>必须填写信息</span>
                </div>
            </td>
        </tr>
       <!--  <tr>
        <td class="label">是否带料下单</td>
        <td>
            <div data-toggle="topjui-radio">
                <input type="radio" name="ismaterial" label="是" >
                <input type="radio" name="ismaterial" label="否" checked="checked">
            </div>
        </td>
        <td class="label">该订单是否加急</td>
        <td>
            <div data-toggle="topjui-radio">
                <input type="radio" name="is_urgent" label="是" >
                <input type="radio" name="is_urgent" label="否" checked="checked">
            </div>
        </td>
    </tr> -->
        <tr>
            <td class="label">下单数量</td>
            <td><input type="text" name="order_num" data-toggle="topjui-textbox"data-options="required:true" onblur=""></td>
            <td class="label">单价</td>
            <td><input type="text" name="carton_price" data-toggle="topjui-textbox" data-options="id:'carton_price',required:true" value="6.25" ></td>
        </tr>
        <tr>
            <td class="label">总价</td>
            <td><input type="text" name="carton_total" data-toggle="topjui-textbox"data-options="required:true,readonly:true" ></td>
            <td class="label">联系电话</td>
            <td><input type="text" name="user_tel" data-toggle="topjui-textbox" data-options="required:true" value="13699509973" ></td>
        </tr>
        <tr>
            <td class="label">送货时间</td>
            <td><input name="delivery_time"
                   data-toggle="topjui-datetimebox"
                   data-options="required:true,
                   showSeconds:false"></td>
            <td class="label">送货地址</td>
            <td><input type="text" name="delivery_address" data-toggle="topjui-textbox"  value="江西南昌青山湖区" data-options="required:true"></td>
        </tr>
        <tr>
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
       
        <div title="成套下单" data-options="id:'tab3',type:'panel',
        iconCls:'fa fa-th',footer:'#footer3'">
          <form data-toggle="topjui-form" data-options="id:'formId3'" >
    <table class="editTable">
        <tr>
            <td colspan="4">
                <div class="divider">
                    <span>下单信息</span>
                </div>
            </td>
        </tr>
        <tr>
            <td class="label">类型</td>
            <td><input type="text" name="user" data-toggle="topjui-combobox"
                       data-options="required:true,
                       valueField:'id',
                       textField:'text',
                       data:[{id:1,text:'通用'},{id:2,text:'内接'},{id:3,text:'外发'}]"></td>
            <td class="label">客户公司</td>
            <td><input type="text" name="user_company" data-toggle="topjui-textbox" data-options="readonly:true,id:'user_company',required:true" value="美宝时光"></td>
            <td class="label"></td>
            <td></td>
            
        </tr>
       
        <tr>
            <td colspan="4">
                <div class="divider">
                    <span>箱型信息</span>
                </div>
            </td>
        </tr>
        
        <tr>
            <td class="label">箱型展示图片</td>
            <td colspan="3" >
                    
                    <img  style="height:150px;width:100%;boder:1px solid;"
                              data-toggle="topjui-img"
                              data-options="id:'remarkAddEditor'"></img>
                              
            </td>
        </tr>
        <tr>
            <td class="label">输入纸箱名称</td>
            <td colspan="3">
                <input type="text" name="zone"
                       data-toggle="topjui-textbox"
                       data-options="required:true">
            </td>
        </tr>
        <tr>
            <td class="label">种类</td>
            <td><input type="text" name="carton_type" data-toggle="topjui-textbox" data-options="readonly:true,id:'carton_type'"></td>
            <td class="label">箱型</td>
            <td><input type="text" name="model_name" data-toggle="topjui-textbox" data-options="readonly:true,id:'model_name'"></td>
        </tr>
        <tr>
            <td class="label">长</td>
            <td><input type="text" name="carton_length" data-toggle="topjui-textbox" data-options="readonly:true,id:'carton_length'"></td>
            <td class="label">宽</td>
            <td><input type="text" name="carton_width" data-toggle="topjui-textbox" data-options="readonly:true,id:'carton_width'"></td>
        </tr>
        <tr>
            <td class="label">高</td>
            <td><input type="text" name="carton_height" data-toggle="topjui-textbox" data-options="readonly:true,id:'carton_height'"></td>
            <td class="label">门幅</td>
            <td><input type="text" name="fabric_width" data-toggle="topjui-textbox" data-options="readonly:true,id:'fabric_width'"></td>
        </tr>
        <tr>
            <td class="label">材质</td>
            <td><input type="text" name="material_science" data-toggle="topjui-textbox" data-options="readonly:true,id:'material_science'"></td>
            <td class="label">楞型</td>
            <td><input type="text" name="pit_type" data-toggle="topjui-textbox" data-options="readonly:true,id:'pit_type'"></td>
        </tr>
        <tr>
            <td class="label">颜色数</td>
            <td><input type="text" name="carton_color" data-toggle="topjui-textbox" data-options="readonly:true,id:'carton_color'"></td>
            <td class="label">打包数</td>
            <td><input type="text" name="pack_num" data-toggle="topjui-textbox" data-options="readonly:true,id:'pack_num'"></td>
        </tr>
        
        
        
        <tr>
            <td class="label">印版号</td>
            <td><input type="text" name="plate_account" data-toggle="topjui-textbox" data-options="readonly:true,id:'plate_account'"></td>
            <td class="label">模版号</td>
            <td><input type="text" name="plates_account" data-toggle="topjui-textbox" data-options="readonly:true,id:'plates_account'"></td>
        </tr>
        <tr>
            <td class="label">粘合方式</td>
            <td><input type="text" name="nail_or_iscose" data-toggle="topjui-textbox" data-options="readonly:true"></td>
            <td class="label">钉条类型</td>
            <td><input type="text" name="nailing_type" data-toggle="topjui-textbox" data-options="readonly:true"></td>
        </tr>
        <tr>
            <td class="label">打钉数</td>
            <td><input type="text" name="nail_num" data-toggle="topjui-textbox" data-options="readonly:true,id:'nail_num'"></td>
            <td class="label"></td>
            <td></td>
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
                <input type="checkbox" name="tz" label="分压" checked="checked"  data-options="readonly:true">
                <input type="checkbox" name="tz" label="裱糊" checked="checked" data-options="readonly:true">
                <input type="checkbox" name="tz" label="印刷" checked="checked"  data-options="readonly:true">
                <input type="checkbox" name="tz" label="开槽"  checked="checked"   data-options="readonly:true">
                <input type="checkbox" name="tz" label="模切"   checked="checked" data-options="readonly:true">
            </div>
            </td>
        </tr>
        <tr>
            <td colspan="4">
                <div class="divider">
                    <span>附件信息</span>
                </div>
            </td>
        </tr>
        <tr>
            <td class="label">刀卡1只</td>
            <td class="label">垫片2张</td>
            
        </tr>
        <tr>
            <td colspan="4">
                <div class="divider">
                    <span>必须填写信息</span>
                </div>
            </td>
        </tr>
       <tr>
        <td class="label">是否带料下单</td>
        <td>
            <div data-toggle="topjui-radio">
                <input type="radio" name="ismaterial" label="是" >
                <input type="radio" name="ismaterial" label="否" checked="checked">
            </div>
        </td>
        <td class="label">该订单是否加急</td>
        <td>
            <div data-toggle="topjui-radio">
                <input type="radio" name="is_urgent" label="是" >
                <input type="radio" name="is_urgent" label="否" checked="checked">
            </div>
        </td>
    </tr>
        <tr>
            <td class="label">下单数量</td>
            <td><input type="text" name="order_num" data-toggle="topjui-textbox"data-options="required:true" onblur=""></td>
            <td class="label">单价</td>
            <td><input type="text" name="carton_price" data-toggle="topjui-textbox" data-options="readonly:true,id:'carton_price',required:true" value="6.25" ></td>
        </tr>
        <tr>
            <td class="label">总价</td>
            <td><input type="text" name="carton_total" data-toggle="topjui-textbox"data-options="required:true,readonly:true" ></td>
            <td class="label">联系电话</td>
            <td><input type="text" name="user_tel" data-toggle="topjui-textbox" data-options="required:true" value="13699509973" ></td>
        </tr>
        <tr>
            <td class="label">送货时间</td>
            <td><input name="delivery_time"
                   data-toggle="topjui-datetimebox"
                   data-options="required:true,
                   showSeconds:false"></td>
            <td class="label">送货地址</td>
            <td><input type="text" name="delivery_address" data-toggle="topjui-textbox"  value="江西南昌青山湖区" data-options="required:true"></td>
        </tr>
        <tr>
            <td class="label">备注</td>
            <td colspan="3">
                    <textarea name="order_remarks" style="height:300px;"
                              data-toggle="topjui-textarea"
                              data-options="id:'remarkAddEditor'"></textarea>
            </td>
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