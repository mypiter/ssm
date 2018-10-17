<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <%@ include file="../ap.jsp" %>
    <title>生产单列表</title>
</head>

<body>
<!-- layout布局 开始 -->
<div data-toggle="topjui-layout" data-options="fit:true">
    <div data-options="region:'center',iconCls:'icon-reload',title:'',split:true,border:false,bodyCls:'border_left_right'">
        <!-- datagrid表格 -->
        <table data-toggle="topjui-datagrid"
               data-options="id:'userDg',
                        fitColumns:true,
                        singleSelect:true,
					    selectOnCheck:false,
					    checkOnSelect:false,
                       	url:'/PlaceController/findByProList/'">
            <thead>
            <tr>
                <th data-options="field: 'id', title: 'UUID'"></th>
                <th data-options="field:'orderAccount', title: '订单号'"></th>
                <th data-options="field:'customName', title: '客户名称'"></th>
                <th data-options="field:'cartonName', title: '产品名称'"></th>
                <th data-options="field:'cartonLength', title: '长'"></th>
                <th data-options="field:'cartonWidth', title: '宽'"></th>
                <th data-options="field:'cartonHeight', title: '高'"></th>
                <th data-options="field: 'orderNum', title: '订单数量'"></th>
                <th data-options="field:'materialScience', title: '材质/楞型',
                        formatter:function(value,row,index){
                                    var material=value+'/'+row['pitType'];
                                    return material;
                                }"></th>
                <th data-options="field:'blankingLength', title: '纸板长'"></th>
                <th data-options="field: 'blankingWidth', title: '纸板宽'"></th>
                <th data-options="field:'lengthLine', title: '压线尺寸'"></th>
                <th data-options="field:'numberOfSpareParts', title: '备料数'"></th>
                <th data-options="field:'staffId', title: '业务员'"></th>
                <th data-options="field:'deliveryTime', title: '交货时间'"></th>
                <th data-options="field: 'workingProcedure', title: '工序'"></th>
                <th data-options="field: 'state', title: '订单状态'"></th>
                <th data-options="field:'operate',title:'操作',sortable:true,formatter:operateFormatter,width:80"></th>
            </tr>
            </thead>
        </table>
    </div>
</div>


<!-- layout布局 结束 -->


<!-- 表格工具栏开始 -->
<div id="userDg-toolbar" class="topjui-toolbar"
     data-options="grid:{
           type:'datagrid',
           id:'userDg'
       }">
    <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method:'export',
       extend: '#userDg-toolbar',
       iconCls:'fa fa-cloud-download',
       btnCls:'topjui-btn-red',
       url:'/PlaceController/export/'">导出生产单</a>

</div>
<script type="text/javascript">
        function operateFormatter(value, row, index) {
            var htmlstr = '<button class="layui-btn layui-btn-xs" onclick="openTop(\'' + index + '\',\'' + row.id + '\')">置顶</button>';
            //htmlstr += '<button class="layui-btn layui-btn-xs layui-btn-danger" onclick="putRow(\'' + index + '\')">上移</button>';
            return htmlstr;
        }
      function openTop(uuid,id){
            if(uuid==0){
                alert("亲，已经是最上面啦！");
            }else{
                //传入id
                $.ajax({
                    type : "POST",
                    url : "/PlaceController/zhid/?id="+id,
                    success : function(result) {
                        console.info(result);
                        if ( result.statusCode==200) {
                          alert(result.message);
                          $('#userDg').iDatagrid('reload');
                        } else {
                          alert(result.message);
                        }
                    }
                });
            }
      }
        function putRow(uuid){
            if(uuid==0){
                alert("亲，已经是最上面啦！");
            }else{
                row.id-=1;
            }
        }
</script>
</body>
</html>