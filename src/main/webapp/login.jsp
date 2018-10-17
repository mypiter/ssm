<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/common/tagPage.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <!-- 避免IE使用兼容模式 -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
    <meta name="renderer" content="webkit">
    <meta name="keywords" content='easyui,jui,jquery easyui,easyui demo,easyui中文'/>
    <meta name="description" content='TopJUI前端框架，基于最新版EasyUI前端框架构建，纯HTML调用功能组件，不用写JS代码的EasyUI，专注你的后端业务开发！'/>
    <title>纸箱厂管理系统 - 用户登录</title>
    <!-- 浏览器标签图片 -->
    <link rel="shortcut icon" href="${webRoot}/topjui/images/favicon.ico"/>
    <link rel="stylesheet" href="${webRoot}/static/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${webRoot}/static/plugins/font-awesome/css/font-awesome.min.css">
    <script type="text/javascript" src="${webRoot}/static/plugins/jquery/jquery.min.js"></script>
    <style type="text/css">
        html, body {
            height: 100%;
        }
        .box {
            background: url("${webRoot}/images/back.jpg") no-repeat center center;
            background-size: cover;

            margin: 0 auto;
            position: relative;
            width: 100%;
            height: 100%;
        }

        .login-box {
            width: 100%;
            max-width: 500px;
            height: 400px;
            position: absolute;
            top: 50%;

            margin-top: -200px;
            /*设置负值，为要定位子盒子的一半高度*/

        }

        @media screen and (min-width: 500px) {
            .login-box {
                left: 50%;
                /*设置负值，为要定位子盒子的一半宽度*/
                margin-left: -250px;
            }
        }

        .form {
            width: 100%;
            max-width: 500px;
            height: 275px;
            margin: 2px auto 0px auto;
        }

        .login-content {
            border-bottom-left-radius: 8px;
            border-bottom-right-radius: 8px;
            height: 250px;
            width: 100%;
            max-width: 500px;
            background-color: rgba(255, 250, 2550, .6);
            float: left;
        }

        .input-group {
            margin: 30px 0px 0px 0px !important;
        }

        .form-control,
        .input-group {
            height: 40px;
        }

        .form-actions {
            margin-top: 10px;
        }

        .form-group {
            margin-bottom: 0px !important;
        }

        .login-title {
            border-top-left-radius: 8px;
            border-top-right-radius: 8px;
            padding: 20px 10px;
            background-color: rgba(0, 0, 0, .6);
        }

        .login-title h1 {
            margin-top: 10px !important;
        }

        .login-title small {
            color: #fff;
        }

        .link p {
            line-height: 20px;
            margin-top: 30px;
        }

        .btn-sm {
            padding: 8px 24px !important;
            font-size: 16px !important;
        }

        .flag {
            position: absolute;
            top: 10px;
            right: 10px;
            color: #fff;
            font-weight: bold;
            font: 14px/normal "microsoft yahei", "Times New Roman", "宋体", Times, serif;
        }
    </style>
    <title>${config_siteConfig.cfgCompanyName}</title>
</head>
<body>
<div class="box">
    <div class="login-box">
        <div class="login-title text-center">
            <span class="flag"><i class="fa fa-user"></i> 登陆</span>
            <h1>
                <small>纸箱厂管理系统</small>
            </h1>
        </div>
        <div class="login-content ">
            <div class="form">
                <form id="modifyPassword" class="form-horizontal" action="${webRoot}/AdminController/login/" method="post" enctype="multipart/form-data">
                    <input type="hidden" id="referer" name="referer" value="${param.referer}">
                    <div class="form-group">
                        <div class="col-xs-10 col-xs-offset-1">
                            <div class="input-group">
                                <span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
                                <input type="text" id="username" name="account" class="form-control" placeholder="账号">
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-xs-10 col-xs-offset-1">
                            <div class="input-group">
                                <span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
                                <input type="password" id="password" name="password" class="form-control"
                                       placeholder="密码" >
                            </div>
                        </div>
                    </div>
                    <!--<div style="margin-top: 15px; text-align: center; font-size: 16px; " >

                                <input name="fruit" type="radio" value="1"  checked="checked" />用户
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input name="fruit" type="radio" value="2" />管理员

                    </div>-->
                    <div class="form-group form-actions">
                        <div class="col-xs-12 text-center">
                            <button type="submit" id="login" class="btn btn-sm btn-success">
                                <span class="fa fa-check-circle"></span> 登录
                            </button>
                            <button type="button" id="reset" class="btn btn-sm btn-danger">
                                <span class="fa fa-close"></span> 重置
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog modal-sm" role="document">
        <div class="modal-content">
            <div class="modal-body">
                <span class="text-danger"><i class="fa fa-warning"></i>${message}</span>
            </div>
        </div>
    </div>
</div>

<!-- 引入jQuery -->
<script src="${webRoot}/static/plugins/jquery/jquery.min.js"></script>
<script src="${webRoot}/static/plugins/jquery/jquery.cookie.js"></script>
<script src="${webRoot}/static/plugins/bootstrap/js/bootstrap.min.js"></script>
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]-->
<!-- <script src="./static/plugins/bootstrap/plugins/html5shiv.min.js"></script>
<script src="./static/plugins/bootstrap/plugins/respond.min.js"></script> -->
<!--  [endif]-->
<script type="text/javascript">
    if (navigator.appName == "Microsoft Internet Explorer" &&
            (navigator.appVersion.split(";")[1].replace(/[ ]/g, "") == "MSIE6.0" ||
            navigator.appVersion.split(";")[1].replace(/[ ]/g, "") == "MSIE7.0" ||
            navigator.appVersion.split(";")[1].replace(/[ ]/g, "") == "MSIE8.0")
    ) {
        alert("您的浏览器版本过低，请使用360安全浏览器的极速模式或IE9.0以上版本的浏览器");
    }
</script>
<script>
    var _hmt = _hmt || [];
    (function () {
        var hm = document.createElement("script");
        hm.src = "https://hm.baidu.com/hm.js?9bbb7536a0474a4ad060a6fdc8a678b5";
        var s = document.getElementsByTagName("script")[0];
        s.parentNode.insertBefore(hm, s);
    })();
</script>
<script type="text/javascript">
     $(function () {
    	 if(!${message == null}){
    		 $('#myModal').modal();
    	 }
    	 /*  */
    	 /*$('#password').keyup(function (event) {
            if (event.keyCode == "13") {
                $("#login").trigger("click");
                return false;
            }
        });

        $("#login").on("click", function () {
            submitForm();
        });

        function submitForm() {
            if (navigator.appName == "Microsoft Internet Explorer" &&
                    (navigator.appVersion.split(";")[1].replace(/[ ]/g, "") == "MSIE6.0" ||
                    navigator.appVersion.split(";")[1].replace(/[ ]/g, "") == "MSIE7.0" ||
                    navigator.appVersion.split(";")[1].replace(/[ ]/g, "") == "MSIE8.0")
            ) {
                alert("您的浏览器版本过低，请使用360安全浏览器的极速模式或IE9.0以上版本的浏览器");
            } else {
                var formData = {
                    username: $('#username').val(),
                    password: $('#password').val(),
                    referer: $('#referer').val()
                };
                $.ajax({
                    type: 'POST',
                    url: '/json/response/login.json',
                    contentType: "application/json; charset=utf-8",
                    data: JSON.stringify(formData),
                    success: function (data) {
                        if (data.statusCode == 200) {
                            //location.href = '/system/index/index?portal=';

                            location.href = data.referer;
                        } else {
                            $('#myModal').modal();
                            //alert("用户名或密码错误！");
                        }
                    },
                    error: function () {

                    }
                });
            }
        }*/

        $("#reset").on("click", function () {
            $("#username").val("");
            $("#password").val("");
        });
    }); 
</script>
</body>
</html>