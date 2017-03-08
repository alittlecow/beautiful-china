/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 *
 * @author: chenghuanhuan
 * date: 2015-11-04
 */
package com.beautifulchina.interceptor;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 安全拦截器
 */
public class SecurityInterceptor extends HandlerInterceptorAdapter {

    private Logger logger = LoggerFactory.getLogger(SecurityInterceptor.class);


    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        //logger.debug("--------------------------安全拦截器------------------------------");
        // TODO 从session中获取用户信息，如果不存在则从cookie中恢复，cookie恢复失败则跳转到登录页面



        return true;
    }
}
