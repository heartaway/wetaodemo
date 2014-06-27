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
            <h6>页面权限控制</h6>

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
                                    <td>anoymous</td>
                                    <td class="center"><a target="_blank" href="/views/sso/anonymous.jsp" class="btn btn-small btn-success" >点击</a></td>
                                </tr>
                                <tr>
                                    <td>sitecustomer</td>
                                    <td class="center"><a target="_blank" href="/views/sso/sitecustomer.jsp" class="btn btn-small btn-success" >点击</a></td>
                                </tr>
                                <tr>
                                    <td>developer</td>
                                    <td class="center"><a target="_blank" href="/views/sso/developer.jsp" class="btn btn-small btn-success" >点击</a></td>
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


