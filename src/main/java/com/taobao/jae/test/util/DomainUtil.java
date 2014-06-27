package com.taobao.jae.test.util;

import org.apache.commons.lang3.StringUtils;

/**
 * User: xinyuan.ymm
 * Date: 14-1-17
 * Time: 下午11:00
 */
public class DomainUtil {

    /**
     * 根据 微淘 domain 获取 前缀
     *
     * @param domain
     * @return
     */
    public static String getWeTaoPrefix(String domain) {
        String result = "";
        if (StringUtils.isBlank(domain)) {
            return result;
        } else if (domain.contains(".we.aliapp-inc.")) {
            result = domain.split("we.aliapp-inc")[0];
            return result;
        } else if (domain.contains(".we.jaeapp.")) {
            result = domain.split("we.jaeapp")[0];
            return result;
        } else if (domain.contains(".we.app.jae.")) {
            result = domain.split("we.app.jae")[0];
            return result;
        } else {
            return result;
        }
    }

    //根据当前域名，判断当前环境是日常还是线上，如果判断失败，返回null
    public static EnvGroup getEnv(String domain) {
        if (StringUtils.isBlank(domain)) {
            return null;
        } else if (domain.contains(".aliapp-inc.") || domain.contains(".daily.") || domain.contains(".waptest.")) {
            return EnvGroup.DAILY;
        } else if (domain.contains(".wapa.")) {
            return EnvGroup.PRE;
        } else if (domain.contains(".jaeapp.") || domain.contains(".taobao.com")) {
            return EnvGroup.ONLINE;
        } else {
            return null;
        }
    }
}
