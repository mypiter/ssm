<%--
  Created by IntelliJ IDEA.
  User: zjs
  Date: 2018/8/20
  Time: 15:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>样箱图片上传</title>
    <%@ include file="../ap.jsp" %>
</head>
<body>
<style>
    .glons{width: 100%}
    .glons_nei{width:202px;margin: 0 auto;}
</style>
<div class="glons">
    <div class="glons_nei">
        <form id="form1">

            <div style="margin-top:30px">
                上传照片<input type="file" id="carton_image" name="carton_image" style="width:300px">
                <%--<input id="knifePictureFile" name="knifePictureFile" data-toggle="topjui-uploadbox"--%>
                <%--data-options="editable:false,--%>
                <%--buttonText:'上传图片',--%>
                <%--accept:'images',--%>
                <%--uploadUrl:'/json/response/upload.json',required:true" style="width:300px">--%>
            </div>
        </form>
    </div>
</div>
</body>
</html>
