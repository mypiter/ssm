<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div data-toggle="topjui-layout" data-options="fit:true">
    <div data-options="region:'center',title:'',fit:true,border:false,bodyCls:'border_right_bottom'">
        <div data-toggle="topjui-tabs" data-options="fit:true,border:false">
        
        	<!-- 物材采购单入库 -->
            <div title="物材出库" data-options="iconCls:'fa fa-th'">
                <div data-toggle="topjui-layout" style="width: 100%;height: 100%">
				    <div data-options="region:'center',title:'',split:true" style="width:50%;background:#eee;">
				        <!-- <table class="netCompanyDataTable"></table> -->
				        <table data-toggle="topjui-edatagrid"
						       data-options="id:'configDatagrid',
						                   selectOnCheck:true,
						                   url:'<!-- ../../json/config/config_1.json -->'">
						    <thead>
						    <tr>
						        <th data-options="field:'uuid',title:'UUID',checkbox:true"></th>
						        <th data-options="field:'type',title:'供应商',sortable:true"></th>
						        <th data-options="field:'createTime',title:'物材名称',sortable:true"></th>
						        <th data-options="field:'code',title:'规格',sortable:true"></th>
						        <th data-options="field:'value',title:'库存数量',sortable:true"></th>
						        <th data-options="field:'kuqu',title:'库区位置',sortable:true"></th>
						        <th data-options="field:'number',title:'出库数量',sortable:true,editor:{type:'textbox',options:{required:true,height:30}}"></th>
						    </tr>
						    </thead>
						</table>
				    </div>
				</div>
            </div>
            <!-- 物材采购单入库 -->
            
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