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
    <meta http-equiv="description" content="This is my page">
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <!-- 导入公共样式 -->
    <%@ include file="../ap.jsp" %>
    <title>列员工表</title>
</head>

<body>
<!-- layout布局 开始 -->
<div data-toggle="topjui-layout" data-options="fit:true">
    <div data-options="region:'center',iconCls:'icon-reload',title:'',split:true,border:false">
        <div data-toggle="topjui-layout" data-options="fit:true">

            <div data-options="region:'center',title:'',fit:false,split:true,border:false,bodyCls:'border_right_bottom'"
                 style="height:80%">
                <!-- datagrid表格 -->
                <table data-toggle="topjui-datagrid"
                       data-options="id:'userDg',
                        idField:'staffId',
                        treeField:'staffName',
                        pagination:true,
                        striped:true,
                        fitColumns:true,
                        rownumbers: true,
                        url:'/StaffTable/select/',
			            childTabs: [
                            {id:'eastTabs'}
                        ]">
                    <thead>
                    <tr>
                        <th data-options="field: 'staffId', title: 'UID', checkbox: true"></th>
                        <th data-options="field: 'staffNumber', title: '工号', sortable: true"></th>
                        <th data-options="field: 'staffName', title: '姓名', sortable: true"></th>
                        <th data-options="field: 'sex', title: '性别'"></th>
                        <th data-options="field: 'staffAge', title: '年龄', sortable: true"></th>
                        <th data-options="field: 'staffTel', title: '电话', sortable: true"></th>
                        <th data-options="field: 'staffPost', title: '职务', sortable: true"></th>
                        <th data-options="field: 'staffSalary', title: '工资', sortable: true"></th>
                        <th data-options="field: 'isSalesman', title: '所属部门', sortable: true,
                        formatter:function(value,row,index){
                                    if (value == '1') {
                                        return '业务部';
                                    } else if (value == '2') {
                                        return '生产部';
                                    } else if (value == '3'){
                                        return '物流部';
                                    }
                                }"></th>
                        <th data-options="field: 'extract', title: '提成', sortable: true"></th>
                        <th data-options="field: 'staffTime', title: '入职时间', sortable: true"></th>
                        <th data-options="field: 'staffAddress', title: '地址', sortable: true"></th>
                    </tr>

                    </thead>
                </table>
            </div>
            
        </div>
    </div>
 


<!-- 表格工具栏开始 -->
	<div id="userDg-toolbar" class="topjui-toolbar"
		data-options="grid:{
           type:'datagrid',
           id:'userDg'
       }">
        <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method:'openDialog',
        extend: '#userDg-toolbar',
       iconCls: 'fa fa-plus',
       dialog:{
           width: 700,
           height: 550,
           id:'userAddDialog',
            href:'/AdminController/jsp/?url=/staff/staffAdd',
           buttonsGroup:[
               {text:'保存',url:'/StaffTable/addStaff/',iconCls:'fa fa-plus',handler:'ajaxForm',btnCls:'topjui-btn-brown'}
           ]
       }">新增</a>
		<!--  <input style="width:115px;height:35px" id="add" name="sub" onclick="addCartonType()" value="录入订单" type="button" /> -->
		<a href="javascript:void(0)" data-toggle="topjui-menubutton"
			data-options="method: 'openDialog',
            extend: '#userDg-toolbar',
            iconCls: 'fa fa-pencil',
            btnCls: 'topjui-btn-green',
            grid: {
                type: 'datagrid',
                id: 'userDg'
            },
            dialog: {
                width: 750,
                height: 550,
                href: '/AdminController/jsp/?url=/staff/staffAdd&staffId={staffId}',
                url: '/StaffTable/findById/?staffId={staffId}',//这里是根据选中数据的id查询改记录地址
                buttonsGroup: [
                    {
                        text: '更新',
                        url: '/StaffTable/updataStaff/',
                        iconCls: 'fa fa-save',
                        handler: 'ajaxForm',
                        btnCls: 'topjui-btn-green'
                    }
                ]
            }">编辑</a>
       <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method:'doAjax',btnCls:'topjui-btn-brown',
       extend: '#userDg-toolbar',
       iconCls:'fa fa-trash',
       url:'/StaffTable/deleteStaff/',
       grid: {uncheckedMsg:'请先勾选要删除的数据',param:'staffId:staffId'}">删除</a>
	   <a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method:'search',
       extend: '#userDg-toolbar',
       btnCls:'topjui-btn-blue'">查询</a>
	   <%--<a href="javascript:void(0)"
       data-toggle="topjui-menubutton"
       data-options="method:'filter',
       extend: '#userDg-toolbar',
       btnCls:'topjui-btn-black'">过滤</a>--%>
  
	</div>
</div>
<!-- 表格工具栏结束 -->
<script type="text/javascript">
	$(function(){
	   // alert("4164553453534");
	     //测试
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
	
	// $.ajax({
	//      url:remoteHost+'/system/organization/getListByCodeSetIdAndLevelId?codeSetId=A&levelId=1',
	//      data:null,
	//      type:"post",
	//      dataType:"json",
	//      success:function(data){
	//          console.info(JSON.stringify(data));
	//
	//      }
	// });
	// $.ajax({
	//      url:remoteHost+'/system/organization/getListByPid?pid=3',
	//      data:null,
	//      type:"post",
	//      dataType:"json",
	//      success:function(data){
	//          console.info(JSON.stringify(data));
	//      }
	// });


	function huoqu(){
      	/* alert("没获取到"); */
      		/* var row = $('#userDg').detagrid('getSelected');
      		if(row){
      			alert('Item ID:' + row.itemid + "Price:" + row.listprice);
      		}else{
      			alert("没获取到");
      		} */
      };

</script>
</body>
</html>