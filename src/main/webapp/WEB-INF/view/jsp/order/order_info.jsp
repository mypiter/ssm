<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
     <link href="${pageContext.request.contextPath}/style/common.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/bootstrap/css/table_common.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap-responsive.css" rel="stylesheet">
	<script src="${pageContext.request.contextPath}/bootstrap/js/jQuery.js"></script>
	<script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.js"></script>
	<script src="${pageContext.request.contextPath}/js/checkboxJs.js"></script>
	<script src="${pageContext.request.contextPath}/js/waitDailog.js"></script>

	
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
	    a{
	    cursor:pointer;
	    }
		body{font-family: "微软雅黑";margin-top: 50px;align:center;}
		.str1{color: red;}
		table{width:800px;height:auto;align:center;}
		td{font-size:13px;line-height:18px;}
		b{font-size: 17px;}

		#img{height:230px;width:100%;}
		
		.demo{
		padding: 2em 0;
		background: linear-gradient(to right, #2c3b4e, #4a688a, #2c3b4e);
		  }
		  .progress{
			  height: 16px;
			  background: #262626;
			  padding: 5px;
			  overflow: visible;
			  border-radius: 20px;
			  border-top: 1px solid #000;
			  border-bottom: 1px solid #7992a8;
			  margin-bottom: 0px;
		  }
		  .progress .progress-bar{
			  border-radius: 20px;
			  position: relative;
			  animation: animate-positive 2s;
		  }
		  .progress .progress-value{
			  display: block;
			  padding: 3px 7px;
			  font-size: 13px;
			  color: #fff;
			  border-radius: 4px;
			  background: #191919;
			  border: 1px solid #000;
			  position: absolute;
			  top: -40px;
			  right: -10px;
		  }
		  .progress .progress-value:after{
			  content: "";
			  border-top: 10px solid #191919;
			  border-left: 10px solid transparent;
			  border-right: 10px solid transparent;
			  position: absolute;
			  bottom: -6px;
			  left: 26%;
		  }
		  .progress-bar.active{
			  animation: reverse progress-bar-stripes 0.40s linear infinite, animate-positive 2s;
		  }
		  @-webkit-keyframes animate-positive{
			  0% { width: 0; }
		  }
		  @keyframes animate-positive{
			  0% { width: 0; }
		  }
		
	</style>
	<script type="text/javascript">
	$(document).ready(function(){  //获取机器列表
	 /*  $.ajax({ //一个Ajax过程
				type : "post", //以post方式与后台沟通
				url : "userfindRobot.action", //与此php页面沟通
				dataType : 'json',//从php返回的值以 JSON方式 解释
				async : false,
				success : function(data) {//如果调用php成功
	           
	    var b = " <center> <input id=\"storage_name\" type=\"hidden\" name=\"storage_name\" style=\"width:80px;margin-top:-5px; margin-right:20px;\">"+  
		"生产机器：<select id=\"robot\" name=\"robot\" style=\"width:180px;margin-top:5px;\"> "; 	
  			var c =	""; 
  			
  			//1号机:高速机,	2号机:链条机,	3号机:半自动打钉机,	4号机:手动打钉机,	5号机:粘箱机
  			for (var i=0;i<data.robot.length;i++){
  			  c = c+"<option value =\""+data.robot[i].user_id+"\">"+data.robot[i].user_name+"</option>";
  			} */
			/* 	for (var i=0;i<data.robot.length;i++){
  			  c = c+"<option value =\""+data.robot[i].user_id+"\">"+(i+1)+"号机</option>";
  			} */
  			
			/*var d="</select> </center>"; 
		
			$("#modal5").html(b+c+d);		
					//alert(menus);
				}
			});  */
			/*
			 $.ajax({ //一个Ajax过程
				type : "post", //以post方式与后台沟通
				url : "reckongetList.action", //与此php页面沟通
				dataType : 'json',//从php返回的值以 JSON方式 解释
				data:{type:1},
				async : false,
				success : function(data) {//如果调用php成功
				     var list =  data.list;
				     //console.info(list);
				     var b= "<center>选择纸板计算公式：<select id=\"reckon_id\"  style=\"width:180px;margin-top:5px;\"> ";
				     var d="</select> </center>";
				     var e = "<option value=\"0\"></option>";
				     var m = "";
				     for(var i=0;i<list.length;i++){
				         m = m+"<option value=\""+list[i].reckon_id+"\">"+list[i].carton_type+"&nbsp;&nbsp;&nbsp;"+list[i].reckon_formula+"</option>";
				     }
				     $("#modal5").html(b+e+m+d);
				
				}
				}); */
	  
		
	});
	
	//打印
	function preview(){    
        bdhtml=window.document.body.innerHTML;    
        sprnstr="<!--startprint-->";    
        eprnstr="<!--endprint-->";    
        prnhtml=bdhtml.substring(bdhtml.indexOf(sprnstr)+17);    
        prnhtml=prnhtml.substring(0,prnhtml.indexOf(eprnstr));    
        window.document.body.innerHTML=prnhtml;    
        window.print();    
}  
	
	//导出为excel文件
	 var idTmr;
        function  getExplorer() {
            var explorer = window.navigator.userAgent ;
            //ie 
            if (explorer.indexOf("MSIE") >= 0) {
                return 'ie';
            }
            //firefox 
            else if (explorer.indexOf("Firefox") >= 0) {
                return 'Firefox';
            }
            //Chrome
            else if(explorer.indexOf("Chrome") >= 0){
                return 'Chrome';
            }
            //Opera
            else if(explorer.indexOf("Opera") >= 0){
                return 'Opera';
            }
            //Safari
            else if(explorer.indexOf("Safari") >= 0){
                return 'Safari';
            }
        }
        function method1(tableid) {//整个表格拷贝到EXCEL中
            if(getExplorer()=='ie')
            {
                var curTbl = document.getElementById(tableid);
                var oXL = new ActiveXObject("Excel.Application");

                //创建AX对象excel 
                var oWB = oXL.Workbooks.Add();
                //获取workbook对象 
                var xlsheet = oWB.Worksheets(1);
                //激活当前sheet 
                var sel = document.body.createTextRange();
                sel.moveToElementText(curTbl);
                //把表格中的内容移到TextRange中 
                sel.select;
                //全选TextRange中内容 
                sel.execCommand("Copy");
                //复制TextRange中内容  
                xlsheet.Paste();
                //粘贴到活动的EXCEL中       
                oXL.Visible = true;
                //设置excel可见属性

                try {
                    var fname = oXL.Application.GetSaveAsFilename("Excel.xls", "Excel Spreadsheets (*.xls), *.xls");
                } catch (e) {
                    print("Nested catch caught " + e);
                } finally {
                    oWB.SaveAs(fname);

                    oWB.Close(savechanges = false);
                    //xls.visible = false;
                    oXL.Quit();
                    oXL = null;
                    //结束excel进程，退出完成
                    //window.setInterval("Cleanup();",1);
                    idTmr = window.setInterval("Cleanup();", 1);

                }

            }
            else
            {
                tableToExcel('tab');
            }
        }
        function Cleanup() {
            window.clearInterval(idTmr);
            CollectGarbage();
        }
        var tableToExcel = (function() {
              var uri = 'data:application/vnd.ms-excel;base64,',
              template = '<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40"><head><!--[if gte mso 9]><xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet><x:Name>{worksheet}</x:Name><x:WorksheetOptions><x:DisplayGridlines/></x:WorksheetOptions></x:ExcelWorksheet></x:ExcelWorksheets></x:ExcelWorkbook></xml><![endif]--></head><body><table>{table}</table></body></html>',
                base64 = function(s) { return window.btoa(unescape(encodeURIComponent(s))); },
                format = function(s, c) {
                    return s.replace(/{(\w+)}/g,
                    function(m, p) { return c[p]; }) ;};
                return function(table, name) {
                if (!table.nodeType) table = document.getElementById(table);
                var ctx = {worksheet: name || 'Worksheet', table: table.innerHTML};
                window.location.href = uri + base64(format(template, ctx));
              };
            })()
	$(document).ready(function(){
		var dnum=$("#Dnum").val();//订单数量
		var cnum=$("#Cnum").val();//成品数量
		var c=$("#c").val();
		var k=$("#k").val();
		var zoo=dnum*c*k/10000;
		$("#pf").html(zoo.toFixed(2));
		//var value = parseFloat(es[i].innerHTML)*100;
		var value = cnum/dnum*100;
		var va = (value.toFixed(2));
		va = va+"%";
		//alert(va);
		$("#pro").html(va);
		
		var bai=(dnum/cnum)*100;
		// var divOffset = $("#tab").offset();

         //$("#tab2").css("marginLeft",divOffset.left);

		$("#info").html(bai+"%");
		$("#jindu").css("width:bai%");
		var str="<div id=\"jindu\" class=\"progress-bar progress-bar-info progress-bar-striped active\" style=\"width: "+bai+"%;\">";
			str+="<div id=\"info\" class=\"progress-value\">"+bai+"%</div>";					
			str+="</div>";	
		$("#jd").append(str);			
	});
	function cheMap(){
	window.location.href ="${pageContext.request.contextPath}/Map/showMap.jsp";
	}
	function save(){
	
	   // var storage_name=$("#storage_name").val();
	    //var robot=$("#robot").val();
	  var reckon_id = $("#reckon_id").val(); 
	  if(reckon_id==""){
	      alert("请选择纸板计算公式");
	  }
	  else{
	  window.location="placependdingOrder.action?account=${place.order_account }&state=3&storage_name=A&robot=60&reckon_id="+reckon_id;
	  }
	}
	//查看利润
	function che(){
	  var cb=$("#cben").val();//成本价
	  var dm=$("#dmo").val();//刀模
	  var zb=$("#zban").val();//制版
	  var sl=$("#Dnum").val();//数量
	  var dj=$("#djia").val();//单价
	  var lr=sl*dj-cb-dm-zb;
	  alert("该订单利润为："+lr);
	  $("#lr").html(lr);
	}
	</script> 
  </head>
  
  <body>
  	<h3 align="center" style="font-size:22px;">待审核订单详情</h3><br>
  	
  	
  	<form action="">
  	<div id="tab2" style="text-align:center;">
  			<c:if test="${admin.level==1||admin.level==9}">
	  			<button type="button" onclick="preview()" class="btn btn-info btn-mini" >打印</button>
	  			<button type="button" onclick="method1('tab')" class="btn btn-info btn-mini" >导出为excel文件</button>
	  		</c:if>
	  	
	  			<!-- <button type="button" class="btn btn-info" onclick="javascript:history.back()" >返回</button> -->
  	</div>
  	

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">请选择：</h4>
      </div>
      <div class="modal-body" id="modal5">
      
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
        <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="save()" >确定</button>
      </div>
    </div>
  </div>
</div>


  	<div align="center" id="tab1" style="margin-top:50px;">
  	   
  	   <!--startprint-->
  			<table id="tab" border="1px" bordercolor="#000000" cellspacing="0px">
  				<tr >
  					<td colspan="6" style="line-height:24px;" align="center">
  						<input type="hidden" name="account" value="${place.order_account }">
  						<b>当前为订单号是:&nbsp;<strong class="str1">18011314281216</strong>&nbsp;的基本信息</b>
  					</td>
  					
  				</tr>
  				<tr>
  					<td colspan="6" align="center">
  						<label style="font-size:15; "><b>客户信息</b></label>
  					</td>
  				</tr>
  				<tr >
  					<td style="width:15%" align="right">客户公司名称：</td>
  				    <td style="width:18% " align="center">美宝时光</td>
  					<td style="width:15%" align="right">公司地址：</td>
  					<td style="width:18%" align="center">江西省南昌市青山湖区</td>
  					<td style="width:16%" align="right">公司联系方式：</td>
  					<td style="width:18%" align="center">13699509973</td>
  				</tr>
  			    <!-- <tr >
  					<td align="right">供应商名称：</td>
  					<td align="center">九江市一佳嘉业环保材料有限公司</td>
  					<td align="right">供应商地址：</td>
  					<td align="center"><a onclick="cheMap()">江西省九江市</a></td>
  					<td align="right">供应商电话：</td>
  					<td align="center">0792-8798380</td>		
  				</tr> -->
  				<tr>
  					<td colspan="6" align="center">
  						<label style="font-size:15; "><b>货品信息</b></label>
  					</td>
  				</tr>
  				<tr>
  					<td align="right">箱型：</td>
  					<td align="center">天地箱</td>
  					<td align="right">纸箱尺寸：</td>
  					<td align="center">52.5*36.0*24.6(cm)</td>
  					<td align="right">纸板长宽：</td>
  					<td align="center">88*56(cm)</td>
  				</tr>
  				<tr>
  					<td align="right">是否样箱：</td>
  					<td align="center">否</td>
  					<td align="right">是否加急：</td>
  					<td align="center">否</td>
  					<td align="right">压线类型：</td>
  					<td align="center">外压</td>
  				</tr>
  				<tr>
  					<td align="right">材质：</td>
  					<td align="center">B636C</td>
  					<td align="right">厚度：</td>
  					<td align="center">五层箱</td>
  					 <td align="right">楞型：</td>
  					<td align="center">BC</td>
  				</tr>
  				<tr>
  					<td align="right">订单数量：</td>
  					<td align="center">1000</td>
  					<td align="right">单价：</td>
  					<td align="center">6.25(元)</td>
  					<td align="right">门幅：</td>
  					<td align="center">200</td>
  				</tr>
  			
  			
  				<tr>
  					<td align="right">颜色数：</td>
  					<td align="center">3</td>
  					<td align="right">结合方式：</td>
  					<td align="center">打钉</td>
  					<td align="right">打钉方式：</td>
  					<td align="center">单</td>
  				</tr>
  				<tr>
  					<td align="right">产品编号：</td>
  					<td align="center">123</td>
  					<td align="right">打钉数：</td>
  					<td align="center">100</td>
  					
  					<td align="right">打包数：</td>
  					<td align="center">100</td>
  				</tr>
  				<tr>
  					<td align="right">印版号：</td>
  					<td align="center">12345</td>
  					<td align="right">模版号：</td>
  					<td align="center">12346</td>
  					<td align="right">订单类型：</td>
  					<td align="center">普通订单</td>
  				</tr>
  				
 
  			<!--  	<tr>
  					<td align="right">订单数量：</td>
  					<td align="center">1000</td>
  					<td align="right">单价：</td>
  					<td align="center">6.25(元)</td>
  					<td align="right">门幅倍数：</td>
  					<td align="center">200</td>
  				</tr>
  				 <c:forEach items="${enclosureList }" var="enclosure">
  				<tr>
  				<td align="right">附件名称：</td>
  					<td align="center">${enclosure.enclosure_name}</td>
  					<td align="right">数量：</td>
  					<td align="center">${enclosure.enclosure_num}</td>
  					<td align="right">单价：</td>
  					<td align="center">${enclosure.enclosure_price}</td>
  				</tr>
  				</c:forEach>
  				<tr>
  				  <td align="right">纸箱重量：</td>
  					<td align="center">${place.carton_suttle}</td>
  					<td align="right">坑型：</td>
  					<td align="center">${place.carton_land}</td>
  					<td align="right">纸箱硬度：</td>
  					<td align="center">${place.carton_hardness}</td>
  				</tr> -->
  				<tr>
                   
  					<td  align="right">下单备注：</td>
  					<td colspan="6" align="left">${place.order_remarks}	</td>
  					<!--  
  					<td align="right">纸板总平方：</td>
  					<td align="center"><span id="pf"></span></td> -->
  				</tr>
  				<!--   				
  				<tr>
  					<td colspan="6" align="center">
  						<label style="font-size: 15; "><b>交易信息</b></label>
  					</td>
  					
  				</tr>
  				<tr>
  					<td align="right">总金额：</td>
  					<td align="center">${place.carton_total}</td>
  					<td align="right">已付金额：</td>
  					<td align="center"><c:if test="${trans.pay_money==null}">0</c:if><c:if test="${trans.pay_money!=null}">${trans.pay_money}</c:if></td>
  					<td align="right">未付金额：</td>
  					<td align="center"><c:if test="${trans.no_pay_money==null}">0</c:if><c:if test="${trans.no_pay_money!=null}">${trans.no_pay_money}</c:if></td>
  				</tr>
  				<tr>
  					<td align="right">付费全部完成：</td>
                    <td align="center"><c:if test="${trans.ispay_end==null}">否</c:if><c:if test="${trans.ispay_end!=null}">${trans.ispay_end}</c:if></td>
  					<td align="right"><c:if test="${sessionScope.level1=='1'}">利润：<input id="cben" type="hidden" value="${place.order_cost}"><input id="zban" type="hidden" value="${place.plate}"><input id="dmo" type="hidden" value="${place.die_cutter}"></c:if></td>
  					<td align="center"><c:if test="${sessionScope.level1=='1'}"><span id="lr"></span></c:if></td>
  					<td align="right"></td>
  					<td align="center"></td>
  				</tr>
  				-->
  				<tr>
  					<td colspan="6" align="center">
  						<label style="font-size: 15; "><b>配送信息</b></label>
  					</td>
  				</tr>
  				<tr>
  					<td align="right">送货时间：</td>
  					<td align="center">(预期)2018-02-28</td>
  					<td align="right">送货地址：</td>
  					<td align="center">江西省南昌市青山湖区</td>
  					<td align="right">送货方式：</td>
  					<td align="center">送货上门</td>
  				</tr>
  				<tr>
  					<td align="right">配送人：</td>
  					<td align="center">暂无</td>
  					<td align="right">配送车辆：</td>
  					<td align="center">暂无</td>
  					<td align="right"></td>
  					<td align="center"></td>
  				</tr>
  			
  			</table>
  			
  			<!--endprint-->
  			<h4>箱型图片</h4>
  			<div id="img" class="example">	
  				
				  		<img class="lightense" style="height: 230px;width: 500px;border:1px solid;" src="${place.carton_image}">
				  		
				
			</div>
			<h4>印刷图片</h4>
			<div align="center">
			<img class="lightense" style="height: 115px;width: 250px;border:1px solid;" src="${place.carton_image}">
			</div>
			<script type="text/javascript">
				/*$(document).ready(function() {
				    $('div.example a').fancyZoom({scaleImg: true, closeOnClick: true});
				}); */
			</script>
	
  	</div>
  	</form>
  </body>
</html>
