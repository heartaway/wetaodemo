<%@ page import="com.taobao.jae.test.util.DomainUtil" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="/views/header.jsp" %>
<div class="navbar">
    <div class="navbar-inner">
        <div class="container-fluid">
            <a href="#" class="brand">
                <small>
                    <i class="icon-cloud"></i>
                    JAE无线DEMO
                </small>
            </a><!--/.brand-->
        </div>
        <!--/.container-fluid-->
    </div>
    <!--/.navbar-inner-->
</div>


<div class="sidebar" id="sidebar">

    <ul class="nav nav-list">

        <li>
            <a href="#" class="dropdown-toggle">
                <i class=" icon-heart red"></i>
                <span class="menu-text">Js API</span>
                <b class="arrow icon-angle-down"></b>
            </a>
            <ul class="submenu">
                <li>
                    <a href="/views/jsapi/3.0/index.jsp?seller_nick=<%  if(DomainUtil.getEnv(request.getServerName()).value() == 10){out.println("tae");}else{ out.println("c测试账号151");} %>">
                        <i class="icon-double-angle-right"></i>
                        API 3.0
                    </a>
                </li>
                <li>
                    <a href="/views/jsapi/2.0/index.jsp?seller_nick=<%  if(DomainUtil.getEnv(request.getServerName()).value() == 10){out.println("tae");}else{ out.println("c测试账号151");} %>">
                        <i class="icon-double-angle-right"></i>
                        API 2.0
                    </a>
                </li>
            </ul>
        </li>

        <li>
            <a href="/views/oauth/index.jsp?seller_nick=<%  if(DomainUtil.getEnv(request.getServerName()).value() == 10){out.println("tae");}else{ out.println("c测试账号151");} %>">
                <i class=" icon-key "></i>
                买家授权
            </a>
        </li>

    </ul>
    <!--/.nav-list-->
</div>
<!--/.sidebar-->

<div class="alert alert-info">
    <button type="button" class="close" data-dismiss="alert">×</button>
    说明：关注组件参数由snsId变更为userId，2014-5-20.
</div>

<%@ include file="/views/footer.jsp" %>
