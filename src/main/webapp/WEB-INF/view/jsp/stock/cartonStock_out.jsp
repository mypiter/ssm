<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div data-toggle="topjui-layout" data-options="fit:true">
    <div data-options="region:'center',title:'',fit:true,border:false,bodyCls:'border_right_bottom'">
        <div data-toggle="topjui-tabs" data-options="fit:true,border:false">
            <div title="纸箱出库" data-options="iconCls:'fa fa-th'">
                <div data-toggle="topjui-layout" style="width: 100%;height: 100%">
    
    <div data-options="region:'north',split:true" style="height:235px;">
        <!-- <input type="hidden" id="transportId" name="transportId" value="${id}">
        <input type="hidden" id="flightId" name="flightId" value="${transportFlight.id}">
        <input type="hidden" id="level2ProxyId" name="level2ProxyId" value="${carrierLevel2Proxy.id}"> -->
        <table class="editTable" border="0" style="margin-left: 2px;text-align: left!important;" cellpadding="15px">
            <tr>
                <td>选择要配送的客户名称</td>
                <td>
                    <input type="text" name="user"
                       data-toggle="topjui-combogrid"
                       data-options="required:true,id:'user',
	                   idField: 'userNameId',
	                   textField: 'userName',
	                   url:remoteHost+'/system/user/getPageSetData',
	                   columns:[[
	                       {field: 'userName', title: '客户名称'},
                   
                   ]]">
                </td>
                <td></td>
                <td>
                   <input type="button" name="flightNo" value="自动分析">
                </td>
                <td>选择配送人</td>
                <td>
                    <input type="text" name="user"
                       data-toggle="topjui-combogrid"
                       data-options="required:true,id:'user',
	                   idField: 'userNameId',
	                   textField: 'userName',
	                   url:remoteHost+'/system/user/getPageSetData',
	                   columns:[[
	                       {field: 'userName', title: '配送人'},
                   
                   ]]">
                </td>
                <td>选择配送时间</td>
                <td>
                    <input type="text" name="delivery_time" data-toggle="topjui-datebox" data-options="required:true">
                </td>
            </tr>
            <tr>
            	<td>收货人</td>
                <td>
                	<input type="text" name="user"
                       data-toggle="topjui-combogrid"
                       data-options="required:true,id:'user',
	                   idField: 'userNameId',
	                   textField: 'userName',
	                   prompt:'默认客户名称（可修改）',
	                   url:remoteHost+'/system/user/getPageSetData',
	                   columns:[[
	                       {field: 'userName', title: '客户名称'},
                   
                   ]]">
                </td>
                <td></td><td></td>
                <td>收货人联系方式</td>
                <td>
                    <input type="text" name="text" data-toggle="topjui-textbox" data-options="prompt:'默认客户联系方式（可修改）',required:true">
                </td>
            </tr>
            <tr>
            	<td>确认配送地址</td>
            	<td colspan="7"><input type="text" name="qq" value="显示默认地址（可以修改）" data-toggle="topjui-textbox" data-options="required:true"></td>
            </tr>
            <tr>
            	<td>备注</td>
		        <td colspan="6">
		            <input type="text" name="description" data-toggle="topjui-textarea">
		        </td>
            </tr>
        </table>
        <!-- <div class="divider">
        </div> -->
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
        <th data-options="field:'code',title:'客户名称',sortable:true"></th>
        <th data-options="field:'value',title:'业务员',sortable:true"></th>
        <th data-options="field:'createTime',title:'产品名称',sortable:true"></th>
        <th data-options="field:'description',title:'订单数量',sortable:true"></th>
        <th data-options="field:'description',title:'库存数量',sortable:true"></th>
        <th data-options="field:'kuqu',title:'库区位置',sortable:true"></th>
        <th data-options="field:'number',title:'出库数',sortable:true,editor:{type:'textbox',options:{required:true,height:30}}"></th>
        <th data-options="field:'sort',title:'材质',sortable:true"></th>
        <th data-options="field:'name',title:'楞型',sortable:true"></th>
        <th data-options="field:'creator',title:'纸箱尺寸',sortable:true"></th>
    </tr>
    </thead>
</table>
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