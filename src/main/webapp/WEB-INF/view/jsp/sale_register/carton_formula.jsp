<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

    <title>箱型公式设置</title>

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
</head>
<style>
    /*layui table修改样式*/
    /*改变表格表头样式*/
    .layui-table th{
        /*color: red;*/
        /*text-align: left;*/
    }
    /*改变表格表头样式*/

    /*改变表格内边距*/
    .layui-table-cell{
        padding: 0 5px;
    }
    /*改变表格内边距*/

    .layui-table-sort{
        margin-left: 0px;
    }
    /* layui  table修改样式*/


    .button1{padding: 5px;}
</style>
<body>
<div data-toggle="topjui-layout" data-options="fit:true">
    <div data-toggle="topjui-panel" title="" data-options="fit:true,iconCls:'icon-ok',footer:'#footer'">
        <c:if test="${ids == null}">
            <form class="hidden" method="post" data-toggle="topjui-form" data-options="id:'formId',
               <%--url:_ctx + '/json/response/form.json?uuid=123456',--%>
               editor:[
                   {id:'remarkAddEditor',field:'remark'}
               ]">
        </c:if>
        <c:if test="${ids != null}">
            <form class="hidden" method="post" data-toggle="topjui-form" data-options="id:'formId',
           url:'/CartonFormulaController/findById/?ids=${ids}',
           editor:[
               {id:'remarkAddEditor',field:'remark'}
           ]">
                <input type="hidden" name="id" value="${ids}">
        </c:if>

            <div style="margin: 20px 0;">

                箱型编号<input id="cartonNumber" name="cartonNumber" type="text" style="width: 150px;"
                           data-toggle="topjui-textbox"
                           data-options="onChange:function(newValue,oldValue){},required:true,groupSeparator:'',validType:['length[0,10]','checkNumber']" >
                箱型名称<input id="cartonName" name="cartonName" type="text"
                           data-toggle="topjui-textbox"
                           data-options="required:true,validType:['length[0,20]']" style="width: 150px;">
                类型<input type="text" id="cartonType" name="cartonType"
                         data-toggle="topjui-combobox"
                         data-options="valueField: 'text',textField: 'text',
                         data:[
                         {value:1,text:'板片',selected:true},
                         {value:2,text:'其他'}],panelHeight:70" style="width: 100px;">
                搭口类型<input type="text" id="mouthType" name="mouthType"
                           data-toggle="topjui-combobox"
                           data-options="valueField: 'text',textField: 'text',data:[
                           {value:1,text:'全搭',selected:true},
                           {value:2,text:'半搭'},
                           {value:3,text:'不搭'}],panelHeight:100" style="width: 100px;"><br><br>
                <span>&nbsp;长度压线&nbsp;</span><input id="lengthLine" name="lengthLine" style="width: 400px"
                                                    data-toggle="topjui-textbox"
                                                    data-options="validType:['length[0,100]'],readonly:true">
                <span>&nbsp;宽度压线&nbsp;</span><input id="widthLine" name="widthLine" style="width:400px;"
                                                    data-toggle="topjui-textbox"
                                                    data-options="validType:['length[0,100]'],readonly:true" ><br><br>
                    <input type="radio" name="sex" value="1" checked="checked">长度
                    <input type="radio" name="sex" value="2">宽度
                <input class="button1" type="button" value="长" onclick="yusuan(this)">
                <input class="button1" type="button" value="宽" onclick="yusuan(this)">
                <input class="button1" type="button" value="高" onclick="yusuan(this)">
                <input class="button1" type="button" value="楞" onclick="yusuan(this)">
                <input class="button1" type="button" value="0" onclick="yusuan(this)">
                <input class="button1" type="button" value="1" onclick="yusuan(this)">
                <input class="button1" type="button" value="2" onclick="yusuan(this)">
                <input class="button1" type="button" value="3" onclick="yusuan(this)">
                <input class="button1" type="button" value="4" onclick="yusuan(this)">
                <input class="button1" type="button" value="5" onclick="yusuan(this)">
                <input class="button1" type="button" value="6" onclick="yusuan(this)">
                <input class="button1" type="button" value="7" onclick="yusuan(this)">
                <input class="button1" type="button" value="8" onclick="yusuan(this)">
                <input class="button1" type="button" value="9" onclick="yusuan(this)">
                <input class="button1" type="button" value="." onclick="yusuan(this)">
                <input class="button1" type="button" value="+" onclick="yusuan(this)">
                <input class="button1" type="button" value="-" onclick="yusuan(this)">
                <input class="button1" type="button" value="*" onclick="yusuan(this)">
                <input class="button1" type="button" value="/" onclick="yusuan(this)">
                <input class="button1" type="button" value="(" onclick="yusuan(this)">
                <input class="button1" type="button" value=")" onclick="yusuan(this)">
                <input class="button1" type="button" value="|" onclick="yusuan(this)">
                <input class="button1" type="button" value="删除" onclick="yusuan(this)">
                <input class="button1" type="button" value="全部删除" onclick="yusuan(this)">

                <br><br>
                <input id="table_data" name="table_data"
                       data-toggle="topjui-textarea"
                       data-options="required:true,readonly:true,prompt:'此处无需输入，只需修改表格即可'" style="width:930px;height:100px"/>

            </div>

            <c:if test="${ids == null}">
            <div style="width: 100%">
                <div style="margin: 0 auto; width: 143px;">
                <!-- <div class="layui-btn-group demoTable">
                  <button class="layui-btn" data-type="getCheckData">获取选中行数据</button>
                  <button class="layui-btn" data-type="getCheckLength">获取选中数目</button>
                  <button class="layui-btn" data-type="isAll">验证是否全选</button>
                </div> -->
                <table class="layui-table"
                       lay-data="{height: 393,width: 143,
                       url:'/Flut/getAll/',
                       even:true,
                       id:'test3'}" lay-filter="test3">
                    <thead>
                    <tr>
                        <th lay-data="{field:'name',align:'center', width:70}">楞型</th>
                        <th lay-data="{field:'coefficient',align:'center',edit: 'text', width: 70}">系数</th>
                    </tr>
                    </thead>
                </table>
                <script>
                    layui.use('table', function(){
                        var table = layui.table;

                        //监听单元格编辑
                        table.on('edit(test3)', function(obj){
                            var value = obj.value //得到修改后的值
                                ,data = obj.data //得到所在行所有键值
                                ,field = obj.field; //得到字段
                            // layer.msg('[ID: '+ data.id +'] ' + field + ' 字段更改为：'+ value);

                            //非零非负数字正则表达式
                            var reg=/^(([1-9]+)|([0-9]+\.[0-9]{1,2}))$/;
                            if(!reg.test(value) && value!=""){
                                layer.msg('系数输入错误，请重新输入！', {icon: 2});
                                return;
                            }

                            var val = $("#table_data").iTextarea("getValue");//拿到已保存起来的编辑数据
                            // console.log(val);
                            if(val=="" || val=="[]"){//数据为空，表示当前是第一次编辑，直接保存即可无需过多的逻辑处理
                                if(value!=""){
                                    var json=[];
                                    json.push(data);//在json数组里新增一个json对象
                                    // console.log(json);
                                    var jsonarr = JSON.stringify(json);//把json对象Opject转化为string，以便保存和提交
                                    $("#table_data").iTextarea("setValue",jsonarr);
                                }
                            }else{//数据不为空，表示当前不是第一次编辑数据
                                var json = JSON.parse(val);//把json字符串转化为json对象object数组，以便数据操作
                                for(var i = 0;i<json.length;i++){//遍历json对象数组中的每一个对象
                                    if(json[i].id == data.id){//找到其中一个对象的id是当前编辑条目的id，的对象数据
                                        var demo = json[i];
                                        for(var item in demo){//循环遍历输出该对象的‘属性’和‘值’
                                            if(item == field){//找到与修改字段一样的属性，修改该‘属性’对应‘值’
                                                demo[item]=value;//修改该编辑属性的值
                                            }
                                        }
                                        break;
                                    }
                                    if(i==json.length-1){
                                        json.push(data);//在json数组里新增一个json对象
                                    }
                                }
                                // console.log(json);
                                var jsonarr = JSON.stringify(json);//把json对象Opject转化为string，以便保存和提交
                                if(jsonarr=="[]"){
                                    $("#table_data").iTextarea("setValue","");
                                }else{
                                    $("#table_data").iTextarea("setValue",jsonarr);
                                }
                            }
                        });


                        var $ = layui.$, active = {
                            getCheckData: function(){ //获取选中数据
                                var checkStatus = table.checkStatus('test3')
                                    ,data = checkStatus.data;
                                layer.alert(JSON.stringify(data));
                            }
                            ,getCheckLength: function(){ //获取选中数目
                                var checkStatus = table.checkStatus('test3')
                                    ,data = checkStatus.data;
                                layer.msg('选中了：'+ data.length + ' 个');
                            }
                            ,isAll: function(){ //验证是否全选
                                var checkStatus = table.checkStatus('test3');
                                layer.msg(checkStatus.isAll ? '全选': '未全选')
                            }
                        };

                        $('.demoTable .layui-btn').on('click', function(){
                            var type = $(this).data('type');
                            active[type] ? active[type].call(this) : '';
                        });

                    });
                </script>
                </div>
            </div>
            </c:if>

            <div id="footer" class="hidden" style="height: 34px; padding: 5px; text-align: right;">
                <c:if test="${ids == null}">
                <a href="#"
                   data-toggle="topjui-linkbutton"
                   data-options="id:'submitBtn',
			                   iconCls:'fa fa-save',
			                   form:{
			                       id:'formId',
			                       method:'submit',
			                       url:'/CartonFormulaController/addCartonFormula/',
			                       <%--refreshRefererTab:true,--%>
			                       <%--closeCurrentTab:true--%>
			                   }">提交</a>
                </c:if>
                <c:if test="${ids != null}">
                    <a href="#"
                       data-toggle="topjui-linkbutton"
                       data-options="id:'submitBtn',
			                   iconCls:'fa fa-save',
			                   form:{
			                       id:'formId',
			                       method:'submit',
			                       url:'/CartonFormulaController/updateCartonFormula/',
			                       refreshRefererTab:true,
			                       closeCurrentTab:true
			                   }">更新</a>
                </c:if>

                <%--<a href="#"--%>
                <%--data-toggle="topjui-linkbutton"--%>
                <%--data-options="id:'submitBtn',--%>
                <%--iconCls:'fa fa-exchange',--%>
                <%--btnCls:'topjui-btn-black',--%>
                <%--form:{--%>
                <%--id:'formId',--%>
                <%--method:'reset'--%>
                <%--}">重置</a>--%>
                <%--<a href="#"--%>
                <%--data-toggle="topjui-linkbutton"--%>
                <%--data-options="id:'submitBtn',--%>
                <%--iconCls:'fa fa-trash',--%>
                <%--btnCls:'topjui-btn-red',--%>
                <%--form:{--%>
                <%--id:'formId',--%>
                <%--method:'clear'--%>
                <%--}">清空</a>--%>
            </div>
        </form>
    </div>
</div>
<script type="text/javascript">
    $(function(){
        var dat = new Date().Format("yyyy-MM-dd");
        $("#time").iDatebox("setValue",dat);

        $("#table_data").next().hide();//隐藏表格数据框

        $.ajax({
            type:'post',
            url:'/Flut/getAll/',
            dataType:'json',
            success:function (data) {
                // console.log(data.data);
                var json=data.data;
                var jsonarr = JSON.stringify(json);//把json对象Opject转化为string，以便保存和提交
                $("#table_data").iTextarea("setValue",jsonarr);
            }
        });





    });

    //小键盘点击方法实现
    function yusuan(test) {
        var lengthLine = $("#lengthLine").iTextbox("getValue");
        var widthLine = $("#widthLine").iTextbox("getValue");

        var check = $('input:radio:checked').val();//获取单选框中的值
        if(test.value=="删除"){
            check==1 ? $("#lengthLine").iTextbox("setValue",lengthLine.substring(0,lengthLine.length-1)):$("#widthLine").iTextbox("setValue",widthLine.substring(0,widthLine.length-1));
        }else if(test.value=="全部删除"){
            check==1 ? $("#lengthLine").iTextbox("setValue",""):$("#widthLine").iTextbox("setValue","");
        }else{
            assignment(check,test.value);
        }
    }

    //给长度或宽度压线赋值方法
    function assignment(check,value) {
        var lengthLine = $("#lengthLine").iTextbox("getValue");
        var widthLine = $("#widthLine").iTextbox("getValue");
        check==1 ? $("#lengthLine").iTextbox("setValue",lengthLine+value):$("#widthLine").iTextbox("setValue",widthLine+value);
    }
    
    
</script>
</body>
</html>
