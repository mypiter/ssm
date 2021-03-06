<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>测试表格重载</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!-- 导入公共样式 -->
    <%@ include file="/jsp/ap.jsp" %>
  </head>
  
  <body>
  	<div class="demoTable">
  搜索ID：
  <div class="layui-inline">
    <input class="layui-input" name="id" id="demoReload" autocomplete="off">
  </div>
  <button class="layui-btn" data-type="reload">搜索</button>
</div>
 
<table class="layui-hide" id="LAY_table_user" lay-filter="user"></table> 
<script>
layui.use('table', function(){
  var table = layui.table;
  
  //方法级渲染
  table.render({
    elem: '#LAY_table_user'
    ,url: '${pageContext.request.contextPath}/data/demo.json'
    ,cols: [[
      {checkbox: true, fixed: true}
      ,{field:'id', title: 'ID', width:80, sort: true, fixed: true}
      ,{field:'username', title: '用户名', width:80}
      ,{field:'sex', title: '性别', width:80, sort: true}
      ,{field:'city', title: '城市', width:80}
      ,{field:'sign', title: '签名'}
      ,{field:'experience', title: '积分', sort: true, width:80}
      ,{field:'score', title: '评分', sort: true, width:80}
      ,{field:'classify', title: '职业', width:80}
      ,{field:'wealth', title: '财富', sort: true, width:135}
    ]]
    ,id: 'testReload'
    ,page: true
    ,height: 315
  });
  
  var $ = layui.$, active = {
    reload: function(){
      var demoReload = $('#demoReload');
      
      //执行重载
      table.reload('testReload', {
        page: {
          curr: 1 //重新从第 1 页开始
        }
        ,where: {
            id: demoReload.val()
        }
      });
    }
  };
  
  $('.demoTable .layui-btn').on('click', function(){
    var type = $(this).data('type');
    active[type] ? active[type].call(this) : '';
  });
});
</script>
  </body>
</html>
