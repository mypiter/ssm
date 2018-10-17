<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <!-- 避免IE使用兼容模式 -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
    <meta name="renderer" content="webkit">
    <!-- 导入公共样式 -->
    <script type="text/javascript" src="../../static/plugins/jquery/jquery.min.js"></script>
    <%@ include file="./ap.jsp" %>
    <title>纸张列表</title>
    <script type="text/javascript">
        $(document).ready(function(){
            //var html = $("#userDg").html();
            //console.info(html);

            //$("#userDg").click(function(a){
            //    alert(a);
            // });
        });
    </script>
</head>

<body>
<!-- layout布局 开始 -->
<div data-toggle="topjui-layout" data-options="fit:true">
    <div data-options="region:'center',title:'',fit:false,split:true,border:false,bodyCls:'border_right_bottom'">
        <!-- datagrid表格 -->
        <table  id="dbss" data-toggle="topjui-datagrid"
               data-options="id:'userDg',
                       singleSelect:true,
					    selectOnCheck:false,
					    checkOnSelect:false,
                      url:'/BackLog/getList/',
			            childTabs: [
                            {id:'eastTabs'}
                        ]">
            <thead>
            <tr>
                <th data-options="field: 'id', title: 'UID', checkbox: true"></th>
                <th data-options="field: 'orderNum', title: '订单号', sortable: true"></th>
                <th data-options="field: 'name', title: '名称', sortable: true"></th>
                <th  data-options="field: 'description', title: '描述',formatter:compareTime,sortable: true"></th>
                <th id="descr" data-options="field: 'state', title: '状态', sortable: true"></th>
                <th data-options="field: 'lastTime', title: '最后处理时间',sortable: true"></th>
                <th data-options="field: 'oper',title: '操作',formatter:rowformater,onClickRow:delHsCode"></th>
            </tr>
            </thead>
        </table>
    </div>
</div>
<!-- layout布局 结束 -->


<!-- 表格工具栏开始 -->



<!-- 表格工具栏结束 -->
<script type="text/javascript">

    function compareTime(value, row, index) {
        var now = new Date();
        var v1 = new Date(row.lastTime);
        if(now > v1){
            return '<span style="color: red">逾期未处理... </span>';
        }
        return value
    }
    function rowformater(value, row, index) {

        if(row.state==("待处理")){
            return '<a onclick="delHsCode(' + index + ')" style="color: red">处理</input>';
        }else{
            return '<a onclick="delHsCode(' + index + ')" style="color: green">查看</input>';
        }
    }
    function delHsCode(index) {
        $('#dbss').datagrid('selectRow', index);
        var row = $('#dbss').datagrid('getSelected');

    }
    $(function(){
        $("#treetab th").tabs({
            onClick:function(node){
                alert(node.text);
            }
        });
        $('#queryBtn').iMenubutton({
            method: 'query',
            iconCls: 'fa fa-search',
            btnCls: 'topjui-btn-danger',
            form: {id: 'queryForm'},
            grid: {type: 'datagrid', 'id': 'productDg'}
        });
        // var body = $("#body").html();
        // console.info(body);

    });

</script>
</body>
</html>