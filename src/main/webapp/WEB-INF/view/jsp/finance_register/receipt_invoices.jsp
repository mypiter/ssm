<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

	<title>接收发票登记</title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!-- 导入公共样式 -->
	<%@ include file="../ap.jsp" %>

	<style>
		.hang{margin: 4px 0;}
		/*.textbox-invalid{display: none}*/
	</style>
</head>

<body>
<div data-toggle="topjui-panel" title="" data-options="fit:true,iconCls:'icon-ok',footer:'#footer'">
	<form class="hidden" method="post" data-toggle="topjui-form" data-options="id:'formId',
               <%--url:_ctx + '/json/response/form.json?uuid=123456',--%>
               editor:[
                   {id:'remarkAddEditor',field:'remark'}
               ]">
		<input type="hidden" name="type" value="2">
		<input id="table_data" name="table_data"
			   data-toggle="topjui-textbox"
			   data-options="required:true"/>
		<div class="hang">
			<span>&nbsp;发票代码&nbsp;</span><input id="invoiceCode" name="invoiceCode" type="text" data-toggle="topjui-numberbox" data-options="required:true" value="201800362" style="width:250px;">
			<span>&nbsp;发票号码&nbsp;&nbsp;</span><input id="ticketAccout" name="ticketAccout" type="text" data-toggle="topjui-numberbox" data-options="required:true" value="201800362" style="width:279px;">
			<span>&nbsp;开票日期&nbsp;</span><input id="ticketTime" name="ticketTime" type="text" data-toggle="topjui-datebox" data-options="required:true" style="width:223px;">
		</div>
		<div class="hang">
			<span>&nbsp;供&nbsp;应&nbsp;商&nbsp;</span>
			<input id="ticketName" name="ticketName" type="text" data-toggle="topjui-combogrid"
				   data-options="id:'supplierId',
								  required:true,
								  width:250,
								  idField: 'supplierName',
								  textField: 'supplierName',
								  url:'/Purchase/dropSelect/',
								  fitColumns:true,<%--列宽自适应属性 搭配列属性中的width:100使用--%>
								  onSelect: function (index,row){
												<%--console.log(index+','+row['supplierType']);--%>
												$('#contacts').iTextbox('setValue',row['cust']);
												$('#contactsTel').iTextbox('setValue',row['supplierTel']);
												$('#accountNumber').iTextbox('setValue',row['accountNumber']);
												$('#taxpayerNumber').iTextbox('setValue',row['recognitionNumber']);
												$('#openingBank').iTextbox('setValue',row['openingBank']);
												$('#ticketHolder').iTextbox('setValue',row['supplierName']);
												$('#payee').iTextbox('setValue',row['supplierName']);
												$('#cess').iNumberbox('setValue','');
												$('#ticketAdValoremTotal').iNumberbox('setValue','');
												filling(row['supplierId']);
												},
								  columns:[[
									  {field: 'supplierName',width:100, title: '供应商名称'},
									  {field: 'supplierTel',width:100, title: '办公电话'}
								  ]]">
			<span>&nbsp;联&nbsp;系&nbsp;人&nbsp;&nbsp;&nbsp;</span><input id="contacts" name="contacts" type="text" data-toggle="topjui-textbox" data-options="readonly:true" style="width:100px;">
			<span>&nbsp;电&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;话&nbsp;&nbsp;</span><input id="contactsTel" name="contactsTel" type="text" data-toggle="topjui-textbox" data-options="readonly:true" style="width:110px;">
			<span>&nbsp;帐&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号&nbsp;&nbsp;</span><input id="accountNumber" name="accountNumber" type="text" data-toggle="topjui-textbox" data-options="readonly:true" style="width:222px;">
		</div>
		<div class="hang">
			<span>&nbsp;纳税人识别号</span><input id="taxpayerNumber" name="taxpayerNumber" type="text" data-toggle="topjui-textbox" data-options="readonly:true" style="width:400px;">
			<span>&nbsp;开&nbsp;户&nbsp;行&nbsp;&nbsp;</span><input id="openingBank" name="openingBank" type="text" data-toggle="topjui-textbox" data-options="readonly:true" style="width:400px;">
		</div>

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
			<table class="layui-table" lay-data="{url:'/Ticket/findBySuppPurOrder/',page:true, id:'test3',even:true}" lay-filter="test3">
				<thead>
				<tr>
					<th lay-data="{type:'checkbox'}">ID</th>
					<th lay-data="{field:'ticketProductName', templet: '#sexTp3'}">产品名称</th>
					<%--<th lay-data="{field:'username', width:120, sort: true}">规格型号</th>--%>
					<th lay-data="{field:'num', sort: true}">数量</th>
					<th lay-data="{field:'ticketUnit', templet: '#sexTp2'}">单位</th>
					<th lay-data="{field:'squarePrice', sort: true}">单价</th>
					<th lay-data="{field:'ticketProductMoney', sort: true,templet: '#sexTpl'}">金额</th>
				</tr>
				</thead>
			</table>
			<script type="text/html" id="sexTpl">
				{{(d.num*d.squarePrice).toFixed(2)}}
			</script>
			<script type="text/html" id="sexTp2">
				片
			</script>
			<script type="text/html" id="sexTp3">
				纸板
			</script>
			<div class="hang">
				<span>合计金额(大写)</span><input id="ticketMoneys" name="ticketMoneys" type="text" data-toggle="topjui-textbox" data-options="readonly:true" style="width:300px;"><%--required:true,--%>
				<span>(小写)</span><input id="ticketMoney" name="ticketMoney"
										data-toggle="topjui-textbox"
										data-options="readonly:true,
														onChange:function(newValue,oldValue){
															var cess = $('#cess').iNumberbox('getValue');
															if(cess!=''){
																var ticketAdValoremTotal = cess*(newValue/100);
																console.log(ticketAdValoremTotal);
																$('#ticketAdValoremTotal').iNumberbox('setValue',ticketAdValoremTotal);
															}
														}" style="width:100px;">
				<span>税率</span><input id="cess" name="cess" type="text"
									  data-toggle="topjui-numberbox"
									  data-options="required:true,min:0.00,precision:2,max:20.00,
														onChange:function(newValue,oldValue){
															var ticketMoney = $('#ticketMoney').iNumberbox('getValue');
															if(ticketMoney!=''){
																var ticketAdValoremTotal = ticketMoney*(newValue/100);
																console.log(ticketAdValoremTotal);
																$('#ticketAdValoremTotal').iNumberbox('setValue',ticketAdValoremTotal);
															}
														}" style="width:60px;">%
				<span>总税额</span><input id="ticketAdValoremTotal" name="ticketAdValoremTotal" type="text" data-toggle="topjui-numberbox" data-options="required:true,min:00,precision:2,readonly:true" style="width:100px;">
			</div>
			<div class="hang">
				<span>&nbsp;备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注&nbsp;</span><input type="text" id="ticketRemark" name="ticketRemark" data-toggle="topjui-textbox" data-options="validType:['length[0,50]']" style="width:800px;">
			</div>
			<div class="hang">
				<span>&nbsp;收&nbsp;款&nbsp;人&nbsp;</span><input type="text" id="payee" name="payee" data-toggle="topjui-textbox" style="width:200px;">
				<span>&nbsp;复&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;核&nbsp;</span><input type="text" id="toReview" name="toReview" data-toggle="topjui-textbox" data-options="validType:['length[0,10]']" style="width:200px;">
				<span>&nbsp;开&nbsp;票&nbsp;人&nbsp;</span><input type="text" id="ticketHolder" name="ticketHolder" data-toggle="topjui-textbox" style="width:200px;">
				<span>&nbsp;收&nbsp;票&nbsp;人&nbsp;</span><input type="text" id="ticketCollector" name="ticketCollector" data-toggle="topjui-textbox" style="width:200px;" data-options="readonly:true" value="${adminName}">
			</div>


			<script>
                    layui.use('table', function(){
                        var table = layui.table;

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
                                $("#ticketMoney").iTextarea("setValue","");
                                $("#ticketMoneys").iTextarea("setValue","");
                                $('#cess').iNumberbox('setValue','');
                                $('#ticketAdValoremTotal').iNumberbox('setValue','');
                                return;
                            }

                            var val = $("#table_data").iTextbox("getValue");//拿到已保存起来的编辑数据
                            var allprice = Number($("#ticketMoney").iTextarea("getValue"));//拿到总金额
                            var w=Number(data.squarePrice*data.num);//拿到记录中的金额

                            if(obj.checked){
                                if(val=="" || val=="[]"){
                                    var json=[];
                                    json.push(data);
                                    var jsonarr = JSON.stringify(json);//把json对象Opject转化为string，以便保存和提交
                                    if(jsonarr=="[]"){
                                        $("#table_data").iTextbox("setValue","");
                                    }else{
                                        $("#table_data").iTextbox("setValue",jsonarr);
                                    }
                                    if(allprice==""||allprice==0){
                                        $("#ticketMoney").iTextarea("setValue",w);
                                        $("#ticketMoneys").iTextarea("setValue",digitUppercase(w));
                                    }
                                }else{
                                    var json = JSON.parse(val);//把json字符串转化为json对象object数组，以便数据操作
                                    json.push(data);
                                    var jsonarr = JSON.stringify(json);//把json对象Opject转化为string，以便保存和提交
                                    if(jsonarr=="[]"){
                                        $("#table_data").iTextbox("setValue","");
                                    }else{
                                        $("#table_data").iTextbox("setValue",jsonarr);
                                    }
                                    var p=Number((w+allprice).toFixed(2));
                                    $("#ticketMoney").iTextarea("setValue",p);
                                    $("#ticketMoneys").iTextarea("setValue",digitUppercase(p));
                                }

                            }else{
                                var json = JSON.parse(val);//把json字符串转化为json对象object数组，以便数据操作
                                for(var i = 0;i<json.length;i++){
                                    if(json[i].LAY_TABLE_INDEX == data.LAY_TABLE_INDEX){
                                        var p=Number((allprice-w).toFixed(2));
                                        json.splice(i,1);//删除当前json对象
                                        $("#ticketMoney").iTextarea("setValue",p);
                                        $("#ticketMoneys").iTextarea("setValue",digitUppercase(p));
                                    }
                                }

                                var jsonarr = JSON.stringify(json);//把json对象Opject转化为string，以便保存和提交
                                if(jsonarr=="[]"){
                                    $("#table_data").iTextbox("setValue","");
                                }else{
                                    $("#table_data").iTextbox("setValue",jsonarr);
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
                            }
                            ,reload: function(){//表格重载方法
                                var demoReload = $('#demoReload').val();
                                // console.log("demoReload:"+demoReload);
                                //执行重载
                                table.reload('test3', {
                                    page: {
                                        curr: 1 //重新从第 1 页开始
                                    }
                                    ,where: {
                                        supplierId: demoReload
                                    }
                                });
                            }
                        };

                        $('.demoTable .layui-btn').on('click', function(){
                            var type = $(this).data('type');
                            active[type] ? active[type].call(this) : '';
                        });

                    });

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

				</script>
		</div>
	</form>
</div>
<script type="text/javascript">
    $(function(){
        // 获取当前时间戳生成采购单号
        // var timestamp = "CG"+new Date().getTime();
        // $("#purchaseAccount").iTextbox("setValue",timestamp);

        var dat = getNowFormatDate();
        $("#ticketTime").iDatebox("setValue",dat);
        // $("#time").iDatetimebox("setValue",dat);

        $("#table_data").next().hide();//隐藏表格数据框
    });

    function check() {
        var table_data = $("#table_data").iTextbox("getValue");
        if(table_data==""){
            alert("提交失败，请先勾选中数据提交！")
        }else{
            $("#tijiao").click();
        }
    }

    //layui表格重载方法实现
    function filling(test){
        $('#demoReload').val(test);
        $("#sou").click();


        // 执行表格数据重载，表格输入数据也该清空
        $("#table_data").iTextbox("setValue","");
        $("#ticketMoney").iTextbox("setValue","");
        $("#ticketMoneys").iTextbox("setValue","");
        // alert(test);
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
<div id="footer" class="hidden" style="height: 34px; padding: 5px; text-align: right;">
	<a href="#" id="tijiao" style="display:none;"
	   data-toggle="topjui-linkbutton"
	   data-options="id:'submitBtn',
			                   iconCls:'fa fa-save',
			                   form:{
			                       id:'formId',
			                       method:'submit',
			                       url:'/Ticket/AddTi/',
			                       <%--refreshRefererTab:true,--%>
			                       <%--closeCurrentTab:true--%>
			                   }">提交</a>
	<a href="javascript:check()"
	data-toggle="topjui-linkbutton"
	data-options="iconCls:'fa fa-save'">提交</a>
</div>


</body>
</html>
