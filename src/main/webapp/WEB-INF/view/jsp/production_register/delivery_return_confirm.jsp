<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>送货回单确认</title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!-- 导入公共样式 -->
    <%@ include file="../ap.jsp" %>
  </head>
  <style>
  	.hang{margin: 4px 0;}
  </style>
  <body>
  	<div data-toggle="topjui-layout" data-options="fit:true">
    <div data-toggle="topjui-panel" title="" data-options="fit:true,iconCls:'icon-ok',footer:'#footer'">
		<form class="hidden" method="post" data-toggle="topjui-form" data-options="id:'formId',
               editor:[
                   {id:'remarkAddEditor',field:'remark'}
               ]">
		  	<div class="hang">
		 		<span>&nbsp;送货单号&nbsp;</span><input type="text" data-toggle="topjui-combogrid"
													data-options="id:'user',
	  												width:300,
												    onSelect: function (index,row){
															$('#consignee').iTextbox('setValue',row['consignee']);
															$('#consigneeAddress').iTextbox('setValue',row['consigneeAddress']);
															$('#deliTime').iTextbox('setValue',row['deliTime']);
															$('#allPrice').iTextbox('setValue',row['allPrice']);
															$('#car').iTextbox('setValue',row['car']);
															filling(row['deliveryNumber']);
															},
								                  idField: 'id',
								                  textField: 'deliveryNumber',
								                  url:'/CartonOutInfo/findByQ/',
								                   columns:[[
                                                               {field: 'deliveryNumber',width:160, title: '送货单号'},
                                                               {field: 'consignee',width:100, title: '客户名称'}
                                                           ]],prompt:'必填',required:true">
		 		<span>&nbsp;客户名称&nbsp;</span><input id="consignee" type="text" name="consignee" data-toggle="topjui-textbox" data-options="disabled:true" style="width:300px;">
		 		<span>&nbsp;送货日期&nbsp;</span><input id="deliTime" type="text" name="deliTime" data-toggle="topjui-textbox" data-options="disabled:true" data-options="" style="width:200px;">
		 		<span>&nbsp;车&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号&nbsp;</span><input id="car" type="text" name="car" data-toggle="topjui-textbox" data-options="disabled:true" data-options="" style="width:200px;">
			</div>
			<div class="hang">
		 		<span>&nbsp;送货地址&nbsp;</span><input id="consigneeAddress" type="text" name="deliveryAddress" data-toggle="topjui-textbox" data-options="disabled:true" style="width:565px;">
		 		<span>&nbsp;总&nbsp;平&nbsp;方&nbsp;&nbsp;</span><input type="text" name="userNameId" data-toggle="topjui-textbox" data-options="disabled:true" style="width:200px;">
		 		<span>&nbsp;总&nbsp;金&nbsp;额&nbsp;&nbsp;</span><input id="allPrice" type="text" name="allPrice" data-toggle="topjui-textbox" data-options="disabled:true" style="width:200px;">
				<input id="table_data" type="hidden" name="table_data" data-toggle="topjui-textarea" data-options="required:true,readonly:true,prompt:'此处无需输入，只需修改表格即可'" style="width:930px;height:100px"/>
			</div>
			<div>
				<div class="layui-btn-group demoTable" style="display: none">
					搜索ID:
					<div class="layui-inline">
						<input class="layui-input" name="id" id="demoReload" autocomplete="off">
					</div>
					<button id="sou" class="layui-btn" data-type="reload">搜索</button>
				</div>
				<table class="layui-table" lay-data="{url:'/Cartonout/findByN/',page:true, id:'test3',height:600}" lay-filter="test3">
				  <thead>
				    <tr>
				      <th lay-data="{type:'checkbox'}"></th>
				      <th lay-data="{field:'deliveryNumber', width:200, sort: true}">配送单号</th>
					  <th lay-data="{field:'orderAccount', width:200, sort: true}">订单号</th>
				      <th lay-data="{field:'productName', width:120, sort: true}">产品名称</th>
				      <th lay-data="{field:'specifications', width:200, sort: true}">规格</th>
				      <th lay-data="{field:'materialName', width: 80}">材质</th>
				      <th lay-data="{field:'pitTypeName', width:80}">楞型</th>
				      <th lay-data="{field:'outNum',  width: 80}">送货数</th>
				      <th lay-data="{field:'consigneeNum', sort: true, edit: 'text'}">签收数</th>
				      <th lay-data="{field:'returnNum', sort: true, edit: 'text'}">退货数</th>
				      <th lay-data="{field:'minorityNum', sort: true, edit: 'text'}">少数</th>
				      <th lay-data="{field:'isconsignee', sort: true, edit: 'text'}">退货原因</th>
				    </tr>
				  </thead>
				</table>
				
				<script>
				layui.use('table', function(){
                    var table = layui.table;
                    var price=0;//总价
                    //监听单元格编辑
                    table.on('edit(test3)', function(obj){
                        var value = obj.value //得到修改后的值
                            ,data = obj.data //得到所在行所有键值
                            ,field = obj.field; //得到字段
                        console.log(data);

                        //非零非负数字正则表达式
                        var reg=/^\+?[1-9][0-9]*$/;
                        if(!reg.test(value) && field=="number" && value!=""){
                            console.log("非数字");
                            layer.msg('入库数输入错误，请重新输入！', {icon: 2});
                            return;
                        }
                        // layer.msg('[ID: '+ data.id +'] ' + field + ' 字段更改为：'+ value);
                        if(value!=""){
                            if(field=="number"){

                            }else{

                            }
                        }
                        if(data.consigneeNum==undefined){//如果为undefined的话在生成对象的时候就会被自动过滤
                            data.consigneeNum = "0";
                        }
                        if(data.returnNum==undefined){//如果为undefined的话在生成对象的时候就会被自动过滤
                            data.returnNum = "0";
                        }
                        if(data.minorityNum==undefined){//如果为undefined的话在生成对象的时候就会被自动过滤
                            data.minorityNum = "0";
                        }
                        if(data.isconsignee==undefined){//如果为undefined的话在生成对象的时候就会被自动过滤
                            data.isconsignee = "无";
                        }
                        if(data.consigneeNum>data.outNum){
                            data.consigneeNum = "0";
                            alert("出库数量不能大于库存数！请重新输入")
                            return;
                        }
                        //准备好json数组所需的对象 这里改成直接添加所有的数据data
                        // var arr = {
                        //     "id":data.id,
                        //     "price":data.cartonPrice,
                        //     "num":data.num,
                        //     "purchaseRemarks":data.purchaseRemarks
                        // };
                        var val = $("#table_data").iTextarea("getValue");//拿到已保存起来的编辑数据】
                        //price+=data.number*data.price;
                        $("#zong").iTextarea("setValue",price);
                        // console.log(val);
                        if(val=="" || val=="[]"){//数据为空，表示当前是第一次编辑，直接保存即可无需过多的逻辑处理
                            if(field=="consigneeNum"){
                                var json=[];
                                json.push(data);//在json数组里新增一个json对象
                                // console.log(json);
                                var jsonarr = JSON.stringify(json);//把json对象Opject转化为string，以便保存和提交
                                $("#table_data").iTextarea("setValue",jsonarr);

                            }
                        }else{//数据不为空，表示当前不是第一次编辑数据
                            var json = JSON.parse(val);//把json字符串转化为json对象object数组，以便数据操作
                            for(var i = 0;i<json.length;i++){//遍历json对象数组中的每一个对象
                                if(json[i].id == data.id){//找到其中一个对象的id是当前编辑条目的id，的对象数据
                                    var demo = json[i];
                                    for(var item in demo){//循环遍历输出该对象的‘属性’和‘值’
                                        if(item == field){//找到与修改字段一样的属性，修改该‘属性’对应‘值’
                                            if(value==""){//如果修改的值是空的话，即删除；那就要判断连个属性的值是否都为空，都为空的话就删除该条json对象数据（不提交）
                                                if(field=="consigneeNum"){
                                                    json.splice(i,1);//删除当前json对象
                                                }else{
                                                    demo[item]=value;//修改该编辑属性的值
                                                }
                                            }else{
                                                demo[item]=value;//修改该编辑属性的值D
                                            }
                                        }

                                    }
                                    break;
                                }
                                if(i==json.length-1){
                                    json.push(data);//在json数组里新增一个json对象
                                }
                            }
                            console.log(json);
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
                      ,reload: function(){
                          var demoReload = $('#demoReload').val();
                          console.log("demoReload:"+demoReload);
                          //执行重载
                          table.reload('test3', {
                              page: {
                                  curr: 1 //重新从第 1 页开始
                              }
                              ,where: {
                                  deliveryNumber: demoReload,
                              }
                          });
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
                //往cookie里面记录上次单击事件时间
                $.cookie('t', themeName, {
                    expires: 7,
                    path: '/'
                });
                function check(t) {
                    var lastBtnClickTime = $.cookie("t");
                    var nowTime = new Date().getTime();
                    if ((nowTime - lastBtnClickTime) >= 2000) {
                        $.cookie("t", new Date().getTime());
                        var table_data = $("#table_data").iTextarea("getValue");
                        if(table_data==""){
                            alert("提交失败，请先输入调整数！");
                        }else{
                            $("#tijiao").click();
                        }
                    } else {
                        $.iMessager.show({
                            title: '温馨提示',
                            msg: '老司机手速太快啦！'
                        });
                    }

                }

                function filling(test){
                    $('#demoReload').val(test);
                    $("#sou").click();
                    // 执行表格数据重载，表格输入数据也该清空
                    $("#table_data").iTextarea("setValue","");
                    // alert(test);
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
			                       url:'/Cartonout/updateByNum/',
			                   }">提交</a>
				<a href="javascript:check(this)"
				   data-toggle="topjui-linkbutton"
				   data-options="iconCls:'fa fa-save'">提交</a>
			</div>
		</form>
	</div>
  </div>
  </body>
</html>
