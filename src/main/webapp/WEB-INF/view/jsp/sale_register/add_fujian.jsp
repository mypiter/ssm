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
            <div class="topjui-row">
                <div class="topjui-col-sm3">
                    <label class="topjui-form-label">订单号</label>
                    <div class="topjui-input-block">
                        <input id="color" name="color" data-toggle="topjui-textbox"
                               data-options="width:150,required:true,validType:['length[0,30]']">
                    </div>
                </div>
                <div class="topjui-col-sm3">
                <label class="topjui-form-label">产品名称</label>
                <div class="topjui-input-block">
                    <input id="color" name="color" data-toggle="topjui-textbox"
                           data-options="width:150,required:true,validType:['length[0,30]']">
                </div>
               </div>
                <div class="topjui-col-sm3">
                    <label class="topjui-form-label">模板编号</label>
                    <div class="topjui-input-block">
                        <input id="color" name="color" data-toggle="topjui-textbox"
                               data-options="width:150,required:true,validType:['length[0,30]']">
                    </div>
                </div>
            </div>
            <div class="topjui-row">
            <div class="topjui-col-sm3">
                <label class="topjui-form-label">附件名称</label>
                <div class="topjui-input-block">
                    <input id="color" name="color" data-toggle="topjui-textbox"
                           data-options="width:150,required:true,validType:['length[0,30]']">
                </div>
            </div>
            <div class="topjui-col-sm3">
                <label class="topjui-form-label">附件尺寸</label>
                <div class="topjui-input-block">
                    <input id="color" name="color" data-toggle="topjui-textbox"
                           data-options="width:150,required:true,validType:['length[0,30]']">
                </div>
            </div>
            <div class="topjui-col-sm3">
                <label class="topjui-form-label">材质</label>
                <div class="topjui-input-block">
                    <input id="color" name="color" data-toggle="topjui-textbox"
                           data-options="width:150,required:true,validType:['length[0,30]']">
                </div>
            </div>
        </div>
            <div class="topjui-row">
                <div class="topjui-col-sm3">
                    <label class="topjui-form-label">楞型</label>
                    <div class="topjui-input-block">
                        <input id="color" name="color" data-toggle="topjui-textbox"
                               data-options="width:150,required:true,validType:['length[0,30]']">
                    </div>
                </div>
                <div class="topjui-col-sm3">
                    <label class="topjui-form-label">开数</label>
                    <div class="topjui-input-block">
                        <input id="color" name="color" data-toggle="topjui-textbox"
                               data-options="width:150,required:true,validType:['length[0,30]']">
                    </div>
                </div>
                <div class="topjui-col-sm3">
                    <label class="topjui-form-label">数量</label>
                    <div class="topjui-input-block">
                        <input id="color" name="color" data-toggle="topjui-textbox"
                               data-options="width:150,required:true,validType:['length[0,30]']">
                    </div>
                </div>
            </div>
            <div class="topjui-row">
                <div class="topjui-col-sm3">
                    <label class="topjui-form-label">中空尺寸</label>
                    <div class="topjui-input-block">
                        <input id="color" name="color" data-toggle="topjui-textbox"
                               data-options="width:150,required:true,validType:['length[0,30]']">
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
</body>
</html>
