<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


<input type="hidden" id="uuid" name="uuid">
 <form class="hidden" method="post" data-toggle="topjui-form" data-options="id:'formId',
               url:_ctx + '/json/response/form.json?uuid=123456',
               editor:[
                   {id:'remarkAddEditor',field:'remark'}
               ]">
                <br/>
		<div class="topjui-row">
        	<div class="topjui-col-sm4">
                        <label class="topjui-form-label">客户联系人</label>
                        <div class="topjui-input-block">
                            <input type="text" name="" value=""
                                   data-toggle="topjui-textbox"
                                   data-options="required:true">
                        </div>
            </div>
       		 <div class="topjui-col-sm4">
                        <label class="topjui-form-label">客户公司</label>
                        <div class="topjui-input-block">
                            <input type="text" name="" value=""
                                   data-toggle="topjui-textbox"
                                   data-options="required:true">
                        </div>
             </div>
    	</div>
    	
        <div class="topjui-row">
         <div class="topjui-col-sm4">
	           	 <label class="topjui-form-label">所属业务员</label>
	             <div class="topjui-input-block">
	                <input type="text" name="user"
	                       data-toggle="topjui-combogrid"
	                       data-options="required:true,
	                       id:'user',
	                   idField: 'userNameId',
	                   textField: 'userName',
	                   url:remoteHost+'/system/user/getPageSetData',
	                   columns:[[
	                       {field: 'userName', title: '所属业务员'},
	                   ]]">
	            </div>
	           </div>
    		<div class="topjui-col-sm4">
                        <label class="topjui-form-label">电话</label>
                        <div class="topjui-input-block">
                            <input type="text" name="" value=""
                                   data-toggle="topjui-textbox"
                                   data-options="required:true">
                        </div>
            </div> 
        	
		</div>
		
		<div class="topjui-row">
    	    <div class="topjui-col-sm4">
            <label class="topjui-form-label">客户账期类型</label>
            <div class="topjui-input-block">
                 <input type="text" name="type"
                   data-toggle="topjui-combobox"
                   data-options="data:[
                       {
                           text: '额度用户',
                           value: '1'
                       },
                       {
                           text: '预付款',
                           value: '2'
                       },
                       {
                           text: '账期',
                           value: '3'
                       }
                   ],required:true">
          	  </div>
       		 </div>
        	<div class="topjui-col-sm4">
                        <label class="topjui-form-label">账期天数</label>
                        <div class="topjui-input-block">
                            <input type="text" name="zday" data-toggle="topjui-numberspinner" data-options="required:true">
                        </div>
            </div>
       		
    	</div> 
         <div class="topjui-row">
            <div class="topjui-col-sm4">
                        <label class="topjui-form-label">授信天数</label>
                        <div class="topjui-input-block">
                            <input type="text" name="user_lockTime"  data-options="required:true" data-toggle="topjui-numberspinner">
                        </div>
            </div>
       		
        	<div class="topjui-col-sm4">
                        <label class="topjui-form-label">客户额度</label>
                        <div class="topjui-input-block">
                           <input type="text" name="user_quota" data-toggle="topjui-numberspinner"  data-options="required:true">
                        </div>
            </div>
       		
    	</div> 
    	
    	  
    	
    	<div class="topjui-row">
        	
    	  </div> 	
    	<div class="topjui-row">
        	<div class="topjui-col-sm4">
                        <label class="topjui-form-label">微信</label>
                        <div class="topjui-input-block">
                            <input type="text" name="" value=""
                                   data-toggle="topjui-textbox"
                                   data-options="required:true">
                        </div>
            </div>
       		 <div class="topjui-col-sm4">
                        <label class="topjui-form-label">QQ</label>
                        <div class="topjui-input-block">
                            <input type="text" name="" value=""
                                   data-toggle="topjui-textbox"
                                    data-options="required:true">
                        </div>
             </div>
    	</div>	
    	<div class="topjui-row">
        	<div class="topjui-col-sm4">
                        <label class="topjui-form-label">送货距离/公里</label>
                        <div class="topjui-input-block">
                            <input type="text" name="user_qq" data-toggle="topjui-textbox"  data-options="required:true">
                        </div>
            </div>
       		<div class="topjui-col-sm4">
                        <label class="topjui-form-label">是否含付税款</label>
                        <div class="topjui-input-block">
                            <input name="" data-toggle="topjui-switchbutton"
                                   data-options="required:true,onText:'是',offText:'否'">
                        </div>
         	</div>
    	</div>	
    	<div class="topjui-row">
	    	<div class="topjui-col-sm4">
	                        <label class="topjui-form-label">送货单样式</label>
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
	             <div class="topjui-col-sm4">
                        <label class="topjui-form-label">货款打折</label>
                        <div class="topjui-input-block">
                            <input type="text" name="" value=""
	                                   data-toggle="topjui-textbox"
	                                   data-options="required:true">
                        </div>
             </div>
         </div>	
    	<div class="topjui-row">
        	<div class="topjui-col-sm8">
                        <label class="topjui-form-label">地址</label>
                        <div class="topjui-input-block">
                        <textarea id="_easyui_textbox_input7" class="textbox-text validatebox-text" 
                        autocomplete="off" tabindex="" placeholder="" style="margin: 0px; height:50px;
                         width: 500px;" data-options="required:true,"></textarea>
                        </div>
            </div>
       		
       		
    	</div>		
</form>

