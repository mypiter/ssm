<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html>
<head>
    <title>纸板入库标签</title>
    <!-- 导入公共样式 -->
    <%@ include file="../ap.jsp" %>
</head>
<style>
    /*th .layui-table-cell {text-align:center;}*/
    td{
        text-align:center;
        vertical-align:middle;
    }
    .table1 tbody tr{height: 30px;border: 1px #000 solid;}
    .table1 tbody tr td{width: 80px;border: 1px #000 solid;text-align:center;vertical-align:middle;}
    .table2 td{border-left:1px solid #000;}

</style>
<body>
<c:forEach items="${listEnter}" var="listEnters" varStatus="num1">
    <c:forEach items="${listEnters.list}" var="enter" varStatus="num2">
    <div style="background-color: #f7f7f7;">
        <table class="table1">
            <thead>
                <tr style="height: 50px;" >
                    <td colspan="4"><b style="font-size: 20px">江西省熊氏包装材料有限公司</b></td>
                </tr>
                <tr>
                    <td colspan="4"><b style="font-size: 20px">入库&nbsp;&nbsp;标签</b></td>
                </tr>
                <tr>
                    <td colspan="4"><b style="font-size: 20px">${fn:length(listEnters.list)}-${num2.count}</b></td>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>订单号:</td>
                    <td colspan="3">${enter.orderAccount}</td>
                </tr>
                <tr>
                    <td>客户名称:</td>
                    <td colspan="3">${enter.customCompany}</td>
                </tr>
                <tr>
                    <td>产品名称:</td>
                    <td colspan="3">${enter.cartonName}</td>
                </tr>
                <tr>
                    <td>产品型号:</td><td>${enter.cartonNumber}</td>
                    <td>产品规格:</td><td>${enter.cartonSpec}</td>
                </tr>
                <tr>
                    <td>材质:</td><td>${enter.materialScience}</td>
                    <td>楞型:</td><td>${enter.pitType}</td>
                </tr>
                <tr>
                    <td>纸板尺寸:</td>
                    <td colspan="3">${enter.blankingLength}*${enter.blankingWidth}</td>
                </tr>
                <tr>
                    <td>纸箱尺寸:</td>
                    <td colspan="3">${enter.cartonLength}*${enter.cartonWidth}*${enter.cartonHeight}</td>
                </tr>
                <tr>
                    <td>订单数量:</td><td>${enter.orderNum}</td>
                    <td>入库数量:</td><td>${enter.num}</td>
                </tr>
                <tr>
                    <td>入库日期:</td>
                    <td colspan="3">${enter.time}</td>
                </tr>
                <tr>
                    <td>入库备注:</td>
                    <td colspan="3">${enter.enterContent}</td>
                </tr>
            </tbody>
        </table>
    </div>
    </c:forEach>
</c:forEach>

</body>
</html>
