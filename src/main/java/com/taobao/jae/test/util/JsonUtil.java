package com.taobao.jae.test.util;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.reflect.TypeToken;

import java.util.Map;

/**
 * User: xinyuan.ymm
 * Date: 14-1-18
 * Time: 下午4:16
 */
public class JsonUtil {

    public static Map<String, String> parseJsonString2Map(String data){
        GsonBuilder gb = new GsonBuilder();
        Gson g = gb.create();
        Map<String, String> map = g.fromJson(data, new TypeToken<Map<String, String>>() {}.getType());
        return map;
    }

}
