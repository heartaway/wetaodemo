<%@ page import="com.taobao.jae.test.util.DomainUtil" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.taobao.jae.test.top.TokenPersistence" %>
<%@ page import="com.alibaba.appengine.jae.model.TaobaoTinyUser" %>
<%@ page import="org.apache.commons.lang3.StringUtils" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="/views/header.jsp" %>


<%
    //获取用户token  ，如果存在的话。
    String mixUserNick = "淘宝用户混淆Nick";
    TaobaoTinyUser taobaoTinyUser = (TaobaoTinyUser) session.getAttribute(TaobaoTinyUser.SESSION_KEY);
    if (taobaoTinyUser != null) {
        mixUserNick = taobaoTinyUser.getTaobaoUserNick();
    }
    TokenPersistence tokenPersistence = new TokenPersistence();
    ResultSet resultSet = tokenPersistence.getToken(mixUserNick);
    String token = "";
    if (resultSet != null && resultSet.next()) {
        resultSet.last();
        token = resultSet.getString("token");
    }
    tokenPersistence.closeConnetion();
%>
<input type="hidden" id="tokenInDB" name="tokenInDB" value="<%  out.println(token.trim()); %>">

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
        <li class="active">GPS</li>
    </ul>
    <!--.breadcrumb-->
</div>


<div class=" alert alert-success">
    <button type="button" class="close" data-dismiss="alert"><i class="icon-remove"></i></button>
    <i class="icon-umbrella bigger-120 blue"></i>
    <span id="operationInfo" class="operationInfo">
        <%
            if (StringUtils.isNotBlank(token)) {
                out.println("已获取到用户授权token");
            }else{
                out.println("没有token信息，请先到首页进行’买家授权‘。");
            }
        %></span>
</div>


<div class="widget-container">
    <div class="widget-box">
        <div class="widget-header widget-hea1der-small header-color-dark">
            <h6>GPS组件</h6>

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
                                        <button id="getLocation" name="getLocation">正常调用</button>
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





