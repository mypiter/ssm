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
    <title>颜色新增</title>
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

            <div style="margin-top:30px">颜色名称<input id="color" name="color" data-toggle="topjui-textbox"
                                                    data-options="width:150,required:true,validType:['length[0,30]']"></div>
        </form>
    </div>
</div>
</body>
</html>
