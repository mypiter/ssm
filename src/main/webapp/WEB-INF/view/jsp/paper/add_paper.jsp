<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<body>
<form class="hidden" method="post" action="/PaperSet/addPaper/">
<input type="hidden" id="uuid" name="id">
<table class="editTable">
    <tr>
        <td class="label">纸张名称</td>
        <td>
            <input type="text" name="paperName" data-toggle="topjui-textbox"
                   data-options="required:true, value:'',validType:['length[0,50]']">
        </td>
        <td class="label">代号</td>
        <td>
            <input type="text" name="paperCode" data-toggle="topjui-textbox" data-options="required:true">
        </td>
    </tr>
     <tr>
        <td class="label">克重（g/㎡）</td>
        <td>
            <input type="text" name="paperWeight" data-toggle="topjui-textbox" data-options="required:true">
        </td>
        <td class="label">单价（元/㎡）</td>
        <td>
            <input type="text" name="paperPrice" data-toggle="topjui-textbox" data-options="required:true">
        </td>
    </tr>

</table>
    <div><input type="submit" value="提交"></div>
</form>
</body>

                      
