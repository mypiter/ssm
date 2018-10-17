<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>成品库存调整详情</title>
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
                <th colspan="8" style="text-align: center"><b>成品库存调整${cartonRecord.orderNumber}详情</b></th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td style="text-align:right">客户名称：</td>
                <td>${cartonRecord.customer}</td>
                <td style="text-align:right">产品名称：</td>
                <td>${cartonRecord.productName}</td>
                <td style="text-align:right">调整备注：</td>
                <td colspan="3">${cartonRecord.remark}</td>
            </tr>
            <tr>
                <th colspan="8" style="text-align: center;background-color: #f2f2f2"><b>调整信息</b></th>
            </tr>
            <tr>
                <td style="text-align:right">纸箱调整前库存数量：</td>
                <td>${cartonRecord.cartonNum}</td>
                <td style="text-align:right">纸箱调整后库存数量：</td>
                <td>${cartonRecord.cartonNewNum}</td>
                <td style="text-align:right">调整类型：</td>
                <td><%--<c:if test="--%>${cartonRecord.cartonType}<%--">--%><%--==1--%>
                    <%--制造
                </c:if>
                    <c:if test="${cartonRecord.cartonType==2}">
                        内劲
                    </c:if>
                    <c:if test="${cartonRecord.cartonTypee==3}">
                        外径
                    </c:if>--%></td>
                <td style="text-align:right">调整时间：</td>
                <td>${cartonRecord.cardboardTime}</td>
            </tr>
            <tr>
                <td style="text-align:right">库区：</td>
                <td>${cartonRecord.reservoirArea}</td>
                <td style="text-align:right">操作人：</td>
                <td>${cartonRecord.operator}</td>
            </tr>
            </tbody>
        </table>
    </div>
</div>
<script>

</script>
</body>
</html>
