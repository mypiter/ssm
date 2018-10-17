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
                        <label class="topjui-form-label">名称</label>
                        <div class="topjui-input-block">
                            <input type="text" name="" value=""
                                   data-toggle="topjui-textbox"
                                   data-options="required:true">
                        </div>
            </div>
       		 <div class="topjui-col-sm4">
                        <label class="topjui-form-label">规格</label>
                        <div class="topjui-input-block">
                             <input type="text" name="" value=""
                                   data-toggle="topjui-textbox"
                                   data-options="required:true">
                        </div>
             </div>
    	</div>
    	
        <div class="topjui-row">
         <div class="topjui-col-sm4">
	           	 <label class="topjui-form-label">楞型</label>
	             <div class="topjui-input-block">
	                <input type="text" name="user"
	                       data-toggle="topjui-combogrid"
	                       data-options="required:true,
	                       id:'user',
	                   idField: 'userNameId',
	                   textField: 'userName',
	                   url:remoteHost+'/system/user/getPageSetData',
	                   columns:[[
	                       {field: 'userName', title: '楞型'},
	                   ]]">
	            </div>
	           </div>
    		<div class="topjui-col-sm4">
                        <label class="topjui-form-label">单价</label>
                        <div class="topjui-input-block">
                             <input type="text" name="" value=""
                                   data-toggle="topjui-textbox"
                                   data-options="required:true">
                        </div>
            </div> 
        	
		</div>
		
		<div class="topjui-row">
    	    <div class="topjui-col-sm4">
            <label class="topjui-form-label">克重</label>
            <div class="topjui-input-block">
                <input type="text" name="" value=""
                                   data-toggle="topjui-textbox"
                                   data-options="required:true">
          	  </div>
       		 </div>
 
    	</div> 
        
    	</div> 
    
</form>