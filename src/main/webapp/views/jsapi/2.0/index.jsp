<%@ page import="com.taobao.jae.test.util.DomainUtil" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="/views/header.jsp" %>


<!-------------------------------------                          ---->
<!-------------------------------------                          ---->
<!-------------------------------------     主客 4.0          ---->
<!-------------------------------------     2014.01.10      ---->
<!-------------------------------------                          ---->




<div class="breadcrumbs" id="breadcrumbs">
    <ul class="breadcrumb">
        <li>
            <i class="icon-home home-icon"></i>
            <a href="/">Home</a>

							<span class="divider">
								<i class="icon-angle-right arrow-icon"></i>
							</span>
        </li>
        <li class="active">JAE API 2.0</li>
    </ul>
    <!--.breadcrumb-->
</div>

<div class="widget-container">
    <div class="widget-box">
        <div class="widget-header widget-hea1der-small header-color-dark">
            <h6>开放组件</h6>

            <div class="widget-toolbar">

                <a href="#" data-action="collapse">
                    <i class="icon-chevron-up"></i>
                </a>

                <a href="#" data-action="close">
                    <i class="icon-remove"></i>
                </a>
            </div>
        </div>


        <!------------------------------------ start: 开放组件 --------------------------------------------->
        <div class="widget-body">
            <div class="widget-body-inner" style="display: block;">
                <div class="widget-main padding-4">
                    <div class="slim-scroll" data-height="125">
                        <div class="content">
                            <table class="table table-striped table-bordered bootstrap-datatable">
                                <thead>
                                <tr>
                                    <th>Name</th>
                                    <th>Actions</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td>UA属性</td>
                                    <td class="center">
                                        <button onclick="getUAInfo()">获取属性</button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>校验是否在淘宝主客</td>
                                    <td class="center">
                                        <button onclick="checkIsTaobao()">校验是否在主客</button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>bridge组件手机震动</td>
                                    <td class="center">
                                        <button id="chevibrate">校验手机震动</button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>原生的手机震动</td>
                                    <td class="center">
                                        <button id="initialvibrate">校验手机震动</button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>摇一摇组件</td>
                                    <td class="center">
                                        <button id="testListenShake">开始监听</button>
                                        <button id="testCloseListenShake">关闭监听</button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>吹一吹组件</td>
                                    <td class="center">
                                        <div id="showvalue"></div>
                                        <button id="blowListen">开始监听</button>
                                        <button id="blowCloseListen">关闭监听</button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>分享组件</td>
                                    <td class="center">
                                        <button id="shareto">点击分享</button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>分享组件有空参数</td>
                                    <td class="center">
                                        <button id="sharefail">点击分享</button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>关注组件</td>
                                    <td class="center">
                                        <button id="follow">点击关注</button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>获取当前网络类型</td>
                                    <td class="center">
                                        <button onclick="getCurrentNetwork()">获取网络类型</button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>获取设备信息</td>
                                    <td class="center">
                                        <button id="testbaimindan">设备信息不在白名单中</button>
                                    </td>
                                </tr>

                                <tr>
                                    <td>高德地图</td>
                                    <td class="center">
                                        <button><a href="/views/jsapi/2.0/amap.jsp">测试API调用</a></button>
                                    </td>
                                </tr>

                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!---------------- end: 开放组件 ------------------->

<%@ include file="/views/footer.jsp" %>
<script type="text/javascript" src="/assets/js/usr/js-open-api-2.0.js"></script>
<script type="text/javascript" src="http://g.tbcdn.cn/tb/jae-jsapi/0.2.0/jae.js"></script>
<%
    String domain = request.getServerName();
    // 日常 JS
    if (DomainUtil.getEnv(domain).value() == 10) {
        out.println("<script src='http://g.tbcdn.cn/tb/jae-jsapi/0.2.0/jae.js?t=12242049'></script>");
    }
    // 预发 JS
    if (DomainUtil.getEnv(domain).value() == 30) {
        out.println("<script src='http://g.tbcdn.cn/tb/jae-jsapi/0.2.0/jae.js?t=12242049'></script>");
    }
%>


