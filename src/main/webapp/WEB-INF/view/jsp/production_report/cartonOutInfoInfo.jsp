<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>配送详情</title>
    <!-- 导入公共样式 -->
    <%@ include file="../ap.jsp" %>
</head>
<style>
    /*th .layui-table-cell {text-align:center;}*/
</style>
<body>
<div style="background-color: #f7f7f7">
    <div class="layui-fluid">
        <table class="layui-table">
            <thead>
            <tr>
                <th colspan="8" style="text-align: center"><b>配送${cartonOutInfo.deliveryNumber}详情</b></th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td style="text-align:right">客户名称：</td>
                <td>${cartonOutInfo.customCompany}</td>
                <td style="text-align:right">核算单位：</td>
                <td>${cartonOutInfo.company}</td>
                <td style="text-align:right">总金额：</td>
                <td colspan="3">${cartonOutInfo.allPrice}</td>
            </tr>
            <tr>
                <td style="text-align:right">制单员：</td>
                <td colspan="3">${cartonOutInfo.maker}</td>
            </tr>
            <tr>
                <th colspan="8" style="text-align: center;background-color: #f2f2f2"><b>配送信息</b></th>
            </tr>
            <tr>
                <td style="text-align:right">送货日期：</td>
                <td>${cartonOutInfo.deliTime}</td>
                <td style="text-align:right">送货人：</td>
                <td>${cartonOutInfo.deliName}</td>
                <td style="text-align:right">车号：</td>
                <td>${cartonOutInfo.car}</td>
            </tr>
            <tr>
                <td style="text-align:right">收货人：</td>
                <td>${cartonOutInfo.consignee}</td>
                <td style="text-align:right">收货人联系方式：</td>
                <td>${cartonOutInfo.consigneeContact}</td>
                <td style="text-align:right">收货地址：</td>
                <td>${cartonOutInfo.consigneeAddress}</td>
            </tr>
            <tr>
                <td style="text-align:right">备注：</td>
                <td colspan="3">${cartonOutInfo.remarks}</td>
            </tr>
            </tbody>
        </table>
    </div>
</div>
<script>

</script>
</body>
</html>
