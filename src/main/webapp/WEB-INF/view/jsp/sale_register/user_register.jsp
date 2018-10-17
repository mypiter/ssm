<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>客户信息登记</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <!--
    <link rel="stylesheet" type="text/css" href="styles.css">
    -->
    <!-- 导入公共样式 -->
    <%@ include file="../ap.jsp" %>
    <style type="text/css">
        .atable{
            margin: 0 auto;
            width:1000px;
        }

        .atable tr td{
            text-align:center;
            border:1px solid black;
        }

        #zhiban{width: 900px;margin: 20px auto;border: 1px solid #ccc;text-align: center;}
        #zhiban th{font-size:20px;font-family:'黑体'; height: 30px;}
        #zhiban td{font-size:16px; line-height: 20px;  height: 30px;}
    </style>
</head>
<body>
<div data-toggle="topjui-layout" data-options="fit:true">
    <div data-toggle="topjui-panel" title="" data-options="fit:true,iconCls:'icon-ok',footer:'#footer'">
        <c:if test="${customId!=null}">
        <form class="hidden" method="post" data-toggle="topjui-form" data-options="id:'formId',
               url:'/CustomController/findById/?customId=${customId}',
               editor:[
                   {id:'remarkAddEditor',field:'remark'}
               ]">
            </c:if>
            <c:if test="${customId==null}">
                <form class="hidden" method="post" data-toggle="topjui-form" data-options="id:'formId',
               editor:[
                   {id:'remarkAddEditor',field:'remark'}
               ]">
            </c:if>
                <input type="hidden" name="customId">
            <div class="topjui-container">
                <table class="atable">
                    <tr>
                        <td style="width:80px">联系人</td>
                        <td><input id="customName" name="customName" data-toggle="topjui-textbox" data-options="width:340,required:true,validType:['length[0,20]']"/></td>
                        <td style="width:60px">业务员</td>
                        <td><input type="text" id="staffId" name="staffId"
                                   data-toggle="topjui-combogrid"
                                   data-options="id:'staffNames',width:100,
                                                                       idField: 'staffName',
                                                                       textField: 'staffName',
                                                                       fitColumns:true,
                                                                       url:'/StaffTable/findByBusiness/?type=1',
                                                                       columns:[[
                                                                           {field: 'staffName',width:100, title: '业务员姓名'}
                                                                       ]]"></td>

                        <td style="width:60px">联系电话</td>
                        <td><input id="customTel" name="customTel" data-toggle="topjui-textbox" data-options="width:140,required:true,validType:'telephone'"/></td>
                        <td style="width:60px">传真</td>
                        <td><input id="fax" name="fax" data-toggle="topjui-textbox" data-options="width:140,validType:'telephone'"/></td>
                    </tr>

                    <tr>
                        <td colspan='10'>
                            <table style="border-width:0px;border-style:hidden;border-collapse:collapse">
                                <tr>
                                    <td style="width:80px">客户公司</td>
                                    <td><input id="customCompary" name="customCompary" data-toggle="topjui-textbox" data-options="width:503,required:true,validType:['length[0,50]']"/></td>
                                    <td style="width:60px">行业</td>
                                    <td><input  id="industry" name="industry" data-toggle="topjui-textbox" data-options="width:143,validType:['length[0,20]']"/></td>
                                    <td style="width:60px">用户额度</td>
                                    <td><input  id="customQuota" name="customQuota" data-toggle="topjui-numberbox" data-options="width:144,groupSeparator:'',precision:2,min:0,validType:['length[0,10]']"/></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td colspan='10'>
                            <table style="border-width:0px;border-style:hidden;border-collapse:collapse">
                                <tr>
                                    <td style="width:80px">公司地址</td>
                                    <td><input id="customAddress" name="customAddress" data-toggle="topjui-textbox" data-options="width:915,validType:['length[0,50]']"/></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td colspan='10'>
                            <table style="border-width:0px;border-style:hidden;border-collapse:collapse">
                                <tr>
                                    <td style="width:80px">微信</td>
                                    <td><input id="wechat" name="wechat" data-toggle="topjui-textbox" data-options="width:130,validType:['length[0,30]']"/></td>
                                    <td style="width:60px">QQ</td>
                                    <td><input id="customQq" name="customQq" data-toggle="topjui-numberbox" data-options="width:130,groupSeparator:'',validType:['length[0,20]']"/></td>
                                    <td style="width:60px">送货距离</td>
                                    <td><input id="deliveryDistance" name="deliveryDistance" data-toggle="topjui-numberbox" data-options="width:70,groupSeparator:'',min:0,precision:2,validType:['length[0,10]']"/></td>
                                    <td style="width:60px">货款打折</td>
                                    <td><input id="customSale" name="customSale" data-toggle="topjui-numberbox" data-options="width:70,min:0,groupSeparator:'',precision:2,validType:['length[0,5]']"/></td>
                                    <td style="width:60px">是否含税</td>
                                    <td><input id="isShui" name="isShui" data-toggle="topjui-combobox" data-options="width:90,data:[{text:'含税',value:1},{text:'不含税',value:2}]"/></td>
                                    <td style="width:60px">库区</td>
                                    <td><input id="reservoirArea" name="reservoirArea" data-toggle="topjui-textbox" data-options="width:117,validType:['length[0,10]']"/></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td colspan='10'>
                            <table style="border-width:0px;border-style:hidden;border-collapse:collapse">
                                <tr>
                                    <td style="width:80px">客户结账类型</td>
                                    <td><input id="customType" name="customType" data-toggle="topjui-combobox" data-options="width:100,data:[{text:'预付款',value:'1',selected:true},{text:'账期',value:'2'},{text:'月结',value:'3'}]"/></td>
                                    <td style="width:70px">账期天数</td>
                                    <td><input id="zday" name="zday" data-toggle="topjui-numberbox" data-options="width:60,groupSeparator:'',validType:['length[0,10]']"/></td>
                                    <td style="width:70px">授信天数</td>
                                    <td><input id="creditDay" name="creditDay" data-toggle="topjui-numberbox" data-options="width:60,groupSeparator:'',validType:['length[0,10]']"/></td>
                                    <td style="width:70px">客户余额</td>
                                    <td><input id="customerBalance" name="customerBalance" data-toggle="topjui-numberbox" data-options="width:74,precision:2,min:0,groupSeparator:'',validType:['length[0,10]']"/></td>
                                    <td style="width:70px">付款方式</td>
                                    <td><input id="paymentMethod" name="paymentMethod" data-toggle="topjui-combobox" data-options="width:90,data:[{text:'现金',value:'1',selected:true},{text:'微信',value:'2'},{text:'支付宝',value:'3'}]"/></td>
                                    <td style="width:80px">送货单格式</td>
                                    <td>
                                        <input id="deliveryStyle" name="deliveryStyle" type="text" data-toggle="topjui-combobox"
                                               data-options="id:'user',
	  												width:80,
								                  idField: 'id',
								                  textField: 'name',
								                  valueField:'url',
								                  url:'/Dively/getList/?biao=2',
								                   prompt:'必填',required:true">
                                       </td>
                                    <td><a href="javascript:openNewTab()" data-toggle="topjui-linkbutton"
                                           data-options="width:80,text:'送货单预览',iconCls:null,btnCls:'green'"></a></td>
                                </tr>
                            </table>
                        </td>
                    </tr>


                    <tr>
                        <td colspan='10'>
                            <table style="border-width:0px;border-style:hidden;border-collapse:collapse">
                                <tr>
                                    <td style="width:80px">开户行</td>
                                    <td><input id="openingBank" name="openingBank" data-toggle="topjui-textbox" data-options="width:500,validType:['length[0,50]']"/></td>
                                    <td style="width:80px">账号</td>
                                    <td><input id="accountNumber" name="accountNumber" data-toggle="topjui-numberbox" data-options="width:335,min:0,validType:['length[0,20]']"/></td>
                                </tr>
                            </table>
                        </td>
                    </tr>

                    <tr>
                        <td colspan='10'>
                            <table style="border-width:0px;border-style:hidden;border-collapse:collapse">
                                <tr>
                                    <td style="width:100px">纳税人识别号</td>
                                    <td><input id="recognitionNumber" name="recognitionNumber" data-toggle="topjui-textbox" data-options="width:480,validType:['length[0,30]']"/></td>
                                    <td style="width:80px">税号</td>
                                    <td><input id="dutyParagraph" name="dutyParagraph" data-toggle="topjui-textbox" data-options="width:335,validType:['length[0,30]']"/></td>
                                </tr>
                            </table>
                        </td>
                    </tr>

                    <tr>
                        <td colspan='10'>
                            <table style="border-width:0px;border-style:hidden;border-collapse:collapse">
                                <tr>
                                    <td style="width:80px">备注</td>
                                    <td><textarea id="remarks" name="remarks" data-options="validType:['length[0,150]']" style="width:915px;height:80px"></textarea></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>

                <!-- 收货地址table Start -->
                <c:if test="${customId==null}">
                <table id="zhiban" border="1" >
                    <tr>
                        <th width="5%">操作</th>
                        <th width="70%">收货地址</th>
                        <th width="10%">收货人</th>
                        <th width="15%">联系方式</th>
                    </tr>
                    <tr id="tr1">
                        <td><a href="javascript:void(0)" title="新增" onclick="add1()"><i class="fa fa-plus"></i></a></td><!-- <i class="fa fa-minus"></i> -->
                    </tr>
                </table>
                <script type="text/javascript">
                    /* 纸板材料 */
                    function add1(){
                        var html1="";
                        html1 += "<tr>";
                        html1 += "<td><a href=\"javascript:void(0)\" title=\"删除\" onclick=\"delet1(this)\"><i class=\"fa fa-minus\"></i></a></td>";
                        html1 += "<td><input name=\"receivingAddress\" data-toggle=\"topjui-textbox\" data-options=\"width:628,required:true,validType:['length[0,100]']\"/></td>";
                        html1 += "<td><input name=\"consignee\" data-toggle=\"topjui-textbox\" data-options=\"width:88,required:true,validType:['length[0,20]']\"/></td>";
                        html1 += "<td><input name=\"consigneeTel\" data-toggle=\"topjui-textbox\" data-options=\"width:132,required:true,validType:'telephone'\"/></td>";
                        html1 += "</tr>";
                        $("#tr1").before(html1);
                        $.parser.parse($("#tr1").parent());//重新渲染组件
                    };
                    function delet1(_element){
                        // e1.parentElement.parentElement.remove();IE不支持，改为下面写法
                        var _parentElement = _element.parentNode.parentNode.parentNode;
                        if(_parentElement){
                            _parentElement.removeChild(_element.parentNode.parentNode);
                        }
                    };
                    //送货单预览
                    function openNewTab() {
                        var title;
                        // var url="http://182.61.33.21/photo/20180814195636.jpeg";
                        //var url="/CustomController/jumpDivelySee/?url=/sale_register/dively_see&urll=http://demo.jxxiongshi.com/";//外网
                        var url="/CustomController/jumpDivelySee/?url=/sale_register/dively_see&urll=/";
                            title="送货单格式预览";
                            var dively = $("#deliveryStyle").iCombobox('getValue');
                            if(dively==""){
                                alert("未选择送货单或者送货单格式为空!");
                                return;
                            }else{
                                url+="js"+dively;
                                window.open(url);
                            }
                        }
                </script>
                </c:if>
                <!-- 收货地址table End -->

            </div>
        </form>
    </div>
</div>

<div id="footer" class="hidden" style="height: 34px; padding: 5px; text-align: right;">
    <c:if test="${customId==null}">
    <a href="#"
       data-toggle="topjui-linkbutton"
       data-options="id:'submitBtn',
                   iconCls:'fa fa-save',
                   form:{
                       id:'formId',
                       method:'submit',
                       url:'/CustomController/addCustom/',
                       refreshRefererTab:true,
                       <%--closeCurrentTab:true,--%>
                   }">提交</a>
    </c:if>
    <c:if test="${customId!=null}">
        <a href="#"
           data-toggle="topjui-linkbutton"
           data-options="id:'submitBtn',
                   iconCls:'fa fa-save',
                   form:{
                       id:'formId',
                       title:'客户修改',
                       method:'submit',
                       url:'/CustomController/updataCustom/',
                       refreshRefererTab:true,
                       closeCurrentTab:true,
                   }">提交</a>
    </c:if>
    <a href="#"
       data-toggle="topjui-linkbutton"
       data-options="id:'submitBtn',
                   iconCls:'fa fa-exchange',
                   btnCls:'topjui-btn-black',
                   form:{
                       id:'formId',
                       method:'reset'
                   }">重置</a>
    <a href="#"
       data-toggle="topjui-linkbutton"
       data-options="id:'submitBtn',
                   iconCls:'fa fa-trash',
                   btnCls:'topjui-btn-red',
                   form:{
                       id:'formId',
                       method:'clear'
                   }">清空</a>
</div>
</body>
</html>