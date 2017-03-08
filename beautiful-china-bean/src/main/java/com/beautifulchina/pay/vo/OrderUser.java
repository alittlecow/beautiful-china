/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 *
 * @author: pengxiao
 * date: 2016/4/2.
 */
package com.beautifulchina.pay.vo;


public class OrderUser {
    /**
     * 购买者id
     */
    private Long userId;
    /**
     * 联系人
     */
    private String contact;
    /**
     * 联系邮箱
     */
    private String email;

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}
