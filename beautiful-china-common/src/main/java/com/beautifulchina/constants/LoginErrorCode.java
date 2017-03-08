/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 *
 * @author: buhengzhang
 * date: 2016-01-13
 */
package com.beautifulchina.constants;

/**
 * 登陆错误信息
 */
public class LoginErrorCode implements BaseErrorCode {

    /**
     * nickname登陆失败
     */
    public static final String FAILURE = "login_100000";
    /**
     *email登陆失败
     */
    public static final String EMAILFAILURE = "login_100001";
    /**
     *email格式不正确
     */
    public static final String FORMATFAILURE = "login_100006";
}
