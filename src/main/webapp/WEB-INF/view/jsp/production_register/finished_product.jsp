<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>成品入库登记</title>
    
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
  <div data-toggle="topjui-panel" title="" data-options="fit:true,iconCls:'icon-ok',footer:'#footer'">
  <form class="hidden" method="post" data-toggle="topjui-form" data-options="id:'formId',
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
								                  fitColumns:true,<%--列宽自适应属性 搭配列属性中的width:100使用--%>
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
    <div class="hang">
 		<span>&nbsp;入库批号&nbsp;</span><input id="pihao" type="text" name="ph" data-toggle="topjui-textbox" data-options="readonly:true" value="201800362" style="width:150px;">
		<script type="text/javascript">
            $(function () {
                //生成入库批号
                $.ajax({
                    url:'/Cartonwarehousing/generateOrderAccount/',
                    dataType:'json',
                    success:function(data){
                        $("#pihao").iTextbox("setValue",data.rkPihao);
                    }
                });
            });
            </script>
		<span>&nbsp;入库日期&nbsp;</span><input id="riqi" name="rkdate" data-toggle="topjui-datetimebox" data-options="width:200"/>
		仓库<input type="text" name="ck" data-toggle="topjui-combobox" data-options="data:[{value:1,text:'A'},{value:2,text:'B'},{value:3,text:'C'}],panelHeight:100" style="width: 70px;">
		<span>&nbsp;登记人&nbsp;</span><input type="text" name="adminName" data-toggle="topjui-textbox" value="${adminName}" style="width:150px;">
		<input id="table_data" type="hidden" name="table_data" data-toggle="topjui-textarea" data-options="required:true,readonly:true,prompt:'此处无需输入，只需修改表格即可'" style="width:930px;height:100px"/>
	</div>

	<div>
		<div class="layui-btn-group demoTable">
			<!-- <button class="layui-btn" data-type="getCheckData">获取选中行数据</button>
            <button class="layui-btn" data-type="getCheckLength">获取选中数目</button>
            <button class="layui-btn" data-type="isAll">验证是否全选</button> -->
			<button style="margin-left: 450px;" class="layui-btn" data-type="reload">筛选</button>
		</div><br>
		</div>
		<table class="layui-table" lay-data="{url:'/OutStorage/findAll/',page:true, id:'test3',height:400 }" lay-filter="test3">
		  <thead>
		    <tr>
		      <th lay-data="{type:'checkbox'}">ID</th>
		      <th lay-data="{field:'orderAccount', width:200, sort: true}">订单号</th>
		      <th lay-data="{field:'purNumber', width:200, sort: true}">出库单号</th>
				<th lay-data="{field:'customName', width:120, sort: true}">客户名称</th>
		      <th lay-data="{field:'materialScience', width:80, sort: true}">材质</th>
		      <th lay-data="{field:'cardboardLength', minWidth: 80}">长</th>
		      <th lay-data="{field:'cardboardWidth', width:80}">宽</th>
		      <th lay-data="{field:'pitType', width:80}">楞型</th>
		      <th lay-data="{field:'widthLine',  minWidth: 100}">宽度压线</th>
		      <th lay-data="{field:'num', sort: true}">出库数</th>
		      <th lay-data="{field:'time', sort: true}">出库时间</th>
		      <th lay-data="{field:'number', sort: true, edit: 'text'}">成品入库数量</th>
			  <th lay-data="{field:'baosun', sort: true, edit: 'text'}">成品报损数量</th>
			  <th lay-data="{field:'palletNumber', sort: true, edit: 'text'}">托盘数</th>

		    </tr>
		  </thead>
		</table>

		<script>
		layui.use('table', function(){
		  var table = layui.table;

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
              if(data.number==undefined||data.number==""){//如果为undefined的话在生成对象的时候就会被自动过滤
                  data.number = 0;
              }
              if(data.baosun==undefined||data.baosun==""){//无论是undefined还是null都统一等于空字符串“”
                  data.baosun = 0;
              }
              if(data.palletNumber==undefined||data.palletNumber==""){//无论是undefined还是null都统一等于空字符串“”
                  data.palletNumber = 0;
              }
              //准备好json数组所需的对象 这里改成直接添加所有的数据data
              // var arr = {
              //     "id":data.id,
              //     "price":data.cartonPrice,
              //     "num":data.num,
              //     "purchaseRemarks":data.purchaseRemarks
              // };
              var val = $("#table_data").iTextarea("getValue");//拿到已保存起来的编辑数据
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
                      if(json[i].purId == data.purId){//找到其中一个对象的id是当前编辑条目的id，的对象数据
                          var demo = json[i];
                          for(var item in demo){//循环遍历输出该对象的‘属性’和‘值’
                              if(item == field){//找到与修改字段一样的属性，修改该‘属性’对应‘值’
                                  if(value==""){//如果修改的值是空的话，即删除；那就要判断连个属性的值是否都为空，都为空的话就删除该条json对象数据（不提交）
                                      if(field=="number"){
                                              json.splice(i,1);//删除当前json对象
                                              layer.msg('[订单: '+ data.orderAccount+']取消入库！');
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
              reload: function(){
                  var orderAccount = $('#orderAccount').val();
                  var purchaseSpec = $('#purchaseSpec').val();
                  var fluteType = $('#fluteType').val();
                  var chang = $('#chang').val();
                  var k = $('#k').val();
                  var h = $('#h').val();
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
                          h: h,
                          minNum: minNum,
                          maxNum: maxNum
                      }
                  });
              },

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
        $(function(){
            // 获取当前时间戳生成采购单号
            var timestamp = "CP"+new Date().getTime();
            $("#pihao").iTextbox("setValue",timestamp);
            var dat = getNowFormatDate();
            $("#riqi").iDatetimebox("setValue",dat);
            $("#table_data").next().hide();//隐藏表格数据框
        });
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
                    alert("提交失败，请先输入成品入库数！");
                }else{
                    $("#tijiao").click();
                    $(this).attr("disabled","disabled");
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
		</script>
	</div>
  </form>
  </div>
  <div id="footer" class="hidden" style="height: 34px; padding: 5px; text-align: right;">
	  <a href="#"  id="tijiao" style="display:none;"
		 data-toggle="topjui-linkbutton"
		 data-options="id:'submitBtn',
			                   iconCls:'fa fa-save',
			                   form:{
			                       id:'formId',
			                       method:'submit',
			                       url:'/Cartonwarehousing/addCW/',
			                       <%--refreshRefererTab:true,--%>
			                       <%--closeCurrentTab:true--%>
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
                       title:'成品送货',
                       href:'/AdminController/jsp/?url=/production_register/finished_delivery'
                   }">进入下个操作</a>
  </div>
  </body>
</html>
