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
	<link href="${pageContext.request.contextPath}/bootstrap/bootstrap.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/bootstrap/css/table_common.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap-responsive.css" rel="stylesheet">
	<%-- <script src="${pageContext.request.contextPath}/bootstrap/js/jQuery.js"></script> --%>
	<script src="${pageContext.request.contextPath}/js/jquery/jquery.min.js"></script><!-- 合同图片的放大 -->
	<script src="${pageContext.request.contextPath}/js/jquery/jquery.imgbox.pack.js"></script><!-- 合同图片的放大 -->
	<script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.js"></script>
	<script src="${pageContext.request.contextPath}/js/checkboxJs.js"></script>
	<script src="${pageContext.request.contextPath}/js/waitDailog.js"></script>
	<link href="//netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"><!-- font图标的使用 -->
	<link href="${pageContext.request.contextPath}/css/lanrenzhijia.css" type="text/css" rel="stylesheet" /><!-- 合同图片放大 -->
	
	<title>合同详情</title>
	
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
	    a{
	    cursor:pointer;
	    }
		body{font-family: "微软雅黑"; margin-top: 50px; }
		.str1{color: red;}
		table{width:800px;height:auto;align:center; margin-bottom: 15px; }
		td{font-size:14px;line-height:30px;}
		b{font-size: 15px;}

		#img{height:230px;width: 500px;border:1px solid;}
		
		.demo{
		/* padding: 2em 0;
		background: linear-gradient(to right, #2c3b4e, #4a688a, #2c3b4e); */
		  }
		  .progress{
			  height: 25px;
			  background: #262626;
			  padding: 5px;
			  overflow: visible;
			  border-radius: 20px;
			  border-top: 1px solid #000;
			  border-bottom: 1px solid #7992a8;
			  margin-top: 38px;
		  }
		  .progress .progress-bar{
			  border-radius: 38px;
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
			  top: -39px;
			  right: -10px;
		  }
		  .progress .progress-value:after{
			  content: "";
			  border-top: 10px solid #191919;
			  border-left: 10px solid transparent;
			  border-right: 10px solid transparent;
			  position: absolute;
			  bottom: -10px;
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
			#tab2{
				position: fixed;
				bottom: 12px;
				left: 7px;
			}	
			#tab2 a{
				color: #fff;
			}	
			#tab2 a:hover{
				text-decoration: none;
				color: #000;
			}	  
		.hetong{
			margin-bottom: 70px;
		}
		.hetong img{
			vertical-align:text-top;
			border: 1px solid red; 
			height: 200px;
			width: 260px;
			overflow:hidden;
		}
		.jindutiao{
			padding:0 5px;
			width:450px;
			
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
  
  	<h3 align="center" style="">合同详情</h3><br>
  	
  	<%-- <div id="tab2">
  			<c:if test="${admin.level==1||admin.level==9}">
	  			<a type="button" href="javascript:void(0);" onclick="preview()" style=" background-color: #009688; border: 0;height: 37px; border-radius:2px; padding: 10px 5px;" ><i class="fa fa-camera-retro"></i>&nbsp;&nbsp;打印</a>
	  			<a type="button" href="javascript:void(0);" onclick="method1('tab')" style="background-color: #1e9fff; border: 0;height: 37px; border-radius:2px; padding: 10px 5px; " ><i class="fa fa-arrow-circle-down"></i>&nbsp;&nbsp;导出为excel文件</a> 
	  			 
	  		</c:if>
	  	
	  			<!-- <button type="button" class="btn btn-info" onclick="javascript:history.back()" >返回</button> -->
  	</div> --%>
  	
  	<form action="">
  	
  	<div align="center" id="tab1" >
  	   
  	   <!--startprint-->
  			<table id="tab" border="1px" bordercolor="#000000" cellspacing="0px" >
  				<tr>
  					<td colspan="6"  align="center">
  						<input type="hidden" name="account" value="${place.order_account }">
  						<h4>当前是与&nbsp;<strong class="str1">先锋公司</strong>&nbsp;的合同详细信息</h4>
  					</td>
  					
  				</tr>
  				<tr>
  					<td colspan="6" align="center">
  						<label style="font-size:15; color: red; "><b>合同id：011415100036</b></label>
  					</td>
  				</tr>
  				
  				<tr >
  					<td style="width:25%" align="right"  ><b>本公司：</b></td>
  				    <td style="width:25% " align="center">秋天传媒有限公司</td>
  					<td style="width:25%" align="right"><b>签约公司/客户：</b></td>
  					<td style="width:25%" align="center">杭州阿里巴巴总公司</td>
  				</tr>
  				<tr >
  					<td style="width:25%" align="right"  ><b>产品名称：</b></td>
  				    <td style="width:25% " align="center">天地箱</td>
  					<td style="width:25%" align="right"><b>产品数量：</b></td>
  					<td style="width:25%" align="center">5000</td>
  				</tr>
  				<tr >
  					<td style="width:25%" align="right"  ><b>合作时间：</b></td>
  				    <td style="width:25% " align="center">6个月</td>
  					<td style="width:25%" align="right"><b>合同时间：</b></td>
  					<td style="width:25%" align="center">7个月</td>
  				</tr>
  				<tr style="height: 50px;" >
  					<td style="width:25%" align="right" colspan="1"><b>合同进度：</b></td>
  				    <td style="width:25%" align="center" colspan="3" class="jindutiao">
  				    	<div class="demo">
										<div class="progress" style="padding: 0px">
											<div class="progress-bar progress-bar-success progress-bar-striped active" style="width: 25%;">
												<div class="progress-value">25%</div>
											</div>
										</div>
						</div>
  				    </td>
  				</tr>
  			</table>
  				<div class="hetong" id="content">
  						<b>合同附件1：</b>
						<a class="example2" href="${pageContext.request.contextPath }/image/hetong.png" title="合同1附件">
							<img alt="" src="${pageContext.request.contextPath }/image/hetong.png" >
						</a>
						<b>合同附件2：</b>
						<a  class="example2"  href="${pageContext.request.contextPath }/image/hetong.png" title="合同2附件">
							<img alt="" src="${pageContext.request.contextPath }/image/hetong.png" >
						</a>
  				</div>
  			<!--endprint-->
  			<%-- <h3>${place.carton_type}</h3>
  			<div id="img" class="example">	
  				<a >
				  		<img class="lightense" style="height: 230px;width: 500px;" src="${place.carton_image}">
				</a>
			</div>
			<div id="pic_one" style="display:none;"><img style="height:500px;width: 1000px;" src="${place.carton_image}" /></div> --%>
			<script type="text/javascript">
				/*$(document).ready(function() {
				    $('div.example a').fancyZoom({scaleImg: true, closeOnClick: true});
				}); */
			</script>
			
			<!-- 合同图片的放大 -->
			<script>
				$(function(){
					/* $("#example1").imgbox(); */
					$(".example2").imgbox({
						'speedIn'		: 0,
						'speedOut'		: 0,
						'alignment'		: 'center',
						'overlayShow'	: true,
						'allowMultiple'	: false
					});
				});
			</script>
	
  	</div>
  	</form>
  </body>
</html>
