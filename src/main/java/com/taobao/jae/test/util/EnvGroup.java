package com.taobao.jae.test.util;

/**
 * User: xinyuan.ymm
 * Date: 14-1-20
 * Time: 上午10:44
 */
public enum EnvGroup {

    DAILY(10, "日常"),
    PRE(20, "预发"),
    ONLINE(30, "线上");


    private EnvGroup(int value, String comment) {
        this.value = value;
        this.comment = comment;
    }

    private int value;
    private String comment;

    public int value() {
        return this.value;
    }

    public String commnet() {
        return this.comment;
    }

    public static EnvGroup valueOf(int value) {
        for (EnvGroup t : values())
            if (t.value == value)
                return t;
        throw new IllegalArgumentException("Invaild value of EnvType");
    }
}
