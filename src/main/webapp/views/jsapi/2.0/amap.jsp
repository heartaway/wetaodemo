<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE HTML>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <TITLE>JAE微淘测试</TITLE>
    <meta charset="UTF-8"/>
    <meta name="description" content="overview &amp; stats"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <!--basic styles-->
    <link href="/assets/css/bootstrap.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="/assets/css/font-awesome.min.css"/>
    <!--page specific plugin styles-->
    <!--ace styles-->
    <link rel="stylesheet" href="/assets/css/ace.m.min.css"/>

    <!--inline styles related to this page-->
    <link rel="stylesheet" type="text/css" href="http://api.amap.com/Public/css/demo.Default.css"/>
    <script language="javascript" src="http://webapi.amap.com/maps?v=1.2&key=f79b57e757554819ffd39451a44cf97c"></script>
    <script language="javascript">
        var mapObj, toolBar, locationInfo;

        //初始化地图对象，加载地图
        function mapInit() {
            mapObj = new AMap.Map("iCenter");
            //地图中添加地图操作ToolBar插件
            mapObj.plugin(["AMap.ToolBar"], function () {
                toolBar = new AMap.ToolBar(); //设置地位标记为自定义标记
                mapObj.addControl(toolBar);
                AMap.event.addListener(toolBar, 'location', function callback(e) {
                    locationInfo = e.lnglat;
                });
            });
        }

        //获取定位位置信息
        function showLocationInfo() {
            var locationX = locationInfo.lng; //定位坐标经度值
            var locationY = locationInfo.lat; //定位坐标纬度值
            document.getElementById('info').innerHTML = "定位点坐标：(" + locationX + "," + locationY + ")";
        }
    </script>
</HEAD>
<BODY onLoad="mapInit()">
<div class="main-container container-fluid" style="width:320px;margin:0 auto;">
    <div class="row-fluid">


        <div><span>高德地图测试：</span></div>
        <div style="padding:2px 0px 0px 5px;font-size:12px">
            <input type="button" value="开始定位" onClick="javascript:toolBar.doLocation()"/>
            <input type="button" value="显示位置信息" onClick="javascript:showLocationInfo()"/>

            <div id="info" style="margin-top:10px;margin-left:10px"></div>
        </div>
        <div id="iCenter"></div>

    </div>
</div>
</BODY>
</HTML>


