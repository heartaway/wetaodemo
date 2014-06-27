/**
 * 拍照上传
 */
$("#takePhotoAndUpload").on('click', function () {
    takePhotoAndUpload();
})


function takePhotoAndUpload() {
    showInfo("你已触发 拍照上传 功能。");
    JAE.bridge.camera.takePhoto(function (e) {
        alert("take photo success.mseesge:" + JSON.stringify(e));
           $("#uploadedImages").innerHTML = "<img src='"+ e+"</img>";
    }, function (e) {
        alert("take photo failed.mseesge:" + JSON.stringify(e));
    });
}

/**
 * 获取地理位置
 */
$("#getLocation").on('click', function () {
    var token = document.getElementById("tokenInDB").value;
    if (token == null || token == "") {
        alert("Token信息为空，请先进行用户授权。");
    }
    token = token.replace("\n", "");
    chekToken(token);
    getLocation(token);
})

/**
 * 检查token是否存在，如果不存在，则引导用户授权
 */
function chekToken(token) {
    if (token == null) {
        userOAuth();
    }
    if (token == "") {
        userOAuth();
    }
}

/**
 * 引导用户 进行 OAuth
 */
function userOAuth() {

}

function getLocation(token) {
    showInfo("你已触发  获取地理位置 功能。");
    var option = {
        "accessToken":token
    }
    JAE.bridge.geolocation.get(function (e) {
        alert("获取到地理位置:" + JSON.stringify(e));
    }, function (e) {
        alert("获取错误:" + JSON.stringify(e));
        userOAuth();
    }, option);
}


function showInfo(message) {
    document.getElementsByClassName("operationInfo").item(0).innerHTML = message;
}


// ==================  以下 是 2.0 接口=============================

/**
 * 获取当前环境
 */
$("#getEnvironment").on('click', function () {
    getEnv();
})

function getEnv() {
    JAE.bridge.getEnvironment(function (e) {
        alert(JSON.stringify(e));
    }, function (e) {
        alert(JSON.stringify(e));
    });
}


/**
 * 获取设备信息，iphone ipad ipod itouch都是ios系统
 */
function getUAInfo() {
    var uastr = new Array();
    uastr[0] = JAE.util.ua.os;
    uastr[1] = JAE.util.ua.mobile;
    uastr[2] = JAE.util.ua.android;
    uastr[3] = JAE.util.ua.ios;
    uastr[4] = JAE.util.ua.iphone;
    uastr[5] = JAE.util.ua.ipad;
    uastr[6] = JAE.util.ua.ipod;

    alert("JAE.util.ua.os:" + uastr[0] + "\n" +
        "JAE.util.ua.mobile:" + uastr[1] + "\n" +
        "JAE.util.ua.android:" + uastr[2] + "\n" +
        "JAE.util.ua.ios:" + uastr[3] + "\n" +
        "JAE.util.ua.iphone:" + uastr[4] + "\n" +
        "JAE.util.ua.ipad:" + uastr[5] + "\n" +
        "JAE.util.ua.ipod:" + uastr[6])
}


/**
 * 页面是否在客户端打开
 */
function checkIsTaobao() {
    if (JAE.util.isInTaobaoApp()) {
        alert("我知道你在主客里面！");
    } else {
        alert("亲，你在哪里，为什么不在主客中呢~");
    }
}


/**
 * bridge组件:手机震动
 */

function checkvibrate() {
    JAE.bridge.vibrate(function (e) {
        alert("已经执行震动代码了哦，有没有震动？")
        alert(JSON.stringify(e));
    }, function (e) {
        alert("已经执行震动代码失败")
        alert(JSON.stringify(e));
    });
}

$("#chevibrate").on('click', function () {
    checkvibrate();
})

function initvibrate() {
    window.WindVane.call("WVMotion", "vibrate", {}, function (e) {
        alert("执行成功，e的内容是什么" + JSON.stringify(e))
    }, function (e) {
        alert("执行失败，e的内容是什么" + JSON.stringify(e))
    });
}

/**
 * 组件：摇一摇
 * 开始监听摇一摇
 */
function listenShake() {
    var option = {
        timeout: 10000
    }
    JAE.bridge.shake.startWatch(function (e) {
        alert("监听成功");
        alert(JSON.stringify(e));
    }, function (e) {
        alert("监听失败，可能本身失败，可能超时哦~");
        alert(JSON.stringify(e));
    }, option)
}

/**
 * 组件：摇一摇
 * 关闭监听摇一摇
 */
function closeListenShake() {
    JAE.bridge.shake.stopWatch(function (e) {
        alert("关闭监听成功了哦，你再摇一摇，看是否会显示监听成功，" +
            "应该不会的，因为已经关闭了，不会在监听，也不会执行监听成功的逻辑了");
        alert(JSON.stringify(e));
    }, function (e) {
        alert("关闭失败了哦，你再摇一摇，肯定会执行监听中的逻辑，如果继续监听成功，" +
            "会执行监听成功的逻辑哦");
        alert(JSON.stringify(e));
    })
}

$('#testListenShake').on('click', function () {
    listenShake();
})

$('#testCloseListenShake').on('click', function () {
    closeListenShake();
})


/**
 * 组件：吹一吹
 * 开启吹一吹的监听
 */
function listenBlow() {
    JAE.bridge.blow.listenBlow(function (e) {
        alert("吹起监听成功，开始吹吧" + "\n" + JSON.stringify(e))
    }, function (e) {
        alert("监听失败了，你可以吹一吹，应该不会执行callback里面的逻辑哦！" + "\n" + JSON.stringify(e));
    }, function (e) {
        /*if(e.pass=="undifine"){
         alert("error:"+pass值为undifine)
         }else{
         $("#showvalue").text("吹起参数值："+ e.pass)
         }*/
        alert("监听到了，参数值为：" + e.pass)

    })
}

/**
 * 组件： 吹一吹
 *  关闭吹一吹的监听
 */
function stopListonBlow() {
    JAE.bridge.blow.stopListenBlow(function (e) {
        alert("关闭成功，再吹一下，应该不会触发监听成功吹一吹之后的blowcallback" + "\n" + JSON.stringify(e))
    }, function (e) {
        alert("关闭失败，再吹一下，还是会触发监听成功吹一吹之后的blowcallback" + "\n" + JSON.stringify(e))
    })
}

$('#blowListen').on('click', function () {
    listenBlow();
})

$('#blowCloseListen').on('click', function () {
    stopListonBlow();
})


/**
 * 组件 ：分享
 */
function shareTo() {
    var option = {
        "title": "好东西要分享哦，测试专用标题，title内容",
        "text": "大家一起来往吧，很好玩的哦，给来往做个广告吧，text内容",
        "url": "www.baidu.com",
        "image": "http://a.hiphotos.baidu.com/image/w%3D2048/sign=9f5289ba0b55b3199cf9857577918326/4d086e061d950a7b32998b7f0bd162d9f3d3c9d9.jpg"
    }
    JAE.bridge.share(function (e) {
        alert("第三方返回给我们的是分享成功哦！所以执行回调成功函数");
        alert(JSON.stringify(e));
    }, function (e) {
        alert("第三方返回给我们的有问题吧");
        alert(JSON.stringify(e));
    }, option)
}

$("#shareto").on('click', function () {
    shareTo();
})


/**
 * 组件： 分享
 */
function sharefailto() {
    var option = {
        "title": "好东西要分享哦，测试专用标题，title内容",
        "text": "大家一起来往吧，很好玩的哦，给来往做个广告吧，text内容",
        "url": "www.baidu.com"
    }
    JAE.bridge.share(function (e) {
        alert("第三方返回给我们的是分享成功哦！所以执行回调成功函数")
        alert(JSON.stringify(e));
    }, function (e) {
        alert("第三方返回给我们的有问题吧")
        alert(JSON.stringify(e));
    }, option)
}

$("#sharefail").on('click', function () {
    sharefailto();
})

/**
 * 组件：关注
 */
function followToolbar() {
    var option = {
        //userId 卖家用户Id,需要卖家进行OAuth授权，然后获取卖家Id
        userId: 2010555570
    }
    JAE.bridge.weFollow(function (e) {
        alert("执行成功回调，关注条出来了吧~");
        alert(JSON.stringify(e));
    }, function (e) {
        alert("执行失败了，关注条应该没有出来的，是什么原因呢")
        alert(JSON.stringify(e));
    }, option)
}

$("#follow").on('click', function () {
    followToolbar();
})

/**
 * 组件：获取当前网络状态
 */
function getCurrentNetwork() {
    JAE.bridge.netType(function (e) {
        alert("获取当前网络状态成功新API哦！" + JSON.stringify(e))
    }, function (e) {
        alert("获取当前网络状态失败新API哦！" + JSON.stringify(e))
    })
}


/**
 * 测试白名单  获取设备信息
 */
function getdeviceInfomation() {
    window.WindVane.api.base.getDeviceInfo(function (e) {
        alert("获取当前设备成功：" + JSON.stringify(e))
    }, function (e) {
        alert("获取当前设备失败：" + JSON.stringify(e))
    })
}
$("#testbaimindan").on('click', function () {
    getdeviceInfomation()
})




// ==================  以下 是 1.0 接口=============================



