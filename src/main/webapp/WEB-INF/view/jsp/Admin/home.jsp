<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html><head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <!-- 避免IE使用兼容模式 -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
    <meta name="renderer" content="webkit">
    <%@ include file="../ap.jsp" %>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/plugins/echarts/echarts.min.js"></script>
    <link type="text/css" href="${pageContext.request.contextPath}/static/public/css/font.css" rel="stylesheet"/>
    <link type="text/css" href="${pageContext.request.contextPath}/static/public/css/main.css" rel="stylesheet"/>
    <style>
    .wrap{
    padding:30px;
    /*border:1px #ccc solid;*/
    width:500px;margin:20px auto;
    }
    .roll-wrap{
    height:300px;
    overflow:hidden;
    }

    </style>
</head>
<body>
<div class="layui-container-fluid">
    <blockquote class="layui-elem-quote title">主流程快捷入口<i class="iconfont icon-new1"></i></blockquote>
    <div class="panel_box row">
        <div class="panel col">
            <a href="javascript:window.parent.addParentTab({href:'/AdminController/jsp/?url=/sale_register/place_order',title:'下单'})" >
                <div class="panel_icon">
                    <i class="fa fa-angle-double-right"></i>
                </div>
                <div class="panel_word newMessage">
                    <cite>下单</cite>
                </div>
            </a>
        </div>
        <div class="panel col">
            <a href="javascript:window.parent.addParentTab({href:'/AdminController/jsp/?url=/raw_material_register/purchase',title:'采购'})">
                <div class="panel_icon">
                    <i class="fa fa-angle-double-right"></i>
                </div>
                <div class="panel_word newMessage">
                    <cite>采购</cite>
                </div>
            </a>
        </div>
        <div class="panel col">
            <a href="javascript:window.parent.addParentTab({href:'/AdminController/jsp/?url=/raw_material_register/raw_material',title:'原材料入库'})">
                <div class="panel_icon">
                    <i class="fa fa-angle-double-right"></i>
                </div>
                <div class="panel_word newMessage">
                    <cite>原材料入库</cite>
                </div>
            </a>
        </div>
        <div class="panel col">
            <a href="javascript:window.parent.addParentTab({href:'/AdminController/jsp/?url=/raw_material_register/raw_material_out',title:'原材料出库'})">
                <div class="panel_icon">
                    <i class="fa fa-angle-double-right"></i>
                </div>
                <div class="panel_word newMessage">
                    <cite>原材料出库</cite>
                </div>
            </a>
        </div>
        <div class="panel col">
            <a href="javascript:window.parent.addParentTab({href:'/AdminController/jsp/?url=/production_register/finished_product',title:'成品入库'})">
                <div class="panel_icon">
                    <i class="fa fa-angle-double-right" <%--data-icon="icon-wenben"--%>></i>
                </div>
                <div class="panel_word newMessage">
                    <cite>成品入库</cite>
                </div>
            </a>
        </div>
        <div class="panel col">
            <a href="javascript:window.parent.addParentTab({href:'/AdminController/jsp/?url=/production_register/finished_delivery',title:'成品配送'})">
                <div class="panel_icon">
                    <i class="fa fa-angle-double-right"></i>
                </div>
                <div class="panel_word newMessage">
                    <cite>成品配送</cite>
                </div>
            </a>
        </div>
        <div class="panel col">
            <a href="javascript:window.parent.addParentTab({href:'/AdminController/jsp/?url=/finance_register/loan_back',title:'财务登记'})">
                <div class="panel_icon">
                    <i class="fa fa-angle-double-right"></i>
                </div>
                <div class="panel_word newMessage">
                    <cite>财务登记</cite>
                </div>
            </a>
        </div>
        <div class="panel col">
            <a href="javascript:window.parent.addParentTab({href:'/AdminController/jsp/?url=/raw_material_register/knife_die',title:'预留'})">
                <div class="panel_icon">
                    <i class="fa fa-angle-double-right"></i>
                </div>
                <div class="panel_word newMessage">
                    <cite>预留</cite>
                </div>
            </a>
        </div>
    </div>
    <div class="layui-row layui-col-space10">
        <div class="layui-col-md5">
            <blockquote class="layui-elem-quote title">操作记录轮播<i class="iconfont icon-new1"></i></blockquote>
            <table class="layui-table" lay-skin="line">
                <colgroup>
                    <col>
                    <col width="110">
                </colgroup>
                <tbody class="hot_news">
                <div class="wrap">
                <div class="roll-wrap"  id="roll-wrap">
                <ul>
                        <li>
                        <a href="javascript:window.parent.addParentTab({href:'./html/article/detail.html',title:''})"><span style="padding-top:20px;">操作员刘在2018-8-03:11:23:45修改订单<a>CP18546484618416</a>数量为300</span></a>
                        </li>
                        <li>
                            <a href="javascript:window.parent.addParentTab({href:'./html/article/detail.html',title:''})"><span style="padding-top:20px;">操作员刘在2018-8-03:11:23:45修改订单<a>CP18546484618416</a>数量为300</span></a>
                        </li>
                        <li>
                        <a href="javascript:window.parent.addParentTab({href:'./html/article/detail.html',title:''})">操作员刘在2018-8-03:11:23:45修改订单<a>CP18546484618416</a>数量为300</a>
                        </li>
                        <li>
                        <a href="javascript:window.parent.addParentTab({href:'./html/article/detail.html',title:''})">操作员刘在2018-8-03:11:23:45修改订单<a>CP18546484618416</a>数量为300</a>
                        </li>
                        <li>
                        <a href="javascript:window.parent.addParentTab({href:'./html/article/detail.html',title:''})">操作员刘在2018-8-03:11:23:45修改订单<a>CP18546484618416</a>数量为300</a>
                        </li>
                        <li>
                            <a href="javascript:window.parent.addParentTab({href:'./html/article/detail.html',title:''})">操作员刘在2018-8-03:11:23:45修改订单<a>CP18546484618416</a>数量为300</a>
                        </li>
                        <li>
                            <a href="javascript:window.parent.addParentTab({href:'./html/article/detail.html',title:''})">操作员刘在2018-8-03:11:23:45修改订单<a>CP18546484618416</a>数量为300</a>
                        </li>
                        <li>
                            <a href="javascript:window.parent.addParentTab({href:'./html/article/detail.html',title:''})">操作员刘在2018-8-03:11:23:45修改订单<a>CP18546484618416</a>数量为300</a>
                        </li>
                        <li>
                            <a href="javascript:window.parent.addParentTab({href:'./html/article/detail.html',title:''})">操作员刘在2018-8-03:11:23:45修改订单<a>CP18546484618416</a>数量为300</a>
                        </li>
                        <li>
                            <a href="javascript:window.parent.addParentTab({href:'./html/article/detail.html',title:''})">操作员刘在2018-8-03:11:23:45修改订单<a>CP18546484618416</a>数量为300</a>
                        </li>
                        <li>
                            <a href="javascript:window.parent.addParentTab({href:'./html/article/detail.html',title:''})">操作员刘在2018-8-03:11:23:45修改订单<a>CP18546484618416</a>数量为300</a>
                        </li>
                        <li>
                            <a href="javascript:window.parent.addParentTab({href:'./html/article/detail.html',title:''})">操作员刘在2018-8-03:11:23:45修改订单<a>CP18546484618416</a>数量为300</a>
                        </li>
                        <li>
                            <a href="javascript:window.parent.addParentTab({href:'./html/article/detail.html',title:''})">操作员刘在2018-8-03:11:23:45修改订单<a>CP18546484618416</a>数量为300</a>
                        </li>
                    <li>
                        <a href="javascript:window.parent.addParentTab({href:'./html/article/detail.html',title:''})">操作员刘在2018-8-03:11:23:45修改订单<a>CP18546484618416</a>数量为300</a>
                    </li>
                    <li>
                        <a href="javascript:window.parent.addParentTab({href:'./html/article/detail.html',title:''})">操作员刘在2018-8-03:11:23:45修改订单<a>CP18546484618416</a>数量为300</a>
                    </li>
                    <li>
                        <a href="javascript:window.parent.addParentTab({href:'./html/article/detail.html',title:''})">操作员刘在2018-8-03:11:23:45修改订单<a>CP18546484618416</a>数量为300</a>
                    </li>
                    <li>
                        <a href="javascript:window.parent.addParentTab({href:'./html/article/detail.html',title:''})">操作员刘在2018-8-03:11:23:45修改订单<a>CP18546484618416</a>数量为300</a>
                    </li>
                    <li>
                        <a href="javascript:window.parent.addParentTab({href:'./html/article/detail.html',title:'操作员刘在2018-8-03:11:23:45修改订单<a>CP18546484618416</a>数量为300'})">操作员刘在2018-8-03:11:23:45修改订单<a>CP18546484618416</a>数量为300</a>
                    </li>
                    <li>
                        <a href="javascript:window.parent.addParentTab({href:'./html/article/detail.html',title:''})">操作员刘在2018-8-03:11:23:45修改订单<a>CP18546484618416</a>数量为300</a>
                    </li>
                    <li>
                        <a href="javascript:window.parent.addParentTab({href:'./html/article/detail.html',title:''})">操作员刘在2018-8-03:11:23:45修改订单<a>CP18546484618416</a>数量为300</a>
                    </li>
                    <li>
                        <a href="javascript:window.parent.addParentTab({href:'./html/article/detail.html',title:''})">操作员刘在2018-8-03:11:23:45修改订单<a>CP18546484618416</a>数量为300</a>
                    </li>
                    <li>
                        <a href="javascript:window.parent.addParentTab({href:'./html/article/detail.html',title:''})">操作员刘在2018-8-03:11:23:45修改订单<a>CP18546484618416</a>数量为300</a>
                    </li>
                    <li>
                        <a href="javascript:window.parent.addParentTab({href:'./html/article/detail.html',title:''})">操作员刘在2018-8-03:11:23:45修改订单<a>CP18546484618416</a>数量为300</a>
                    </li>
                    <li>
                        <a href="javascript:window.parent.addParentTab({href:'./html/article/detail.html',title:' '})">操作员刘在2018-8-03:11:23:45修改订单<a>CP18546484618416</a>数量为300</a>
                    </li>
                    <li>
                        <a href="javascript:window.parent.addParentTab({href:'./html/article/detail.html',title:' '})">操作员刘在2018-8-03:11:23:45修改订单<a>CP18546484618416</a>数量为300</a>
                    </li>
                    <li>
                        <a href="javascript:window.parent.addParentTab({href:'./html/article/detail.html',title:' '})">操作员刘在2018-8-03:11:23:45修改订单<a>CP18546484618416</a>数量为300</a>
                    </li>
                    </ul>
                </div>
                </div>
                </tbody>
            </table>
        </div>
        <div class="layui-col-md7">
            <blockquote class="layui-elem-quote title">每日生产情况图表<i class="iconfont icon-new1"></i></blockquote>
            <table class="layui-table" lay-skin="line">
                <tbody>
                <tr>

                </tr>
                </tbody>
            </table><td align="left">
            <div data-toggle="topjui-echarts"
                 data-options="id:'lineChart',url:'${pageContext.request.contextPath}/static/line.json',height:400"></div>
        </td>
        </div>
    </div>
</div>
<%--<div class="topjui-container">
    <div class="topjui-row">
        <div class="topjui-col-md12">
            <div data-toggle="topjui-echarts"
                 data-options="id:'lineChart',
                 url:'../json/echarts/line.json',
                 width:900,height:600"></div>
        </div>
    </div>
</div>--%>
<script type="text/javascript">
    function scrollTxt(){
        var controls={},
            values={},
            t1=200, /*播放动画的时间*/
            t2=2000, /*播放时间间隔*/
            si;
        controls.rollWrap=$("#roll-wrap");
        controls.rollWrapUl=controls.rollWrap.children();
        controls.rollWrapLIs=controls.rollWrapUl.children();
        values.liNums=controls.rollWrapLIs.length;
        values.liHeight=controls.rollWrapLIs.eq(0).height();
        values.ulHeight=controls.rollWrap.height();
        this.init=function(){
            autoPlay();
            // pausePlay();
        }
        /*滚动*/
        function play(){
            controls.rollWrapUl.animate({"margin-top" : "-"+values.liHeight}, t1, function(){
                $(this).css("margin-top" , "0").children().eq(0).appendTo($(this));
            });
        }
        /*自动滚动*/
        function autoPlay(){
            /*如果所有li标签的高度和大于.roll-wrap的高度则滚动*/
            if(values.liHeight*values.liNums > values.ulHeight){
                si=setInterval(function(){
                    play();
                },t2);
            }
        }
        /*鼠标经过ul时暂停滚动*/
        function pausePlay(){
            controls.rollWrapUl.on({
                "mouseenter":function(){
                    clearInterval(si);
                }
                ,
                "mouseleave":function(){
                    autoPlay();
                }
            });
        }
    }
    new scrollTxt().init();
</script>
</body>
</html>

