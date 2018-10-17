<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <!-- 避免IE使用兼容模式 -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
    <meta name="renderer" content="webkit">
    <!-- TopJUI框架样式 -->
    <link type="text/css" href="${pageContext.request.contextPath}/topjui/css/topjui.core.min.css" rel="stylesheet">
    <link type="text/css" href="${pageContext.request.contextPath}/topjui/themes/default/topjui.red.css" rel="stylesheet" id="dynamicTheme"/>
    <!-- FontAwesome字体图标 -->
    <link type="text/css" href="${pageContext.request.contextPath}/static/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet"/>
    <!-- layui框架样式 -->
    <link type="text/css" href="${pageContext.request.contextPath}/static/plugins/layui/css/layui.css" rel="stylesheet"/>
    <!-- jQuery相关引用 -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/plugins/jquery/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/plugins/jquery/jquery.cookie.js"></script>
    <!-- TopJUI框架配置 -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/public/js/topjui.config.js"></script>
    <!-- TopJUI框架核心-->
    <script type="text/javascript" src="${pageContext.request.contextPath}/topjui/js/topjui.core.min.js"></script>
    <!-- TopJUI中文支持 -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/topjui/js/locale/topjui.lang.zh_CN.js"></script>
    <!-- layui框架js -->
    <script src="${pageContext.request.contextPath}/static/plugins/layui/layui.js" charset="utf-8"></script>
</head>
<style type="text/css">
    .user{
        width:400px;
        height:400px;
        border:2px red solid;
        text-align: right;
        float:right;

    }
    span{
        color: #fff;
    }
</style>

<body>
<form class="hidden" method="post" data-toggle="topjui-form" data-options="id:'formId'">
    <fieldset>
        <legend><b>基本信息</b></legend>
    </fieldset>
    <div style=" width: 1070px; margin: 0 auto;">
        <div class="topjui-row">
            <input type="hidden" name="supplierId" value="">
            <div class="topjui-col-sm4">
                <label class="topjui-form-label">单位名称</label>
                <div class="topjui-input-block">
                    <input type="text" name="supplierName" data-toggle="topjui-textbox"
                           data-options="required:true, value:'',validType:['length[0,50]']">
                </div>
            </div>
            <div class="topjui-col-sm4">
                <label class="topjui-form-label">简称</label>
                <div class="topjui-input-block">
                    <input type="text" name="abbreviation" data-toggle="topjui-textbox"
                           data-options="required:false, value:'',validType:['length[0,20]']">
                </div>
            </div>
            <div class="topjui-col-sm4">
                <label class="topjui-form-label">结算单位</label>
                <div class="topjui-input-block">
                    <input type="text" name="clearingUnit" data-toggle="topjui-textbox"
                           data-options="required:false, value:'',validType:['length[0,30]']">
                </div>
            </div>

        </div>
        <div class="topjui-row">
            <div class="topjui-col-sm4">
                <label class="topjui-form-label">速记码</label>
                <div class="topjui-input-block">
                    <input type="text" name="shorthandCode" data-toggle="topjui-textbox"
                           data-options="required:true, value:'',validType:['length[0,10]']">
                </div>
            </div>
            <div class="topjui-col-sm4">
                <label class="topjui-form-label">联系人</label>
                <div class="topjui-input-block">
                    <input type="text" name="cust" data-toggle="topjui-textbox"
                           data-options="required:true, value:'',validType:['length[0,20]']">
                </div>
            </div>
            <div class="topjui-col-sm4">
                <label class="topjui-form-label">联系电话</label>
                <div class="topjui-input-block">
                    <input type="text" name="supplierTel" data-toggle="topjui-textbox"
                           data-options="required:true,value:'',validType:['length[0,30]']">
                </div>
            </div>


        </div>
        <div class="topjui-row">
            <div class="topjui-col-sm4">
                <label class="topjui-form-label">开户行</label>
                <div class="topjui-input-block">
                    <input type="text" name="openingBank" data-toggle="topjui-textbox"
                           data-options="required:false, value:'',validType:['length[0,30]']">
                </div>
            </div>
            <div class="topjui-col-sm4">
                <label class="topjui-form-label">账号</label>
                <div class="topjui-input-block">
                    <input type="text" name="accountNumber" data-toggle="topjui-textbox"
                           data-options="required:false, value:'',validType:['length[0,30]']">
                </div>
            </div>

            <div class="topjui-col-sm4">
                <label class="topjui-form-label">纳税人识别号</label>
                <div class="topjui-input-block">
                    <input type="text" name="recognitionNumber" data-toggle="topjui-textbox"
                           data-options="required:false, value:'',validType:['length[0,30]']">
                </div>
            </div>

        </div>
        <div class="topjui-row">
            <div class="topjui-col-sm4">
                <label class="topjui-form-label">传真</label>
                <div class="topjui-input-block">
                    <input type="text" name="fax" data-toggle="topjui-textbox"
                           data-options="required:false, value:'',validType:['length[0,30]']">
                </div>
            </div>
            <div class="topjui-col-sm8">
                <label class="topjui-form-label">地址</label>
                <div class="topjui-input-block">
                    <input type="text" name="supplierAddress" data-toggle="topjui-textbox"
                           data-options="required:true, value:'',validType:['length[0,50]']">
                </div>
            </div>
        </div>
        <div class="topjui-row">
            <div class="topjui-col-sm3">
                <label class="topjui-form-label">付款方式</label>
                <div class="topjui-input-block">
                    <input type="text" name="paymentMethod"
                           data-toggle="topjui-combobox"
                           data-options="required:true,
                       valueField:'id',
                       textField:'text',
                       data:[{id:1,text:'账期'},{id:2,text:'现金'},{id:3,text:'转账'},{id:4,text:'微信'}]">
                </div>
            </div>
            <span>&nbsp;最大纸板长&nbsp;</span><input type="text" name="maxWidth" data-toggle="topjui-numberbox"  data-options="required:true,max:10000,min:0"  style="width:100px;">
            <span>&nbsp;最大纸板宽&nbsp;</span><input type="text" name="maxLength" data-toggle="topjui-numberbox" data-options="required:true,max:10000,min:0" style="width:100px;">
            <span>&nbsp;最小纸板长&nbsp;</span><input type="text" name="minWidth" data-toggle="topjui-numberbox" data-options="required:true,max:10000,min:0" style="width:100px;">
            <span>&nbsp;最小纸板宽&nbsp;</span><input type="text" name="minLength" data-toggle="topjui-numberbox" data-options="required:true,max:10000,min:0" style="width:100px;">

        </div>
        <div class="topjui-row">
            <div class="topjui-col-sm5">
                <label class="topjui-form-label">生产瓦楞</label>
                <div class="topjui-input-block">
                    <input type="text" name="fluteType" data-toggle="topjui-tagbox"
                           data-options="required:true,
                               hasDownArrow:true,
                               textField:'text',
                               valueField:'id',
                               data:[{
                                   id:1,
                                   text:'BC'
                               },{
                                   id:2,
                                   text:'AE'
                               },{
                                   id:3,
                                   text:'AB',
                                   selected:true
                               },{
                                   id:4,
                                   text:'BE'
                               },{
                                   id:5,
                                   text:'A'
                               },{
                                   id:6,
                                   text:'B'
                               },{
                                   id:7,
                                   text:'C'
                               },{
                                   id:8,
                                   text:'E'
                               }]">
                </div>
            </div>
            <div class="topjui-col-sm3">
                <label class="topjui-form-label">供应类型</label>
                <div class="topjui-input-block">
                    <input type="text" name="supplierType"
                           data-toggle="topjui-combobox"
                           data-options="required:true,
                       valueField:'id',
                       textField:'text',
                       data:[{id:1,text:'A类供应商'},{id:2,text:'B类供应商'},{id:3,text:'混合类供应商'}]">
                </div>
            </div>
            <div class="topjui-col-sm3">
            <label class="topjui-form-label">计量单位</label>
            <div class="topjui-input-block">
                <input type="text" name="unit"
                       data-toggle="topjui-combobox"
                       data-options="required:true,
                       valueField:'id',
                       textField:'text',
                       data:[{id:1,text:'毫米'},{id:2,text:'厘米'},{id:3,text:'英寸'}]">
            </div>
            </div>
        </div>
        <fieldset>
            <legend><b>加工费</b></legend>
        </fieldset>
        <div class="topjui-row">
            <div class="topjui-col-sm3">
                <label class="topjui-form-label">两层</label>
                <div class="topjui-input-block">
                    <input type="text" name="tw" data-toggle="topjui-numberbox"
                           data-options="groupSeparator:',',precision:2,max:999.99,min:0.00,prompt:'最大值3位'">
                </div>
            </div>
            <div class="topjui-col-sm3">
                <label class="topjui-form-label">三层</label>
                <div class="topjui-input-block">
                    <input type="text" name="tc" data-toggle="topjui-numberbox"
                           data-options="groupSeparator:',',precision:2,max:999.99,min:0.00,prompt:'最大值3位'">
                </div>
            </div>
            <div class="topjui-col-sm3">
                <label class="topjui-form-label">四层</label>
                <div class="topjui-input-block">
                    <input type="text" name="fc" data-toggle="topjui-numberbox"
                           data-options="groupSeparator:',',precision:2,max:999.99,min:0.00,prompt:'最大值3位'">
                </div>
            </div>
            <div class="topjui-col-sm3">
                <label class="topjui-form-label">五层</label>
                <div class="topjui-input-block">
                    <input type="text" name="vc" data-toggle="topjui-numberbox"
                           data-options="groupSeparator:',',precision:2,max:999.99,min:0.00,prompt:'最大值3位'">
                </div>
            </div>
        </div>
        <div class="topjui-row">
            <div class="topjui-col-sm3">
                <label class="topjui-form-label">六层</label>
                <div class="topjui-input-block">
                    <input type="text" name="sc" data-toggle="topjui-numberbox"
                           data-options="groupSeparator:',',precision:2,max:999.99,min:0.00,prompt:'最大值3位'">
                </div>
            </div>
            <div class="topjui-col-sm3">
                <label class="topjui-form-label">七层</label>
                <div class="topjui-input-block">
                    <input type="text" name="ec" data-toggle="topjui-numberbox"
                           data-options="groupSeparator:',',precision:2,max:999.99,min:0.00,prompt:'最大值3位'">
                </div>
            </div>
        </div>
            <fieldset>
                <legend><b>运费</b></legend>
            </fieldset>
        <div class="topjui-row">
            <div class="topjui-col-sm3">
                <label class="topjui-form-label">二层</label>
                <div class="topjui-input-block">
                    <input type="text" name="ty" data-toggle="topjui-numberbox"
                           data-options="groupSeparator:',',precision:2,max:999.99,min:0.00,prompt:'最大值3位'">
                </div>
            </div>
            <div class="topjui-col-sm3">
                <label class="topjui-form-label">三层</label>
                <div class="topjui-input-block">
                    <input type="text" name="fy" data-toggle="topjui-numberbox"
                           data-options="groupSeparator:',',precision:2,max:999.99,min:0.00,prompt:'最大值3位'">
                </div>
            </div>
            <div class="topjui-col-sm3">
                <label class="topjui-form-label">四层</label>
                <div class="topjui-input-block">
                    <input type="text" name="sy" data-toggle="topjui-numberbox"
                           data-options="groupSeparator:',',precision:2,max:999.99,min:0.00,prompt:'最大值3位'">
                </div>
            </div>
            <div class="topjui-col-sm3">
                <label class="topjui-form-label">五层</label>
                <div class="topjui-input-block">
                    <input type="text" name="fi" data-toggle="topjui-numberbox"
                           data-options="groupSeparator:',',precision:2,max:999.99,min:0.00,prompt:'最大值3位'">
                </div>
            </div>
        </div>
        <div class="topjui-row">
            <div class="topjui-col-sm3">
                <label class="topjui-form-label">六层</label>
                <div class="topjui-input-block">
                    <input type="text" name="si" data-toggle="topjui-numberbox"
                           data-options="groupSeparator:',',precision:2,max:999.99,min:0.00,prompt:'最大值3位'">
                </div>
            </div>
            <div class="topjui-col-sm3">
                <label class="topjui-form-label">七层</label>
                <div class="topjui-input-block">
                    <input type="text" name="se" data-toggle="topjui-numberbox"
                           data-options="groupSeparator:',',precision:2,max:999.99,min:0.00,prompt:'最大值3位'">
                </div>
            </div>
        </div>
    </div>
            <fieldset>
                <legend><b>折扣信息</b></legend>
            </fieldset>
        <div class="topjui-row">
            <div class="topjui-col-sm3">
                <label class="topjui-form-label">货款折扣</label>
                <div class="topjui-input-block">
                    <input type="text" name="zk" data-toggle="topjui-numberbox"
                           data-options="validType:['length[0,5]'],min:0" value="0">
                </div>
            </div>
            <div class="topjui-col-sm3">
                <label class="topjui-form-label">纸板折扣</label>
                <div class="topjui-input-block">
                    <input type="text" name="cardPreferences" data-toggle="topjui-numberbox"
                           data-options="validType:['length[0,5]'],min:0" value="0">
                </div>
            </div>
        </div>
    </div>
</form>
</body>
</html>