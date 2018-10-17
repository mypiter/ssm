<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>原材料入库</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<!-- 导入公共样式 -->
    <%--<%@ include file="..\ap.jsp" %>--%>
	  <%@ include file="/WEB-INF/view/jsp/ap.jsp" %>
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

	  .layui-table-view .layui-form-checkbox{top:0px;}
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
		批号<input id="batch" name="batch" type="text" data-toggle="topjui-textbox" data-options="readonly:true" style="width: 150px;">
		采购单号<input id="orderAccount" name="orderAccount" type="text" data-toggle="topjui-combogrid"
	  								data-options="id:'user',
	  												panelWidth:350,
	  												width:200,
								                  idField: 'purchaseAccount',
								                  textField: 'purchaseAccount',
								                  fitColumns:false,<%--列宽自适应属性 搭配列属性中的width:100使用--%>
								                  url:'/CardboardEnter/dropSelectPurchase/',
								                  onSelect: function (index,row){
                                                                <%--console.log(index+','+row['supplierType']);--%>
                                                                <%--执行表格重载方法--%>
                                                                <%--$('#supplierName').iTextbox('setValue',row['supplierName']);--%>
                                                                filling(1,row['purchaseAccount']);},
                                                  onChange:function(newValue,oldValue){
                                                        if(newValue==''){
                                                            filling('',newValue);
                                                        }
                                                   },
								                  columns:[[
								                      {field: 'purchaseAccount',width:100, title: '采购单号'},
														{field: 'supplierName',width:100, title: '供应商'}
								                  ]]">
		供应商<input id="supplierName" name="supplierName" type="text"
				  data-toggle="topjui-combogrid"
				  data-options="width:200,
								id:'user',
								panelWidth:250,
							  idField: 'supplierName',
							  textField: 'supplierName',
							  fitColumns:false,<%--列宽自适应属性 搭配列属性中的width:100使用--%>
							  url:'/CardboardEnter/dropSupper/',
							  onSelect: function (index,row){
											<%--console.log(index+','+row['supplierType']);--%>
											<%--执行表格重载方法--%>
											<%--$('#supplierName').iTextbox('setValue',row['supplierName']);--%>
											filling(2,row['supplierName']);},
								onChange:function(newValue,oldValue){
											if(newValue==''){
												filling('',newValue);
											}
									   },
							  columns:[[
									{field: 'supplierName',width:100, title: '供应商'}
							  ]]">
  		仓库<input id="reservoir" name="reservoir" type="text" name="sex" data-toggle="topjui-combobox" data-options="data:[{value:1,text:'A'},{value:2,text:'B'},{value:3,text:'C'}],panelHeight:100" style="width: 70px;">

		送货员<input id="songMr" name="songMr" type="text" data-toggle="topjui-textbox" data-options="validType:['length[0,10]']" style="width: 80px;">
		车号<input id="carNumber" name="carNumber" type="text" data-toggle="topjui-textbox" data-options="validType:['length[0,10]']" style="width: 80px;"><br><br>
  		供方单号<input id="gongNumber" name="gongNumber" type="text" data-toggle="topjui-textbox" data-options="validType:['length[0,20]']" style="width: 120px;">
		<span>&nbsp;入&nbsp;库&nbsp;员&nbsp;</span>
		<input id="adminName" name="adminName" type="text" style="width: 200px" data-toggle="topjui-textbox" data-options="" value="${adminName}">
		<span>&nbsp;入库日期&nbsp;</span><input id="time" name="time" type="text" name="" data-toggle="topjui-datebox" style="width:200px;"><br><br>
  		备注<input id="content" name="content" type="text" data-toggle="topjui-textbox" data-options="validType:['length[0,200]']" style="width: 600px;"><br><br>
        <input id="table_data" name="table_data"
                     data-toggle="topjui-textarea"
                     data-options="required:true,readonly:true,prompt:'此处无需输入，只需修改表格即可'" style="width:930px;height:100px"/>
  	</div>
  	

<div>
    <div class="layui-btn-group demoTable" style="display: none">
        <%--<button class="layui-btn" data-type="getCheckData">获取选中行数据</button>--%>
        <%--<button class="layui-btn" data-type="getCheckLength">获取选中数目</button>--%>
        <%--<button class="layui-btn" data-type="isAll">验证是否全选</button>--%>
        搜索ID：
        <div class="layui-inline">
            <input class="layui-input" name="id" id="demoReload" autocomplete="off">
			<input class="layui-input" name="id" id="ty" autocomplete="off">
        </div>
        <button id="sou" class="layui-btn" data-type="reload">搜索</button>
    </div>
	<table class="layui-table" lay-data="{height:460,url:'/CardboardEnter/findByEnter/',page:true, id:'test3',even:true}" lay-filter="test3">
	  <thead>
	    <tr>
			<th lay-data="{field:'purchaseAccount', width:150, sort: true}">采购单号</th>
			<th lay-data="{field:'orderAccount', width:150, sort: true}">订单号</th>
			<th lay-data="{field:'customName', width: 70}">客户名称</th>
			<th lay-data="{field:'cartonName', width: 70}">产品名称</th>
			<th lay-data="{field:'num', width: 50, sort: true}">采购数</th>
			<th lay-data="{field:'endNum', width: 50, sort: true}">到料数</th>
			<th lay-data="{field:'squarePrice', width: 60,sort: true}">单平方</th>
			<th lay-data="{field:'singlePrice', width: 50}">单价</th>
			<th lay-data="{field:'singleTotal', width: 70}">采购金额</th>
			<th lay-data="{field:'total', width: 70}">采购总价</th>
			<th lay-data="{field:'supperSpec', width: 70}">供方材质</th>
			<th lay-data="{field:'cardboardSpec', width: 70}">材质</th>
			<th lay-data="{field:'pitType', width:50}">楞型</th>
			<th lay-data="{field:'blankingSize', width:120, sort: true}">尺寸</th>
			<th lay-data="{field:'widthLine', width:120}">宽度压线</th>
			<th lay-data="{field:'lineType', width:60,templet: '#sexTpl'}">压线类型</th>
			<th lay-data="{field:'singular', width: 60,edit: 'text', fixed: 'right',event:'setSign'}">开单数</th>
			<th lay-data="{field:'difference', width: 50, edit: 'text', fixed: 'right',event:'setSign'}">少数</th>
			<th lay-data="{field:'enterNum', width: 60, edit: 'text', fixed: 'right',event:'setSign'}">实收数</th>
			<th lay-data="{field:'returnNumber', width: 60, edit: 'text', fixed: 'right',event:'setSign'}">退回数</th>
			<th lay-data="{field:'palletNumber', width: 60, edit: 'text', fixed: 'right',event:'setSign'}">托盘数</th>
            <th lay-data="{field:'enterContent', width: 150, edit: 'text', fixed: 'right',event:'setSign'}">订单备注</th>
			<%--<th lay-data="{fixed: 'right', width:178, align:'center', toolbar: '#barDemo'}">操作</th>--%>
			<th lay-data="{field:'fake', width: 110,  fixed: 'right',templet: '#checkboxTpl', unresize: true}">是否结束入库</th>

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
	<script type="text/html" id="barDemo">
		<a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">保留入库</a>
		<%--<a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>--%>
		<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">结束入库</a>
	</script>
	<script type="text/html" id="checkboxTpl">
		<!-- 这里的 checked 的状态只是演示 -->
		<input type="checkbox" id="{{d.purchaseId}}" name="lock" value="{{d.orderAccount}}" title="结束" lay-filter="lockDemo" {{ d.fake == 2 ? 'checked' : '' }}>
	</script>
	<script>
	layui.use('table', function(){
	  var table = layui.table
		  ,form = layui.form;

        //监听锁定操作
        form.on('checkbox(lockDemo)', function(obj){
            // console.log(data.elem); //得到checkbox原始DOM对象
            // console.log(data.elem.checked); //是否被选中，true或者false
            // console.log(data.value); //复选框value值，也可以通过data.elem.value得到
            // console.log(data.othis); //得到美化后的DOM对象
            // console.log(this.id);
			var orderAccount = this.value;

            var purchaseId = this.id;
            var type=obj.elem.checked==true ? 1:2;
            $.ajax({
                url:'/Purchase/isRetain/',
                data:{"type":type,"purchaseId":purchaseId},
                dataType:'json',
                success:function (data) {
                    // console.log(data);
                    if(data.statusCode=="200"){
                        type==1 ? layer.tips("订单："+orderAccount + "结束入库", obj.othis):layer.tips("订单："+orderAccount + "取消结束入库", obj.othis);
                    }else{
                        layer.tips("订单："+orderAccount + "状态修改失败", obj.othis);
                        var zhuangtai = type==1 ? false:true;
                        $("input:checkbox[id='" +this.id+ "']").prop('checked',zhuangtai);//控制当前复选框不选中
                        form.render();//表单重载
                    }
                }
            });

        });

	  //监听单元格编辑
	  table.on('edit(test3)', function(obj){
	    var value = obj.value //得到修改后的值
	    ,data = obj.data //得到所在行所有键值
	    ,field = obj.field; //得到字段
	    // layer.msg('[ID: '+ data.id +'] ' + field + ' 字段更改为：'+ value);
         //  console.log(obj);


          // layer.msg('[ID: '+ data.id +'] ' + field + ' 字段更改为：'+ value);
          if(data.enterContent==undefined){//如果为undefined的话在生成对象的时候就会被自动过滤
              data.enterContent = "";
          }
          if(data.singular==undefined || data.singular==""){//无论是undefined还是null都统一等于空字符串“”
              data.singular = 0;
          }
          if(data.difference==undefined || data.difference==""){//无论是undefined还是null都统一等于空字符串“”
              data.difference = 0;
          }
          if(data.enterNum==undefined || data.enterNum==""){//无论是undefined还是null都统一等于空字符串“”
              data.enterNum = 0;
          }
          if(data.returnNumber==undefined || data.returnNumber==""){//无论是undefined还是null都统一等于空字符串“”
              data.returnNumber = 0;
          }
          if(data.palletNumber==undefined || data.palletNumber==""){//无论是undefined还是null都统一等于空字符串“”
              data.palletNumber = 0;
          }

          // var singular=data.singular;//开单数
          // var difference = data.difference;//少数
          // var enterNum = data.enterNum;//实收数
          // var returnNumber = data.returnNumber;//退回数
          // console.log(singular);
          // console.log(difference);
          // console.log(enterNum);
          // console.log(returnNumber);


          //非零非负数字正则表达式
          var reg=/^\+?[1-9][0-9]*$/;
          if(!reg.test(value) && field!="enterContent" && value!=""){
              // console.log("非数字");
              if(field=="singular"){
                  layer.msg('开单数输入错误，请重新输入！', {icon: 2});
                  return;
              }else if(field=="difference"){
                  layer.msg('少数输入错误，请重新输入！', {icon: 2});
                  return;
              }else if(field=="enterNum"){
                  layer.msg('实收数输入错误，请重新输入！', {icon: 2});
                  return;
              }else if(field=="returnNumber"){
                  layer.msg('退回数输入错误，请重新输入！', {icon: 2});
                  return;
              }else{
                  layer.msg('托盘数输入错误，请重新输入！', {icon: 2});
                  return;
              }
          }

          var val = $("#table_data").iTextarea("getValue");//拿到已保存起来的编辑数据
          // console.log(val);
          if(val=="" || val=="[]"){//数据为空，表示当前是第一次编辑，直接保存即可无需过多的逻辑处理
              if(field=="enterNum" && value!=""){
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
                                  if(field=="enterNum"){
                                      json.splice(i,1);//删除当前json对象
                                      layer.msg('[订单: '+ data.orderAccount+']取消入库！');
                                  }else if(field=="enterContent"){
                                      demo[item]=value;//修改该编辑属性的值
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
          if(obj.event=='setSign'){
              //非零非负数字正则表达式
              var reg=/^\+?[1-9][0-9]*$/;
              if(!reg.test(data.singular)){
                  obj.update({
                      singular:0
                  });
              }
              if(!reg.test(data.difference)){
                  obj.update({
                      difference:0
                  });
              }
              if(!reg.test(data.enterNum)){
                  obj.update({
                      enterNum:0
                  });
              }
              if(!reg.test(data.returnNumber)){
                  obj.update({
                      returnNumber:0
                  });
              }
              if(!reg.test(data.palletNumber)){
                  obj.update({
                      palletNumber:0
                  });
              }
          }else if(obj.event === 'detail'){	////监听工具条		保留入库
              // layer.msg('ID：'+ data.id + ' 的查看操作');
				// console.log(data);
				var da = data;
				var purchaseId = data.purchaseId;
				var type=1;
				$.ajax({
					url:'/Purchase/isRetain/',
					data:{"type":type,"purchaseId":purchaseId},
					dataType:'json',
					success:function (data) {
						// console.log(data);
						if(data.statusCode=="200"){
                            layer.msg('订单：'+ da.orderAccount + ' 保留入库成功');
						}else{
                            layer.msg('订单：'+ da.orderAccount + ' 保留入库失败');
						}
                    }
				});
          } else if(obj.event === 'del'){//结束入库
              layer.confirm('真的结束入库么', function(index){
                  var da = data;
                  var purchaseId = data.purchaseId;
                  var type=1;
                  $.ajax({
                      url:'/Purchase/isRetain/',
                      data:{"type":type,"purchaseId":purchaseId},
                      dataType:'json',
                      success:function (data) {
                          // console.log(data);
                          if(data.statusCode=="200"){
                              layer.msg('订单：'+ da.orderAccount + ' 结束入库成功');
                              if(!da.endNum<da.num){
                                  obj.del();
							  }
                          }else{
                              layer.msg('订单：'+ da.orderAccount + ' 结束入库失败');
                          }
                      }
                  });
                  layer.close(index);
              });
          } else if(obj.event === 'edit'){
              layer.alert('编辑行：<br>'+ JSON.stringify(data))
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
              var ty = $('#ty').val();
              // console.log("demoReload:"+demoReload);
              //执行重载
              table.reload('test3', {
                  page: {
                      curr: 1 //重新从第 1 页开始
                  }
                  ,where: {
                      ty:ty,
                      purchaseAccount: demoReload
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

        var dat = new Date().Format("yyyy-MM-dd");
        $("#time").iDatebox("setValue",dat);//初始化入库日期

        $("#table_data").next().hide();//隐藏表格数据框

		//入库批号初始化
        var time1 = new Date().Format("yyyyMMdd");
        $.ajax({
            url:'/CardboardEnter/generateCardEnter/?time='+time1,
            dataType:'json',
            success:function(data){
                // console.log(data);
                $("#batch").iTextbox("setValue",data.batch);
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
                alert("提交失败，请先输实际入库数！")
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

    //layui表格重载方法实现
    function filling(ty,test){
        $('#ty').val(ty);
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
                       url:'/CardboardEnter/addCarEnterRecord/',
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
                       title:'原材料领料',
                       href:'/AdminController/jsp/?url=/raw_material_register/raw_material_out'
                   }">进入下个操作</a>
</div>
</form>
</div>
</div>
  </body>
</html>
