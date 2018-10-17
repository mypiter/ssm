<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>原材料采购</title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
    <!-- 导入公共样式 -->
    <%@ include file="../ap.jsp" %>
    
    <style type="text/css">
      .atable{
         width:1200px;
         border:1px solid black;
      }
      .atable tr td{
        text-align:center;
        border:1px solid black;
        margin:0;
        padding:0;
      }

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

      .layui-table-cell .layui-form-checkbox[lay-skin=primary]{top:1px;}
      /* layui  table修改样式*/

    </style>
    
  </head>
  
  <body>
  <div data-toggle="topjui-panel" title="" data-options="fit:true,iconCls:'icon-ok',footer:'#footer'">
      <form class="hidden" method="post" data-toggle="topjui-form" data-options="id:'formId',
               <%--url:_ctx + '/json/response/form.json?uuid=123456',--%>
               editor:[
                   {id:'remarkAddEditor',field:'remark'}
               ]">
     <div id="adiv">
         <table class="atable" >
            <tr>
              <td style="width:80px">采购单号</td>
              <td colspan="2"><input id="purchaseAccount" name="purchaseAccount" data-toggle="topjui-textbox" data-options="width:280,readonly:true"/></td>
              <td style="width:80px">供应商</td>
              <td colspan="2"><input id="supplierId" name="supplierId" type="text" data-toggle="topjui-combogrid"
	  								data-options="id:'supplierId',
	  								              required:true,
	  											  width:350,
								                  idField: 'supplierId',
								                  textField: 'supplierName',
								                  url:'/Purchase/dropSelect/',
								                  fitColumns:false,<%--列宽自适应属性 搭配列属性中的width:100使用--%>
								                  onSelect: function (index,row){
                                                                <%--console.log(index+','+row['supplierType']);--%>
                                                                <%--$('#chuan').iTextbox('setValue',row['fax']);--%>
                                                                $('#supplierName').val(row['supplierName']);
                                                                $('#supplierType').val(row['supplierType']);
                                                                filling(row['supplierId']);},
                                                   onChange:function(newValue,oldValue){
                                                        if(newValue==''){
                                                            filling(newValue);
                                                        }
                                                   },
								                  columns:[[
								                      {field: 'supplierName',width:100, title: '供应商名称'},
								                      {field: 'supplierTel',width:100, title: '办公电话'}
								                  ]]">
                  <input type="hidden" id="supplierName" name="supplierName">
                  <input type="hidden" id="supplierType" name="supplierType">

              </td>
                <td style="width:110px">采购单抬头</td>
                <td><input name="taiId" type="text" data-toggle="topjui-combobox"
                           data-options="id:'user',required:true,
	  												  width:310,
													  textField: 'companyName',
													  valueField:'id',
													  url:'/CompanyInformation/getList/',
                                                    onSelect:function(res){
                                                        $('#consignee').iTextbox('setValue',res['contacts']);
                                                        $('#consigneeAdress').iTextbox('setValue',res['companyAddress']);
                                                        $('#consigneeTel').iTextbox('setValue',res['contactsTel']);
                                                        $('#taiName').val(res['companyName']);
                                                    }
											">
                    <input type="hidden" id="taiName" name="taiName">
                </td>
            </tr>

            <tr>

                <td style="width:80px">收货人</td>
                <td colspan="2"><input id="consignee" name="consignee" data-toggle="topjui-textbox" data-options="width:280"/></td>
              <td style="width:80px">收货地址</td>
                <td colspan="2"><input id="consigneeAdress" name="consigneeAdress" data-toggle="topjui-textbox" data-options="width:350"/></td>
                <td style="width:110px">收货人联系</td>
                <td><input id="consigneeTel" name="consigneeTel" data-toggle="topjui-textbox" data-options="width:310"/></td>

            </tr>
             <tr>
                 <td style="width:80px">采购日期</td>
                 <td colspan="2"><input id="time" name="time" data-toggle="topjui-datebox" style="width:280px;"></td>
                 <td style="width:80px">到货日期</td>
                 <td colspan="2"><input id="arrivalTime" name="arrivalTime" data-toggle="topjui-datebox" data-options="width:350"/></td>
                 <td style="width:80px">采购人</td>
                 <td><input id="purchaseName" name="purchaseName" data-toggle="topjui-textbox" data-options="width:310" value="${adminName}"></td>

             </tr>
             <tr>
                 <td>采购单样式</td>
                 <td colspan="2"><input id="caigouName" name="caigouName" type="text" data-toggle="topjui-combobox"
                            data-options="id:'user',
	  												width:275,
								                  textField: 'name',
								                  valueField:'name',
								                  url:'/Dively/getList/?biao=1',
								                   prompt:'必填',required:true,
                                                   onLoadSuccess: function (res) {
													// 下拉框默认选择第一项
													if (res) {
														var val = $(this).iCombobox('getData');
														$(this).iCombobox('select', val[0]['name']); //这个数据根据自己情况来设定
													}
													},
                                                    onSelect:function(res){
                                                        $('#caigouUrl').val(res['url']);
                                                    }
									">
                     <input type="hidden" id="caigouUrl" name="caigouUrl">
                 </td>
                 <td>
                     <a href="javascript:openNewTab()" data-toggle="topjui-linkbutton"
                        data-options="text:'送货单预览',iconCls:null,btnCls:'green'"></a>
                 </td>
                 <td colspan="2"></td>
                 <td>本次采购总额</td>
                 <td><input id="total" name="total" data-toggle="topjui-textbox" data-options="width:280"/></td>
             </tr>
            <tr>
              <td colspan='8' style="border-width:0px;border-collapse:collapse;border-style:hidden">
                <table>
                   <tr>
                     <td style="width:80px">采购备注</td>
                     <td><input id="purRequirement" name="purRequirement" data-toggle="topjui-textarea" data-options="validType:['length[0,255]']" style="width:1165px;height:80px"/></td>
                   </tr>
                        <input id="table_data" name="table_data" data-toggle="topjui-textarea" data-options="required:true,readonly:true,prompt:'此处无需输入，只需修改表格即可'" style="width:965px;height:100px"/>
                </table>
              </td>
            </tr>
         </table>

         <div>
			<div class="layui-btn-group demoTable" style="display: none">
			  <%--<button class="layui-btn" data-type="getCheckData">获取选中行数据</button>--%>
			  <%--<button class="layui-btn" data-type="getCheckLength">获取选中数目</button>--%>
			  <%--<button class="layui-btn" data-type="isAll">验证是否全选</button>--%>
                  搜索ID:
                  <div class="layui-inline">
                      <input class="layui-input" name="id" id="demoReload" autocomplete="off">
                  </div>
                  <button id="sou" class="layui-btn" data-type="reload">搜索</button>
			</div>
			<table class="layui-table" lay-data="{height:383,url:'/Purchase/findByPurchase/',page:true, id:'test3',even:true,size: 'sm'}" lay-filter="test3">
			  <thead>
			    <tr>
			      <th lay-data="{type:'checkbox', fixed: 'left'}">ID</th>
			      <th lay-data="{field:'orderAccount', width:150, sort: true}">订单号</th>
			      <th lay-data="{field:'customName', width:80, sort: true}">客户名</th>
			      <th lay-data="{field:'cartonName', width:80, sort: true}">产品名</th>
			      <th lay-data="{field:'blankingLength', width:70, sort: true}">长</th>
                  <th lay-data="{field:'blankingWidth', width:70, sort: true}">宽</th>
                    <th lay-data="{field:'numberOfSpareParts',width:60,style:'color: red;'}">备料数</th>
                  <th lay-data="{field:'orderIdentification',  width:60}">已采购数</th>
                  <th lay-data="{field:'materialScience', width:60}">材质</th>
                  <th lay-data="{field:'pitType', width:40}">楞型</th>
                  <th lay-data="{field:'widthLine', width:150}">宽度压线</th>
                  <th lay-data="{field:'lineType', width:70,templet: '#sexTpl'}">压线类型</th>
                  <th lay-data="{field:'supplierMaterial', width:90,sort:true}">供方材质</th>
                    <th lay-data="{field:'supplierPrice', width:90}">单平方价</th>
                  <th lay-data="{field:'unitPrice', width:90}">单价</th>
                    <th lay-data="{field:'num', <%--edit: 'text',--%>event: 'setSign',width:60, fixed: 'right'}">采购数</th>
                    <th lay-data="{field:'cost',width:100, fixed: 'right'}">采购金额</th>
                  <th lay-data="{field:'purchaseRemarks', edit: 'text',width:90, fixed: 'right'}">订单备注</th>
			    </tr>
			  </thead>
			</table>
             <script type="text/html" id="sexTp">
                 {{#  if(d.supplierPrice != null){ }}
                    {{d.supplierPrice.toFixed(2)}}
                 {{#  } }}
	         </script>
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

                    //监听单元格事件
                    table.on('tool(test3)', function(obj){
                        var data = obj.data;

                        if(obj.event === 'setSign'){
                            layer.prompt({
                                formType: 2
                                ,title: '修改订单['+ data.orderAccount +'] 的采购数'
                                ,value: data.num
                            }, function(value, index){
                                var voldCost = Number(data.cost);
                                //非零非负数字正则表达式
                                var reg=/^\+?[1-9][0-9]*$/;
                                if(reg.test(value) && value!=""){
                                    var you=0;
                                    //这里一般是发送修改的Ajax请求
                                    var supplierId = $('#supplierId').iCombogrid('getValue');
                                    var danping = Number(data.squareOfCardboard);
                                    var chang,kuan;

                                    if(data.cartonUnit=='MM'){
                                        chang = Number(data.blankingLength/1000);
                                        kuan = Number(data.blankingWidth/1000);
                                    }else{
                                        chang = Number(data.blankingLength/100);
                                        kuan = Number(data.blankingWidth/100);
                                    }
                                    var pingfang = Number(chang*kuan*value).toFixed(2);
                                    // alert(pingfang);
                                    var ceng = data.materialScience.length;
                                    $.ajax({
                                        url:'/Mian/getYh/?sid='+supplierId+'&prinst='+pingfang+'&ceng='+ceng,
                                        dataType:'json',
                                        async: false,
                                        success:function(data){
                                            // console.log(data);
                                            you=Number(data.you);
                                            // $("#purchaseAccount").iTextbox("setValue",data.purchaseAccount);
                                        }
                                    });
                                    var supplierPrice = Number(data.supplierPrice);//单平方价
                                    var mewSupplierPrice = Number(supplierPrice-you);//优惠后单平方价
                                    var newUnitPrice = Number(chang*kuan*mewSupplierPrice).toFixed(4);//优惠后单价
                                    var cost = Number(value*newUnitPrice).toFixed(2);
                                    //同步更新表格和缓存对应的值
                                    obj.update({
                                        unitPrice:newUnitPrice,
                                        supplierPrice:mewSupplierPrice,
                                        num: value,
                                        cost:cost
                                    });

                                    var val = $("#table_data").iTextarea("getValue");//拿到已保存起来的编辑数据

                                    if(val!="" && val!="[]"){//数据为空，表示当前是第一次编辑，直接保存即可无需过多的逻辑处理
                                        var json = JSON.parse(val);//把json字符串转化为json对象object数组，以便数据操作
                                        for(var i = 0;i<json.length;i++){//遍历json对象数组中的每一个对象
                                            if(json[i].id == data.id){//找到其中一个对象的id是当前编辑条目的id，的对象数据
                                                var demo = json[i];
                                                demo.num=value;
                                                var newCost = Number(cost-voldCost);
                                                var demo = Number($('#total').iTextbox('getValue'));
                                                $('#total').iTextbox('setValue',Number(demo+newCost).toFixed(2));
                                                break;
                                            }
                                        }
                                        var jsonarr = JSON.stringify(json);//把json对象Opject转化为string，以便保存和提交
                                        $("#table_data").iTextbox("setValue",jsonarr);
                                    }



                                }
                                layer.close(index);

                                if(!reg.test(value) && value!=""){
                                    layer.msg('采购数输入错误，请重新输入！', {icon: 2});
                                }

                                var number = Number(data.numberOfSpareParts-data.orderIdentification);
                                if(value>number){
                                    layer.open({
                                        type: 1
                                        ,offset: 'auto' //具体配置参考：http://www.layui.com/doc/modules/layer.html#offset
                                        ,id: 'layerDemoauto' //防止重复弹出
                                        ,content: '<div style="padding: 20px 90px;">采购数大于应采购数，多出'+Number(value-number)+'</div>'
                                        ,btn: '关闭'
                                        ,btnAlign: 'c' //按钮居中
                                        ,shade: 0.8 //不显示遮罩
                                        ,yes: function(){
                                            layer.closeAll();
                                        }
                                    });
                                }

                            });
                        }
                    });

                  //监听单元格编辑，表格编辑逻辑实现
                  table.on('edit(test3)', function(obj){
                    var value = obj.value //得到修改后的值
                    ,data = obj.data //得到所在行所有键值
                    ,field = obj.field; //得到字段


                      //非零非负数字正则表达式
                      var reg=/^\+?[1-9][0-9]*$/;
                      if(!reg.test(value) && field=="num" && value!=""){
                          layer.msg('采购数输入错误，请重新输入！', {icon: 2});
                          return;
                      }
                      // layer.msg('[ID: '+ data.id +'] ' + field + ' 字段更改为：'+ value);
                      if(value!=""){
                          if(field=="num"){
                              layer.msg('[订单: '+ data.orderAccount+']采购 '+ value +' 片纸板');
                          }else{
                              layer.msg('[订单: '+ data.orderAccount+']采购备注更改为：'+ value);
                          }
                      }
                    if(data.num==undefined){//如果为undefined的话在生成对象的时候就会被自动过滤
                        data.num = "";
                    }
                    if(data.purchaseRemarks==null){//无论是undefined还是null都统一等于空字符串“”
                        data.purchaseRemarks = "";
                    }
                    //准备好json数组所需的对象 这里改成直接添加所有的数据data
                    // var arr = {
                    //     "id":data.id,
                    //     "price":data.cartonPrice,
                    //     "num":data.num,
                    //     "purchaseRemarks":data.purchaseRemarks
                    // };
                    var val = $("#table_data").iTextarea("getValue");//拿到已保存起来的编辑数据

                    if(val!="" && val!="[]"){//数据为空，表示当前是第一次编辑，直接保存即可无需过多的逻辑处理
                        var json = JSON.parse(val);//把json字符串转化为json对象object数组，以便数据操作
                        for(var i = 0;i<json.length;i++){//遍历json对象数组中的每一个对象
                            if(json[i].id == data.id){//找到其中一个对象的id是当前编辑条目的id，的对象数据
                                var demo = json[i];
                                for(var item in demo){//循环遍历输出该对象的‘属性’和‘值’
                                    if(item == field){//找到与修改字段一样的属性，修改该‘属性’对应‘值’
                                        if(value=="" && item=="num"){
                                            value=demo.numberOfSpareParts;
                                        }
                                        demo[item]=value;//修改该编辑属性的值
                                        var number = Number(demo.numberOfSpareParts-demo.orderIdentification);
                                        if(value>number){
                                            layer.open({
                                                type: 1
                                                ,offset: 'auto' //具体配置参考：http://www.layui.com/doc/modules/layer.html#offset
                                                ,id: 'layerDemoauto' //防止重复弹出
                                                ,content: '<div style="padding: 20px 90px;">采购数大于应采购数，多出'+Number(value-number)+'</div>'
                                                ,btn: '关闭'
                                                ,btnAlign: 'c' //按钮居中
                                                ,shade: 0.8 //不显示遮罩
                                                ,yes: function(){
                                                    layer.closeAll();
                                                }
                                            });
                                        }
                                    }
                                }
                                break;
                            }
                        }
                        var jsonarr = JSON.stringify(json);//把json对象Opject转化为string，以便保存和提交
                        $("#table_data").iTextbox("setValue",jsonarr);
                    }

                  });

                  //监听表格复选框选择
                  table.on('checkbox(test3)', function(obj){
                      var data = obj.data,
                          checked = obj.checked,
                          type = obj.type;



                      if(type=="all" && checked==true){
                          $('div.laytable-cell-checkbox').find('div.layui-form-checked').click();//取消全部选中项
                          alert("禁止全选");
                          return;
                      }
                      if(type=="all" && checked==false){
                          $("#table_data").iTextbox("setValue","");
                          return;
                      }
                      var val = $("#table_data").iTextarea("getValue");//拿到已保存起来的编辑数据

                      if(obj.checked){
                          if(data.num==undefined || data.num==''){
                              data.num=data.numberOfSpareParts;
                          }
                          if(data.purchaseRemarks==undefined){
                              data.purchaseRemarks='';
                          }
                          var number = Number(data.numberOfSpareParts-data.orderIdentification);
                          if(data.num>number){
                              layer.open({
                                  type: 1
                                  ,offset: 'auto' //具体配置参考：http://www.layui.com/doc/modules/layer.html#offset
                                  ,id: 'layerDemoauto' //防止重复弹出
                                  ,content: '<div style="padding: 20px 90px;">采购数大于应采购数，多出'+Number(data.num-number)+'</div>'
                                  ,btn: '关闭'
                                  ,btnAlign: 'c' //按钮居中
                                  ,shade: 0.8 //不显示遮罩
                                  ,yes: function(){
                                      layer.closeAll();
                                  }
                              });
                          }
                          if(val=="" || val=="[]"){
                              var json=[];
                              json.push(data);
                              var jsonarr = JSON.stringify(json);//把json对象Opject转化为string，以便保存和提交
                              $("#table_data").iTextbox("setValue",jsonarr);
                          }else{
                              var json = JSON.parse(val);//把json字符串转化为json对象object数组，以便数据操作
                              json.push(data);
                              var jsonarr = JSON.stringify(json);//把json对象Opject转化为string，以便保存和提交
                              $("#table_data").iTextbox("setValue",jsonarr);
                          }

                          var total = Number($('#total').iTextbox('getValue'));
                          var o = Number(total+Number(data.cost)).toFixed(2);
                          $('#total').iTextbox('setValue',o);
                      }else{
                          var json = JSON.parse(val);//把json字符串转化为json对象object数组，以便数据操作
                          for(var i = 0;i<json.length;i++){
                              if(json[i].id == data.id){
                                  json.splice(i,1);//删除当前json对象
                              }
                          }

                          var jsonarr = JSON.stringify(json);//把json对象Opject转化为string，以便保存和提交
                          if(jsonarr=="[]"){
                              $("#table_data").iTextbox("setValue","");
                          }else{
                              $("#table_data").iTextbox("setValue",jsonarr);
                          }

                          var total = Number($('#total').iTextbox('getValue'));
                          var o = Number(total-Number(data.cost)).toFixed(2);
                          $('#total').iTextbox('setValue',o);
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
                        }
                        ,reload: function(){
                            var demoReload = $('#demoReload').val();
                            var supplierType = $('#supplierType').val();
                            //执行重载
                            table.reload('test3', {
                                page: {
                                    curr: 1 //重新从第 1 页开始
                                }
                                ,where: {
                                    supplierId: demoReload,
                                    supplierType:supplierType
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
                    $("#arrivalTime").iDatebox("setValue",dat);
                    $("#time").iDatebox("setValue",dat);

                    $("#table_data").next().hide();//隐藏表格数据框

                    //采购单号的初始化
                    var time1 = new Date().Format("yyyyMMdd");
                    $.ajax({
                        url:'/Purchase/generatePurOrder/?time='+time1,
                        dataType:'json',
                        success:function(data){
                            // console.log(data);
                            $("#purchaseAccount").iTextbox("setValue",data.purchaseAccount);
                        }
                    });
                });

                //采购单预览
                function openNewTab() {
                    var title;
                    // var url="http://182.61.33.21/photo/20180814195636.jpeg";
                    //var url="/CustomController/jumpDivelySee/?url=/sale_register/dively_see&urll=http://demo.jxxiongshi.com/";//外网
                    var url="/Purchase/printing/?url=/baobiao/purchaseOrder2&caigouUrl=";
                    title="送货单格式预览";
                    var dively = $("#caigouUrl").val();
                    if(dively==""){
                        alert("未选择送货单或者送货单格式为空!");
                        return;
                    }else{
                        url+=dively;
                        window.open(url);
                    }
                }

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
                            alert("提交失败，请选中需要采购的订单！");
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
                function filling(test){
                    $('#demoReload').val(test);
                    $("#sou").click();

                    // 执行表格数据重载，表格输入数据也该清空
                    $("#table_data").iTextarea("setValue","");
                    $('#total').iTextbox('setValue',0);
                    // alert(test);
                }

			</script>
		</div>
       </div>
      </form>
  </div>

			<div id="footer" class="hidden" style="height: 34px; padding: 5px; text-align: right;">
			    <a href="#" id="tijiao" style="display:none;"
			       data-toggle="topjui-linkbutton"
			       data-options="id:'submitBtn',
			                   iconCls:'fa fa-save',
			                   form:{
			                       id:'formId',
			                       method:'submit',
			                       url:'/Purchase/addPurchase/',
			                       <%--refreshRefererTab:true,--%>
			                       <%--closeCurrentTab:true--%>
			                   }">提交</a>
                <a href="javascript:check()"
                   data-toggle="topjui-linkbutton"
                   data-options="iconCls:'fa fa-save'">保存</a>
                <a href="javascript:void(0)"
                   data-toggle="topjui-menubutton"
                   data-options="method:'openTab',
                   extend: '#productDg-toolbar',
                   btnCls:'topjui-btn-purple',
                   tab:{
                       title:'原材料入库',
                       href:'/AdminController/jsp/?url=/raw_material_register/raw_material'
                   }">进入下个操作</a>
			</div>


  </body>
</html>
