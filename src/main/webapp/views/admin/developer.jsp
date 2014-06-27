<%@ page import="com.alibaba.appengine.jae.model.TaobaoTinyUser" %>
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
        <li class="active">页面权限</li>
    </ul><!--.breadcrumb-->
</div>

<div class="widget-container">
    <div class="widget-box">
        <div class="widget-header widget-hea1der-small header-color-dark">
            <h6>Developer-页面</h6>

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
                            <span>只有App拥有者才能查看此页面.</span>
                            <div>
                                <%
                                    String mixUserNick = "淘宝用户混淆Nick";
                                    //图片URI服务地址： /_RS/user/picture?mixUserNick=${mixUserNick}
                                    //获取当前登录用户 com.alibaba.appengine.jae.model.TaobaoTinyUser
                                    TaobaoTinyUser taobaoTinyUser = (TaobaoTinyUser) session.getAttribute(TaobaoTinyUser.SESSION_KEY);
                                    if (taobaoTinyUser != null) {
                                        mixUserNick = taobaoTinyUser.getTaobaoUserNick();
                                    }
                                %>
                                当前登录用户是<%=mixUserNick%>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="/views/footer.jsp" %>
