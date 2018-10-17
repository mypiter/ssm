<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


<input type="hidden" id="uuid" name="uuid">
<table class="editTable">
    <tr>
        <td class="label">名称</td>
        <td ><!-- colspan="3" -->
            <input type="text" name="user_name" data-toggle="topjui-textbox" data-options="required:true,">
        </td>
         <td class="label">版号</td>
        <td ><!-- colspan="3" -->
            <input type="text" name="user_name" data-toggle="topjui-textbox" data-options="required:true,">
        </td>
        
    </tr>
    <tr>
        <td class="label">尺寸</td>
        <td >
             <input type="text" name="user_name" data-toggle="topjui-textbox" data-options="required:true,">
        </td>
        
    </tr>
    
     <tr>
       <td class="label">上传图片</td>
       <td><input type="text" data-toggle="topjui-filebox" data-options="required:true,buttonIcon:'fa fa-folder',id:'model_image',width:'183px'" id="model_image" class="filebox-f textbox-f" textboxname="model_image" style="display: none;">
       </td>
      
    </tr>
    <tr>
     <td class="label">显示图片</td>
       <td  colspan="2">
       <input type="text" style="width:401px;height:221px" name="user_tel" data-toggle="topjui-textbox" data-options="required:true,">

       </td>
    </tr>
</table>