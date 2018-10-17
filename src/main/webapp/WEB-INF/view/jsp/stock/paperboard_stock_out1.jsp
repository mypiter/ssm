<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!-- 添加供应商 页面 -->
<style>
	#youhui,#zhiban{width: 600px;margin: 0 auto;  border: 1px solid #ccc;}
	#youhui th,#zhiban th{font-size:20px;font-family:'黑体'; height: 30px;}
	#youhui td,#zhiban td{font-size:16px; line-height: 20px;  height: 30px;}
	
</style>
	<div class="easyui-tabs" style="height: 100%;width: 99.9%;">
		<div title="纸板出库" style="padding:10px;text-align: center;">
            <div class="topjui-container"> 
                 <div class="topjui-row">
                     <div class="topjui-col-sm2">
		                        <label class="topjui-form-label">操作</label>
		             </div>
					<div class="topjui-col-sm3">
			            <label class="topjui-form-label">库存中材质记录</label>
			            
			       		 </div>
			       		 <div class="topjui-col-sm3">
			            <label class="topjui-form-label">要出库的订单</label>
			            
			       		 </div>
			        <div class="topjui-col-sm1">
		                        <label class="topjui-form-label">出库数量</label>
		                        
		            </div>
		        	<div class="topjui-col-sm1">
		                        <label class="topjui-form-label">库区位置</label>
		                        
		            </div>
		       		 
		    	</div>               
				<div class="topjui-row">
				    <div class="topjui-col-sm2" id="tr1">		                       
							 <a href="javascript:void(0)" title="新增" onclick="add1()"><i class="fa fa-plus"></i></a>
		            </div> 
					<div class="topjui-col-sm3">
			                <input type="text" name="user"
			                       data-toggle="topjui-combogrid"
			                       data-options="required:true,id:'user',
			                   idField: 'userNameId',
			                   textField: 'userName',
			                   url:remoteHost+'/system/user/getPageSetData',
			                   columns:[[
			                       {field: 'userName', title: '库存中的材质记录'},
			                   ]]">
			       		 </div>
			       		 <div class="topjui-col-sm3">
			           
			           
			                <input type="text" name="user"
			                       data-toggle="topjui-combogrid"
			                       data-options="required:true,id:'user',
			                   idField: 'userNameId',
			                   textField: 'userName',
			                   url:remoteHost+'/system/user/getPageSetData',
			                   columns:[[
			                       {field: 'userName', title: '库存中的材质记录'},
			                   ]]">
			          	  
			       		 </div>
			        <div class="topjui-col-sm1">
		                      
		                      
		                            <input type="text" name="" value=""
		                                   data-toggle="topjui-textbox"
		                                   data-options="required:true">
		                      
		            </div>
		        	<div class="topjui-col-sm1">
		                       
		                       
		                            <input type="text" name="" value=""
		                                   data-toggle="topjui-textbox"
		                                   data-options="required:true">
		                    
		            </div>
		       		
		    	</div>
		 
         </div>    

		    
		    
		    
		   <!--  
			 <table id="zhiban" border="1" >
				<tr>
					<th>操作</th>
					<th>库存中的材质记录</th>
			        <th>要出库的订单</th>
					<th>出库数量</th>
					<th>库区位置</th>
				</tr>
				<tr id="tr1">
					<td><a href="javascript:void(0)" title="新增" onclick="add1()"><i class="fa fa-plus"></i></a></td><i class="fa fa-minus"></i>
				</tr>
			</table>   -->
		</div>
	</div>

<script type="text/javascript">
	$(function() {
	});
	
	/* 纸板材料 */
	function add1(){
		var html1="";
		html1 += "<div class=\"topjui-row\">";
		html1 += "<div class=\"topjui-col-sm2\" id=\"tr1\"></div><a href=\"javascript:void(0)\" title=\"删除\" onclick=\"delet1(this)\"><i class=\"fa fa-minus\"></i></a></td>";
		html1 += "<div class=\"topjui-col-sm3\"><input type=\"text\" name=\"user\" data-toggle=\"topjui-combogrid\" data-options=\"required:true,id:'user',idField: 'userNameId',textField: 'userName',url:remoteHost+'/system/user/getPageSetData',columns:[[{field: 'userName', title: '库存中的材质记录'},]]\"></div>";
		html1 += "<div class=\"topjui-col-sm3\"><input type=\"text\" name=\"user\" data-toggle=\"topjui-combogrid\" data-options=\"required:true,id:'user',idField: 'userNameId',textField: 'userName',url:remoteHost+'/system/user/getPageSetData',columns:[[{field: 'userName', title: '库存中的材质记录'},]]\"></div>";;
		html1 += "<div class=\"topjui-col-sm2\"><input type=\"text\" name=\"user\" data-toggle=\"topjui-combogrid\" data-options=\"required:true,id:'user',idField: 'userNameId',textField: 'userName',url:remoteHost+'/system/user/getPageSetData',columns:[[{field: 'userName', title: '库存中的材质记录'},]]\"></div>";
		html1 += "<div class=\"topjui-col-sm2\"><input type=\"text\" name=\"user\" data-toggle=\"topjui-combogrid\" data-options=\"required:true,id:'user',idField: 'userNameId',textField: 'userName',url:remoteHost+'/system/user/getPageSetData',columns:[[{field: 'userName', title: '库存中的材质记录'},]]\"></div>";
		html1 += "</div>";
		$("#tr1").before(html1);
	};
	function delet1(e1){
		e1.parentElement.parentElement.remove();
	};
	
	
	
</script>

