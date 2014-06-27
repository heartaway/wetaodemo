<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="/views/header.jsp" %>

<div class="breadcrumbs" id="breadcrumbs">
    <ul class="breadcrumb">
        <li>
            <i class="icon-home home-icon"></i>
            <a href="/">Home</a>

							<span class="divider">
								<i class="icon-angle-right arrow-icon"></i>
							</span>
        </li>
        <li class="active">页面安全</li>
    </ul><!--.breadcrumb-->
</div>

   <!------------------------------------ start: 安全测试用例 --------------------------------------------->

<div class="widget-container">
    <div class="widget-box">
        <div class="widget-header widget-hea1der-small header-color-dark">
            <h6>安全测试用例</h6>

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
                                    <td>第三方站点打开链接安全检查</td>
                                    <td class="center">
                                        <a href="taobao://m.taobao.com/?weburl=http://www.baidu.com">使用taobao协议跳转</a><br>
                                        <a href="taobao://m.taobao.com.baidu.com">使用taobao协议跳转2</a><br>
                                        <a href="taobao://www.baidu.com">使用taobao协议跳转3</a><br>
                                        <a href="http://www.baidu.com">使用taobao协议跳转4</a><br>
                                        <a href="http://m.taobao.com&action=test@www.baidu.com">使用taobao协议跳转5</a><br>

                                        <a href="http://m.taobao.com;.baidu.com/">URL变种测试1</a><br>
                                        <a href="http://m.taobao.com\@www.baidu.com">URL变种测试2</a><br>
                                        <a href="///////www.baidu.com">URL变种测试3</a><br>
                                        <a href="\\\\\\\www.baidu.com">URL变种测试4</a><br>
                                        <a href="http://ⅅʳºℙˢ.ʷººʸⓊⁿ.ºʳℊ">URL变种测试5</a><br>
                                        <a href="http://m.taobao.com@baidu.com#">URL变种测试6</a><br>
                                        <a href="http://m.taobao.com@baidu.com">URL变种测试7</a><br>
                                        <a href="http:m.taobao.com@qq.com">URL变种测试8</a><br>
                                        <a href="http://0016373751032">URL变种测试9</a><br>
                                        <a href="http://m.taobao.com&action=test@www.baidu.com">URL变种测试10</a><br>
                                        <a href="http://m.taobao.com&action=test@016373751032">URL变种测试11</a><br>

                                    </td>
                                    <td>不提示打开链接</td>
                                </tr>


                                <tr>
                                    <td>iframe 安全测试</td>
                                    <td class="center">
                                        <a href="iframe1.html">iframe 1</a>
                                    </td>
                                    <td>iframe 成功</td>
                                </tr>

                                <tr>
                                    <td>JS跳转链接</td>
                                    <td class="center">
                                        <a onclick="window.location.href='http://www.baidu.com'">iframe 1</a>
                                    </td>
                                    <td>跳转成功</td>
                                </tr>

                                <tr>
                                    <td>激活与休眠Fuzz</td>
                                    <td class="center">
                                        <button class="btn btn-small btn-success" onclick="while(i<99){stopListenShake();startListenShake();}">
                                            启动
                                        </button>
                                    </td>
                                    <td></td>
                                </tr>


                                <tr>
                                    <td>恶意Javascript</td>
                                    <td class="center">
                                        <<a href ="js.html">访问</a>
                                    </td>
                                    <td></td>
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


<%@ include file="/views/footer.jsp" %>


