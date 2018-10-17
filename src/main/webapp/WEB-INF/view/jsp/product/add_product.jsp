<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
        <form class="hidden" method="post" data-toggle="topjui-form" data-options="id:'formId',
               url:_ctx + '/json/response/form.json?uuid=123456',
               editor:[
                   {id:'remarkAddEditor',field:'remark'}
               ]">
           <br/>
    		<div class="topjui-row">
	       		 <div class="topjui-col-sm5">
	           	 <label class="topjui-form-label">客户公司</label>
	             <div class="topjui-input-block">
	                <input type="text" name="user"
	                       data-toggle="topjui-combogrid"
	                       data-options="required:true,
	                       id:'user',
	                   idField: 'userNameId',
	                   textField: 'userName',
	                   url:remoteHost+'/system/user/getPageSetData',
	                   columns:[[
	                       {field: 'userName', title: '客户公司'},
	                   ]]">
	            </div>
	           </div>
	           <div class="topjui-col-sm4">
	           	 <label class="topjui-form-label">客户名称</label>
	             <div class="topjui-input-block">
	                <input type="text" name="user"
	                       data-toggle="topjui-combogrid"
	                       data-options="required:true,
	                       id:'user',
	                   idField: 'userNameId',
	                   textField: 'userName',
	                   url:remoteHost+'/system/user/getPageSetData',
	                   columns:[[
	                       {field: 'userName', title: '客户公司'},
	                   ]]">
	            </div>
	           </div>
	          </div>
         <div class="topjui-row">
        	
       		<div class="topjui-col-sm3">
                        <label class="topjui-form-label">生产尺寸</label>
                        <div class="topjui-input-block">
                            <input type="text" name="carton_length" data-toggle="topjui-textbox" data-options="required:true,readonly:false,id:'carton_length'">
                        </div>
                    </div>
                   <div class="topjui-col-sm3">
                        <label class="topjui-form-label">纸板尺寸</label>
                        <div class="topjui-input-block">
                            <input type="text" name="carton_length" data-toggle="topjui-textbox" data-options="required:true,readonly:false,id:'carton_length'">
                        </div>
                    </div>
                    <div class="topjui-col-sm3">
                        <label class="topjui-form-label">压线规格</label>
                        <div class="topjui-input-block">
                            <input type="text" name="carton_length" data-toggle="topjui-textbox" data-options="required:true,readonly:false,id:'carton_length'">
                        </div>
                    </div>
		         
    	</div>
       
        <div class="topjui-row">
        <div class="topjui-col-sm3">
            <label class="topjui-form-label">箱型</label>
            <div class="topjui-input-block">
                <input type="text" name="user"
                       data-toggle="topjui-combogrid"
                       data-options="required:true,id:'user',
                   idField: 'userNameId',
                   textField: 'userName',
                   url:remoteHost+'/system/user/getPageSetData',
                   columns:[[
                       {field: 'userName', title: '箱型'},
                   ]]">
          	  </div>
       		 </div>
       		 <div class="topjui-col-sm3">
            <label class="topjui-form-label">材质/楞型</label>
            <div class="topjui-input-block">
                <input type="text" name="carton_length" data-toggle="topjui-textbox" data-options="required:true,readonly:false,id:'carton_length'">
          	  </div>
       		 </div>
           
       		 <div class="topjui-col-sm3">
            <label class="topjui-form-label">单价</label>
            <div class="topjui-input-block">
                <input type="text" name="carton_length" data-toggle="topjui-textbox" data-options="required:true,readonly:false,id:'carton_length'">
          	  </div>
       		 </div>
    	</div>

	   <div class="topjui-row">
        	
       		<div class="topjui-col-sm3">
                        <label class="topjui-form-label">印版号</label>
                        <div class="topjui-input-block">
                            <input type="text" name="" value=""
                                   data-toggle="topjui-textbox"
                                   data-options="required:true">
                        </div>
            </div>
       		<div class="topjui-col-sm3">
                        <label class="topjui-form-label">模版号</label>
                        <div class="topjui-input-block">
                            <input type="text" name="" value=""
                                   data-toggle="topjui-textbox"
                                   data-options="required:true">
                        </div>
            </div>
            <div class="topjui-col-sm3">
                        <label class="topjui-form-label">印刷颜色</label>
                        <div class="topjui-input-block">
                        <input type="text" name="" value=""
                                   data-toggle="topjui-textbox"
                                   data-options="required:true">
                            
                        </div>
         	</div>
		</div>

		
		 <div class="topjui-row">
					 <div class="topjui-col-sm3">
	                        <label class="topjui-form-label">结合方式</label>
	                        <div class="topjui-input-block">
	                            <input type="text" name="" value=""
	                                   data-toggle="topjui-textbox"
	                                   data-options="required:true">
	                        </div>
			         </div>
		             <div class="topjui-col-sm3">
		            <label class="topjui-form-label">压线类型</label>
		            <div class="topjui-input-block">
		                <input type="text" name="type"
			                   data-toggle="topjui-combobox"
			                   data-options="data:[
			                       {
			                           text: '明线',
			                           value: '1'
			                       }
			                   ],required:true">
		          	  </div>
		       		 </div>
		       		 <div class="topjui-col-sm3">
            <label class="topjui-form-label">面纸尺寸</label>
            <div class="topjui-input-block">
                <input type="text" name="" value=""
                                   data-toggle="topjui-textbox"
                                   data-options="required:true">
          	  </div>
       		 </div>
    	 </div>
    	<div class="topjui-row">
       		 <div class="topjui-col-sm3">
                        <label class="topjui-form-label">面纸材质</label>
                        <div class="topjui-input-block">
                            <input type="text" name="" value=""
                                   data-toggle="topjui-textbox"
                                   data-options="required:true">
                        </div>
            </div>
       		
       		
		</div>   	
        </form>
