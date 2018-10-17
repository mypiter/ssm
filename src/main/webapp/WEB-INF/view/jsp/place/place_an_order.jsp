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
<div data-toggle="topjui-layout" data-options="fit:true">
    <div data-toggle="topjui-panel" title="" data-options="fit:true,iconCls:'icon-ok',footer:'#footer'">
        <form class="hidden" method="post" data-toggle="topjui-form" data-options="id:'formId',
               url:_ctx + '/json/response/form.json?uuid=123456',
               editor:[
                   {id:'remarkAddEditor',field:'remark'}
               ]">
<div class="topjui-container">
<div class="topjui-row">
    <div class="topjui-col-sm12">
        <fieldset>
            <legend>客户信息</legend>
        </fieldset>
    </div>
</div>
    <div class="topjui-row">
        <div class="topjui-col-sm5">
            <label class="topjui-form-label">客户公司</label>
            <div class="topjui-input-block">
                <input type="text" name="user"
                       data-toggle="topjui-combogrid"
                       data-options="id:'user',
                   idField: 'userNameId',
                   textField: 'userName',
                   url:remoteHost+'/system/user/getPageSetData',
                   columns:[[
                       {field: 'userName', title: '姓名'},
                       {field: 'telephone', title: '办公电话'},
                       {field: 'email', title: '电子邮箱'}
                   ]]">
            </div>
        </div>
        <div class="topjui-col-sm5">
            <label class="topjui-form-label">所属业务员</label>
            <div class="topjui-input-block">
                <input type="text" name="user"
                       data-toggle="topjui-combogrid"
                       data-options="id:'user',
                   idField: 'userNameId',
                   textField: 'userName',
                   url:remoteHost+'/system/user/getPageSetData',
                   columns:[[
                       {field: 'userName', title: '姓名'},
                       {field: 'telephone', title: '办公电话'},
                       {field: 'email', title: '电子邮箱'}
                   ]]">
            </div>
        </div>
    </div>
 <div class="topjui-row">
     <div class="topjui-col-sm12">
         <fieldset>
             <legend>箱型信息</legend>
         </fieldset>
     </div>
 </div>
 <div class="topjui-row">
                    <div class="topjui-col-sm2">
                        <label class="topjui-form-label">长</label>
                        <div class="topjui-input-block">
                            <input type="text" name="carton_length" data-toggle="topjui-textbox" data-options="readonly:false,id:'carton_length'">
                        </div>
                    </div>
                    <div class="topjui-col-sm2">
                        <label class="topjui-form-label">宽</label>
                        <div class="topjui-input-block">
                            <input type="text" name="carton_length" data-toggle="topjui-textbox" data-options="readonly:false,id:'carton_length'">
                        </div>
                    </div>
                    <div class="topjui-col-sm2">
                        <label class="topjui-form-label">高</label>
                        <div class="topjui-input-block">
                            <input type="text" name="carton_length" data-toggle="topjui-textbox" data-options="readonly:false,id:'carton_length'">
                        </div>
                    </div>
                    <div class="topjui-col-sm4">
	                 <label class="topjui-form-label">尺寸类型</label>
	                        <div class="topjui-input-block">
	                           <input type="text" name="type"
				                   data-toggle="topjui-combobox"
				                   data-options="data:[
				                       {
				                           text: '',
				                           value: '1'
				                       },
				                       {
				                           text: '',
				                           value: '2'
				                       },
				                       {
				                           text: '',
				                           value: '3'
				                       }
				                   ],required:true">
	                        </div>
                    </div>
                    
                </div>
                <div class="topjui-row">
                   <div class="topjui-col-sm5">
		            <label class="topjui-form-label">产品名称</label>
		            <div class="topjui-input-block">
		                <input type="text" name="user"
		                       data-toggle="topjui-combogrid"
		                       data-options="id:'user',
		                   idField: 'userNameId',
		                   textField: 'userName',
		                   url:remoteHost+'/system/user/getPageSetData',
		                   columns:[[
		                       {field: 'userName', title: '姓名'},
		                       {field: 'telephone', title: '办公电话'},
		                       {field: 'email', title: '电子邮箱'}
		                   ]]">
		            </div>
        </div> 
                    <div class="topjui-col-sm5">
		            <label class="topjui-form-label">箱型</label>
		            <div class="topjui-input-block">
		                <input type="text" name="user"
		                       data-toggle="topjui-combogrid"
		                       data-options="id:'user',
		                   idField: 'userNameId',
		                   textField: 'userName',
		                   url:remoteHost+'/system/user/getPageSetData',
		                   columns:[[
		                       {field: 'userName', title: '姓名'},
		                       {field: 'telephone', title: '办公电话'},
		                       {field: 'email', title: '电子邮箱'}
		                   ]]">
		            </div>
                </div> 
                </div>
                <div class="topjui-row">
                    <div class="topjui-col-sm5">
		            <label class="topjui-form-label">材质</label>
		            <div class="topjui-input-block">
		                <input type="text" name="user"
		                       data-toggle="topjui-combogrid"
		                       data-options="id:'user',
		                   idField: 'userNameId',
		                   textField: 'userName',
		                   url:remoteHost+'/system/user/getPageSetData',
		                   columns:[[
		                       {field: 'userName', title: '姓名'},
		                       {field: 'telephone', title: '办公电话'},
		                       {field: 'email', title: '电子邮箱'}
		                   ]]">
		            </div>
                </div> 
                   <div class="topjui-col-sm5">
		            <label class="topjui-form-label">楞型</label>
		            <div class="topjui-input-block">
		                <input type="text" name="user"
		                       data-toggle="topjui-combogrid"
		                       data-options="id:'user',
		                   idField: 'userNameId',
		                   textField: 'userName',
		                   url:remoteHost+'/system/user/getPageSetData',
		                   columns:[[
		                       {field: 'userName', title: '姓名'},
		                       {field: 'telephone', title: '办公电话'},
		                       {field: 'email', title: '电子邮箱'}
		                   ]]">
		            </div>
                </div> 
                </div> 
                <div class="topjui-row">
                <div class="topjui-col-sm5">
                        <label class="topjui-form-label">长度压线</label>
                        <div class="topjui-input-block">
                           <input type="text" name="fabric_width" data-toggle="topjui-textbox" data-options="readonly:false,id:'fabric_width'">
                        </div>
                    </div>
                    <div class="topjui-col-sm3">
                        <label class="topjui-form-label">压线类型</label>
                        <div class="topjui-input-block">
                            <input type="text" name="nation"
                                   data-toggle="topjui-combobox"
                                   data-options="url:remoteHost + '/system/codeItem/getListByCodeSetIdAndLevelId?codeSetId=AAAB&levelId=2',
                                   valueField:'text',
                                   panelHeight:'100'">
                        </div>
                    </div>
                    
                </div>
                <div class="topjui-row">
                    <div class="topjui-col-sm5">
                        <label class="topjui-form-label">宽度压线</label>
                        <div class="topjui-input-block">
                            <input type="text" name="fabric_width" data-toggle="topjui-textbox" data-options="readonly:false,id:'fabric_width'">
                        </div>
                    </div>
                    <div class="topjui-col-sm5">
                        <label class="topjui-form-label">开数</label>
                        <div class="topjui-input-block">
                           <input type="text" name="fabric_width" data-toggle="topjui-textbox" data-options="readonly:false,id:'fabric_width'">
                        </div>
                    </div>
                </div>
                <div class="topjui-row">
                    <div class="topjui-col-sm5">
                        <label class="topjui-form-label">落料尺寸</label>
                        <div class="topjui-input-block">
                            <input type="text" name="fabric_width" data-toggle="topjui-textbox" data-options="readonly:false,id:'fabric_width'">
                        </div>
                    </div>
                    <div class="topjui-col-sm5">
                        <label class="topjui-form-label">计量单位</label>
                        <div class="topjui-input-block">
                           <input type="text" name="nation"
                                   data-toggle="topjui-combobox"
                                   data-options="url:remoteHost + '/system/codeItem/getListByCodeSetIdAndLevelId?codeSetId=AAAB&levelId=2',
                                   valueField:'text',
                                   panelHeight:'100'">
                        </div>
                    </div>
                </div>
                 <div class="topjui-row">
                    <div class="topjui-col-sm5">
		            <label class="topjui-form-label">纸板平方</label>
		            <div class="topjui-input-block">
		                <input type="text" name="fabric_width" data-toggle="topjui-textbox" data-options="readonly:false,id:'fabric_width'">
		            </div>
                </div> 
                   <div class="topjui-col-sm5">
		            <label class="topjui-form-label">纸板总平方</label>
		            <div class="topjui-input-block">
		                <input type="text" name="fabric_width" data-toggle="topjui-textbox" data-options="readonly:false,id:'fabric_width'">
		            </div>
                </div> 
                </div>
                <div class="topjui-row">
                    <div class="topjui-col-sm5">
		            <label class="topjui-form-label">印版号</label>
		            <div class="topjui-input-block">
		                <input type="text" name="user"
		                       data-toggle="topjui-combogrid"
		                       data-options="id:'user',
		                   idField: 'userNameId',
		                   textField: 'userName',
		                   url:remoteHost+'/system/user/getPageSetData',
		                   columns:[[
		                       {field: 'userName', title: '姓名'},
		                       {field: 'telephone', title: '办公电话'},
		                       {field: 'email', title: '电子邮箱'}
		                   ]]">
		            </div>
                </div> 
                   <div class="topjui-col-sm5">
		            <label class="topjui-form-label">模板号</label>
		            <div class="topjui-input-block">
		                <input type="text" name="user"
		                       data-toggle="topjui-combogrid"
		                       data-options="id:'user',
		                   idField: 'userNameId',
		                   textField: 'userName',
		                   url:remoteHost+'/system/user/getPageSetData',
		                   columns:[[
		                       {field: 'userName', title: '姓名'},
		                       {field: 'telephone', title: '办公电话'},
		                       {field: 'email', title: '电子邮箱'}
		                   ]]">
		            </div>
                </div> 
                </div>
                <div class="topjui-row">
                    <div class="topjui-col-sm5">
		            <label class="topjui-form-label">门幅</label>
		            <div class="topjui-input-block">
		                <input type="text" name="fabric_width" data-toggle="topjui-textbox" data-options="readonly:false,id:'fabric_width'">
		            </div>
                </div> 
                   <div class="topjui-col-sm5">
		            <label class="topjui-form-label">门幅倍数</label>
		            <div class="topjui-input-block">
		                <input type="text" name="fabric_width" data-toggle="topjui-textbox" data-options="readonly:false,id:'fabric_width'">
		            </div>
                </div> 
                </div>
                <div class="topjui-row">
                    <div class="topjui-col-sm5">
                        <label class="topjui-form-label">结合方式</label>
                        <div class="topjui-input-block">
                            <input type="text" name="nation"
                                   data-toggle="topjui-combobox"
                                   data-options="url:remoteHost + '/system/codeItem/getListByCodeSetIdAndLevelId?codeSetId=AAAB&levelId=2',
                                   valueField:'text',
                                   panelHeight:'100'">
                        </div>
                    </div>
                    <div class="topjui-col-sm5">
                        <label class="topjui-form-label">打钉数</label>
                        <div class="topjui-input-block">
                           <input type="text" name="fabric_width" data-toggle="topjui-textbox" data-options="readonly:false,id:'fabric_width'">
                        </div>
                    </div>
                </div>
                <div class="topjui-row">
                    <div class="topjui-col-sm5">
		            <label class="topjui-form-label">颜色数</label>
		            <div class="topjui-input-block">
		                <input type="text" name="fabric_width" data-toggle="topjui-textbox" data-options="readonly:false,id:'fabric_width'">
		            </div>
                </div> 
                   <div class="topjui-col-sm5">
		            <label class="topjui-form-label">打包数</label>
		            <div class="topjui-input-block">
		                <input type="text" name="fabric_width" data-toggle="topjui-textbox" data-options="readonly:false,id:'fabric_width'">
		            </div>
                </div> 
                </div>
                <div class="topjui-row">
                    <div class="topjui-col-sm5">
                       <label class="topjui-form-label">工序信息</label>
                <div data-toggle="topjui-checkbox">
       
                       分压<input type="checkbox" name="tz" label="分压" checked="checked">裱糊
		                <input type="checkbox" name="tz" label="裱糊" checked="checked">
		                印刷<input type="checkbox" name="tz" label="印刷" checked="checked">开槽
		                <input type="checkbox" name="tz" label="开槽"  checked="checked">
		                模切<input type="checkbox" name="tz" label="模切"   checked="checked">
                
            </div>
                    </div>
                    <div class="topjui-col-sm5">
                        <label class="topjui-form-label">备料数</label>
                        <div class="topjui-input-block">
                            <input type="text" name="fabric_width" data-toggle="topjui-textbox" data-options="readonly:false,id:'fabric_width'">
                        </div>
                    </div>
                </div>
                 <div class="topjui-row">
                    <div class="topjui-col-sm5">
                        <label class="topjui-form-label">是否样箱</label>
                        <div class="topjui-input-block">
                            <input name="sex" data-toggle="topjui-switchbutton"
                                   data-options="onText:'是',offText:'否'">
                        </div>
                    </div>
                    <div class="topjui-col-sm5">
                        <label class="topjui-form-label">是否登记产品库</label>
                        <div class="topjui-input-block">
                           <input name="sex" data-toggle="topjui-switchbutton"
                                   data-options="onText:'是',offText:'否'">
                        </div>
                    </div>
                </div>
                <div class="topjui-row">

                    <div class="topjui-col-sm10">
		            <label class="topjui-form-label">生产备注</label>
		            <div class="topjui-input-block">
		               <textarea id="_easyui_textbox_input7" class="textbox-text validatebox-text" 
                        autocomplete="off" tabindex="" placeholder="" style="margin: 0px; height:86px;
                         width: 630px;"data-options="required:true"></textarea>

		            </div>
                </div> 
      </div>
     
       <div class="topjui-row">

                    <div class="topjui-col-sm10">
		            <label class="topjui-form-label">采购备注</label>
		            <div class="topjui-input-block">
		               <textarea id="_easyui_textbox_input7" class="textbox-text validatebox-text" 
                        autocomplete="off" tabindex="" placeholder="" style="margin: 0px; height:86px;
                         width: 630px;"data-options="required:true"></textarea>

		            </div>
                </div> 
      </div>
       <div class="topjui-row">
                <div class="topjui-col-sm6">
                        <label class="topjui-form-label">印版展示图片</label>
                        <div class="topjui-input-block">
                           <img  style="height:150px;width:80%;boder:1px solid;"
                              data-toggle="topjui-img"
                              data-options="id:'remarkAddEditor'"></img>
                        </div>
                 </div>
        </div>
     <div class="topjui-col-sm12">
         <fieldset>
             <legend>配送信息</legend>
         </fieldset>
     </div>
     <div class="topjui-row">
                    <div class="topjui-col-sm5">
		            <label class="topjui-form-label">客户名称</label>
		            <div class="topjui-input-block">
		                <input type="text" name="fabric_width" data-toggle="topjui-textbox" data-options="readonly:false,id:'fabric_width'">
		            </div>
                </div> 
                   <div class="topjui-col-sm5">
		            <label class="topjui-form-label">联系电话</label>
		            <div class="topjui-input-block">
		                <input type="text" name="fabric_width" data-toggle="topjui-textbox" data-options="readonly:false,id:'fabric_width'">
		            </div>
                </div> 
      </div>
      <div class="topjui-row">
                    <div class="topjui-col-sm5">
		            <label class="topjui-form-label">交货时间</label>
		            <div class="topjui-input-block">
		               <input name="delivery_time"
                   data-toggle="topjui-datetimebox"
                   data-options="required:true,
                   showSeconds:false">
                     
		            </div>
                </div> 
                <div class="topjui-col-sm5">
		            <label class="topjui-form-label">单价</label>
		            <div class="topjui-input-block">
		                <input type="text" name="fabric_width" data-toggle="topjui-textbox" data-options="readonly:false,id:'fabric_width'">
		            </div>
                </div>
                   
      </div>
      <div class="topjui-row">
                    
                   <div class="topjui-col-sm5">
		            <label class="topjui-form-label">订单数量</label>
		            <div class="topjui-input-block">
		                <input type="text" name="fabric_width" data-toggle="topjui-textbox" data-options="readonly:false,id:'fabric_width'">
		            </div>
                </div> 
                 <div class="topjui-col-sm5">
		            <label class="topjui-form-label">总价</label>
		            <div class="topjui-input-block">
		                <input type="text" name="fabric_width" data-toggle="topjui-textbox" data-options="readonly:false,id:'fabric_width'">
		            </div>
                </div> 
      </div>
     
      <div class="topjui-row">

                    <div class="topjui-col-sm10">
		            <label class="topjui-form-label">送货地址</label>
		            <div class="topjui-input-block">
		                <input type="text" name="fabric_width" data-toggle="topjui-textbox" data-options="readonly:false,id:'fabric_width'">
		            </div>
                </div> 
                    
                   
      </div>
      <div class="topjui-row">

                    <div class="topjui-col-sm10">
		            <label class="topjui-form-label">送货备注</label>
		            <div class="topjui-input-block">
		                <textarea id="_easyui_textbox_input7" class="textbox-text validatebox-text" 
                        autocomplete="off" tabindex="" placeholder="" style="margin: 0px; height:86px;
                         width: 630px;"data-options="required:true"></textarea>

		            </div>
                </div> 
                    
                   
      </div>
            </div>
            
        </form>
    </div>
</div>
<div id="footer" class="hidden" style="height: 34px; padding: 5px; text-align: right;">
    <a href="#"
       data-toggle="topjui-linkbutton"
       data-options="id:'submitBtn',
                   iconCls:'fa fa-save',
                   form:{
                       id:'formId',
                       method:'submit',
                       url:'/json/response/success.json',
                       refreshRefererTab:true,
                       closeCurrentTab:true
                   }">提交</a>
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