<%@ page import="com.taobao.jae.test.top.TokenPersistence" %>
<%@ page import="java.sql.ResultSet" %>
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
            <a href="/views/oauth/index.jsp?seller_nick=<%  if(DomainUtil.getEnv(request.getServerName()).value() == 10){out.println("tae");}else{ out.println("c测试账号151");} %>">OAuth</a>
							<span class="divider">
								<i class="icon-angle-right arrow-icon"></i>
							</span>
        </li>
        <li class="active">查看Token数据</li>
    </ul>
    <!--.breadcrumb-->
</div>

<%
    TokenPersistence tokenPersistence = new TokenPersistence();
    ResultSet queryData = tokenPersistence.queryAllData();
    out.println("<table class=\"table table-striped table-bordered table-hover\"><thead><th>AppKey</th><th>Seller Nick</th><th>Token</th></thead><tbody>");
    while (queryData.next()) {
        out.println("<tr>");
        out.println("<td>" + queryData.getString("app_key") + "</td>");
        out.println("<td>" + queryData.getString("seller_nick") + "</td>");
        out.println("<td>" + queryData.getString("token") + "</td>");
        out.println("</tr>");
    }
    tokenPersistence.closeConnetion();
    out.println("</tbody></table>");
%>

<%@ include file="/views/footer.jsp" %>

