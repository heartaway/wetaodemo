<%@ page import="com.taobao.jae.test.util.DomainUtil" %>
<%@ page import="com.taobao.jae.test.top.TokenPersistence" %>
<%@ page import="com.alibaba.appengine.jae.model.TaobaoTinyUser" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="/views/header.jsp" %>


<!------------------------------------- ---->
<!------------------------------------- ---->
<!------------------------------------- ---->
<!------------------------------------- 2014.03.08 ---->
<!------------------------------------- ---->


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
            <a href="/views/jsapi/3.0/index.jsp?seller_nick=<%  if(DomainUtil.getEnv(request.getServerName()).value() == 10){out.println("tae");}else{ out.println("c测试账号151");} %>">JAE API 3.0</a>
							<span class="divider">
								<i class="icon-angle-right arrow-icon"></i>
							</span>
        </li>
        <li class="active">TakePhoto</li>
    </ul>
    <!--.breadcrumb-->
</div>

<div id="uploadedImages" name="uploadedImages" >

</div>


<div class=" alert alert-success">
    <button type="button" class="close" data-dismiss="alert"><i class="icon-remove"></i></button>
    <i class="icon-umbrella bigger-120 blue"></i>
    <span id="operationInfo" class="operationInfo"></span>
</div>

<div class="widget-container">
    <div class="widget-box">
        <div class="widget-header widget-hea1der-small header-color-dark">
            <h6>拍照上传组件</h6>

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
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td class="center">
                                        <span id="takePhotoAndUpload"><a  href="#">正常调用</a></span>
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
<script type="text/javascript" src="/assets/js/usr/js-open-api-3.0.js"></script>
<script type="text/javascript" src="http://g.tbcdn.cn/tb/jae-jsapi/0.3.0/jae.js?appKey=21729740"></script>





