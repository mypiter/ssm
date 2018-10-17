<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<form class="hidden" method="post" data-toggle="topjui-form" data-options="id:'formId',
               url:_ctx + '/json/response/form.json?uuid=123456',
               editor:[
                   {id:'remarkAddEditor',field:'remark'}
               ]">
     <div class="topjui-container">
       <div><br/>
       </div>
        <div class="topjui-row">
        <div class="topjui-col-sm4">
            <label class="topjui-form-label">客户名称</label>
            <div class="topjui-input-block">
                 <input type="text" name="" value=""
                                   data-toggle="topjui-textbox"
                                   data-options="required:true">
          	  </div>
       		 </div>
       		 <div class="topjui-col-sm4">
            <label class="topjui-form-label">订单号</label>
            <div class="topjui-input-block">
                <input type="text" name="user"
                       data-toggle="topjui-combogrid"
                       data-options="required:true,id:'user',
                   idField: 'userNameId',
                   textField: 'userName',
                   url:remoteHost+'/system/user/getPageSetData',
                   columns:[[
                       {field: 'userName', title: '订单号'},
                   ]]">
          	  </div>
       		 </div>
    	</div>
       <div class="topjui-row">
       <div class="topjui-col-sm4">
            <label class="topjui-form-label">退货产品名称</label>
            <div class="topjui-input-block">
                <input type="text" name="user"
                       data-toggle="topjui-combogrid"
                       data-options="required:true,id:'user',
                   idField: 'userNameId',
                   textField: 'userName',
                   url:remoteHost+'/system/user/getPageSetData',
                   columns:[[
                       {field: 'userName', title: '产品名称'},
                   ]]">
          	  </div>
       		 </div>
        <div class="topjui-col-sm4">
            <label class="topjui-form-label">退货数量</label>
            <div class="topjui-input-block">
                <input type="text" name="zday" data-toggle="topjui-numberspinner" data-options="required:true">
          	  </div>
       	 </div>
       
      </div>
      
      
    	
    	<div class="topjui-row">
        	
       		 <div class="topjui-col-sm4">
            <label class="topjui-form-label">退货时间</label>
            <div class="topjui-input-block">
                <input type="text" name="delivery_time" data-toggle="topjui-datebox" data-options="required:true">
          	  </div>
       		 </div>
       		<div class="topjui-col-sm4">
                        <label class="topjui-form-label">退货类型</label>
                        <div class="topjui-input-block">
                            <input type="text" name="type"
                   data-toggle="topjui-combobox"
                   data-options="data:[
                       {
                           text: '',
                           value: '1'
                       }
                   ],required:true">
                        </div>
         	</div>
            
             
    	</div>
    	
    	<div class="topjui-row">
    	<div class="topjui-col-sm4">
                        <label class="topjui-form-label">退赔方式</label>
                        <div class="topjui-input-block">
                             <input type="text" name="type"
                   data-toggle="topjui-combobox"
                   data-options="data:[
                       {
                           text: '',
                           value: '1'
                       }
                   ],required:true">
                        </div>
         	</div>
    	<div class="topjui-col-sm4">
            <label class="topjui-form-label">单价</label>
            <div class="topjui-input-block">
                <input type="text" name="zday" data-toggle="topjui-numberspinner" data-options="required:true">
          	  </div>
       	</div>
        
      </div>
     
        <div class="topjui-row">
        <div class="topjui-col-sm4">
            <label class="topjui-form-label">退赔金额</label>
            <div class="topjui-input-block">
                <input type="text" name="zday" data-toggle="topjui-numberspinner" data-options="required:true">
          	  </div>
       	</div>
        
        <div class="topjui-col-sm4">
            <label class="topjui-form-label">退赔时间</label>
            <div class="topjui-input-block">
                <input type="text" name="delivery_time" data-toggle="topjui-datebox" data-options="required:true">
          	  </div>
       	</div>
        
       		
    	</div>
	   <div class="topjui-row">
	    <div class="topjui-col-sm4">
            <label class="topjui-form-label">材质</label>
            <div class="topjui-input-block">
                <input type="text" name="user"
                       data-toggle="topjui-combogrid"
                       data-options="required:true,id:'user',
                   idField: 'userNameId',
                   textField: 'userName',
                   url:remoteHost+'/system/user/getPageSetData',
                   columns:[[
                       {field: 'userName', title: '材质'},
                   ]]">
          	  </div>
       		 </div>
        	 <div class="topjui-col-sm4">
            <label class="topjui-form-label">楞型</label>
            <div class="topjui-input-block">
                <input type="text" name="user"
                       data-toggle="topjui-combogrid"
                       data-options="required:true,id:'user',
                   idField: 'userNameId',
                   textField: 'userName',
                   url:remoteHost+'/system/user/getPageSetData',
                   columns:[[
                       {field: 'userName', title: '楞型'},
                   ]]">
          	  </div>
       		 </div>
       		
       		
		 </div>
		 <div class="topjui-row">
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
        	<div class="topjui-col-sm6">
                        <label class="topjui-form-label">退货原因</label>
                        <div class="topjui-input-block">
                        <textarea id="_easyui_textbox_input7" class="textbox-text validatebox-text" 
                        autocomplete="off" tabindex="" placeholder="" style="margin: 0px; height:50px;
                         width: 530px;"data-options="required:true"></textarea>
                        </div>
            </div>
       		
    	</div>
    	 <div class="topjui-row">
        	<div class="topjui-col-sm6">
                        <label class="topjui-form-label">备注</label>
                        <div class="topjui-input-block">
                        <textarea id="_easyui_textbox_input7" class="textbox-text validatebox-text" 
                        autocomplete="off" tabindex="" placeholder="" style="margin: 0px; height:50px;
                         width: 530px;"data-options="required:true"></textarea>
                        </div>
            </div>
       		
    	</div>
         </div>   
</form>

