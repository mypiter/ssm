<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div data-toggle="topjui-layout" data-options="fit:true">
        <div data-options="region:'center',title:'',fit:true,border:false,bodyCls:'border_right_bottom'">
        <div data-toggle="topjui-tabs" data-options="fit:true,border:false">
        <div title="必填信息" data-options="iconCls:'fa fa-th'">
        <div class="topjui-fluid">
        <fieldset>
        <legend>基本信息</legend>
        </fieldset>
            <input type="hidden" name="id">
        <div class="topjui-row">
        <div class="topjui-col-sm4">
             <label class="topjui-form-label">工序名称</label>
              <div class="topjui-input-block">
                    <input type="text" name="name" data-toggle="topjui-textbox"
                         data-options="required:true">
        </div>
        </div>
            <div class="topjui-col-sm4">
                <label class="topjui-form-label">工序代号</label>
                <div class="topjui-input-block">
                    <input type="text" name="code" data-toggle="topjui-textbox"
                           data-options="required:true">
                </div>
            </div>
        </div>


        </div>
        </div>
        </div>
        </div>
        </div>

