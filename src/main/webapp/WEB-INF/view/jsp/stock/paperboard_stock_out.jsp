<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div data-toggle="topjui-layout" data-options="fit:true">
    <div data-options="region:'center',title:'',fit:true,border:false,bodyCls:'border_right_bottom'">
        <div data-toggle="topjui-tabs" data-options="fit:true,border:false">
            <div title="采购单出库" data-options="iconCls:'fa fa-th'">
                <div data-toggle="topjui-layout" style="width: 100%;height: 100%">
    
    <div data-options="region:'north',split:true" style="height:80px;">
        <!-- <input type="hidden" id="transportId" name="transportId" value="${id}">
        <input type="hidden" id="flightId" name="flightId" value="${transportFlight.id}">
        <input type="hidden" id="level2ProxyId" name="level2ProxyId" value="${carrierLevel2Proxy.id}"> -->
        <table class="editTable" border="0" style="margin-left: 2px;text-align: left!important;" cellpadding="15px">
            <tr>
                
                <td class="label1">选择要出库的采购单</td>
                <td>
                    <input type="text" name="nation"
	                                   data-toggle="topjui-combobox"
	                                   data-options="url:remoteHost + '/system/codeItem/getListByCodeSetIdAndLevelId?codeSetId=AAAB&levelId=2',
	                                   valueField:'text',
	                                   panelHeight:'100'">
                </td>
                <td class="label1"></td>
                <td>
                   <input type="button" name="flightNo" value="自动分析">
                </td>
            </tr>
        </table>
        <div class="divider">
        </div>
    </div>
    <div data-options="region:'center',title:'',split:true" style="width:50%;background:#eee;">
        <!-- <table class="netCompanyDataTable"></table> -->
        <table data-toggle="topjui-edatagrid"
       data-options="id:'configDatagrid',
                   selectOnCheck:true,
                   url:'../../json/config/config_1.json'">
    <thead>
    <tr>
        <th data-options="field:'uuid',title:'UUID',checkbox:true"></th>
        <th data-options="field:'type',title:'订单号',sortable:true"></th>
        <th data-options="field:'sort',title:'材质',sortable:true"></th>
        <th data-options="field:'name',title:'楞型',sortable:true"></th>
        <th data-options="field:'code',title:'纸板长',sortable:true"></th>
        <th data-options="field:'value',title:'纸板宽',sortable:true"></th>
        <th data-options="field:'description',title:'压线类型',sortable:true"></th>
        <th data-options="field:'creator',title:'下料尺寸',sortable:true"></th>
        <th data-options="field:'createTime',title:'备料数',sortable:true"></th>
        <th data-options="field:'number',title:'出库数',sortable:true,editor:{type:'textbox',options:{required:true,height:30}}"></th>
        <th data-options="field:'kuqu',title:'出库库区',sortable:true,editor:{type:'textbox',options:{required:true,height:30}}"></th>
    </tr>
    </thead>
</table>
    </div>
</div>
            </div>
            
            <div title="材质出库" data-options="iconCls:'fa fa-th'">
                <div class="topjui-fluid">
                    <fieldset>
                        <legend>出库信息</legend>
                    </fieldset>
                    <div class="topjui-row">
                        
                        <div class="topjui-col-sm4">
                        <label class="topjui-form-label">本公司代号</label>
                        <div class="topjui-input-block">
                          <input type="text" name="" value=""
		                                   data-toggle="topjui-textbox"
		                                   data-options="required:true">
                        </div>
           				</div>
                        
                        
           			
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
		                        <label class="topjui-form-label">宽度压线</label>
		                        <div class="topjui-input-block">
		                            <input type="text" name="" value=""
		                                   data-toggle="topjui-textbox"
		                                   data-options="required:true">
		                        </div>
		            </div>
		             <div class="topjui-col-sm4">
		                        <label class="topjui-form-label">压线类型</label>
		                        <div class="topjui-input-block">
		                            <input type="text" name="type"
					                   data-toggle="topjui-combobox"
					                   data-options="data:[
					                       {
					                           text: '额度用户',
					                           value: '1'
					                       }
					                   ],required:true">
		                        </div>
		         	</div>
		         	<div class="topjui-col-sm4">
                        <label class="topjui-form-label">出库数量</label>
                        <div class="topjui-input-block">
                            <input type="text" name="zday" data-toggle="topjui-numberspinner" data-options="required:true">
                        </div>
            		</div>
            			
		    	</div>
    	
                    <div class="topjui-row">
                        
                        <div class="topjui-col-sm4">
                            <label class="topjui-form-label">单价</label>
                            <div class="topjui-input-block">
                                <input type="text" name="sale_price" data-toggle="topjui-numberspinner"
                                       data-options="required:true,precision:2">
                            </div>
                        </div>
                        <div class="topjui-col-sm4">
                            <label class="topjui-form-label">总价</label>
                            <div class="topjui-input-block">
                                <input type="text" name="sale_price" data-toggle="topjui-numberspinner"
                                       data-options="required:true,precision:2">
                            </div>
                        </div>
                        <div class="topjui-col-sm4">
                        <label class="topjui-form-label">出库库区</label>
                        <div class="topjui-input-block">
                           <input type="text" name="type"
			                   data-toggle="topjui-combobox"
			                   data-options="data:[
			                       {
			                           text: '额度用户',
			                           value: '1'
			                       }
			                   ],required:true">
                        </div>
           				 </div>
                    </div>
                    
                    
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    $(function () {
        var grid = {
            type: 'datagrid',
            id: 'airplaneDataTable'
        };

        var grid1 = {
            type: 'datagrid',
            id: 'netCompanyDataTable'
        };

        var _ctx = '${pageContext.request.contextPath}';
        
        /* $("." + grid1.id).iDatagrid({
            rownumbers: false,
            remoteFilter: true,
            url: '/json/datagrid/wldl.json',
            onClickRow: function (index, row) {
                selectLevel2Proxy(row);
            },
            columns: [[
                {field: 'id', title: '', checkbox: true},
                {field: 'name', title: '订单号', sortable: false, width: 100},
                {field: 'leader', title: '材质', sortable: false, width: 100},
                {field: 'leaderPhone', title: '楞型', sortable: false, width: 100},
                {field: 'remark', title: '纸板长', sortable: false, width: 100},
                {field: 'remark', title: '纸板宽', sortable: false, width: 100},
                {field: 'remark', title: '压线类型', sortable: false, width: 100},
                {field: 'remark', title: '宽度压线', sortable: false, width: 100},
                {field: 'address', title: '下料尺寸', sortable: false, width: 100, hidden: true},
                {field: 'remark', title: '备料数', sortable: false, width: 100},
            ]],
            filter: [
                {
                    field: 'status',
                    type: 'label'
                }
            ]
        }); */
    });

    // 选择航空代理
    function selectFlight(row) {
        $("#carrierFlightId").html("");
        $("#flightId").val("");

        $("#carrierFlightId").html("<span style='font-weight:bold;font-size:18px'>【航空代理】：</span><span style='font-size:18px'>" + row.name + " " + row.leader + " " + row.leaderPhone + " " + row.address + " " + row.remark + "</span>");
        $("#flightId").val(row.id);
    }
    // 选择二级网络代理
    function selectLevel2Proxy(row) {
        $("#carrierLevel2ProxyId").html("");
        $("#level2ProxyId").val("");

        $("#carrierLevel2ProxyId").html("<span style='font-weight:bold;font-size:18px '>【网络代理】：</span><span style='font-size:18px'>" + row.name + " " + row.leader + " " + row.leaderPhone + " " + row.address + " " + row.remark + "</span>");
        $("#level2ProxyId").val(row.id);
    }
</script>