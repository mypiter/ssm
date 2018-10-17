<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


<input type="hidden" id="uuid" name="uuid">
 <form class="hidden" method="post" data-toggle="topjui-form" data-options="id:'formId',
               url:_ctx + '/json/response/form.json?uuid=123456',
               editor:[
                   {id:'remarkAddEditor',field:'remark'}
               ]">
            
                
                   <br/>
           
         <div class="topjui-row">
        	<div class="topjui-col-sm8">
	           	 <label class="topjui-form-label">供应商</label>
	            <div class="topjui-input-block">
                            <input type="text" name="" value=""
                                   data-toggle="topjui-textbox"
                                   data-options="required:true">
                        </div>
	           </div>
    	</div>       
		<div class="topjui-row">
        	<div class="topjui-col-sm4">
                        <label class="topjui-form-label">物材名称</label>
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
	           	 <label class="topjui-form-label">单价</label>
	             <div class="topjui-input-block">
	                <input type="text" name="" value=""
                                   data-toggle="topjui-textbox"
                                   data-options="required:true">
	            </div>
	           </div>
    		<div class="topjui-col-sm4">
                        <label class="topjui-form-label">数量</label>
                        <div class="topjui-input-block">
                             <input type="text" name="zday" data-toggle="topjui-numberspinner" data-options="required:true">
                        </div>
            </div> 
        	
		</div>
		
		<div class="topjui-row">
    	    <div class="topjui-col-sm4">
            <label class="topjui-form-label">总价</label>
            <div class="topjui-input-block">
                <input type="text" name="" value=""
                                   data-toggle="topjui-textbox"
                                   data-options="required:true">
          	  </div>
       		 </div>
        	<div class="topjui-col-sm4">
                        <label class="topjui-form-label">采购时间</label>
                        <div class="topjui-input-block">
                           <input type="text" name="delivery_time" data-toggle="topjui-datebox" data-options="required:true">
                        </div>
            </div>
       		
    	</div> 
         <div class="topjui-row">
            <div class="topjui-col-sm4">
                        <label class="topjui-form-label">是否到料</label>
                        <div class="topjui-input-block">
                            <input name="" data-toggle="topjui-switchbutton"
                                   data-options="required:true,onText:'是',offText:'否'">
                        </div>
         	</div>
       		
        	<div class="topjui-col-sm4">
                        <label class="topjui-form-label">到料数量</label>
                        <div class="topjui-input-block">
                           <input type="text" name="zday" data-toggle="topjui-numberspinner" data-options="required:true">
                        </div>
            </div>
       		
    	</div> 
    	<!--  <div class="topjui-row">
        	<div class="topjui-col-sm4">
                        <label class="topjui-form-label">是否需要开发票</label>
                        <div class="topjui-input-block">
                            <input name="" data-toggle="topjui-switchbutton"
                                   data-options="required:true,onText:'是',offText:'否'">
                        </div>
         	</div>
       		
    	</div>  -->
    	<div class="topjui-row">
            <div class="topjui-col-sm8">
                        <label class="topjui-form-label">备注</label>
                        <div class="topjui-input-block">
                            <textarea id="_easyui_textbox_input7" class="textbox-text validatebox-text" 
                        autocomplete="off" tabindex="" placeholder="" style="margin: 0px; height:50px;
                        width:460px" data-options="required:true,"></textarea>
                        </div>
         	</div>
       		
        
    	</div> 	
         
</form>

