var _grwebapp_websocket = null,
    webapp_onmessage; //如果需要响应执行任务后的消息响应，应该写一个名称为 webapp_onmessage 的 function


function webapp_ajax(method, url, callback, cbthis, data) {
    var xmlhttp = new XMLHttpRequest();

    xmlhttp.onreadystatechange = function () {
        if (xmlhttp.readyState == 4 && xmlhttp.status > 0) {
            callback.call(cbthis, xmlhttp, xmlhttp.status == 200);
        }
    }

    xmlhttp.onerror = function () {
        callback.call(cbthis, xmlhttp, 0);
    }

    if (!method) {
        method = data ? "POST" : "GET";
    }
    xmlhttp.open(method, url, true); //异步请求数据
    xmlhttp.send(data);  //POST 或 PUT 可以传递参数
}

//创建启动WEB报表客户端的URL协议参数
function webapp_urlprotocol_href(args) {
    return "grwebapp://" + (args ? JSON.stringify(args) : "");
}

//通过URL协议启动WEB报表客户端程序
function webapp_urlprotocol_startup() {
    window.location.href = webapp_urlprotocol_href();
}

//如果WEB报表客户端程序，先通过URL协议启动WEB报表客户端程序
//通知WEB报表客户端程序根据模板与数据的URL进行报表生成，
function webapp_urlprotocol_run(args, report_url, data_url) {
    if (report_url) {
        args.report = report_url;
    }
    if (data_url) {
        args.data = data_url;
    }

    window.location.href = webapp_urlprotocol_href(args);
}

//检查WebSocket是否已经创建并通讯连接成功
function webapp_ws_check(slience) {
    if (!slience) {
        if (!_grwebapp_websocket) {
            alert("WebSocket没有创建，无法发送数据！");
        }
        else if (_grwebapp_websocket.readyState != 1) {
            alert("WebSocket正在连接中，暂不能发送数据！");
        }
    }
    return _grwebapp_websocket && (_grwebapp_websocket.readyState === 1);
}

//创建并通讯连接WebSocket
function webapp_ws_create(onopen) {
    var count = 0;

    //如果已经创建，且连接正常，则不要再次创建
    if (_grwebapp_websocket && _grwebapp_websocket.readyState === 1) {
        return;
    }

    //判断当前浏览器是否支持WebSocket
    if ('WebSocket' in window) {
        _grwebapp_websocket = new WebSocket("ws://127.0.0.1:22333");

        //连接成功建立的回调方法
        if (onopen) {
            _grwebapp_websocket.onopen = function () {
                //alert("_grwebapp_websocket.onopen");
                onopen();
            }
        }

        //接收到消息的回调方法
        if (webapp_onmessage) {
            _grwebapp_websocket.onmessage = function (event) {
                webapp_onmessage(event);
            }
        }

        _grwebapp_websocket.onerror = function () {
            //alert("_grwebapp_websocket.onerror");
            _grwebapp_websocket = null;
        };

        //连接关闭的回调方法
        _grwebapp_websocket.onclose = function () {
            _grwebapp_websocket = null;
        }

        //感觉这部分可以不要
        //监听窗口关闭事件，当窗口关闭时，主动去关闭_grwebapp_websocket连接，防止连接还没断开就关闭窗口，server端会抛异常。
        //window.onbeforeunload = function () {
        //    if (_grwebapp_websocket) {
        //        _grwebapp_websocket.close();
        //    }
        //}
    }
    else {
        alert('当前浏览器不支持HTML5的WebSocket，请选用更新版本的浏览器！')
    }
}

//将参数通过WebSocket发送给WEB报表客户端，WEB报表客户端执行对应的任务
//参数说明：
//args：
//  报表生成相关的参数，为一个结构体对象或结构体对象数组。
//  当参数为数组时，表示是执行批量任务。此时后面的 report 与 data 参数不会被用到。
//  结构体对象的各个数据项说明请参考帮助中“WEB报表(B/S报表)->WEB报表客户端->启动参数说明”部分
//report：
//  报表模板文本，报表定义格式必须为JSON格式。此参数可空，为空表示执行非报表生成任务，或WEB报表客户端通过URL获取报表模板。
//data：
//  报表数据文本，此参数可空，报表无需提供数据，或WEB报表客户端通过URL获取报表数据。
//  报表数据对应的 XML 或 JSON 文本，请参考帮助“WEB报表(B/S报表)->WEB报表数据”中的说明。 
function webapp_ws_run(variant_args, report, data) {
    function run_one(args, report, data) {
        var msg;

        if (webapp_ws_check()) {
            if (typeof args === "string") {
                args = {
                    type: args
                };
            }
            msg = JSON.stringify(args);

            if (report) {
                msg += report;

                if (data) {
                    msg += data;
                }
            }

            _grwebapp_websocket.send(msg);
        }
    } //end of run_one

    if (!webapp_ws_check(1)) {
        //如果WebSocket没有连接，则首先创建并连接WebSocket，并在onopen事件中执行相关的任务
        webapp_ws_create(function () {
            webapp_ws_run(variant_args, report, data);
        });
        return;
    }

    if (Array.isArray(variant_args)) {
        variant_args.forEach(function (args) {
            run_one(args);
        })
    }
    else {
        run_one(variant_args, report, data);
    }
}

//通过 ajax 方式获取报表模板与报表数据，然后通过 WebSocket 发送相关数据给WEB报表客户端并生成报表
//参数既可以是单个结构体对象，也可以是结构体对象数组。如果是数组，表示成批生成多个报表。
//结构体对象的各个数据项说明请参考帮助中“WEB报表(B/S报表)->WEB报表客户端->启动参数说明”部分。
function webapp_ws_ajax_run(variant_args) {
    function run_one(args) {
        var report_url = args.report,
        data_url = args.data,
        report_method = args.report_method,
        data_method = args.data_method,
        pack = {};

        function run() {
            //只有当report与data都赋值之后才运行，即向WEB报表客户端程序发送数据
            if (pack.report && pack.data) {
                webapp_ws_run(args, pack.report, pack.data);
            }
        }

        delete args.report;
        delete args.data;
        delete args.report_method;
        delete args.data_method;

        if (!report_method) {
            report_method = "GET";
        }
        if (!data_method) {
            data_method = "POST";
        }

        if (!report_url) {
            alert("在参数中没有定义报表模板的url，报表没法生成！");
            return;
        }

        if (data_url) {
            webapp_ajax(data_method, data_url, function (xmlhttp, success) {
                if (success) {
                    pack.data = xmlhttp.responseText;
                    run();
                }
                else {
                    //alert("载入报表数据失败，响应消息：" + xmlhttp.responseText);
                    window.open(data_url, "blank");
                }
            });
        }
        else {
            pack.data = "{}";
        }

        webapp_ajax(report_method, report_url, function (xmlhttp, success) {
            if (success) {
                pack.report = xmlhttp.responseText;
                run();
            }
            else {
                //alert("载入报表模板失败，响应消息：" + xmlhttp.responseText);
                window.open(report_url, "blank");
            }
        });
    } //end of run_one

    if (!webapp_ws_check(1)) {
        //如果WebSocket没有连接，则首先创建并连接WebSocket，并在onopen事件中执行相关的任务
        webapp_ws_create(function () {
            webapp_ws_ajax_run(variant_args);
        });
        return;
    }

    if (Array.isArray(variant_args)) {
        variant_args.forEach(function (args) {
            run_one(args);
        })
    }
    else {
        run_one(variant_args);
    }
}

//通过WebSocket向WEB报表客户端发送枚举出当前电脑的所有打印机信息的指令
//在网页的 webapp_onmessage 函数中接收WEB报表客户端返回的结果，具体请参考例子。
function webapp_ws_fun_Printers() {
    webapp_ws_run({
        type: "fun",
        fun: "Printers"
    });
}

//通过WebSocket向WEB报表客户端发送枚举出当前电脑的指定打印机的全部可用纸张的指令
//在网页的 webapp_onmessage 函数中接收WEB报表客户端返回的结果，具体请参考例子
function webapp_ws_fun_PrinterPapers(printer) {
    webapp_ws_run({
        type: "fun",
        fun: "PrinterPapers",
        printer: printer
    });
}