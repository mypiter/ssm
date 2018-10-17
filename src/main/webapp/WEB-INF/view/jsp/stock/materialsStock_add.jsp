<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div data-toggle="topjui-layout" data-options="fit:true">
    <div data-options="region:'center',title:'',fit:true,border:false,bodyCls:'border_right_bottom'">
        <div data-toggle="topjui-tabs" data-options="fit:true,border:false">
        
        	<!-- 物材采购单入库 -->
            <div title="物材采购单入库" data-options="iconCls:'fa fa-th'">
                <div data-toggle="topjui-layout" style="width: 100%;height: 100%">
				    <table class="editTable">
				    	<tr>
				    		<td class="label1">选择要入库的物材采购单</td>
			                <td>
			                    <input type="text" name="user"
			                       data-toggle="topjui-combogrid"
			                       data-options="id:'user',
				                   idField: 'userNameId',
				                   textField: 'userName',
				                   url:remoteHost+'/system/user/getPageSetData',
				                   columns:[[
				                       {field: 'userName', title: '客户名称'},
			                   ]]">
			                </td>
				    	</tr>
					    <tr>
					        <td class="label">物材名称</td>
					        <td>
					            <input type="text" name="making_name" data-toggle="topjui-textbox" data-options="required:true">
					        </td>
					        <td class="label">规格</td>
					        <td>
					            <input type="text" name="making_spec"
					                   data-toggle="topjui-combobox"
					                   data-options="required:true,data:[
					                       {
					                           text: 'A级',
					                           value: 'A级'
					                       },
					                       {
					                           text: 'B级',
					                           value: 'B级'
					                       },
					                       {
					                           text: 'C级',
					                           value: 'C级'
					                       }
					                   ],panelHeight:100">
					            <!-- <input type="text" name="spec"
					                   data-toggle="topjui-combobox"
					                   data-options="required:true,panelWidth:200,valueField:'code',
					                   url:_ctx + '/json/dictionary/models.json'"> -->
					        </td>
					    </tr>
					    <tr>
					    	<td class="label">入库数量</td>
					        <td><input type="text" name="num" data-toggle="topjui-numberspinner" data-options="required:true"></td><!-- data-options="precision:3" 小数点 -->
					    	<td class="label">单价</td>
					        <td><input type="text" name="price" data-toggle="topjui-numberspinner" data-options="required:true,precision:2"></td><!-- data-options="precision:3" 小数点 -->
					    </tr>
					    <tr>
					    	<td class="label">入库库区位置</td>
					        <td>
					            <input type="text" name="storge_name"
					                   data-toggle="topjui-combobox"
					                   data-options="data:[
					                       {
					                           text: 'A库',
					                           value: 'A库'
					                       },
					                       {
					                           text: 'B库',
					                           value: 'B库'
					                       },
					                       {
					                           text: 'C库',
					                           value: 'C库'
					                       }
					                   ],panelHeight:100">
					            <!-- <input type="text" name="spec"
					                   data-toggle="topjui-combobox"
					                   data-options="required:true,panelWidth:200,valueField:'code',
					                   url:_ctx + '/json/dictionary/models.json'"> -->
					        </td>
					    </tr>
					</table>
				</div>
            </div>
            <!-- 物材采购单入库 -->
        
        	<!-- 物材无采购单入库  -->
            <div title="物材入库" data-options="iconCls:'fa fa-th'">
                <div data-toggle="topjui-layout" style="width: 100%;height: 100%">
				    <input type="hidden" id="uuid" name="uuid">
					<table class="editTable">
					    <tr>
					        <td class="label">物材名称</td>
					        <td>
					            <input type="text" name="making_name" data-toggle="topjui-textbox" data-options="required:true">
					        </td>
					        <td class="label">规格</td>
					        <td>
					            <input type="text" name="making_spec"
					                   data-toggle="topjui-combobox"
					                   data-options="required:true,data:[
					                       {
					                           text: 'A级',
					                           value: 'A级'
					                       },
					                       {
					                           text: 'B级',
					                           value: 'B级'
					                       },
					                       {
					                           text: 'C级',
					                           value: 'C级'
					                       }
					                   ],panelHeight:100">
					            <!-- <input type="text" name="spec"
					                   data-toggle="topjui-combobox"
					                   data-options="required:true,panelWidth:200,valueField:'code',
					                   url:_ctx + '/json/dictionary/models.json'"> -->
					        </td>
					    </tr>
					    <tr>
					    	<td class="label">入库数量</td>
					        <td><input type="text" name="num" data-toggle="topjui-numberspinner" data-options="required:true"></td><!-- data-options="precision:3" 小数点 -->
					    	<td class="label">单价</td>
					        <td><input type="text" name="price" data-toggle="topjui-numberspinner" data-options="required:true,precision:2"></td><!-- data-options="precision:3" 小数点 -->
					    </tr>
					    <tr>
					    	<td class="label">入库库区位置</td>
					        <td>
					            <input type="text" name="storge_name"
					                   data-toggle="topjui-combobox"
					                   data-options="data:[
					                       {
					                           text: 'A库',
					                           value: 'A库'
					                       },
					                       {
					                           text: 'B库',
					                           value: 'B库'
					                       },
					                       {
					                           text: 'C库',
					                           value: 'C库'
					                       }
					                   ],panelHeight:100">
					            <!-- <input type="text" name="spec"
					                   data-toggle="topjui-combobox"
					                   data-options="required:true,panelWidth:200,valueField:'code',
					                   url:_ctx + '/json/dictionary/models.json'"> -->
					        </td>
					    </tr>
					</table>
				</div>
            </div>
            <!-- 物材无采购单入库 -->
        
            
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
                {field: 'remark', title: '产品名称', sortable: false, width: 100},
				{field: 'remark', title: '客户名称', sortable: false, width: 100},
                {field: 'remark', title: '业务员', sortable: false, width: 100},
                {field: 'leader', title: '材质', sortable: false, width: 100},
                {field: 'leaderPhone', title: '楞型', sortable: false, width: 100},
                {field: 'remark', title: '订单数量', sortable: false, width: 100},
                {field: 'address', title: '尺寸', sortable: false, width: 100, hidden: true},
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