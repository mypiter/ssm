<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html>
<head>
    <title>制造单</title>
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
    .table1 tbody tr td{width: 70px;border: 1px #000 solid;text-align:center;vertical-align:middle;}
    .table2 td{border-left:1px solid #000;}

</style>
<body>
<script type="text/javascript">
    function fuzhi(num) {
        var widthLine = $("#widthLine_"+num).val();
        var lengthLine = $("#lengthLine_"+num).val();
        var widthLines  = widthLine.split('|');
        var lengthLines  = lengthLine.split('|');
        $("#width_"+num+"_1").text(widthLines[0]);
        $("#width_"+num+"_2").text(widthLines[1]);
        $("#width_"+num+"_3").text(widthLines[2]);
        $("#chang_"+num+"_1").text(parseFloat(lengthLines[0]));
        $("#chang_"+num+"_2").text(parseFloat(lengthLines[1]));
        $("#chang_"+num+"_3").text(parseFloat(lengthLines[2]));
        $("#chang_"+num+"_4").text(parseFloat(lengthLines[3]));
        $("#chang_"+num+"_5").text(parseFloat(lengthLines[4]));
        // $('#chang1').text('草');
    }
</script>
<c:forEach items="${listPlace}" var="place" varStatus="index">
<div style="background-color: #f7f7f7;margin-top: 20px;">
    <table class="table1">
        <thead>
            <tr style="height: 50px;" >
                <td colspan="11"><b style="font-size: 20px">江西省熊氏包装材料有限公司</b></td>
            </tr>
            <tr>
                <td colspan="11"><b style="font-size: 20px">生产&nbsp;&nbsp;制造单</b></td>
            </tr>
            <tr>
                <td><span>客户名称:</span></td>
                <td style="text-align: left">
                    <span>${place.customName}</span>
                </td>
                <td></td>
                <td>订单号:</td>
                <td colspan="2" style="text-align: left">${place.orderAccount}</td>
                <td colspan="2">产品编号:</td>
                <td  style="text-align: left">${place.cartonNumber}</td>
                <td></td>
                <td>单位:${place.cartonUnit}</td>
            </tr>
        </thead>
        <tbody>
        <tr>
            <td>产品名称:</td>
            <td colspan="2">${place.cartonName}</td>
            <td>箱型:</td><td colspan="2">${place.cartonType}</td>
            <td>纸箱尺寸:</td>
            <td colspan="2">${place.cartonLength}X${place.cartonWidth}X${place.cartonHeight}</td>
            <td>订单数量:</td><td>${place.orderNum}</td>
        </tr>
        <tr>
            <td>材质:</td><td colspan="2">${place.materialScience}</td>
            <td>楞型:</td><td colspan="2">${place.pitType}</td>
            <td>纸板尺寸:</td><td colspan="2">${place.cardboardLength}X${place.cardboardWidth}</td>
            <td>纸板数:</td><td>${listNum[index.count-1]}</td>
        </tr>
        <tr>
            <td>印刷颜色:</td>
            <td colspan="2">${place.cartonColor}</td>
            <td>结合方式:</td>
            <c:if test="${place.combinationMode==1}">
                <td>单钉</td>
                <td>钉数：${place.nailingNum}</td>
            </c:if>
            <c:if test="${place.combinationMode==2}">
                <td>双钉</td>
                <td>钉数：${place.nailingNum}</td>
            </c:if>
            <c:if test="${place.combinationMode==3}">
                <td>粘胶</td>
                <td></td>
            </c:if>
            <td border="2px;" colspan="5" rowspan="6">
                <div style="width: 325px;height: 205px;overflow: hidden;">
                    <div style="float: left">箱型展开图:</div>
                    <div style="clear:both;"></div>
                    <c:if test="${place.cartonId==11}">
                        <div style="width: 40px;float: left;">
                            &nbsp;
                        </div>
                        <div style="width: 230px;height: 150px;overflow: hidden;float: left;">
                            <img src="http://demo.jxxiongshi.com/product/xiang1.jpg" width="100%" height="100%">
                            <div>123456465</div>
                        </div>
                        <div style="float: left;margin-left: 3px;">
                            <input type="hidden" id="widthLine_${index.count}" value="${place.widthLine}">
                            <div style="margin-top: -6px;">───</div>
                            <div id="width_${index.count}_1" style="margin-top: 5px;"></div>
                            <div style="margin-top: 5px;">───</div>
                            <div id="width_${index.count}_2" style="margin-top: 12px;"></div>
                            <div style="margin-top: 12px;">───</div>
                            <div id="width_${index.count}_3" style="margin-top: 5px;"></div>
                            <div style="margin-top: 6px;">───</div>
                        </div>
                        <div style="clear:both;text-align: right">
                            <input type="hidden" id="lengthLine_${index.count}" value="${place.lengthLine}">
                            <span id="chang_${index.count}_1"></span>
                            <span style="margin-right: 18px;">│</span>
                            <span id="chang_${index.count}_2" style="margin-right: 20px;"></span>
                            <span style="margin-right: 2px;">│</span>
                            <span id="chang_${index.count}_3"></span>
                            <span style="margin-right: 14px;">│</span>
                            <span id="chang_${index.count}_4" style="margin-right: 25px;"></span>
                            <span>│</span>
                            <span id="chang_${index.count}_5"></span>
                            <span style="margin-right: 48px;">│</span>
                        </div>
                        <script type="text/javascript">fuzhi(${index.count})</script>
                    </c:if>
                </div>
            </td>
        </tr>
        <tr>
            <td>工序</td>
            <td>数量</td>
            <td>操作</td>
            <td>检验</td>
            <td>废品</td>
            <td>备注</td>
        </tr>
        <tr>
            <td>分压<c:if test="${fn:contains(place.workingProcedure,'分压')}">
                √
            </c:if>
                </td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td>裱糊<c:if test="${fn:contains(place.workingProcedure,'裱糊')}">
                √
            </c:if></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td>印刷<c:if test="${fn:contains(place.workingProcedure,'印刷')}">
                √
            </c:if></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td>开槽<c:if test="${fn:contains(place.workingProcedure,'开槽')}">
                √
            </c:if></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td>模切<c:if test="${fn:contains(place.workingProcedure,'模切')}">
                √
            </c:if></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td>模板号:</td><td colspan="2">${place.plateId}</td>
            <td>印版号:</td><td>${place.platesId}</td>
        </tr>
        <tr>
            <td>结合<c:if test="${fn:contains(place.workingProcedure,'结合')}">
                √
            </c:if></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td>注意事项:</td><td colspan="2">${place.makerRemarks}</td>
            <td>打包数:</td><td>${place.packNum}</td>
        </tr>
        </tbody>
    </table>
</div>
</c:forEach>

</body>
</html>
