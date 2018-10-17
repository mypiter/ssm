<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>成品仓库详情</title>
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
                <th colspan="8" style="text-align: center"><b>成品库存调整${cartonStock.orderAccount}详情</b></th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td style="text-align:right">订单数量：</td>
                <td>${cartonStock.orderNum}</td>
                <td style="text-align:right">客户名称：</td>
                <td>${cartonStock.customerName}</td>
                <td style="text-align:right">产品名称：</td>
                <td colspan="3">${cartonStock.productName}</td>
            </tr>
            <tr>
                <th colspan="8" style="text-align: center;background-color: #f2f2f2"><b>纸箱库存信息</b></th>
            </tr>
            <tr>
                <td style="text-align:right">材质：</td>
                <td>${cartonStock.materialScience}</td>
                <td style="text-align:right">尺寸：</td>
                <td>${cartonStock.size}</td>
                <td style="text-align:right">楞型：</td>
                <td><%--<c:if test="--%>${cartonStock.pitType}<%--">--%><%--==1--%>
                    <%--制造
                </c:if>
                    <c:if test="${cartonRecord.cartonType==2}">
                        内劲
                    </c:if>
                    <c:if test="${cartonRecord.cartonTypee==3}">
                        外径
                    </c:if>--%></td>
                <td style="text-align:right">库存数量：</td>
                <td>${cartonStock.stockNum}</td>
            </tr>
            <tr>
                <td style="text-align:right">纸箱单价：</td>
                <td>${cartonStock.price}</td>
                <td style="text-align:right">总价：</td>
                <td>${cartonStock.total}</td>
                <td style="text-align:right">托盘数：</td>
                <td>${cartonStock.palletNumber}</td>
                <td style="text-align:right">库区位置：</td>
                <td>${cartonStock.reservoir}</td>
            </tr>
            </tbody>
        </table>
    </div>
</div>
<script>

</script>
</body>
</html>
