/**
 * 获取当前环境
 */
function getCurrentWebviewEnvrionment() {
    JAE.bridge.getEnvironment(function (e) {
        if (JSON.stringify(e).indexOf("0") >= 0) {
            document.getElementsByClassName("getCurrentWebviewEnvrionment").item(0).innerHTML = "淘宝-WebView";
        }
        else if (JSON.stringify(e).indexOf("1") >= 0) {
            document.getElementsByClassName("getCurrentWebviewEnvrionment").item(0).innerHTML = "JAE-WebView";
        }
        else if (JSON.stringify(e).indexOf("2") >= 0) {
            document.getElementsByClassName("getCurrentWebviewEnvrionment").item(0).innerHTML = "三方-WebView";
        }
        else {
            document.getElementsByClassName("getCurrentWebviewEnvrionment").item(0).innerHTML = "参数异常";
        }
    }, function (e) {
        alert(JSON.stringify(e));
    });
}

/**
 *  Ajax 请求 阿里 域内的域名
 */
function ajaxRequestUrlInnerAliDomain() {
    var url = "/views/jaewebview/ajaxalidomain.jsp";
    var param = {};
    $.ajax({
        type: "get",
        url: url,
        data: param,
        cache: false,
        timeout: 5000,
        dataType: 'json',
        success: function (data) {
            var q = eval(data);
            if (q.info == "success") {
                alert("Ajax请求阿里域内文件成功，符合预期");
                document.getElementsByClassName("ajaxrequesturlinneralidomain").item(0).innerHTML = "符合预期";
            } else {
                document.getElementsByClassName("ajaxrequesturlinneralidomain").item(0).innerHTML = "不符合预期";
                alert("Ajax请求阿里域内文件失败，不符合预期");
            }
        },
        error: function () {
            alert("Ajax请求阿里域内文件失败，不符合预期");
            document.getElementsByClassName("ajaxrequesturlinneralidomain").item(0).innerHTML = "不符合预期";
        }
    });
}


/**
 *  Ajax 请求 阿里 域外 的域名
 */
function ajaxRequestUrlOutofAliDomain() {
    var url = "http://www.baidu.com";
    var param = {};
    $.ajax({
        type: "get",
        url: url,
        data: param,
        cache: false,
        timeout: 5000,
        dataType: 'json',
        success: function (data) {
            alert("Ajax请求阿里域外文件成功，不符合预期");
            document.getElementsByClassName("ajaxrequesturloutofalidomain").item(0).innerHTML = "不符合预期";
        },
        error: function () {
            alert("Ajax请求阿里域外文件不成功，符合预期");
            document.getElementsByClassName("ajaxrequesturloutofalidomain").item(0).innerHTML = "符合预期";
        }
    });
}


// 开始监听摇一摇 并响铃
function startListenShake() {
    JAE.bridge.shake.startWatch(function () {
        document.getElementsByClassName("activitySleepAndLiveMusic").item(0).src = "/assets/img/win.mp3";
        document.getElementsByClassName("activitySleepAndLiveMusic").item(0).play();
        document.getElementsByClassName("currentMusicActivityStatus").item(0).innerHTML = "(已启动)";
        sleep(3);
    }, function () {
        alert("监听失败，可能本身失败，可能超时哦~")
    }, 5000)
}

// 停止监听摇一摇 并响铃
function stopListenShake() {
    JAE.bridge.shake.stopWatch(function () {
        document.getElementsByClassName("activitySleepAndLiveMusic").item(0).src = "";
        document.getElementsByClassName("currentMusicActivityStatus").item(0).innerHTML = "(已关闭)";
        alert("关闭成功")
    }, function () {
        alert("关闭失败了哦")
    })
}


function sleep(n)
{
    var start=new Date().getTime();
    while(true) if(new Date().getTime()-start>n) break;
}





