<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>原材料领料（出库）</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<!-- 导入公共样式 -->
    <%@ include file="../ap.jsp" %>
  </head>
  <style>
	  /*layui table修改样式*/
	  /*改变表格表头样式*/
	  .layui-table th{
		  /*color: red;*/
		  /*text-align: left;*/
	  }
	  /*改变表格表头样式*/

	  /*改变表格内边距*/
	  .layui-table-cell{
		  padding: 0 5px;
	  }
	  /*改变表格内边距*/

	  .layui-table-sort{
		  margin-left: 0px;
	  }
	  /* layui  table修改样式*/
  </style>
  <body>
  <div data-toggle="topjui-layout" data-options="fit:true">
    <div data-toggle="topjui-panel" title="" data-options="fit:true,iconCls:'icon-ok',footer:'#footer'">
		<form class="hidden" method="post" data-toggle="topjui-form" data-options="id:'formId',
               <%--url:_ctx + '/json/response/form.json?uuid=123456',--%>
               editor:[
                   {id:'remarkAddEditor',field:'remark'}
               ]">
               
			<div style="margin: 20px 0;">
				出库单号<input id="purNumber" name="purNumber" type="text" data-toggle="topjui-textbox" data-options="onChange:function(newValue,oldValue){},readonly:true" style="width: 150px;">
		  		<%--品类<input type="text" name="sex" data-toggle="topjui-combobox" data-options="data:[{value:1,text:'纸板'},{value:2,text:'其他'}],panelHeight:70" style="width: 100px;">--%>
		  		<%--仓库<input type="text" name="sex" data-toggle="topjui-combobox" data-options="data:[{value:1,text:'A'},{value:2,text:'B'},{value:3,text:'C'}],panelHeight:100" style="width: 70px;">--%>
		  		领料人<input type="text" id="leader" name="leader"
						  data-toggle="topjui-combogrid"
						  data-options="id:'staffNames',width:100,
							   idField: 'staffName',
							   textField: 'staffName',
							   fitColumns:false,
							   url:'/StaffTable/findByBusiness/?type=2',
							   columns:[[
								   {field: 'staffName',width:100, title: '姓名'}
							   ]],validType:['length[0,10]']">
				<span>&nbsp;出&nbsp;库&nbsp;员&nbsp;</span><input id="adminName" name="adminName" type="text" style="width: 100px" data-toggle="topjui-textbox" data-options="validType:['length[0,10]']" value="${adminName}">
				<span>&nbsp;出库日期&nbsp;</span><input type="text" id="time" name="time" data-toggle="topjui-datebox" style="width:200px;"><br><br>
				<input id="table_data" name="table_data"
							 data-toggle="topjui-textarea"
							 data-options="required:true,readonly:true,prompt:'此处无需输入，只需修改表格即可'" style="width:930px;height:100px"/>

		  	</div>
  	

			<div>
				<!-- <div class="layui-btn-group demoTable">
				  <button class="layui-btn" data-type="getCheckData">获取选中行数据</button>
				  <button class="layui-btn" data-type="getCheckLength">获取选中数目</button>
				  <button class="layui-btn" data-type="isAll">验证是否全选</button>
				</div> -->
				<table class="layui-table" lay-data="{height: 393, url:'/OutStorage/findByPurStockS/',page:true,even:true,size: 'sm', id:'test3'}" lay-filter="test3">
				  <thead>
				    <tr>
					  <th lay-data="{field:'orderAccount', width:150, sort: true}">订单号</th>
						<th lay-data="{field:'customName', width: 70}">客户名称</th>
						<th lay-data="{field:'cartonName', width: 70}">产品名称</th>
					  <th lay-data="{field:'materialScience', width: 80}">材质</th>
					  <th lay-data="{field:'fluteType', width:50}">楞型</th>
					  <th lay-data="{field:'purchaseSpec', width:150, sort: true}">尺寸</th>
					  <th lay-data="{field:'widthLine', width:150}">宽度压线</th>
				      <th lay-data="{field:'lineType', width:50,templet: '#sexTpl'}">压类型</th>
				      <th lay-data="{field:'outNum',  width: 60}">已出库</th>
					  <th lay-data="{field:'n',  width: 60}">被借调</th>
				      <th lay-data="{field:'stockNum',width: 60, sort: true}">库存数</th>
				      <th lay-data="{field:'num',width: 60, sort: true, edit: 'text', fixed: 'right'}">领料数</th>
				    </tr>
				  </thead>
				</table>
                <script type="text/html" id="sexTpl">
                    {{#  if(d.lineType === 1){ }}
                    <%--<span style="color: #F581B1;">明线</span>--%>
                    明线
                    {{#  } else { }}
                    暗线
                    {{#  } }}
                </script>
				<script>
				layui.use('table', function(){
				  var table = layui.table;
				  
				  //监听单元格编辑
				  table.on('edit(test3)', function(obj){
				    var value = obj.value //得到修改后的值
				    ,data = obj.data //得到所在行所有键值
				    ,field = obj.field; //得到字段
				    // layer.msg('[ID: '+ data.id +'] ' + field + ' 字段更改为：'+ value);

                      //非零非负数字正则表达式
                      var reg=/^\+?[1-9][0-9]*$/;
                      if(!reg.test(value) && value!=""){
                          layer.msg('领料数输入错误，请重新输入！', {icon: 2});
                          return;
                      }
                      var s=Number(data.stockNum)-Number(data.outNum)-Number(data.n);
                      if(value>s){
                          layer.msg('领料数输入过大，请重新输入！', {icon: 2});
                          return;
                      }

                      var val = $("#table_data").iTextarea("getValue");//拿到已保存起来的编辑数据
                      // console.log(val);
                      if(val=="" || val=="[]"){//数据为空，表示当前是第一次编辑，直接保存即可无需过多的逻辑处理
                          if(value!=""){
                              var json=[];
                              json.push(data);//在json数组里新增一个json对象
                              // console.log(json);
                              var jsonarr = JSON.stringify(json);//把json对象Opject转化为string，以便保存和提交
                              $("#table_data").iTextarea("setValue",jsonarr);
                          }
                      }else{//数据不为空，表示当前不是第一次编辑数据
                          var json = JSON.parse(val);//把json字符串转化为json对象object数组，以便数据操作
                          for(var i = 0;i<json.length;i++){//遍历json对象数组中的每一个对象
                              if(json[i].LAY_TABLE_INDEX == data.LAY_TABLE_INDEX){//找到其中一个对象的id是当前编辑条目的id，的对象数据
                                  var demo = json[i];
                                  for(var item in demo){//循环遍历输出该对象的‘属性’和‘值’
                                      if(item == field){//找到与修改字段一样的属性，修改该‘属性’对应‘值’
                                          if(value==""){//如果修改的值是空的话，即删除；那就要判断连个属性的值是否都为空，都为空的话就删除该条json对象数据（不提交）
                                              json.splice(i,1);//删除当前json对象
                                              layer.msg('[订单: '+ data.orderAccount+']取消出库！');
                                          }else{
                                              demo[item]=value;//修改该编辑属性的值
                                          }
                                      }
                                  }
                                  break;
                              }
                              if(i==json.length-1){
                                  json.push(data);//在json数组里新增一个json对象
                              }
                          }
                          // console.log(json);
                          var jsonarr = JSON.stringify(json);//把json对象Opject转化为string，以便保存和提交
                          if(jsonarr=="[]"){
                              $("#table_data").iTextarea("setValue","");
                          }else{
                              $("#table_data").iTextarea("setValue",jsonarr);
                          }
                      }
				  });
				  
				  //监听表格复选框选择
				  table.on('checkbox(test3)', function(obj){
				    console.log(obj)
				  });
				  
				  var $ = layui.$, active = {
					    getCheckData: function(){ //获取选中数据
					      var checkStatus = table.checkStatus('test3')
					      ,data = checkStatus.data;
					      layer.alert(JSON.stringify(data));
					    }
					    ,getCheckLength: function(){ //获取选中数目
					      var checkStatus = table.checkStatus('test3')
					      ,data = checkStatus.data;
					      layer.msg('选中了：'+ data.length + ' 个');
					    }
					    ,isAll: function(){ //验证是否全选
					      var checkStatus = table.checkStatus('test3');
					      layer.msg(checkStatus.isAll ? '全选': '未全选')
					    }
					  };
					  
				  $('.demoTable .layui-btn').on('click', function(){
				    var type = $(this).data('type');
				    active[type] ? active[type].call(this) : '';
				  });
				  
				});
				</script>
			</div>
			
  	
			<div id="footer" class="hidden" style="height: 34px; padding: 5px; text-align: right;">
			    <a href="#" id="tijiao" style="display:none;"
			       data-toggle="topjui-linkbutton"
			       data-options="id:'submitBtn',
			                   iconCls:'fa fa-save',
			                   form:{
			                       id:'formId',
			                       method:'submit',
			                       url:'/OutStorage/addOutStoragerS/',
			                       <%--refreshRefererTab:true,--%>
			                       <%--closeCurrentTab:true--%>
			                   }">提交</a>
				<a href="javascript:check()"
				   data-toggle="topjui-linkbutton"
				   data-options="iconCls:'fa fa-save'">提交</a>
				<a href="javascript:void(0)"
				   data-toggle="topjui-menubutton"
				   data-options="method:'openTab',
                   extend: '#productDg-toolbar',
                   btnCls:'topjui-btn-purple',
                   tab:{
                       title:'成品入库登记',
                       href:'/AdminController/jsp/?url=/production_register/finished_product'
                   }">进入下个操作</a>
			    <%--<a href="#"--%>
			       <%--data-toggle="topjui-linkbutton"--%>
			       <%--data-options="id:'submitBtn',--%>
			                   <%--iconCls:'fa fa-exchange',--%>
			                   <%--btnCls:'topjui-btn-black',--%>
			                   <%--form:{--%>
			                       <%--id:'formId',--%>
			                       <%--method:'reset'--%>
			                   <%--}">重置</a>--%>
			    <%--<a href="#"--%>
			       <%--data-toggle="topjui-linkbutton"--%>
			       <%--data-options="id:'submitBtn',--%>
			                   <%--iconCls:'fa fa-trash',--%>
			                   <%--btnCls:'topjui-btn-red',--%>
			                   <%--form:{--%>
			                       <%--id:'formId',--%>
			                       <%--method:'clear'--%>
			                   <%--}">清空</a>--%>
			</div>
		</form>
	</div>
</div>
    <script type="text/javascript">
        $(function(){
            var dat = new Date().Format("yyyy-MM-dd");
            $("#time").iDatebox("setValue",dat);

            $("#table_data").next().hide();//隐藏表格数据框

			//初始化出库批号
			var time = new Date().Format("yyyyMMdd");
            $.ajax({
                url:'/OutStorage/generateOutStorAccount/?time='+time,
                dataType:'json',
                success:function(data){
                    // console.log(data);
                    $("#purNumber").iTextbox("setValue",data.purNumber);
                }
            });

        });
        //往cookie里面记录上次单击事件时间
        $.cookie('t', themeName, {
            expires: 7,
            path: '/'
        });
        function check() {
            var lastBtnClickTime = $.cookie("t");
            var nowTime = new Date().getTime();
            if ((nowTime - lastBtnClickTime) >= 2000) {
                $.cookie("t", new Date().getTime());
                var table_data = $("#table_data").iTextarea("getValue");
                if(table_data==""){
                    alert("提交失败，请先输入出库数！");
                }else{
                    $("#tijiao").click();
                    $(this).attr("disabled","disabled");
                }
            }else{
                $.iMessager.show({
                    title: '温馨提示',
                    msg: '操作过快，请稍后重试！'
                });
            }

        }
    </script>
  </body>
</html>
