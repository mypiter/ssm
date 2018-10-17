<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>开出发票登记</title>
    
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
				<input type="hidden" name="type" value="1">
				<span>&nbsp;客户名称&nbsp;</span><input name="ticketName" type="text" data-toggle="topjui-combogrid"
													data-options="id:'user',
	  												width:200,
												    onSelect: function (index,row){
															$('#accountNumber').iTextbox('setValue',row['accountNumber']);
															$('#recognitionNumber').iTextbox('setValue',row['recognitionNumber']);
															$('#openingBank').iTextbox('setValue',row['openingBank']);
															$('#staffId').iTextbox('setValue',row['staffId']);
															$('#customName').iTextbox('setValue',row['customName']);
															$('#customTel').iTextbox('setValue',row['customTel']);
															filling(row['customName']);
															},
								                  idField: 'customName',
								                  textField: 'customName',
								                  url:'/Mian/selectCus/',
								                   columns:[[
                                                               {field: 'customName',width:100, title: '客户名称'}
                                                           ]],prompt:'必填',required:true">
		 		<span>&nbsp;发票代码&nbsp;</span><input type="text" name="invoiceCode" data-toggle="topjui-numberbox" data-options="required:true,prompt:'只限数字',validType:['length[0,50]']" value="" style="width:200px;">
		 		<span>&nbsp;发票号码&nbsp;</span><input type="text" name="ticketAccout" data-toggle="topjui-numberbox" data-options="required:true,prompt:'只限数字',validType:['length[0,50]']"  value="" style="width:200px;">
			</div>
			<div class="hang">
				<span>联&nbsp;系&nbsp;人&nbsp;&nbsp;&nbsp;</span><input id="customName" type="text" name="contacts" data-toggle="topjui-textbox" style="width:200px;">
		 		<span>&nbsp;电&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;话&nbsp;</span><input id="customTel" type="text" name="contactsTel" data-toggle="topjui-textbox" style="width:200px;">
				<span>&nbsp;帐&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号&nbsp;&nbsp;</span><input id="accountNumber" type="text" name="accountNumber" data-toggle="topjui-textbox" style="width:200px;">
			</div>
			<div class="hang">
		 		<span>纳税人识别号</span><input id="recognitionNumber" type="text" name="taxpayerNumber" data-toggle="topjui-textbox" data-options="validType:['length[0,100]']" style="width:300px;">
				<span>&nbsp;开&nbsp;户&nbsp;行&nbsp;</span><input id="openingBank" type="text" name="openingBank" data-toggle="topjui-textbox" data-options="validType:['length[0,100]']" style="width:350px;">
			</div>

			<div>
				<!-- <div class="layui-btn-group demoTable">
				  <button class="layui-btn" data-type="getCheckData">获取选中行数据</button>
				  <button class="layui-btn" data-type="getCheckLength">获取选中数目</button>
				  <button class="layui-btn" data-type="isAll">验证是否全选</button>
				</div> -->
				<div class="layui-btn-group demoTable" style="display: none">
					搜索ID:
					<div class="layui-inline">
						<input class="layui-input" name="id" id="demoReload" autocomplete="off">
					</div>
					<button id="sou" class="layui-btn" data-type="reload">搜索</button>
				</div>
				<table class="layui-table" lay-data="{url:'/Ticket/findList/',page:true, id:'test3'}" lay-filter="test3">
				  <thead>
				    <tr>
				      <th lay-data="{type:'checkbox'}">ID</th>
				      <th lay-data="{field:'productName', width:120, sort: true}">产品名称</th>
				      <th lay-data="{field:'dan', width:80 ,templet: '#sexTp2'}">单位</th>
				      <th lay-data="{field:'outNum',  minWidth: 100}">数量</th>
				      <th lay-data="{field:'cartonPrice', sort: true}">单价</th>
				      <th lay-data="{field:'price', sort: true,templet: '#sexTpl'}">金额</th>
				    </tr>
				  </thead>
				</table>
				<script type="text/html" id="sexTpl">
					{{(d.outNum*d.cartonPrice).toFixed(2)}}
				</script>
				<script type="text/html" id="sexTp2">
					个
				</script>
				<div class="hang">
					<span>合计金额(大写)</span><input id="Allprice" type="text" name="ticketMoneys" data-toggle="topjui-textbox" data-options="readonly:true" style="width:300px;">
			 		<span>(小写)</span><input id="price" name="ticketMoney" data-toggle="topjui-textbox" data-options="readonly:true,
														onChange:function(newValue,oldValue){
															var cess = $('#cess').iNumberbox('getValue');
															if(cess!=''){
																var ticketAdValoremTotal = cess*(newValue/100);
																console.log(ticketAdValoremTotal);
																$('#ticketAdValoremTotal').iNumberbox('setValue',ticketAdValoremTotal);
															}
														}" style="width:100px;">
					<span>&nbsp;开票日期&nbsp;</span><input type="text" id="riqi" name="ticketTime" data-toggle="topjui-datetimebox" data-options="" data-options="" style="width:200px;">
				</div>
				<div class="hang">
					<span>&nbsp;收&nbsp;款&nbsp;人&nbsp;</span><input type="text" name="ticketCollector" data-toggle="topjui-textbox" style="width:200px;">
					<span>&nbsp;复&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;核&nbsp;</span><input type="text" name="toReview" data-toggle="topjui-textbox" data-options="rvalidType:['length[0,10]']" style="width:213px;">
					<span>&nbsp;开&nbsp;票&nbsp;人&nbsp;</span><input type="text" name="ticketHolder" value="${adminName}" data-toggle="topjui-textbox" style="width:200px;">
				</div>
				<div class="hang">
                    <span>税率</span><input id="cess" name="cess" type="text"
                                          data-toggle="topjui-numberbox"
                                          data-options="required:true,min:0.00,precision:2,max:20.00,
														onChange:function(newValue,oldValue){
															var ticketMoney = $('#price').iNumberbox('getValue');
															if(ticketMoney!=''){
																var ticketAdValoremTotal = ticketMoney*(newValue/100);
																console.log(ticketAdValoremTotal);
																$('#ticketAdValoremTotal').iNumberbox('setValue',ticketAdValoremTotal);
															}
														}" style="width:60px;">%
                    <span>总税额</span><input id="ticketAdValoremTotal" name="ticketAdValoremTotal" type="text" data-toggle="topjui-numberbox" data-options="required:true,min:00,precision:2,readonly:true,validType:['length[0,12]']" style="width:100px;">
					<span>&nbsp;备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注&nbsp;</span><input type="text" name="ticketRemark" data-toggle="topjui-textbox" data-options="validType:['length[0,50]']" style="width:735px;">
					<input id="table_data" type="hidden" name="table_data" data-toggle="topjui-textarea" data-options="required:true,readonly:true,prompt:'此处无需输入，只需修改表格即可'" style="width:930px;height:100px"/>
				</div>

				<script>
				layui.use('table', function(){
				  var table = layui.table;
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
                                layer.msg('[客户订单: '+ data.orderAccount+']出库 '+ value +' 片纸箱');
                                price+=value*data.price;
                            }else{
                                price+=value*data.price;
                                layer.msg('[客户订单: '+ data.orderAccount+']报损数量更改为：'+ value);
                            }
                        }
                        if(data.number==undefined){//如果为undefined的话在生成对象的时候就会被自动过滤
                            data.number = "0";
                        }
                        if(data.number>data.stockNum){
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
                    // console.log(val);
                    if(val=="" || val=="[]"){//数据为空，表示当前是第一次编辑，直接保存即可无需过多的逻辑处理
                        if(field=="number"){
                            var json=[];
                            json.push(data);//在json数组里新增一个json对象
                            // console.log(json);
                            var jsonarr = JSON.stringify(json);//把json对象Opject转化为string，以便保存和提交
                            $("#table_data").iTextarea("setValue",jsonarr);

                        }
                    }else{//数据不为空，表示当前不是第一次编辑数据
                        var json = JSON.parse(val);//把json字符串转化为json对象object数组，以便数据操作
                        for(var i = 0;i<json.length;i++){//遍历json对象数组中的每一个对象
                            if(json[i].stockId == data.stockId){//找到其中一个对象的id是当前编辑条目的id，的对象数据
                                var demo = json[i];
                                for(var item in demo){//循环遍历输出该对象的‘属性’和‘值’
                                    if(item == field){//找到与修改字段一样的属性，修改该‘属性’对应‘值’
                                        if(value==""){//如果修改的值是空的话，即删除；那就要判断连个属性的值是否都为空，都为空的话就删除该条json对象数据（不提交）
                                            if(field=="number"){
                                                json.splice(i,1);//删除当前json对象
                                                layer.msg('[客户订单: '+ data.orderAccount+']取消出库！');
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
				  //监听单元格编辑
				  table.on('edit(test3)', function(obj){
				    var value = obj.value //得到修改后的值
				    ,data = obj.data //得到所在行所有键值
				    ,field = obj.field; //得到字段
				    layer.msg('[ID: '+ data.id +'] ' + field + ' 字段更改为：'+ value);
				  });

				  //监听表格复选框选择
				  table.on('checkbox(test3)', function(obj){
				    console.log(obj);
                      var checked = obj.checked //得到修改后的值
                          ,data = obj.data //得到所在行所有键值
                          ,type = obj.type; //得到字段
                      if(type=="all" && checked==true){
                          $('div.laytable-cell-checkbox').find('div.layui-form-checked').click();//取消全部选中项
                          alert("禁止全选");
                          return;
                      }
                      if(type=="all" && checked==false){
                          $("#table_data").iTextbox("setValue","");
                          $("#price").iTextarea("setValue","");
                          $("#Allprice").iTextarea("setValue","");
                          return;
                      }

                      var val = $("#table_data").iTextarea("getValue");//拿到已保存起来的编辑数据
                      var allprice = $("#price").iTextarea("getValue");//拿到总金额

                          if(obj.checked){
                              if(val=="" || val=="[]"){
                                  var json=[];
                                  json.push(data);
                                  var jsonarr = JSON.stringify(json);//把json对象Opject转化为string，以便保存和提交
                                  if(jsonarr=="[]"){
                                      $("#table_data").iTextarea("setValue","");
                                  }else{
                                      $("#table_data").iTextarea("setValue",jsonarr);
                                  }
                                  var p=data.cartonPrice*data.outNum;
                                  if(allprice==""||allprice==0){
                                      $("#price").iTextarea("setValue",p);
                                      $("#Allprice").iTextarea("setValue",digitUppercase(p));
								  }
                              }else{
                                  var json = JSON.parse(val);//把json字符串转化为json对象object数组，以便数据操作
                                  json.push(data);
                                  var jsonarr = JSON.stringify(json);//把json对象Opject转化为string，以便保存和提交
                                  if(jsonarr=="[]"){
                                      $("#table_data").iTextarea("setValue","");
                                  }else{
                                      $("#table_data").iTextarea("setValue",jsonarr);
                                  }
                                  var p=data.cartonPrice*data.outNum;
                                  $("#price").iTextarea("setValue",numAdd(allprice,p));
                                  $("#Allprice").iTextarea("setValue",digitUppercase(numAdd(allprice,p)));
                              }

						  }else{
                              var json = JSON.parse(val);//把json字符串转化为json对象object数组，以便数据操作
                              for(var i = 0;i<json.length;i++){
                                  if(json[i].LAY_TABLE_INDEX == data.LAY_TABLE_INDEX){
                                      var p=data.cartonPrice*data.outNum;
                                      json.splice(i,1);//删除当前json对象
                                      if(numSub(allprice,p)<=0){
                                          $("#price").iTextarea("setValue",0);
                                          $("#Allprice").iTextarea("setValue",digitUppercase(0));
                                      }else{
                                          $("#price").iTextarea("setValue",numSub(allprice,p));
                                          $("#Allprice").iTextarea("setValue",digitUppercase(numSub(allprice,p)));
                                      }
								  }
							  }

                              var jsonarr = JSON.stringify(json);//把json对象Opject转化为string，以便保存和提交
                              if(jsonarr=="[]"){
                                  $("#table_data").iTextarea("setValue","");
                              }else{
                                  $("#table_data").iTextarea("setValue",jsonarr);
                              }
						  }
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
					    },
                      reload: function(){
                          var demoReload = $('#demoReload').val();
                          console.log("demoReload:"+demoReload);
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
                    var dat = getNowFormatDate();
                    $("#riqi").iDatetimebox("setValue",dat);

                    $("#table_data").next().hide();//隐藏表格数据框

                });

                function check() {
                    var table_data = $("#table_data").iTextarea("getValue");
                    if(table_data==""){
                        alert("提交失败，请先勾选选中数据！");
                    }else{
                        $("#tijiao").click();
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

				/*大写转换函数*/
                var digitUppercase = function(n) {
                    var fraction = ['角', '分'];
                    var digit = [
                        '零', '壹', '贰', '叁', '肆',
                        '伍', '陆', '柒', '捌', '玖'
                    ];
                    var unit = [
                        ['元', '万', '亿'],
                        ['', '拾', '佰', '仟']
                    ];
                    var head = n < 0 ? '欠' : '';
                    n = Math.abs(n);
                    var s = '';
                    for (var i = 0; i < fraction.length; i++) {
                        s += (digit[Math.floor(n * 10 * Math.pow(10, i)) % 10] + fraction[i]).replace(/零./, '');
                    }
                    s = s || '整';
                    n = Math.floor(n);
                    for (var i = 0; i < unit[0].length && n > 0; i++) {
                        var p = '';
                        for (var j = 0; j < unit[1].length && n > 0; j++) {
                            p = digit[n % 10] + unit[1][j] + p;
                            n = Math.floor(n / 10);
                        }
                        s = p.replace(/(零.)*零$/, '').replace(/^$/, '零') + unit[0][i] + s;
                    }
                    return head + s.replace(/(零.)*零元/, '元')
                        .replace(/(零.)+/g, '零')
                        .replace(/^整$/, '零元整');
                };
                //加法
                function numAdd(num1, num2) {
                    var baseNum, baseNum1, baseNum2;
                    try {
                        baseNum1 = num1.toString().split(".")[1].length;
                    } catch (e) {
                        baseNum1 = 0;
                    }
                    try {
                        baseNum2 = num2.toString().split(".")[1].length;
                    } catch (e) {
                        baseNum2 = 0;
                    }
                    baseNum = Math.pow(10, Math.max(baseNum1, baseNum2));
                    var precision = (baseNum1 >= baseNum2) ? baseNum1 : baseNum2;//精度
                    return ((num1 * baseNum + num2 * baseNum) / baseNum).toFixed(precision);;
                };
                //减法
                function numSub(num1, num2) {
                    var baseNum, baseNum1, baseNum2;
                    try {
                        baseNum1 = num1.toString().split(".")[1].length;
                    } catch (e) {
                        baseNum1 = 0;
                    }
                    try {
                        baseNum2 = num2.toString().split(".")[1].length;
                    } catch (e) {
                        baseNum2 = 0;
                    }
                    baseNum = Math.pow(10, Math.max(baseNum1, baseNum2));
                    var precision = (baseNum1 >= baseNum2) ? baseNum1 : baseNum2;
                    return ((num1 * baseNum - num2 * baseNum) / baseNum).toFixed(precision);
                };
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
			                       url:'/Ticket/AddTi/',
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
