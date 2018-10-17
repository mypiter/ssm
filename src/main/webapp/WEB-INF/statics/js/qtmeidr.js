/**
 * topjui文本框自定义校验
 * zjs
 */
$.extend($.fn.validatebox.defaults.rules,{
    checkMaterial:{//校验材质
        validator: function(value){
            var reg = /^[0-9a-zA-Z]+$/;
            return reg.test(value);
        },
        message: '只能输入字母或者数字'
    },
    checkPitType:{//校验楞型
        validator: function(value){
            var reg = /^[a-zA-Z]*$/g;
            return reg.test(value);
        },
        message: '只能输入字母'
    },
    checkNumber:{
        validator: function(value) {
            var reg = /^[0-9]*$/;
            return reg.test(value);
        },
        message:'只能输入数字'
    },
    checkOrderTime:{//校验下单日期
        validator: function(value) {
            var deliveryTime= $('#deliveryTime').iDatebox('getValue');
            var dat = new Date().Format("yyyy-MM-dd");
            if(deliveryTime!=''){
                return value>=dat && value<deliveryTime;
            }else{
                return value>=dat;
            }

        },
        message:'不能小于当前日期时间并且小于送货日期'
    },
    checkDeliveryTime:{//校验送货日期
        validator: function(value) {
            var orderTime=$('#orderTime').iDatebox('getValue');
            var dat = new Date().Format("yyyy-MM-dd");
            return value>=dat && value>orderTime;
        },
        message:'不能小于当前日期时间并大于下单日期'
    }
});

/**
 * 按时间日期的格式获取当前时间
 * zjs
 */
Date.prototype.Format = function (fmt) { // author: meizz
    var o = {
        "M+": this.getMonth() + 1, // 月份
        "d+": this.getDate(), // 日
        "h+": this.getHours(), // 小时
        "m+": this.getMinutes(), // 分
        "s+": this.getSeconds(), // 秒
        "q+": Math.floor((this.getMonth() + 3) / 3), // 季度
        "S": this.getMilliseconds() // 毫秒
    };
    if (/(y+)/.test(fmt))
        fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
    for (var k in o)
        if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
    return fmt;
};
