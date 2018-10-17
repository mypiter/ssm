<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>打印采购单</title>
    <!-- 导入公共样式 -->
    <%--<%@ include file="../ap.jsp" %>--%>
    <!-- jQuery相关引用 -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/plugins/jquery/jquery.min.js"></script>
</head>
<style>
    *{margin: 0px;padding: 0px}
    body{padding: 30px}
    .whole{width: 100%;height: 100%;}
    .whole .whole_1{font-size: 22px;text-align: center;margin-bottom: 10px}
    .whole .whole_2{text-align: center;font-size: 12px}
    .whole .whole_2 .span1{display:inline-block;text-align: left; width: 200px;}
    .whole .whole_2 .span2{display:inline-block;text-align: left; width: 200px; margin-bottom: 5px}
    .whole .whole_2 .whole_table{line-height: 24px;margin: 0 auto;text-align: center;}
    .whole .whole_2 .whole_table thead td{text-align: left;}
    .whole .whole_2 .span3{display:inline-block;text-align: left;width: 400px;margin-top: 5px}

</style>
<body>
    <div class="whole">
        <div class="whole_1">
            <b>江西熊氏纸箱包装有限公司订购单</b>
        </div>
        <div class="whole_2">
            <span class="span1">接单中心联系人：${cartonSupplier.cust}</span>
            <span class="span2">订购电话：${cartonSupplier.supplierTel}</span>
            <span class="span2">传真：${cartonSupplier.fax}</span>

            <table border="1" cellpadding="0" cellspacing="0" class="whole_table" style="font-size: 12px">
                <thead>
                    <tr>
                        <td colspan="7">订货单位：${cartonPurchase.consignee}</td>
                        <td colspan="2">联系电话：${cartonPurchase.consigneeTel}</td>
                    </tr>
                    <tr>
                        <td colspan="9">送货地址：${cartonPurchase.consigneeAdress}</td>
                    </tr>
                    <tr>
                        <th width="30px">序号</th>
                        <th width="60px">材质</th>
                        <th width="30px">瓦楞</th>
                        <th width="90px">规格(长*宽${cartonPurchase.unit})</th>
                        <th width="50px">数量(片)</th>
                        <th width="150px">压线尺寸</th>
                        <th width="30px">类型</th>
                        <th width="70px">交货日期</th>
                        <th width="70px">订单备注</th>
                    </tr>
                </thead>
                <tbody>
                    <c:set var="count" value="0"></c:set>
                    <c:forEach  items="${list}" var="list" varStatus="status">
                        <c:set var="count" value="${count+1}"></c:set>
                        <tr>
                            <td><c:out value="${status.count}"></c:out></td>
                            <td>${list.supperSpec}</td>
                            <td>${list.pitType}</td>
                            <td>${list.blankingSize}</td>
                            <td>${list.num}</td>
                            <td>${list.widthLine}</td>
                            <c:if test="${list.lineType==1}">
                                <td>明线</td>
                            </c:if>
                            <c:if test="${list.lineType==2}">
                                <td>暗线</td>
                            </c:if>
                            <td>${list.arrivalTime}</td>
                            <td>${list.orderRequirement}</td>
                        </tr>
                    </c:forEach>
                    <c:if test="${count<4}">
                        <tr>
                            <td>${count+1}</td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>${count+2}</td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>${count+3}</td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                    </c:if>
                        <tr>
                            <td colspan="9" style="text-align: left">采购备注：${cartonPurchase.purRequirement}</td>
                        </tr>
                </tbody>
            </table>
            <span class="span3">订单人签名：</span>
            <span class="span2">订购日期：</span>
        </div>
    </div>
</body>
</html>
