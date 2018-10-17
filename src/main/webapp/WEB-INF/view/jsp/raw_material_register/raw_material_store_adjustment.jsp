<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>原材料库存调整</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
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
				调整日期<input id="editTime" name="editTime" type="text" data-toggle="topjui-datebox" data-options="onChange:function(newValue,oldValue){}" style="width: 180px;">
		  		<%--仓库<input id="" name="" type="text" data-toggle="topjui-combobox" data-options="data:[{value:1,text:'A'},{value:2,text:'B'},{value:3,text:'C'}],panelHeight:100" style="width: 70px;">--%>
		  		异常类型<input id="editTye" name="editTye" type="text" data-toggle="topjui-combobox" data-options="data:[{value:1,text:'原材料报废'},{value:2,text:'生产报废'}],panelHeight:70" style="width: 130px;">
				调整人<input id="editName" name="editName" type="text" style="width: 200px" data-toggle="topjui-textbox" data-options="" value="${adminName}">
			</div>
			<div style="margin: 20px 0;">
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
				<table class="layui-table" lay-data="{height:393,url:'/CardboardEdit/findByPurStockAll/',page:true, id:'test3',even:true,size: 'sm'}" lay-filter="test3">
				  <thead>
				    <tr>
				      <th lay-data="{field:'orderAccount', width:150, sort: true}">订单号</th>
						<th lay-data="{field:'customName', width: 65}">客户名称</th>
						<th lay-data="{field:'cartonName', width: 65}">产品名称</th>
				      <th lay-data="{field:'materialScience', width: 80}">材质</th>
						<th lay-data="{field:'fluteType', width:50}">楞型</th>
						<th lay-data="{field:'purchaseSpec', width:150}">尺寸</th>
						<th lay-data="{field:'widthLine',  width: 150}">宽度压线</th>
				      <th lay-data="{field:'lineType',width: 60,templet: '#sexTpl'}">压类型</th>
						<th lay-data="{field:'outNum',width: 60, sort: true}">出库数</th>
						<th lay-data="{field:'n',width: 60, sort: true}">被借调</th>
						<th lay-data="{field:'stockNum',width: 60, sort: true}">库存数</th>
						<th lay-data="{field:'price',width: 50, sort: true}">单价</th>
				      <th lay-data="{field:'editOutNums', width: 65, edit: 'text',event:'setSign', fixed: 'right'}">出库调整</th>
						<th lay-data="{field:'editLoans', width: 65, edit: 'text',event:'setSign', fixed: 'right'}">借调调整</th>
				      <th lay-data="{field:'editNums',width: 65, edit: 'text',event:'setSign', fixed: 'right'}">库存调整</th>
				      <th lay-data="{field:'editPrices', width: 65, edit: 'text',event:'setSign', fixed: 'right'}">单价调整</th>
				      <th lay-data="{field:'editRemark',width: 80, edit: 'text',event:'setSign', fixed: 'right'}">备注</th>
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
                      var reg=/^\+?[1-9][0-9]*$/;//非零非负数字正则表达式
					  var regss = /^[1-9]\d*|0$/;//非负整数（正整数 + 0）
                      var regs = /^\d+(\.\d{1,2})?$/;//两位小数的正实数
					  if(value!=""){
                          switch (field){
                              case "editOutNums"://出库数调整
								  if(!regss.test(value)){
                                      layer.msg('调整出库数输入错误，请重新输入！', {icon: 2});
                                      return;
								  }
                                  break;
							  case "editLoans"://借调数调整
                                  if(!regss.test(value)){
                                      layer.msg('借调数输入错误，请重新输入！', {icon: 2});
                                      return;
                                  }
                                  break;
                              case "editNums"://库存数调整
                                  if(!regss.test(value)){
                                      layer.msg('调整库存数输入错误，请重新输入！', {icon: 2});
                                      return;
                                  }
                                  break;
                              case "editPrices"://单价调整
                                  if(!regs.test(value)){
                                      layer.msg('调整单价输入错误，请重新输入！', {icon: 2});
                                      return;
                                  }
                                  break;
                              default:
                          }
                      }
                      // layer.msg('[ID: '+ data.id +'] ' + field + ' 字段更改为：'+ value);
                      if(data.editOutNums==undefined){//如果为undefined的话在生成对象的时候就会被自动过滤
                          data.editOutNums = "";
                      }
                      if(data.editLoans==undefined){//如果为undefined的话在生成对象的时候就会被自动过滤
                          data.editLoans = "";
                      }
                      if(data.editNums==undefined){//无论是undefined还是null都统一等于空字符串“”
                          data.editNums = "";
                      }
                      if(data.editPrices==undefined){//无论是undefined还是null都统一等于空字符串“”
                          data.editPrices = "";
                      }
                      if(data.editRemark==undefined){//无论是undefined还是null都统一等于空字符串“”
                          data.editRemark = "";
                      }

                      var val = $("#table_data").iTextarea("getValue");//拿到已保存起来的编辑数据
                      // console.log(val);
                      if(val=="" || val=="[]"){//数据为空，表示当前是第一次编辑，直接保存即可无需过多的逻辑处理
                          if(field!="editRemark" && value!=""){
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
                                              switch (field) {
												  case "editOutNums":
												      if(demo.editNums=="" && demo.editPrices=="" && demo.editLoans==""){
                                                          json.splice(i,1);//删除当前json对象
                                                          layer.msg('[订单: '+ data.orderAccount+']取消调整！');
													  }else{
                                                          demo[item]=value;//修改该编辑属性的值
													  }
												      break;
												  case "editNums":
                                                      if(demo.editOutNums=="" && demo.editPrices=="" && demo.editLoans==""){
                                                          json.splice(i,1);//删除当前json对象
                                                          layer.msg('[订单: '+ data.orderAccount+']取消调整！');
                                                      }else{
                                                          demo[item]=value;//修改该编辑属性的值
                                                      }
												      break;
												  case "editPrices":
                                                      if(demo.editOutNums=="" && demo.editNums=="" && demo.editLoans==""){
                                                          json.splice(i,1);//删除当前json对象
                                                          layer.msg('[订单: '+ data.orderAccount+']取消调整！');
                                                      }else{
                                                          demo[item]=value;//修改该编辑属性的值
                                                      }
                                                      break;
                                                  case "editLoans":
                                                      if(demo.editOutNums=="" && demo.editNums=="" && demo.editPrices==""){
                                                          json.splice(i,1);//删除当前json对象
                                                          layer.msg('[订单: '+ data.orderAccount+']取消调整！');
                                                      }else{
                                                          demo[item]=value;//修改该编辑属性的值
                                                      }
                                                      break;
                                                  case "editRemark":
													  demo[item]=value;//修改该编辑属性的值
                                                      break;
												  default:
											  }
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

                    //如果是第一次点击下面的验证就用不到，此验证主要是消除表格中不符合规定的数据,防止不符合规定的数据添加到提交数据中
                    table.on('tool(test3)',function(obj){
                        var data = obj.data;
                        if(obj.event=='setSign'){
                            var reg=/^\+?[1-9][0-9]*$/;//非零非负数字正则表达式
                            var regss = /^[1-9]\d*|0$/;//非负整数（正整数 + 0）
                            var regs = /^\d+(\.\d{1,2})?$/;//两位小数的正实数
                            if(!regss.test(data.editOutNums)){
                                obj.update({
                                    editOutNums:""
                                });
                            }
                            if(!regss.test(data.editNums)){
                                obj.update({
                                    editNums:""
                                });
                            }
                            if(!regs.test(data.editPrices)){
                                obj.update({
                                    editPrices:""
                                });
                            }
                            if(!regss.test(data.editLoans)){
                                obj.update({
                                    editLoans:""
                                });
                            }
                        }
                    });
				  
				});

                $(function(){

                    var dat = new Date().Format("yyyy-MM-dd");
                    $("#editTime").iDatebox("setValue",dat);

                    $("#table_data").next().hide();//隐藏表格数据框

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
                            alert("提交失败，请先输入调整数！");
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
                /*获取当前时间yyyy-MM-dd HH:MM:SS 开始*/
                function getNowFormatDate() {
                    var date = new Date();
                    var seperator1 = "-";
                    var seperator2 = ":";
                    var month = date.getMonth() + 1;
                    var strDate = date.getDate();
                    if (month >= 1 && month <= 9) {
                        month = "0" + month;
                    }
                    if (strDate >= 0 && strDate <= 9) {
                        strDate = "0" + strDate;
                    }
                    var currentdate = date.getFullYear() + seperator1 + month + seperator1 + strDate
                        + " " + date.getHours() + seperator2 + date.getMinutes()
                        + seperator2 + date.getSeconds();
                    return currentdate;
                }
                /*获取当前时间yyyy-MM-dd HH:MM:SS 结束*/
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
			                       url:'/CardboardEdit/addCardEditS/',
			                       <%--refreshRefererTab:true,--%>
			                       <%--closeCurrentTab:true--%>
			                   }">提交</a>
				<a href="javascript:check()"
				   data-toggle="topjui-linkbutton"
				   data-options="iconCls:'fa fa-save'">提交</a>
			</div>
		</form>
	</div>
  </div>
  </body>
</html>
