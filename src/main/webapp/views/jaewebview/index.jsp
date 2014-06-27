<%@ page import="com.taobao.jae.test.util.DomainUtil" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="/views/header.jsp" %>

<div class="breadcrumbs" id="breadcrumbs">
    <ul class="breadcrumb">
        <li>
            <i class="icon-home home-icon"></i>
            <a href="/views/index.jsp?seller_nick=<%  if(DomainUtil.getEnv(request.getServerName()).value() == 10){out.println("tae");}else{ out.println("c测试账号151");} %>">Home</a>

							<span class="divider">
								<i class="icon-angle-right arrow-icon"></i>
							</span>
        </li>
        <li>
            <a href="/views/jaewebview/index.jsp?seller_nick=<%  if(DomainUtil.getEnv(request.getServerName()).value() == 10){out.println("tae");}else{ out.println("c测试账号151");} %>">JaeWebView</a>

							<span class="divider">
								<i class="icon-angle-right arrow-icon"></i>
							</span>
        </li>
        <li class="active">功能列表</li>
    </ul>
    <!--.breadcrumb-->
</div>


<!------------------------------------ start: 资源管控 --------------------------------------------->

<div class="widget-container">
    <div class="widget-box">
        <div class="widget-header widget-hea1der-small header-color-dark">
            <h6>资源管控</h6>

            <div class="widget-toolbar">

                <a href="#" data-action="collapse">
                    <i class="icon-chevron-up"></i>
                </a>

                <a href="#" data-action="close">
                    <i class="icon-remove"></i>
                </a>
            </div>
        </div>

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
                                    <th>Expect</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td>阿里域内图片</td>
                                    <td class="center"><img
                                            src="http://gtms01.alicdn.com/tps/i1/T151f9FohdXXXbwKP7-520-280.png"
                                            alt="域内图片" width="50"/></td>
                                    <td>图片展示正常</td>
                                </tr>

                                <tr>
                                    <td>阿里域外图片</td>
                                    <td class="center"><img
                                            src="http://h.hiphotos.baidu.com/image/w%3D2048/sign=d6778987b21bb0518f24b4280242dbb4/f603918fa0ec08fa2e3d960258ee3d6d55fbda52.jpg"
                                            alt="域外图片" width="50"/></td>
                                    <td>不展示此图片</td>
                                </tr>

                                <tr>
                                    <td>跳转域内网址</td>
                                    <td class="center">
                                        <a href="http://wetaojavatest.we.aliapp-inc.com/">*.aliapp-inc.com</a>
                                        <a href="http://weitaodemojava.we.jaeapp.com/">*.jaeapp.com</a>
                                        <a href="http://api.amap.com/">*.amap.com</a>
                                    </td>
                                    <td>可以打开(无提醒)</td>
                                </tr>
                                <tr>
                                    <td>跳转域外网址</td>
                                    <td class="center"><a
                                            href="http://yanmingming.sinaapp.com/wp-content/themes/jaetest/js/outAliPage.html"
                                            class="btn btn-small btn-success">请求</a>
                                    </td>
                                    <td>可以打开(有提醒,webview会被降级)</td>
                                </tr>

                                <tr>
                                    <td>Ajax请求域内文件</td>
                                    <td class="center">
                                        <button class="btn btn-small btn-success"
                                                onclick="ajaxRequestUrlInnerAliDomain()">
                                            请求
                                        </button>
                                        <span>结果：[<span class="ajaxrequesturlinneralidomain"></span>]</span>
                                    </td>
                                    <td>[符合预期]</td>
                                </tr>
                                <tr>
                                    <td>Ajax请求域外文件</td>
                                    <td class="center">

                                        <button class="btn btn-small btn-success"
                                                onclick="ajaxRequestUrlOutofAliDomain()">
                                            请求
                                        </button>
                                        <span>结果：[<span class="ajaxrequesturloutofalidomain"></span>]</span>
                                    </td>
                                    <td>[符合预期]</td>
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
<!---------------- end: 资源管控 ------------------->


<!------------------------------------ start: 激活与休眠 --------------------------------------------->

<div class="widget-container">
    <div class="widget-box">
        <div class="widget-header widget-hea1der-small header-color-dark">
            <h6>激活与休眠</h6>

            <div class="widget-toolbar">

                <a href="#" data-action="collapse">
                    <i class="icon-chevron-up"></i>
                </a>

                <a href="#" data-action="close">
                    <i class="icon-remove"></i>
                </a>
            </div>
        </div>

        <div class="widget-body">
            <div class="widget-body-inner" style="display: block;">
                <div class="widget-main padding-4">
                    <div class="slim-scroll" data-height="125">
                        <div class="content">
                            <audio class="activitySleepAndLiveMusic" style="width:0px;height:0px;" src=""
                                   preload="auto"></audio>
                            <embed src="" class="activitySleepAndLiveMusic" loop=false width="0" height="0">
                            <button class="btn btn-small btn-success" onclick="startListenShake()">
                                启动
                            </button>
                            <button class="btn btn-small btn-success" onclick="stopListenShake()">
                                关闭
                            </button>
                            摇一摇 响铃<span class="currentMusicActivityStatus"></span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!---------------- end: 激活与休眠 ------------------->


<!------------------------------------ start: 开放接口 --------------------------------------------->
<div class="widget-container">
    <div class="widget-box">
        <div class="widget-header widget-hea1der-small header-color-dark">
            <h6>开放接口</h6>

            <div class="widget-toolbar">

                <a href="#" data-action="collapse">
                    <i class="icon-chevron-up"></i>
                </a>

                <a href="#" data-action="close">
                    <i class="icon-remove"></i>
                </a>
            </div>
        </div>

        <div class="widget-body">
            <div class="widget-body-inner" style="display: block;">
                <div class="widget-main padding-4">
                    <div class="slim-scroll" data-height="125">
                        <div class="content">
                            <table class="table table-striped table-bordered bootstrap-datatable">
                                <thead>
                                <tr>
                                    <th>Api name</th>
                                    <th>Actions</th>
                                    <th>Expect</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td>getEnvrionment</td>
                                    <td class="center">
                                        <button class="btn btn-small btn-success"
                                                onclick="getCurrentWebviewEnvrionment()">
                                            获取环境
                                        </button>
                                        [<span class="getCurrentWebviewEnvrionment"></span>]
                                    </td>
                                    <td>JAE-WV</td>
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
<!---------------- end: 开放接口 ------------------->

<!------------------------------------ start: Iframe 降级处理 -------------------------------------->
<div class="widget-container">
    <div class="widget-box">
        <div class="widget-header widget-hea1der-small header-color-dark">
            <h6>Iframe 降级处理</h6>

            <div class="widget-toolbar">

                <a href="#" data-action="collapse">
                    <i class="icon-chevron-up"></i>
                </a>

                <a href="#" data-action="close">
                    <i class="icon-remove"></i>
                </a>
            </div>
        </div>

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
                                    <td>Iframe为三方Webview</td>
                                    <td class="center"><a href="/views/jaewebview/iframeisthirdwebview.jsp?seller_nick=<%  if(DomainUtil.getEnv(request.getServerName()).value() == 10){out.println("tae");}else{ out.println("c测试账号151");} %>"
                                                          class="btn btn-small btn-success">测试</a></td>
                                </tr>
                                <tr>
                                    <td>Iframe为通用Webview</td>
                                    <td class="center"><a href="/views/jaewebview/iframeistbwebview.jsp?seller_nick=<%  if(DomainUtil.getEnv(request.getServerName()).value() == 10){out.println("tae");}else{ out.println("c测试账号151");} %>"
                                                          class="btn btn-small btn-success">测试</a></td>
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
<!---------------- end: Iframe 降级处理------------------->


<%@ include file="/views/footer.jsp" %>
<script type="text/javascript" src="/assets/js/usr/jaewebview.js"></script>
<script type="text/javascript" src="http://g.tbcdn.cn/tb/jae-jsapi/0.3.0/jae.js?appKey=21729740"></script>


