<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>订单详情</title>
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
                <th colspan="8" style="text-align: center"><b>订单${place.orderAccount}详情</b></th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td style="text-align:right">客户名称：</td>
                <td>${place.customName}</td>
                <td style="text-align:right">业务员：</td>
                <td>${place.staffId}</td>
                <td style="text-align:right">公司名称：</td>
                <td colspan="3">${place.customCompany}</td>
            </tr>
            <tr>
                <th colspan="8" style="text-align: center;background-color: #f2f2f2"><b>订单信息</b></th>
            </tr>
            <tr>
                <td style="text-align:right">产品名称：</td>
                <td>${place.cartonName}</td>
                <td style="text-align:right">箱型：</td>
                <td>${place.cartonType}</td>
                <td style="text-align:right">材质：</td>
                <td>${place.materialScience}</td>
                <td style="text-align:right">楞型：</td>
                <td>${place.pitType}</td>
            </tr>
            <tr>
                <td style="text-align:right">尺寸类型：</td>
                <td>
                    <c:if test="${place.sizeType==1}">
                        制造
                    </c:if>
                    <c:if test="${place.sizeType==2}">
                        内劲
                    </c:if>
                    <c:if test="${place.sizeType==3}">
                        外径
                    </c:if>
                </td>
                <td style="text-align:right">长：</td>
                <td>${place.cartonLength}</td>
                <td style="text-align:right">宽：</td>
                <td>${place.cartonWidth}</td>
                <td style="text-align:right">高：</td>
                <td>${place.cartonHeight}</td>
            </tr>
            <tr>
                <td style="text-align:right">订单数：</td>
                <td>${place.orderNum}</td>
                <td style="text-align:right">单价：</td>
                <td>${place.cartonPrice}</td>
                <td style="text-align:right">金额：</td>
                <td>${place.cartonTotal}</td>
                <td style="text-align:right">是否含税：</td>
                <td>不含税</td>
            </tr>
            <tr>
                <td style="text-align:right">长度压线：</td>
                <td colspan="2">${place.lengthLine}</td>
                <td style="text-align:right">宽度压线：</td>
                <td colspan="2">${place.widthLine}</td>
                <td style="text-align:right">压线类型：</td>
                <td>
                    <c:if test="${place.lineType==1}">
                        明线
                    </c:if>
                    <c:if test="${place.lineType==2}">
                        暗线
                    </c:if>
                    <c:if test="${place.sizeType==3}">
                        外径
                    </c:if>
                </td>
            </tr>
            <tr>
                <td style="text-align:right">颜色：</td>
                <td colspan="3">${place.cartonColor}</td>
                <td style="text-align:right">工序：</td>
                <td colspan="3">${place.workingProcedure}</td>
            </tr>
            <tr>
                <td style="text-align:right">客户编号：</td>
                <td>${place.customId}</td>
                <td style="text-align:right">合同编号：</td>
                <td>${place.contractNumber}</td>
                <td style="text-align:right">下单日期：</td>
                <td>${place.orderTime}</td>
                <td style="text-align:right">交货日期：</td>
                <td>${place.deliveryTime}</td>
            </tr>
            <tr>
                <td style="text-align:right">送货地址：</td>
                <td colspan="3">${place.deliveryAddress}</td>
                <td style="text-align:right">送货备注：</td>
                <td colspan="3">${place.deliveryRemarks}</td>
            </tr>
            <tr>
                <td style="text-align:right">订单数：</td>
                <td>${place.orderNum}</td>
                <td style="text-align:right">单价：</td>
                <td>${place.cartonPrice}</td>
                <td style="text-align:right">金额：</td>
                <td>${place.cartonTotal}</td>
                <td style="text-align:right">是否含税：</td>
                <td>不含税</td>
            </tr>
            <tr>
                <th colspan="8" style="text-align: center;background-color: #f2f2f2"><b>纸板采购</b></th>
            </tr>
            <tr>
                <td style="text-align:right">开数：</td>
                <td>${place.openNumber}</td>
                <td style="text-align:right">纸板尺寸：</td>
                <td>${place.cardboardLength}X${place.cardboardWidth}</td>
                <td style="text-align:right">落料尺寸：</td>
                <td>${place.blankingLength}X${place.blankingWidth}</td>
                <td style="text-align:right">备料数：</td>
                <td>${place.numberOfSpareParts}</td>
            </tr>
            <tr>
                <td style="text-align:right">模切数：</td>
                <td>${place.cuttingNum}</td>
                <td style="text-align:right">门幅：</td>
                <td>${place.fabricWidth}</td>
                <td style="text-align:right">门幅倍数：</td>
                <td>${place.fabricBei}</td>
                <td style="text-align:right">是否样箱：</td>
                <td>
                    <c:if test="${place.isLibrary==1}">
                        是
                    </c:if>
                    <c:if test="${place.isLibrary==2}">
                        否
                    </c:if>
                </td>
            </tr>
            <tr>
                <td style="text-align:right">订单数：</td>
                <td>${place.orderNum}</td>
                <td style="text-align:right">单价：</td>
                <td>${place.cartonPrice}</td>
                <td style="text-align:right">金额：</td>
                <td>${place.cartonTotal}</td>
                <td style="text-align:right">是否含税：</td>
                <td>不含税</td>
            </tr>
            <tr>
                <td style="text-align:right">宽加边：</td>
                <td>${place.wideEdge}</td>
                <td style="text-align:right">长加边：</td>
                <td>${place.longEdge}</td>
                <td style="text-align:right">采购备注：</td>
                <td colspan="3">${place.purchaseRemarks}</td>
            </tr>
            <tr>
                <th colspan="8" style="text-align: center;background-color: #f2f2f2"><b>纸箱参数</b></th>
            </tr>
            <tr>
                <td style="text-align:right">模板编号：</td>
                <td>${place.plateId}</td>
                <td style="text-align:right">印版编号：</td>
                <td>${place.platesId}</td>
                <td style="text-align:right">结合方式：</td>
                <td>${place.combinationMode}</td>
                <td style="text-align:right">钉数：</td>
                <td>${place.nailingNum}</td>
            </tr>
            <tr>
                <td style="text-align:right">生产备注：</td>
                <td>${place.makerRemarks}</td>
            </tr>
            </tbody>
        </table>
    </div>
</div>
<script>

</script>
</body>
</html>
