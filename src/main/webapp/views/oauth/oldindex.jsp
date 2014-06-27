<%@ page import="org.apache.commons.lang3.StringUtils" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.io.StringWriter" %>
<%@ page import="com.taobao.jae.test.util.HttpConnection" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ page import="com.alibaba.appengine.jae.model.TaobaoTinyUser" %>
<%@ page import="com.taobao.jae.test.top.TokenPersistence" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.taobao.jae.test.util.DomainUtil" %>
<%@ page import="java.util.TreeMap" %>
<%@ page import="com.taobao.jae.test.util.JsonUtil" %>
<%@ page import="com.taobao.jae.test.util.EnvGroup" %>
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
        <li class="active">买家授权</li>
    </ul>
    <!--.breadcrumb-->
</div>

<%
    if ("true".equals(request.getParameter("formSubmit"))) {
        TokenPersistence tokenPersistence = new TokenPersistence();
        try {
            StringBuilder requestUrl = new StringBuilder();
            StringBuilder redirectUrl = new StringBuilder();
            String domain = request.getServerName();
            long timeStamp = System.currentTimeMillis();
            if (!domain.contains("http://")) {
                domain = "http://" + domain;
            }
            if (!domain.endsWith("/")) {
                domain = domain + "/";
            }
            // 获取域名前缀
            String urlPrefix = DomainUtil.getWeTaoPrefix(domain);
            int env =DomainUtil.getEnv(domain).value();
            //根据不同环境拼装 回调URL
            if (10==env) {
                //日常环境    格式：testfrontkey.we.app.jae.waptest.taobao.com
                redirectUrl.append(urlPrefix);
                redirectUrl.append("we.app.jae.waptest.taobao.com/");
            } else if (20==env) {
                // 预发环境   格式：testfrontkey.we.app.jae.wapa.taobao.com
                redirectUrl.append(urlPrefix);
                redirectUrl.append("we.app.jae.wapa.taobao.com/");
            } else if (30==env) {
                // 线上环境   格式：testfrontkey.we.app.jae.m.taobao.com
                redirectUrl.append(urlPrefix);
                redirectUrl.append("we.app.jae.m.taobao.com/");
            } else {
                out.println("参数错误");
            }
            redirectUrl.append("views/oauth/index.jsp");

            String appKey = StringUtils.trim(request.getParameter("appkey"));
            String sellerNick = StringUtils.trim(request.getParameter("seller_nick"));
            String appSecret = StringUtils.trim(request.getParameter("appSecret"));

            if (StringUtils.isBlank(sellerNick)) {
                if (10==env) {
                    sellerNick = "tae";
                } else {
                    sellerNick = "c测试账号151";
                }
            }

            TreeMap<String, String> map = new TreeMap<String, String>();
            map.put("client_id", appKey);
            map.put("seller_nick", sellerNick);
            map.put("redirect_uri", redirectUrl.toString());
            map.put("timestamp", String.valueOf(timeStamp));
            String sign = tokenPersistence.createParamsSign(map, appSecret);

            requestUrl.append(domain);
            requestUrl.append("_jae_auth?timestamp=");
            requestUrl.append(String.valueOf(timeStamp));
            requestUrl.append("&redirect_uri=");
            requestUrl.append(redirectUrl.toString());
            requestUrl.append("&seller_nick=");
            requestUrl.append(sellerNick);
            requestUrl.append("&client_id=");
            requestUrl.append(appKey);

            requestUrl.append("&sign=");
            requestUrl.append(sign);

            //获取当前登录用户 com.alibaba.appengine.jae.model.TaobaoTinyUser
            String mixUserNick = "淘宝用户混淆Nick";
            TaobaoTinyUser taobaoTinyUser = (TaobaoTinyUser) session.getAttribute(TaobaoTinyUser.SESSION_KEY);
            if (taobaoTinyUser != null) {
                mixUserNick = taobaoTinyUser.getTaobaoUserNick();
            }
            //将 小二测试时填写的关键数据存储到 数据库中
            String savePreDataResult = tokenPersistence.savePreData(appKey, appSecret, sellerNick, mixUserNick, redirectUrl.toString(), String.valueOf(env), String.valueOf(timeStamp));
            if ("true".equals(savePreDataResult)) {
                out.println("<div class=\" alert\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\"><i class=\"icon-remove\"></i></button><i class=\"icon-umbrella bigger-120 blue\"></i>");
                out.println("<button class=\"btn btn-primary btn-purple\"><i class=\"icon-bell-alt icon-animated-bell\"></i><a href='");
                out.println(requestUrl.toString());
                out.println("'>引导授权");
                out.println("</a></button>");
                out.println("</div>");
            } else {
                out.println(savePreDataResult);
            }
        } catch (Throwable e) {
            StringWriter sw = new StringWriter();
            PrintWriter pw = new PrintWriter(sw);
            e.printStackTrace(pw);
            out.print(sw.toString());
        }
    }
%>

<%
    //  使用 coden 码 换取 token 值
    if (StringUtils.isNotBlank(request.getParameter("code"))) {
        TokenPersistence tokenPersistence = new TokenPersistence();
        HttpConnection hc = HttpConnection.getInstance(60 * 1000, 30 * 1000);
        //获取当前登录用户 com.alibaba.appengine.jae.model.TaobaoTinyUser
        String mixUserNick = "淘宝用户混淆Nick";
        TaobaoTinyUser taobaoTinyUser = (TaobaoTinyUser) session.getAttribute(TaobaoTinyUser.SESSION_KEY);
        if (taobaoTinyUser != null) {
            mixUserNick = taobaoTinyUser.getTaobaoUserNick();
        }
        String sellerNick = request.getParameter("seller_nick");
        if (StringUtils.isBlank(sellerNick)) {
            out.println("<div class=\" alert alert-danger\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\"><i class=\"icon-remove\"></i></button><i class=\"icon-umbrella bigger-120 blue\"></i>");
            out.println("<span>注意：授权后seller_nick丢失。</span>");
            out.println("<span>DEMO尝试数据重补。</span></div>");
            sellerNick = "tae";
        }
        //根据当前用户信息，查询之前已经输入的appKey、secret、sellerNick等信息。
        ResultSet resultSet = tokenPersistence.getPreData(mixUserNick, sellerNick);
        String env = "";
        Map<String, String> param = new HashMap<String, String>();
        param.put("grant_type", "authorization_code");
        param.put("code", request.getParameter("code"));

        if (resultSet != null && resultSet.next()) {
            resultSet.last();
            param.put("client_id", resultSet.getString("app_key"));
            param.put("client_secret", resultSet.getString("app_secret"));
            param.put("redirect_uri", resultSet.getString("redirect_url"));
            env = resultSet.getString("env");
        } else {
            out.println("<div class=\" alert alert-danger\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\"><i class=\"icon-remove\"></i></button><i class=\"icon-umbrella bigger-120 blue\"></i>");
            out.println("<span>获取DB数据异常</span></div>");
        }
        tokenPersistence.closeConnetion();
        String oAuthUrl = "";
        if ("10".equals(env)) {
            oAuthUrl = "https://oauth.daily.taobao.net/token";
        } else if ("20".equals(env)) {
            oAuthUrl = "https://oauth.taobao.com/token";
        } else if ("30".equals(env)) {
            oAuthUrl = "https://oauth.taobao.com/token";
        } else {
            out.println("Env 参数错误。");
        }
        String responseJson = hc.fetchByPost(oAuthUrl, param);
        Map<String, String> tokenInfo = JsonUtil.parseJsonString2Map(responseJson);

        if (tokenInfo != null && tokenInfo.get("access_token") != null) {
            String token = tokenInfo.get("access_token");
            out.println("<div class=\" alert alert-success\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\"><i class=\"icon-remove\"></i></button><i class=\"icon-umbrella bigger-120 blue\"></i>TOKEN 信息如下:");
            out.println("<p>UserId: " + tokenInfo.get("taobao_user_id") + "</p>");
            out.println("<p>UserNick: " + tokenInfo.get("taobao_user_nick") + "</p>");
            out.println("<p>AccessToken: ");
            StringBuilder piece = new StringBuilder();
            for (int i = 0; i < token.length(); i++) {
                piece.append(token.charAt(i));
                if (piece.toString().length() >= 35) {
                    out.println("<p>" + piece.toString() + "</p>");
                    piece = new StringBuilder();
                }
            }
            out.println("</div>");
            tokenPersistence.saveToken(tokenInfo.get("access_token"), request.getParameter("code"), mixUserNick);
        } else {
            out.println("<div class=\" alert alert-success\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\"><i class=\"icon-remove\"></i></button><i class=\"icon-umbrella bigger-120 blue\"></i>TOKEN 信息如下:");
            out.println("<p>使用code换取token失败</p>");
            out.println("<p>" + responseJson + "</p>");
            out.println("</div>");
        }


    }

%>


<div class="widget-container">
    <div class="widget-box">
        <div class="widget-header widget-hea1der-small header-color-dark">
            <h6>自定义参数 进行买家授权</h6>

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
            <div class="widget-main">
                <form action="/views/oauth/index.jsp?seller_nick=<%out.println(StringUtils.trim(request.getParameter("seller_nick")));%>"
                      method="post">
                    <input name="formSubmit" value="true" type="hidden">

                    <div class="control-group">
                        <label class="control-label" for="form-field-1">Seller Nick</label>
                        <%
                            String domain = request.getServerName();
                            EnvGroup env = DomainUtil.getEnv(domain);
                        %>

                        <div class="controls">
                            <div class="input-prepend ">
                                <input id="form-field-1" name="seller_nick" class="input-medium" type="text" readonly
                                       value="<%
                                                if (StringUtils.isNotBlank(request.getParameter("seller_nick"))) {
                                                out.println(request.getParameter("seller_nick"));
                                                } else if("10".equals(env.value())){
                                                        out.println("tae");
                                                } else {
                                                        out.println("c测试账号151");
                                                }
                                                %>">

                            </div>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="form-field-2">Appkey</label>

                        <div class="controls">
                            <div class="input-prepend">
                                <input id="form-field-2" name="appkey" class="input-medium " type="text"
                                       placeholder=""
                                       value="<%
                                                if (StringUtils.isNotBlank(request.getParameter("appkey"))) {
                                                out.println(request.getParameter("appkey"));
                                                } else if("10".equals(env.value())){
                                                        out.println("682948");
                                                } else{
                                                        out.println("21729740");
                                                }
                                                %>">
                            </div>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="form-field-3">AppSecret</label>

                        <div class="controls">
                            <div class="input-prepend">
                                <input id="form-field-3" name="appSecret" class="input-medium " type="text"
                                       placeholder=""
                                       value="<%
                                                if (StringUtils.isNotBlank(request.getParameter("appSecret"))) {
                                                out.println(request.getParameter("appSecret"));
                                                } else if("10".equals(env.value())){
                                                        out.println("9ca2211fe6858183ce0eddbb0ac8e56c ");   // 对应的app： wetaojavatest
                                                }else{
                                                        out.println("6d43abf1e05cb5ce6cd24e6cb8611a55");     // 对应的app： wethirdopen
                                                }
                                                %>">
                            </div>
                        </div>
                    </div>

                    <div class="form-actions">
                        <button class="btn btn-info" type="submit">
                            <i class="icon-ok bigger-110"></i>
                            输入参数
                        </button>
                    </div>

                </form>
            </div>

            <div class="widget-toolbox padding-8 clearfix">
                <button class="btn btn-mini btn-danger pull-left">
                    <i class="icon-refresh"></i>
                    <a href="/views/oauth/resetTokenData.jsp">重置Token存储数据</a>
                </button>

                <button class="btn btn-mini btn-success pull-right">
                    <a href="/views/oauth/queryTokenData.jsp">查看Token存储数据</a>
                    <i class=" icon-eye-open icon-on-right"></i>
                </button>
            </div>
        </div>
    </div>
</div>


<%@ include file="/views/footer.jsp" %>


