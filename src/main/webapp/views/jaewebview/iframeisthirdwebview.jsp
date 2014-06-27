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
        <li class="active">权限降级</li>
    </ul>
    <!--.breadcrumb-->
</div>


<div class="widget-container">
    <div class="widget-box">
        <div class="widget-header widget-hea1der-small header-color-dark">
            <h6>JaeWebView-内嵌外部域iframe-页面</h6>

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
                            <div class="row-fluid">
                                <span>外层为JaeWebView，iframe为三方域名</span> <br/>

                                <button class="btn btn-small btn-success" onclick="getCurrentWebviewEnvrionment()">
                                    获取环境
                                </button>
                                <span>[<span class="getCurrentWebviewEnvrionment"></span>]</span>
                                <br/>
                                <span>预期为：点击“获取环境”按钮后提示在JaeWebView(单外部连接被拦截)</span>
                                <br/>
                                <iframe src="http://www.baidu.com" width="100" height="100">
                                    <span>Inner of iframe is Third WebView</span>
                                </iframe>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<%@ include file="/views/footer.jsp" %>
<script type="text/javascript" src="/assets/js/usr/jaewebview.js"></script>


