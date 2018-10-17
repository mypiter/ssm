<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div data-toggle="topjui-layout" data-options="fit:true">
    <div data-options="region:'center',title:'',fit:true,border:false,bodyCls:'border_right_bottom'">
        <div data-toggle="topjui-tabs" data-options="fit:true,border:false">
        
        	<!-- 采购单入库 -->
            <div title="采购单入库" data-options="iconCls:'fa fa-th'">
                <div class="topjui-fluid">
                    <fieldset>
                        <legend>入库信息</legend>
                    </fieldset>
                    <div class="topjui-row">
                        <div class="topjui-col-sm6">
                        	<label class="topjui-form-label">选择采购单号</label>
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
                    </div>
                    <div class="topjui-row">
                        <div class="topjui-col-sm6">
                        	<label class="topjui-form-label">订单单号</label>
				            <div class="topjui-input-block">
				            	<input type="text" name="" value=""
			                                   data-toggle="topjui-textbox"
			                                   data-options="required:true">
				            </div>
                        </div>
                        
                        <div class="topjui-col-sm6">
			            	<label class="topjui-form-label">材质/楞型</label>
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
                    </div>
                    <div class="topjui-row">
                        <div class="topjui-col-sm6">
	                        <label class="topjui-form-label">纸板尺寸</label>
	                        <div class="topjui-input-block">
	                          <input type="text" name="" value=""
			                                   data-toggle="topjui-textbox"
			                                   data-options="required:true">
	                        </div>
           				</div>
           				<div class="topjui-col-sm6">
	                        <label class="topjui-form-label">压线规格</label>
	                        <div class="topjui-input-block">
	                            <input type="text" name="" value=""
	                                   data-toggle="topjui-textbox"
	                                   data-options="required:true">
	                        </div>
			            </div>
                    </div>
                    <div class="topjui-row">
			            <div class="topjui-col-sm6">
	                        <label class="topjui-form-label">压线类型</label>
	                        <div class="topjui-input-block">
	                            <input type="text" name="type"
				                   data-toggle="topjui-combobox"
				                   data-options="data:[
				                       {
				                           text: '明线',
				                           value: '1'
				                       },
				                       {
				                           text: '暗线',
				                           value: '2'
				                       }
				                   ],required:true,
				                   panelHeight:'70'">
	                        </div>
			         	</div>
			         	<div class="topjui-col-sm6">
                            <label class="topjui-form-label">入库数量</label>
	                        <div class="topjui-input-block">
	                            <input type="text" name="zday" data-toggle="topjui-numberspinner" data-options="required:true">
	                        </div>
                        </div>
		    		</div>
                </div>
            </div>
            <!-- 采购单入库 -->
            
            <!-- 非采购入库 -->
            <div title="材质入库" data-options="iconCls:'fa fa-th'">
                <div class="topjui-fluid">
                    <fieldset>
                        <legend>入库信息</legend>
                    </fieldset>
                    <div class="topjui-row">
                        <div class="topjui-col-sm6">
                        	<label class="topjui-form-label">默认采购单号</label>
				            <div class="topjui-input-block">
				            	<input type="text" name="" value=""
	                                   data-toggle="topjui-textbox"
	                                   data-options="required:true">
				            </div>
                        </div>
                        <div class="topjui-col-sm6">
			            	<label class="topjui-form-label">材质/楞型</label>
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
                    </div>
                    <div class="topjui-row">
                        <div class="topjui-col-sm6">
	                        <label class="topjui-form-label">纸板尺寸</label>
	                        <div class="topjui-input-block">
	                          <input type="text" name="" value=""
			                                   data-toggle="topjui-textbox"
			                                   data-options="required:true">
	                        </div>
           				</div>
           				<div class="topjui-col-sm6">
	                        <label class="topjui-form-label">压线规格</label>
	                        <div class="topjui-input-block">
	                            <input type="text" name="" value=""
	                                   data-toggle="topjui-textbox"
	                                   data-options="required:true">
	                        </div>
			            </div>
                    </div>
                    <div class="topjui-row">
			            <div class="topjui-col-sm6">
	                        <label class="topjui-form-label">压线类型</label>
	                        <div class="topjui-input-block">
	                            <input type="text" name="type"
				                   data-toggle="topjui-combobox"
				                   data-options="data:[
				                       {
				                           text: '明线',
				                           value: '1'
				                       },
				                       {
				                           text: '暗线',
				                           value: '2'
				                       }
				                   ],required:true,
				                   panelHeight:'70'">
	                        </div>
			         	</div>
			         	<div class="topjui-col-sm6">
                            <label class="topjui-form-label">入库数量</label>
	                        <div class="topjui-input-block">
	                            <input type="text" name="zday" data-toggle="topjui-numberspinner" data-options="required:true">
	                        </div>
                        </div>
		    		</div>
                </div>
            </div>
            <!-- 非采购入库 -->
            
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