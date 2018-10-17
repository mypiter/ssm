<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<style>
    .editTable .label {
        min-width: 80px;
        width: 80px;
    }
</style>
<input type="hidden" id="adminId" name="adminId" value="${adminId}">
<div class="easyui-tabs" style="height: 100%;width: 99.9%;">
    <div title="修改密码" style="padding:10px">
<table class="editTable">
    <tr>
         <td class="label">密码</td>
        <td ><!-- colspan="3" -->
            <input type="text" id="adminPassword" name="adminPassword" data-toggle="topjui-textbox" data-options="required:true">
        </td>
    </tr>
    <tr>
        <td class="label">重复密码</td>
        <td ><!-- colspan="3" -->
            <input type="text" id="adminPasswordTwo" name="adminPasswordTwo" data-toggle="topjui-textbox" data-options="required:true">
        </td>
    </tr>
</table>
    </div>
</div>

<script type="text/javascript">
    $(function () {
        $('#adminPassword').iPasswordbox({
            width: 200,
            required: true,
            validType: 'minLength[6]'
        });
        $('#adminPasswordTwo').iPasswordbox({
            width: 200,
            required: true,
            validType: "equals['#adminPassword']"
        });
    });
</script>