package com.taobao.jae.test.top;

import com.taobao.jae.test.util.DomainUtil;
import org.apache.commons.codec.digest.DigestUtils;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;

public class TokenPersistence {
    Logger logger = LoggerFactory.getLogger("TokenPersistence");
    Connection connection = getConnection();

    public TokenPersistence() {
    }

    /**
     * 获取 Token数据
     */
    public ResultSet getToken(String mixUserNick) {
        ResultSet queryData = null;
        connection = getConnection();
        try {
            Statement statement = null;
            statement = connection.createStatement();
            queryData = statement.executeQuery("select * from  jae_oauth_token where mix_user_nick ='" + mixUserNick + "' and token !=''");
        } catch (Exception e) {
        }
        return queryData;
    }

    /**
     * 存储 生成Token数据
     */
    public void saveToken(String token, String code, String mixUserNick) {
        connection = getConnection(); // 首先要获取连接，即连接到数据库
        try {
            Statement statement = connection.createStatement();
            StringBuilder dataSql = new StringBuilder();
            dataSql.append("update   jae_oauth_token set  token=");
            dataSql.append("'").append(token).append("' ,code=");
            dataSql.append("'").append(code).append("'  ");
            dataSql.append(" where mix_user_nick='");
            dataSql.append(mixUserNick).append("';");
            statement.executeUpdate(dataSql.toString());
        } catch (Exception e) {
        } finally {
            try {
                connection.close();
            } catch (Exception e) {
                logger.error("数据库关闭失败");
            }
        }
    }


    /**
     * 存储 生成Token前的部分数据
     */
    public String savePreData(String appKey, String appSecret, String sellerNick, String mixUserNick, String redirectUrl, String env, String timestamp) {
        connection = getConnection(); // 首先要获取连接，即连接到数据库
        String result = "true";
        try {
            Statement statement = connection.createStatement();
            StringBuilder dataSql = new StringBuilder();
            dataSql.append("insert into  jae_oauth_token (app_key,app_secret,seller_nick,mix_user_nick,redirect_url,env,timestamp) values(");
            dataSql.append("'").append(appKey).append("',");
            dataSql.append("'").append(appSecret).append("',");
            dataSql.append("'").append(sellerNick).append("',");
            dataSql.append("'").append(mixUserNick).append("',");
            dataSql.append("'").append(redirectUrl).append("',");
            dataSql.append("'").append(env).append("',");
            dataSql.append("'").append(timestamp).append("');");

            statement.executeUpdate(dataSql.toString());
        } catch (Exception e) {
            result = e.getMessage();
        } finally {
            try {
                connection.close();
            } catch (Exception e) {
                logger.error("数据库关闭失败");
                result = e.getMessage();
            }
        }
        return result;
    }


    /**
     * 获取 生成Token前的部分数据
     */
    public ResultSet getPreData(String mixUserNick, String sellerNick) {
        ResultSet queryData = null;
        connection = getConnection();
        try {
            Statement statement = null;
            statement = connection.createStatement();
            queryData = statement.executeQuery("select * from  jae_oauth_token where mix_user_nick ='" + mixUserNick + "' and seller_nick='" + sellerNick + "';");
        } catch (Exception e) {
        }
        return queryData;
    }


    /* 获取数据库连接的函数*/
    private Connection getConnection() {
        Connection con = null;  //创建用于连接数据库的Connection对象
        try {
            Class.forName("com.mysql.jdbc.Driver");// 加载Mysql数据驱动
            con = DriverManager.getConnection(
                    "jdbc:mysql://42.120.125.10:3306/huamin_dev", "huamin_dev", "huamin_dev");// 创建数据连接
        } catch (Exception e) {
            logger.error("数据库连接失败");
        }
        return con; //返回所建立的数据库连接
    }

    /**
     * 删除表中所有数据,没有表时新建表。
     *
     * @return
     */
    public String resetData() {
        connection = getConnection();
        String result = "true";
        try {
            Statement statement = null;
            statement = connection.createStatement();
            statement.execute("DROP TABLE IF EXISTS jae_oauth_token;");
            statement.execute("CREATE TABLE jae_oauth_token (id int(10)  primary key not  null  auto_increment,app_key varchar(30),app_secret varchar(128),seller_nick varchar(50),mix_user_nick varchar(256),redirect_url varchar(256),env varchar(10),timestamp varchar(30),code varchar(128),token varchar(256)) ENGINE=InnoDB DEFAULT CHARSET=utf8");
        } catch (Exception e) {
            result = e.getMessage();
        } finally {
            try {
                connection.close();
            } catch (Exception e) {
                logger.error("数据库关闭失败");
            }
        }
        return result;
    }

    /**
     * 查询所有 Token数据
     *
     * @return
     */
    public ResultSet queryAllData() {
        ResultSet queryData = null;
        connection = getConnection();
        try {
            Statement statement = null;
            statement = connection.createStatement();
            queryData = statement.executeQuery("select * from  jae_oauth_token;");
        } catch (Exception e) {
        }
        return queryData;
    }

    public void closeConnetion() {
        try {
            if (!connection.isClosed()) {
                connection.close();
            }
        } catch (Exception e) {
            logger.error("数据库关闭失败");
        }
    }

    /**
     * 根据参数创建 sign 签名
     *
     * @param params
     * @param appSecret
     * @return
     */
    public String createParamsSign(TreeMap<String, String> params, String appSecret) {
        StringBuilder paramsString = new StringBuilder();
        Set<Map.Entry<String, String>> paramsEntry = params.entrySet();
        for (Map.Entry<String, String> paramEntry : paramsEntry) {
            paramsString.append(paramEntry.getKey()).append(paramEntry.getValue());
        }
        String sign = null;
        try {
            sign = DigestUtils.md5Hex((paramsString.append(appSecret).toString()).getBytes("utf-8")).toUpperCase();
        } catch (UnsupportedEncodingException e) {
        }
        return sign;
    }


    @Test
    public void test() throws Exception {
        String domain = "http://weitaodemojava.we.app.jae.taobao.com/";
        // 获取域名前缀
        String urlPrefix = DomainUtil.getWeTaoPrefix(domain);
        System.out.println(urlPrefix);

        ResultSet resultSet = getPreData("t01STK2XVITW9dYGvEgXnwfL1egxsGlRq1E4/O/0VvF8ao=", "tae");
        resultSet.first();
        String appKey = resultSet.getString("app_key");
        System.out.println(appKey);
        closeConnetion();

        String token = "6901d1516597694171436e6ZZ665ca9d735b53c62a44e2735983222440293180773092";
        StringBuilder piece = new StringBuilder();
        for (int i = 0; i < token.length(); i++) {
            piece.append(token.charAt(i));
            if (piece.toString().length() >= 35) {
                System.out.println("<p>" + piece.toString() + "</p>");
                piece = new StringBuilder();
            }
        }
    }
}
