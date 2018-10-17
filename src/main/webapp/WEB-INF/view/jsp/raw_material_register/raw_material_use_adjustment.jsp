<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>原材料使用调整</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!-- 导入公共样式 -->
    <%@ include file="../ap.jsp" %>
  </head>
  <style>
	  /*表格中的下拉框	样式修改*/
	/*td[data-field='orderAccounts'] .layui-table-cell{overflow: visible;}*/
	/*.layui-table-body{overflow: visible;}*/
	/*.layui-table-box,.layui-table-view{overflow: visible;}*/

	  /*表格中的下拉框	样式修改*/

	/*layui table修改样式*/
	.layui-table th{/*改变表格表头样式*/
		/*color: red;*/
		/*text-align: left;*/
	}
	.layui-table-cell{/*改变表格内边距*/
		padding: 0 5px;
	}
	.layui-table-sort{/*改变头部正三角倒三角排序符号与表头文字的间距*/
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
               
			<div style="margin: 20px 0; width: 100%;">
				<fieldset>
			        <legend><b>筛选条件</b></legend>
			    </fieldset>
		  		订单号<input id="orderAccount" type="text" data-toggle="topjui-combogrid"
	  								data-options="id:'user',
	  												width:180,
								                  idField: 'orderAccount',
								                  textField: 'orderAccount',
								                  fitColumns:false,<%--列宽自适应属性 搭配列属性中的width:100使用--%>
								                  url:'/CardboardLoan/dropSelectPlace/',
								                  columns:[[
								                      {field: 'orderAccount',width:100, title: '订单号'}
								                  ]]">
		  		<%--批号<input type="text" name="" data-toggle="topjui-textbox" data-options="" style="width: 150px;">--%>
				材质<input id="purchaseSpec" type="text" name="" data-toggle="topjui-textbox" data-options="" style="width: 150px;">
				楞型<input id="fluteType" type="text" name="" data-toggle="topjui-textbox" data-options="" style="width: 150px;">
				纸板规格<input id="chang" type="text" name="" data-toggle="topjui-numberbox" data-options="min:0,max:99999999,prompt:'长'" style="width: 70px;">
				X&nbsp;<input id="k" type="text" name="" data-toggle="topjui-numberbox" data-options="min:0,max:99999999,prompt:'宽'" style="width: 70px;">
				<%--入库时间<input type="text" data-toggle="topjui-datetimebox" data-options="onChange:function(newValue,oldValue){console.log(newValue);},prompt:'开始时间'" style="width: 180px;">-<input type="text" data-toggle="topjui-datetimebox" data-options="onChange:function(newValue,oldValue){console.log(newValue);},prompt:'结束时间'" style="width: 180px;">--%>
		  		库存数<input id="minNum" type="text" name=""
						  data-toggle="topjui-numberbox"
						  data-options="min:0,max:99999999,prompt:'输入范围0至99999999之间'" style="width: 80px;">~
						<input id="maxNum" type="text" name=""
							   data-toggle="topjui-numberbox"
							   data-options="min:0,max:99999999,prompt:'输入范围0至99999999之间'" style="width: 80px;">
			</div>
			<div>

				<div class="layui-btn-group demoTable">
				  <!-- <button class="layui-btn" data-type="getCheckData">获取选中行数据</button>
				  <button class="layui-btn" data-type="getCheckLength">获取选中数目</button>
				  <button class="layui-btn" data-type="isAll">验证是否全选</button> -->
				  <button style="margin-left: 450px;" class="layui-btn" data-type="reload">筛选</button>
				</div><br>
				<input id="table_data" name="table_data"
							 data-toggle="topjui-textarea"
							 data-options="required:true,readonly:true,prompt:'此处无需输入，只需修改表格即可'" style="width:930px;height:100px"/>
				<form class="layui-form">
				<table class="layui-table" lay-data="{height:393,url:'/CardboardLoan/findByPurStock/',page:true, id:'test3',even:true}" lay-filter="test3">
				  <thead>
				    <tr>
				      <th lay-data="{field:'orderAccount', width:150, sort: true}">订单号</th>
						<th lay-data="{field:'customName', width: 65}">客户名称</th>
						<th lay-data="{field:'cartonName', width: 65}">产品名称</th>
				        <th lay-data="{field:'materialScience', width: 80}">材质</th>
						<th lay-data="{field:'fluteType', width:50}">楞型</th>
						<th lay-data="{field:'purchaseSpec', width:150, sort: true}">尺寸</th>
						<th lay-data="{field:'widthLine',  width: 150}">宽压线</th>
				      	<th lay-data="{field:'lineType',width: 60,templet: '#sexTpl'}">压类型</th>
						<th lay-data="{field:'outNum',width: 60, sort: true}">已出库</th>
						<th lay-data="{field:'n',width: 60, sort: true}">被借调</th>
						<th lay-data="{field:'stockNum',width: 60, sort: true}">库存数</th>
						<th lay-data="{field:'orderAccounts', edit: 'text',width:220,event:'setSign', fixed: 'right'}">调去订单号</th>
						<th lay-data="{field:'orderAccountsNum',width: 60, edit: 'text',event:'setSign', fixed: 'right'}">调用数</th>
						<th lay-data="{field:'orderAccountsConter',width: 60, edit: 'text',event:'setSign', fixed: 'right'}">备注</th>
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
				</form>
				
				<script>
				layui.use('table', function(){
				  var table = layui.table;

				  //监听单元格编辑
				  table.on('edit(test3)', function(obj){
				    var value = obj.value //得到修改后的值
				    ,data = obj.data //得到所在行所有键值
				    ,field = obj.field; //得到字段
				    // layer.msg('[ID: '+ data.id +'] ' + field + ' 字段更改为：'+ value);
				    // console.log(data);
						//非零非负数字正则表达式
                      var reg=/^\+?[1-9][0-9]*$/;
                      if(!reg.test(value) && field=="orderAccountsNum" && value!=""){
						  layer.msg('调用数输入错误，请重新输入！', {icon: 2});
						  return;
                      }
                      if(field=="orderAccounts" && value!=""){
                          var is = 1;
                          $.ajax({
                              type:'post',
                              url:'/CardboardLoan/findByIsPur/',
                              data:{"orderAccount":value},
                              dataType:"json",
                              async:false,
                              success:function(result){
                                  // console.log(result.length);
                                  console.log(result);
                                  console.log(result[0]);
                                  if(result.length==0){
                                      layer.msg('查无此订单，请重新输入！', {icon: 2});
                                      is=0;
                                  }else{
                                      var place = result[0];
                                      var s = place.blankingLength+"X"+place.blankingWidth;
                                      if(!(data.materialScience==place.materialScience
										  && data.fluteType==place.pitType
										  && data.purchaseSpec==s
                                          && data.widthLine==place.widthLine
                                          && data.lineType==place.lineType)){
                                          layer.msg('该订单与被借调订单不匹配，无法完成借调，请重新输入！', {icon: 2});
                                          is=0;
									  }
								  }
                              }
                          });
                          if(is==0){
                              return;
						  }
                          if(value==data.orderAccount){
                              layer.msg('不可借用本订单纸板！', {icon: 2});
                              return;
						  }
					  }
                      // layer.msg('[ID: '+ data.id +'] ' + field + ' 字段更改为：'+ value);
                      if(data.orderAccountsNum==undefined){//如果为undefined的话在生成对象的时候就会被自动过滤
                          data.orderAccountsNum = "";
                      }
                      if(data.orderAccounts==undefined || data.orderAccounts==""){//无论是undefined还是null都统一等于空字符串“”
                          data.orderAccounts = "";
                      }
                      if(data.orderAccountsConter==undefined || data.orderAccountsConter==""){//无论是undefined还是null都统一等于空字符串“”
                          data.orderAccountsConter = "";
                      }

                      var val = $("#table_data").iTextarea("getValue");//拿到已保存起来的编辑数据
                      // console.log(val);
                      if(val=="" || val=="[]"){//数据为空，表示当前是第一次编辑，直接保存即可无需过多的逻辑处理
                          if(field=="orderAccounts" && value!=""){
                              if(data.orderAccountsNum!=""){
                                  var json=[];
                                  json.push(data);//在json数组里新增一个json对象
                                  // console.log(json);
                                  var jsonarr = JSON.stringify(json);//把json对象Opject转化为string，以便保存和提交
                                  $("#table_data").iTextarea("setValue",jsonarr);
							  }
                          }else if(field=="orderAccountsNum" && value!=""){
                              if(data.orderAccounts!=""){
                                  var json=[];
                                  json.push(data);//在json数组里新增一个json对象
                                  // console.log(json);
                                  var jsonarr = JSON.stringify(json);//把json对象Opject转化为string，以便保存和提交
                                  $("#table_data").iTextarea("setValue",jsonarr);
							  }
						  }
                      }else{//数据不为空，表示当前不是第一次编辑数据
                          var json = JSON.parse(val);//把json字符串转化为json对象object数组，以便数据操作
                          for(var i = 0;i<json.length;i++){//遍历json对象数组中的每一个对象
                              if(json[i].LAY_TABLE_INDEX == data.LAY_TABLE_INDEX){//找到其中一个对象的id是当前编辑条目的id，的对象数据
                                  var demo = json[i];
                                  for(var item in demo){//循环遍历输出该对象的‘属性’和‘值’
                                      if(item == field){//找到与修改字段一样的属性，修改该‘属性’对应‘值’
                                          if(value==""){//如果修改的值是空的话，即删除；那就要判断连个属性的值是否都为空，都为空的话就删除该条json对象数据（不提交）
                                              if(field=="orderAccountsNum" || field=="orderAccounts" ){
												  json.splice(i,1);//删除当前json对象
												  layer.msg('[订单: '+ data.orderAccount+']取消被借调！');
                                              }else{
                                                  demo[item]=0;//修改该编辑属性的值
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
                    //如果是第一次点击下面的验证就用不到，此验证主要是消除表格中不符合规定的数据,防止不符合规定的数据添加到提交数据中
                    table.on('tool(test3)',function(obj){
                        var data = obj.data;
                        // console.log(data);
                        if(obj.event=='setSign'){
                            //非零非负数字正则表达式
                            var reg=/^\+?[1-9][0-9]*$/;
                            if(!reg.test(data.orderAccountsNum)){
                                obj.update({
                                    orderAccountsNum:""
                                });
                            }

                            if(data.orderAccounts!="" && data.orderAccounts!=undefined){
                                var orderAccount = data.orderAccounts;
                                var is = 1;
                                if(data.orderAccounts==data.orderAccount){
                                    // layer.msg('不可借用本订单纸板！', {icon: 2});
                                    is=0;
                                }
                                $.ajax({
                                    type:'post',
                                    url:'/CardboardLoan/findByIsPur/',
                                    data:{"orderAccount":orderAccount},
                                    dataType:"json",
                                    async:false,
                                    success:function(result){
                                        // console.log(result.length);
                                        // console.log(result[0]);
                                        if(result.length==0){
                                            is=0;
                                        }else{
                                            var place = result[0];
                                            var s = place.blankingLength+"X"+place.blankingWidth;
                                            if(!(data.materialScience==place.materialScience
                                                && data.fluteType==place.pitType
                                                && data.purchaseSpec==s
                                                && data.widthLine==place.widthLine
                                                && data.lineType==place.lineType)){
                                                // layer.msg('该订单与被借调订单不匹配，无法完成借调，请重新输入！', {icon: 2});
                                                is=0;
                                            }
                                        }
                                    }
                                });
                                if(is==0){
                                    obj.update({
                                        orderAccounts:""
                                    });
                                }
							}


                        }
                    });

				  //监听表格复选框选择
				  table.on('checkbox(test3)', function(obj){
				    console.log(obj)
				  });
				  
				  var $ = layui.$, active = {
				  		reload: function(){
				  		    var orderAccount = $('#orderAccount').val();
                            var purchaseSpec = $('#purchaseSpec').val();
                            var fluteType = $('#fluteType').val();
                            var chang = $('#chang').val();
                            var k = $('#k').val();
                            var minNum = $('#minNum').val();
                            var maxNum = $('#maxNum').val();
                            console.log(orderAccount);
						      //执行重载
						      table.reload('test3', {
						        page: {
						          curr: 1 //重新从第 1 页开始
						        }
						        ,where: {
                                      orderAccount: orderAccount,
                                      purchaseSpec: purchaseSpec,
                                      fluteType: fluteType,
                                      chang: chang,
                                      k: k,
                                      minNum: minNum,
                                      maxNum: maxNum
						        }
						      });
						    }
					    ,getCheckData: function(){ //获取选中数据
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
				$(function(){
                    $("#table_data").next().hide();//隐藏表格数据框
				});
                function check() {
                    var table_data = $("#table_data").iTextarea("getValue");
                    if(table_data==""){
                        alert("提交失败，请先输入借调订单！");
                    }else{
                        $("#tijiao").click();
                    }
                }
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
			                       url:'/CardboardLoan/addCarLoanS/'
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
