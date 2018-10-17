<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<style type="text/css">
  p{
  color:red;
  }
</style>
<div data-toggle="topjui-layout" data-options="fit:true">
    <div data-options="region:'center',title:'',fit:true,border:false,bodyCls:'border_right_bottom'">
        <div data-toggle="topjui-tabs" data-options="fit:true,border:false">
            <div title="纸箱借调" data-options="iconCls:'fa fa-th'">
                <div data-toggle="topjui-layout" style="width: 100%;height: 100%">
    
    <div data-options="region:'north',split:true" style="height:80px;">
        <!-- <input type="hidden" id="transportId" name="transportId" value="${id}">
        <input type="hidden" id="flightId" name="flightId" value="${transportFlight.id}">
        <input type="hidden" id="level2ProxyId" name="level2ProxyId" value="${carrierLevel2Proxy.id}"> -->
        <table class="editTable" border="0" style="margin-left: 2px;text-align: left!important;" cellpadding="15px">
            <tr>
                <td class="label1"></td>
                <td>
                                      <p>借调给 》》</p>
                </td>
                <td class="label1">选择要借调的订单</td>
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
        <th data-options="field:'code',title:'客户名称',sortable:true"></th>
        <th data-options="field:'value',title:'业务员',sortable:true"></th>
         <th data-options="field:'createTime',title:'产品名称',sortable:true"></th>
        <th data-options="field:'description',title:'订单数量',sortable:true"></th>
        <th data-options="field:'description',title:'库存数量',sortable:true"></th>
        <th data-options="field:'number',title:'借调数',sortable:true,editor:{type:'textbox',options:{required:true,height:30}}"></th>
        <th data-options="field:'kuqu',title:'借调存放库区',sortable:true,editor:{type:'textbox',options:{required:true,height:30}}"></th>
        <th data-options="field:'sort',title:'材质',sortable:true"></th>
        <th data-options="field:'name',title:'楞型',sortable:true"></th>
        <th data-options="field:'name',title:'纸箱尺寸',sortable:true"></th>
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
