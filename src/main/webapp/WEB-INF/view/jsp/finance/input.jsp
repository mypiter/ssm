<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<style>
	#youhui,#zhiban{width: 600px;margin: 0 auto;  border: 1px solid #ccc;}
	#youhui th,#zhiban th{font-size:20px;font-family:'黑体'; height: 30px;}
	#youhui td,#zhiban td{font-size:16px; line-height: 20px;  height: 30px;}
	
</style>
	<div>
    <input type="hidden" id="uuid" name="uuid">
    <input type="hidden" id="time" name="time">
    <table class="editTable">
        <tr>
            <td colspan="4">
                <div class="divider">
                    <span>录入付款信息</span>
                </div>
            </td>
        </tr>
        <tr>
            <td class="label">支付金额</td>
            <td><input type="text" name="admin_name" value="" data-toggle="topjui-textbox"
                       data-options="required:true,width:278,prompt:'必填'"></td>
            <td class="label">支付方式</td>
            <td><input type="text" id="sf" name="type" 
                   data-toggle="topjui-combobox"
                   data-options="
                        onChange:ck,
                   		data:[
                       {
                           text: '承兑',
                           value: '1'
                       },
                       {
                           text: '支付宝',
                           value: '2'
                       },
                       {
                           text: '转账',
                           value: '3'
                       },
                       {
                           text: '.....',
                           value: '4'
	                       }
                   ],required:true"></td>
        </tr>
        <tr id="p1">
            <td class="label">承兑票号</td>
            <td><input type="text" name="admin_name" value="" data-toggle="topjui-textbox"
                       data-options="required:true,width:278,"></td>
            <td class="label">承兑日期</td>
            <td><input type="text" name="delivery_time" data-toggle="topjui-datebox" data-options="width:188,required:true">
			</td>
        </tr>
        <tr>
            <td class="label">付款备注</td>
            <td colspan="3">
                <textarea id="_easyui_textbox_input7" class="textbox-text validatebox-text" 
                        autocomplete="off" tabindex="" placeholder="" style="margin: 0px; height:50px;
                         width: 500px;" data-options="required:true,"></textarea>
          
        </tr>
    </table>
</div>

<script type="text/javascript">
	$(function() {
	        $("#p1").hide();  
	});
	function ck(){
	var a=$("#sf").val();  
        if(a==1)  
        {  
              $("#p1").show();
                
        }
	}
	
</script>


