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
<script>
    //初始化加载所有权限（默认加载管理员）
   
   $(function () {
    /* $.ajax({
          type: 'POST',
          url: '${pageContext.request.contextPath}/indextree.action',
          contentType: "application/json; charset=utf-8",
          data: "json",
          success: function (data) {
            var tree = JSON.parse(data);
            $('#org2').iTree({
            width: 450,
            labelPosition: 'top',
            url: remoteHost + '/system/organization/getListByCodeSetIdAndLevelId?codeSetId=A&levelId=1',
            expandUrl: remoteHost + '/system/organization/getListByPid?pid={id}',
            idField: 'id',
            treeField: 'text',
           
        });
          },
          error: function () {

          }
      }); */
    //动态生成选择框
       
}); 
function opens(){
 console.info("11111");
}
function openEnd(){
  console.info("22222");
}
//联想文本框
function getLinkData() {
            var popupDiv = document.getElementById("popup");//获得对应的div对象
            var popupBody = document.getElementById("popupBody");//获得对应的tbody对象
            var linkDataProperty = document.getElementById("linkDataProperty"); //获得对应的输入框对象
            linkDataProperty = linkDataProperty.value.trim();
            clearModels();//清除联想输入提示框的内容
            //利用ajax获取后台的模糊查询的数据，并且封装成下拉列表的形式展现出来
            $.ajax({
                type : "post",//提交的方法为post
                url : '${pageContext.request.contextPath}/userselectUser.action',//对应的Action提交的路径
                data:{st:linkDataProperty},//从前台传递到后台的查询语句的参数
                dataType: 'json',
                error:function(){
                    alert("没有对应的数据，请查看输入的查询条件！");
                },
                success : function(data) {//当Ajax提交成功时调用的方法
                          
                          if(data.userlist.length==0){return;}
                          setOffsets();//设置联想输入下拉列表提示框的位置
                          var tr,td,text;
                          for (var i = 0; i < data.userlist.length; i++) {//根据返回的值，手动的拼tbody的内容
                          text = document.createTextNode("用户名:"+data.userlist[i].user_name);//从Action中返回的数据中取出linkDataProperty的值
                          td = document.createElement("td");//创建一个td的对象           
                          tr = document.createElement("tr");//创建一个tr的对象       
                          inp= document.createElement("a");//创建一个a链接对象
                          tex=document.createTextNode(data.userlist[i].user_id);
                          inp.appendChild(tex);
                          td.mouseOver = function(){this.className="mouseOver;";};
                          td.mouseOut = function(){this.className="mouseOut;";};
                          td.onclick = function(){populateModel(this);};//单击td是的方法为populateModel             
                          td.appendChild(inp);
                          td.appendChild(text);
                          tr.appendChild(td);            
                          popupBody.appendChild(tr);
                      }
                    }
                });
	    
            //点击下拉列表中的某个选项时调用的方法
            function populateModel(cell) {
            	   
                    clearSelect();
                    $("#linkDataProperty").val(cell.firstChild.firstChild.nodeValue);
                    //initOtherData(linkDataProperty.value);利用输入框中的数据调用其他方法，初始化其他数据
                    clearModels();//清除自动完成行                        
            }
            //清除自动完成行，只要tbody有子节点就删除掉，并且将将外围的div的边框属性设置为不可见的
            function clearModels() {
                while (popupBody.childNodes.length > 0) {
                    popupBody.removeChild(popupBody.firstChild);
                }
                popupDiv.style.border = "none";
            }
            //设置下拉列表的位置和样式
            function setOffsets() {
                var width = linkDataProperty.offsetWidth;//获取linkDataProperty输入框的相对宽度
                var left = getLeft(linkDataProperty);
                var top = getTop(linkDataProperty) + linkDataProperty.offsetHeight;
        
                popupDiv.style.border = "black 0px solid";
                popupDiv.style.left = left + "px";
                popupDiv.style.top = top + "px";
                popupDiv.style.width = width + "px";
                
            }
            //获取指定元素在页面中的宽度起始位置
            function getLeft(e) {
                var offset = e.offsetLeft;
                if (e.offsetParent != null) {
                    offset += getLeft(e.offsetParent);
                }
                return offset;
            }
            //获取指定元素在页面中的高度起始位置
            function getTop(e) {
                var offset = e.offsetTop;
                if (e.offsetParent != null) {
                    offset += getTop(e.offsetParent);
                }
                return offset;
            }
        }
         //清空输入框中的数据
        function clearSelect() {
            var linkDataProperty=document.getElementById(linkDataProperty);
           // linkDataProperty.value="";
        }

</script>
<body>
<!-- 查询栏开始 -->
<div id="productDg-toolbar" class="topjui-toolbar" style="display: block;">
        <input style="width:375px;height:30px" id="linkDataProperty" name="model.user_id" value="${model.user_id}" autocomplete="off" type="text" placeholder="请输入用户名称查找" onkeyup="getLinkData();"/>
		 <div id="popup" style="position: absolute;">
                            <table width="100%" bgcolor="#fffafa">
                               <tbody id="popupBody"></tbody>
                            </table>
         </div>
   
</div>

<!-- 树形布局开始 -->
<div data-toggle="topjui-layout" data-options="fit:true">
    <div data-options="region:'center',title:'',split:true,border:false,width:'20%',iconCls:'fa fa-sitemap',headerCls:'border_right',bodyCls:'border_right'">
  
   <table  data-toggle="topjui-treegrid"
       data-options="id:'menuTreegrid',
        idField:'id',
        treeField:'text',
        url:'${pageContext.request.contextPath}/data/test100.json',
        fitColumns:true">
    <thead>
    <tr>
        <th data-options="field:'uuid',title:'UUID',checkbox:true"></th>
        <th data-options="field:'text',title:'权限名称',sortable:true,"></th>
        <th data-options="field:'type',title:'权限状态',sortable:true,
        formatter:function(value,row,index){
                        if (value == '1') {
                            return '<span style=\'color:green\'>已授权</span>';
                        } else if (value == '2') {
                            return '<span style=\'color:red\'>未授权</span>';
                        } else {
                            return '<span style=\'color:red\'>异常</span>';
                        }
                    }"></th>
        <th data-options="field:'button',title:'操作',sortable:true,
                          formatter:function(value,row,index){
                        if (value == '1') {
                            return '<button class=\'layui-btn layui-btn-xs\' onclick=\'opens()\'>启用</button>';
                        }else if (value == '2'){ 
                            return '<button class=\'layui-btn layui-btn-xs layui-btn-danger\' onclick=\'openEnd()\'>禁用</button>';
                        }}"></th>
    </tr>
    </thead>
</table>
 
</div>
<!-- 
 <div class=""  data-options="region:'center'">
         <p style="color:red;">用户权限设置:单击左侧菜单即可为用户添加权限</p>
         <p>当前已选择权限：</p>
         <div id="lev"></div>
    </div>
     -->
</div>
</body>
</html>