/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 *
 * @author: chenghuanhuan
 * date: 2015-11-09
 */
package com.beautifulchina.constants;

/**
 * 公共的错误码
 */
public class CommonErrorCode implements BaseErrorCode{

    /**
     * 返回成功的消息
     */
    public static final String SUCCESS = "common_100000";

    /**
     * 返回成功消息
     */
    public static final String FAILURE = "common_100001";

    /**
     * 根据ip获取对应时区的时间错误
     */
    public static final String IP_TIME_ZONE_ERROR = "200001";
}
