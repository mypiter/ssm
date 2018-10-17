<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>成品送货</title>
    
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
		 		<span>&nbsp;客户名称&nbsp;</span><input type="text" data-toggle="topjui-combobox"
	  								data-options="id:'user',
	  												width:300,
												    onSelect: function (index,row){
															$('#customCompary').iTextbox('setValue',index['customCompary']);
															$('#customId').iTextbox('setValue',index['customId']);
															$('#staffId').iTextbox('setValue',index['staffId']);
															filling(index['customName']);
															},
								                  idField: 'customId',
								                  textField: 'customName',
								                  valueField:'customId',
								                  url:'/Mian/getList/',
								                   prompt:'必填',childCombobox:{
																			   id:'deliveryAddress',
																			   url:'/ReceivingAddress/selectByList/?custom={parentValue}'
																		   },required:true">

				<span>&nbsp;送货单号&nbsp;</span><input type="text" id="oder" name="oder" data-toggle="topjui-textbox" data-options="required:true,readonly:true" value="" style="width:200px;">
				<script type="text/javascript">
                    $(function () {
                        //生成当前订单的songhuo 单号
                        $.ajax({
                            url:'/CartonOutInfo/generateOrderAccount/',
                            dataType:'json',
                            success:function(data){
                                $("#oder").iTextbox("setValue",data.deliveryNumber);
                            }
                        });
                    });
				</script>
				<span>&nbsp;送货日期&nbsp;</span><input id="riqi" type="text" name="userNameId" data-toggle="topjui-datebox" data-options="width:200,required:true">
			</div>
			<div class="hang">
		 		<span>&nbsp;核算单位&nbsp;</span><input type="text" id="customCompary" name="customCompary" data-toggle="topjui-textbox" data-options="width:300,required:true"/>
		 		<span>&nbsp;送&nbsp;货&nbsp;人&nbsp;&nbsp;</span>
				<input type="text" id="" name="song"
					   data-toggle="topjui-combogrid"
					   data-options="id:'staffNames',width:100,
									   idField: 'staffName',
									   textField: 'staffName',
									   fitColumns:false,
									   url:'/StaffTable/findByBusiness/?type=3',
									   columns:[[
										   {field: 'staffName',width:170, title: '姓名'}
									   ]],validType:['length[0,10]']">
		 		<span>&nbsp;车&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号&nbsp;</span><input type="text" name="car" data-toggle="topjui-textbox" data-options="required:true,validType:['length[0,10]']" style="width:200px;">
			</div>
			<div class="hang">
		 		<span>&nbsp;收&nbsp;货&nbsp;人&nbsp;&nbsp;</span><input type="text" id="customName" name="customName" data-toggle="topjui-textbox" data-options="required:true" style="width:100px;">
		 		<span>&nbsp;收货人联系方式</span><input type="text" id="customTel" name="customTel" data-toggle="topjui-textbox" data-options="required:true" style="width:120px;">
		 		<span>&nbsp;送货地址&nbsp;</span>
				<input id="deliveryAddress" type="text" name="deliveryAddress"
					   data-toggle="topjui-combobox"
					   data-options="id:'deliveryAddress',width:445,
						   textField: 'receivingAddress',
						   valueField: 'receivingAddress',
						   required:true,
						   prompt:'必填',
						   onLoadSuccess: function (res) {
								// 下拉框默认选择第一项
								if (res) {
									var val = $(this).iCombobox('getData');
									$(this).iCombobox('select', val[0]['receivingAddress']); //这个数据根据自己情况来设定
								}
							},
							onSelect:function(res){
								$('#customName').iTextbox('setValue',res['consignee']);
								$('#customTel').iTextbox('setValue',res['consigneeTel']);
							}
						">
			</div>
			<div class="hang">
		 		<span>&nbsp;备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注&nbsp;&nbsp;</span><input type="text" name="cent" data-toggle="topjui-textbox" data-options="validType:['length[0,250]']" style="width:835px;">
			</div>
			<div class="hang">
		 		<span>&nbsp;制&nbsp;单&nbsp;员&nbsp;&nbsp;</span><input type="text" name="adminName" value="${adminName}" data-toggle="topjui-textbox" style="width:150px;">
				<span>&nbsp;总&nbsp;金&nbsp;额&nbsp;&nbsp;</span><input id="zong" type="text" name="price" data-toggle="topjui-numberbox" data-options="readonly:true,precision:2,required:true,validType:['length[0,13]']" style="width:100px;">
				<input id="table_data" type="hidden" name="table_data" data-toggle="topjui-textarea" data-options="required:true,readonly:true,prompt:'此处无需输入，只需修改表格即可'" style="width:930px;height:100px"/>
				<span>送货单格式</span><input id="deliveryStyle" name="deliveryStyle" type="text" data-toggle="topjui-combobox"
					   data-options="id:'user',
	  												width:80,
								                  idField: 'id',
								                  textField: 'name',
								                  valueField:'url',
								                  url:'/Dively/getList/?biao=2',
								                   prompt:'必填',required:true,
                                                   onLoadSuccess: function (res) {
													// 下拉框默认选择第一项
													if (res) {
														var val = $(this).iCombobox('getData');
														$(this).iCombobox('select', val[0]['url']); //这个数据根据自己情况来设定
													}
													}
									"><a href="javascript:openNewTab()" data-toggle="topjui-linkbutton"
	 								data-options="text:'送货单预览',iconCls:null,btnCls:'green'"></a>
				                    <span>&nbsp;送货单台头&nbsp;</span><input name="coid" type="text" data-toggle="topjui-combobox"
													  data-options="id:'user',
	  												  width:210,
	  												  idField: 'id',
													  textField: 'companyName',
													  valueField:'id',
													  url:'/CompanyInformation/getList/',
								                      required:false,
													 onLoadSuccess: function (res) {
													// 下拉框默认选择第一项
													if (res) {
														var val = $(this).iCombobox('getData');
														$(this).iCombobox('select', val[0]['id']); //这个数据根据自己情况来设定
													}
													}
											">
			</div>

			<div>
				<div class="layui-btn-group demoTable" style="display: none">
					搜索ID:
					<div class="layui-inline">
						<input class="layui-input" name="id" id="demoReload" autocomplete="off">
					</div>
					<button id="sou" class="layui-btn" data-type="reload">搜索</button>
				</div>
				<table class="layui-table" lay-data="{url:'/CartonStock/findByCu/',page:true, id:'test3',height:500}" lay-filter="test3">
				  <thead>
				    <tr>
						<th lay-data="{type:'checkbox'}">ID</th>
						<th lay-data="{field:'orderAccount', width:200, sort: true}">订单号</th>
						<th lay-data="{field:'customerName', width:120, sort: true}">客户名称</th>
						<th lay-data="{field:'productName', width:120, sort: true}">品名</th>
						<th lay-data="{field:'size', width:200, sort: true}">规格</th>
						<th lay-data="{field:'materialScience', width: 80}">材质</th>
						<th lay-data="{field:'pitType', width:80}">楞型</th>
						<th lay-data="{field:'stockNum',  minWidth: 100}">库存数</th>
				      <th lay-data="{field:'price',  minWidth: 100 ,edit: 'text',fixed: 'right',event:'setSign' }">单价</th>
				      <th lay-data="{field:'reservoir',  minWidth: 100 ,templet:'#sexTpl'}">仓库</th>
				      <th lay-data="{field:'number', sort: true, edit: 'text',fixed: 'right',event:'setSign'}">发货数</th>
				    </tr>
				  </thead>
				</table>
				
				<script>
				layui.use('table', function(){
				    var tiaoshi=0;

                    var table = layui.table;
                    var price=0;//总价
                    //监听单元格编辑
                    table.on('edit(test3)', function(obj){
                        var value = obj.value //得到修改后的值
                            ,data = obj.data //得到所在行所有键值
                            ,field = obj.field; //得到字段
                        //console.log(data);

                        //非零非负数字正则表达式
                        var reg=/^\+?[1-9][0-9]*$/;
                        if(!reg.test(value) && field=="number" && value!=""){
                            //console.log("非数字");
                            layer.msg('入库数输入错误，请重新输入！', {icon: 2});
                            return;
                        }
                        // layer.msg('[ID: '+ data.id +'] ' + field + ' 字段更改为：'+ value);
                        if(value!=""){
                            if(field=="number"){
                                // price+=value*data.price;
                            }else{
                                // price+=value*data.price;
                            }
                        }
                        if(data.number==undefined){//如果为undefined的话在生成对象的时候就会被自动过滤
                            data.number = "0";
                        }
                        if(data.number>data.stockNum){
                            alert("出库数量不能大于库存数！请重新输入");
                            $("#zong").iNumberbox("setValue","");
                            $("#table_data").iTextarea("setValue","");
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
                        // console.log(val);
                        if(val=="" || val=="[]"){//数据为空，表示当前是第一次编辑，直接保存即可无需过多的逻辑处理
                            if(field=="number"){
                                var json=[];
                                json.push(data);//在json数组里新增一个json对象
                                // console.log(json);
                                var jsonarr = JSON.stringify(json);//把json对象Opject转化为string，以便保存和提交
                                price=data.number*data.price;
                                $("#zong").iNumberbox("setValue",price);
                                $("#table_data").iTextarea("setValue",jsonarr);

                            }
                        }else{//数据不为空，表示当前不是第一次编辑数据
                            var yuan = Number($("#zong").iNumberbox("getValue"));//获取总金额的值

                            var json = JSON.parse(val);//把json字符串转化为json对象object数组，以便数据操作
                            for(var i = 0;i<json.length;i++){//遍历json对象数组中的每一个对象
                                if(json[i].stockId == data.stockId){//找到其中一个对象的id是当前编辑条目的id，的对象数据
                                    var demo = json[i];
                                    for(var item in demo){//循环遍历输出该对象的‘属性’和‘值’
                                        if(item == field){//找到与修改字段一样的属性，修改该‘属性’对应‘值’
                                            if(value==""){//如果修改的值是空的话，即删除；那就要判断连个属性的值是否都为空，都为空的话就删除该条json对象数据（不提交）
                                                if(field=="number"){
                                                    json.splice(i,1);//删除当前json对象
                                                    price = Number(tiaoshi*data.price);
                                                    var ss = Number(yuan-price).toFixed(2);
                                                    $("#zong").iNumberbox("setValue",ss);
                                                }else{
                                                    demo[item]=value;//修改该编辑属性的值
                                                }
                                            }else{
                                                demo[item]=value;//修改该编辑属性的值D
                                                if(tiaoshi!=0 && field=="number"){
                                                        var ss=0;
                                                        if(tiaoshi>value){
                                                            price = Number((tiaoshi-value)*data.price);
                                                            ss=Number(yuan-price).toFixed(2);
														}else{
                                                            price = Number((value-tiaoshi)*data.price);
                                                            ss=Number(yuan+price).toFixed(2);
														}
                                                        $("#zong").iNumberbox("setValue",ss);
                                                }
                                            }
                                        }
                                    }
                                    break;
                                }
                                if(i==json.length-1){
                                    json.push(data);//在json数组里新增一个json对象
                                    price=Number(data.number*data.price);
                                    var ss = Number(price+yuan).toFixed(2);
                                    $("#zong").iNumberbox("setValue",ss);
                                }
                            }
                            // console.log(json);
                            var jsonarr = JSON.stringify(json);//把json对象Opject转化为string，以便保存和提交
                            if(jsonarr=="[]"){
                                $("#zong").iNumberbox("setValue",0);
                                $("#table_data").iTextarea("setValue","");
                            }else{
                                $("#table_data").iTextarea("setValue",jsonarr);
                            }
                        }
				  });

                    //如果是第一次点击下面的验证就用不到，此验证主要是消除表格中不符合规定的数据,防止不符合规定的数据添加到提交数据中
                    table.on('tool(test3)',function(obj){
                        var data = obj.data;
                        if(obj.event=='setSign'){
							if(data.number!=undefined){
                                tiaoshi=data.number;
							}else{
                                tiaoshi=0;
							}
							// console.log(data.number);
                        }
                    });
				  
				  //监听表格复选框选择
				  table.on('checkbox(test3)', function(obj){


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
                          //console.log("demoReload:"+demoReload);
                          //执行重载
                          table.reload('test3', {
                              page: {
                                  curr: 1 //重新从第 1 页开始
                              }
                              ,where: {
                                  customName: demoReload,
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
                    // 获取当前时间戳生成送货单号
                   // var timestamp = "SH"+new Date().getTime();
                   // $("#oder").iTextbox("setValue",timestamp);
                    //var dat = getNowFormatDate();
                    //$("#riqi").iDatetimebox("setValue",dat);
                    $("#table_data").next().hide();//隐藏表格数据框
                });
                //送货单预览
                function openNewTab() {
                    var title;
                    // var url="http://182.61.33.21/photo/20180814195636.jpeg";
                    //var url="/CustomController/jumpDivelySee/?url=/sale_register/dively_see&urll=http://demo.jxxiongshi.com/";//外网
                    var url="/CustomController/jumpDivelySee/?url=/sale_register/dively_see&urll=/";
                    title="送货单格式预览";
                    var dively = $("#deliveryStyle").iCombobox('getValue');
                    if(dively==""){
                        alert("未选择送货单或者送货单格式为空!");
                        return;
                    }else{
                        url+="js"+dively;
                        window.open(url);
                    }
                }
                //往cookie里面记录上次单击事件时间
                $.cookie('t', themeName, {
                    expires: 7,
                    path: '/'
                });
                //
                function check(t) {
                    var lastBtnClickTime = $.cookie("t");
                    var nowTime = new Date().getTime();
                    if ((nowTime - lastBtnClickTime) >= 2000) {
                        $.cookie("t", new Date().getTime());
                        var table_data = $("#table_data").iTextarea("getValue");
                        if(table_data==""){
                            alert("提交失败，请先输入发货数！");
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
                function filling(test){
                    $('#demoReload').val(test);
                    $("#sou").click();
                    // 执行表格数据重载，表格输入数据也该清空
                    $("#table_data").iTextarea("setValue","");
                    // alert(test);
                }
				</script>
				<script type="textml" id="sexTpl">
					{{#  if(d.lineType === 1){ }}
					<%--<span style="color: #F581B1;">明线</span>--%>
					A仓库
					{{#  } else { }}
					B仓库
					{{#  } }}
	         </script>

			</div>
  	
			<div id="footer" class="hidden" style="height: 34px; padding: 5px; text-align: right;">
			    <a href="#" id="tijiao" style="display:none;"
			       data-toggle="topjui-linkbutton"
			       data-options="id:'submitBtn',
			                   iconCls:'fa fa-save',
			                   form:{
			                       id:'formId',
			                       xxx:'1',
			                       method:'submit',
			                       url:'/Cartonout/AddCO/',
			                   }">提交</a>
				<a href="javascript:check(this)"
				   data-toggle="topjui-linkbutton"
				   data-options="iconCls:'fa fa-save'">提交</a>
				<a href="javascript:void(0)"
				   data-toggle="topjui-menubutton"
				   data-options="method:'openTab',
                   extend: '#productDg-toolbar',
                   btnCls:'topjui-btn-purple',
                   tab:{
                       title:'成品送货记录列表',
                       href:'/AdminController/jsp/?url=/production_report/delivery_goods'
                   }">进入成品送货记录</a>
			</div>
		</form>
	</div>
  </div>
  </body>
</html>
