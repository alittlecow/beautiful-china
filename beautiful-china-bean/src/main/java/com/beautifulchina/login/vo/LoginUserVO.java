/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 *
 * @author: buhengzhang
 * date: 2016-01-06
 */

package com.beautifulchina.login.vo;

import com.beautifulchina.base.BaseBean;

/**
 * 登陆验证用户VO
 */
public class LoginUserVO extends BaseBean{

    /**
     * 登录名
     */
    private String nickName;
    /**
     * 密码
     */
    private String password;
    /**
     * 邮箱
     */
    private String email;

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getNickName() {
        return nickName;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}
