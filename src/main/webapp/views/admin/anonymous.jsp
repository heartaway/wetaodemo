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
            <h6>Anonymous-页面</h6>

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
                            <div>
                                任何人都可以访问此页面，无需登录
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="/views/footer.jsp" %>



