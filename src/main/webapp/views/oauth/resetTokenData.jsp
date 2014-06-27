<%@page import="java.lang.*" %>
<%@ page import="com.taobao.jae.test.top.TokenPersistence" %>
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
        <li class="active">重置Token数据</li>
    </ul>
    <!--.breadcrumb-->
</div>

<%
    com.taobao.jae.test.top.TokenPersistence tokenPersistence = new com.taobao.jae.test.top.TokenPersistence();
    String result = tokenPersistence.resetData() ;
    if("true".equals(result)){
        out.println("<div class=\" alert alert-success\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\"><i class=\"icon-remove\"></i></button>");
        out.println("数据重置成功。");
        out.println("</div>");
    }else{
        out.println("<div class=\" alert alert-danger\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\"><i class=\"icon-remove\"></i></button>");
        out.println(result);
        out.println("</div>");
    }
%>


<%@ include file="/views/footer.jsp" %>

