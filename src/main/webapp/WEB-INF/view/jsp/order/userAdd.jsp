<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


<input type="hidden" id="uuid" name="uuid">
<table class="editTable">
    <tr>
        <td class="label">姓名</td>
        <td ><!-- colspan="3" -->
            <input type="text" name="user_name" data-toggle="topjui-textbox" data-options="">
        </td>
        <td class="label">账号</td>
        <td ><!-- colspan="3" -->
            <input type="text" name="user_account" data-toggle="topjui-textbox" data-options="required:true">
        </td>
    </tr>
    <tr>
        <td class="label">用户公司</td>
        <td ><!-- colspan="3" -->
            <input type="text" name="user_company" data-toggle="topjui-textbox" data-options="">
        </td>
        <td class="label">密码</td>
        <td ><!-- colspan="3" -->
            <input type="text" name="user_password" data-toggle="topjui-passwordbox" data-options="required:true">
        </td>
    </tr>
    <tr>
        <td class="label">注册时间</td>
        <td ><!-- colspan="3" -->
            <input type="text" name="user_registerTime" data-toggle="topjui-datebox">
        </td>
        <td class="label">电话</td>
        <td ><!-- colspan="3" -->
            <input type="text" name="user_tel" data-toggle="topjui-textbox" data-options="">
        </td>
    </tr>
    <tr>
        <td class="label">qq</td>
        <td ><!-- colspan="3" -->
            <input type="text" name="user_qq" data-toggle="topjui-textbox">
        </td>
        <td class="label">用户额度</td>
        <td ><!-- colspan="3" -->
            <input type="text" name="user_quota" data-toggle="topjui-numberspinner">
        </td>
    </tr>
    <tr>
        <td class="label">授信时间</td>
        <td ><!-- colspan="3" -->
            <input type="text" name="user_lockTime" data-toggle="topjui-datebox">
        </td>
        <td class="label">所属业务员</td>
        <td ><!-- colspan="3" -->
            <input type="text" name="user_relation"
                   data-toggle="topjui-combobox"
                   data-options="required:true,panelWidth:200,valueField:'code',
                   url:_ctx + '/json/demo/salesman.json'">
        </td>
    </tr>
    <tr>
        <td class="label">地址</td>
        <td ><!-- colspan="3" -->
            <input type="text" name="user_address" data-toggle="topjui-textbox">
        </td>
        <td class="label">权限</td>
        <td >
            <input type="text" name="level"
                   data-toggle="topjui-combobox"
                   data-options="data:[
                       {
                           text: '1',
                           value: '1'
                       },
                       {
                           text: '2',
                           value: '2'
                       },
                       {
                           text: '3',
                           value: '3'
                       },
                       {
                           text: '4',
                           value: '4'
                       },
                       {
                           text: '5',
                           value: '5'
                       }
                   ],required:true">
        </td>
    </tr>
    <tr>
        <td class="label">是否锁单</td>
        <td ><!-- colspan="3" -->
            <div data-toggle="topjui-radio">
                <input type="radio" name="user_lock" value="1" label="未锁" checked="checked">
                <input type="radio" name="user_lock" value="2" label="已锁">
            </div>
        </td>
    </tr>
    
    <!-- <tr>
        <td class="label">商品编号</td>
        <td>
            <input type="text" name="code"
                   data-toggle="topjui-combobox"
                   data-options="data:[
                       {
                           text: '2103',
                           value: '2103'
                       },
                       {
                           text: '5103',
                           value: '5103'
                       },
                       {
                           text: '1204',
                           value: '1204'
                       },
                       {
                           text: '1404',
                           value: '1404'
                       }
                   ]">
        </td>
        <td class="label">规格型号</td>
        <td>
            <input type="text" name="spec"
                   data-toggle="topjui-combobox"
                   data-options="required:true,panelWidth:200,valueField:'code',
                   url:_ctx + '/json/dictionary/models.json'">
        </td>
    </tr> -->
    <!-- <tr>
        <td class="label">销售单价</td>
        <td><input type="text" name="sale_price" data-toggle="topjui-numberspinner" data-options="precision:2"></td>
        <td class="label">首页推荐</td>
        <td>
            <input type="text" name="recommend"
                   data-toggle="topjui-combobox"
                   data-options="valueField:'code',
                   url:_ctx + '/json/dictionary/yesOrNo.json'">
        </td>
    </tr>
    <tr>
        <td class="label">产品缩略图</td>
        <td colspan="3">
            <input type="text" name="thumbnail" data-toggle="topjui-upload-lay"
                   data-options="editable:false,
                       buttonText:'上传图片',
                       accept:'images',
                       uploadUrl:'/json/response/upload.json'">
        </td>
    </tr>
    <tr>
        <td class="label">备注信息</td>
        <td colspan="3">
            <input type="text" name="description" data-toggle="topjui-textarea">
        </td>
    </tr> -->
</table>