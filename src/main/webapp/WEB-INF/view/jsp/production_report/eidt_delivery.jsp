<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <!-- 避免IE使用兼容模式 -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
    <meta name="renderer" content="webkit">
    <!-- 导入公共样式 -->
    <%@ include file="../ap.jsp" %>
</head>
<style type="text/css">
    .user{
        width:400px;
        height:400px;
        border:2px red solid;
        text-align: right;
        float:right;

    }
    span{
        color: #fff;
    }
</style>

<body>
<form class="hidden" method="post" data-toggle="topjui-form" data-options="id:'formId'">
    <div style=" width: 200px; margin: 0 auto;">
        <input id="cartonoutId" type="hidden" name="cartonoutId" value="${uuid}">
        <span>送货单格式</span><input id="deliveryStyle" name="deliveryStyle" type="text" data-toggle="topjui-combobox"
                                 data-options="id:'user',
	  											  width:120,
								                  idField: 'id',
								                  textField: 'name',
								                  valueField:'url',
								                  url:'/Dively/getList/',
								                   prompt:'必填',required:true,
                                                   onLoadSuccess: function (res) {
													// 下拉框默认选择第一项
													if (res) {
														var val = $(this).iCombobox('getData');
														$(this).iCombobox('select', val[0]['url']); //这个数据根据自己情况来设定
													}
													}
                                             ">
        <a href="javascript:opens()" >送货单预览</a>
    </div>
</form>
</body>
<script type="text/javascript">
    function opens() {
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
    /*获取地址栏参数的方法实现*/
</script>

</html>