/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 * @author: zhangyun
 * date: 2016-01-16
 */
package com.beautifulchina.email.vo;

import com.beautifulchina.base.BaseBean;

/**
 * Created by Administrator on 2016/1/16.
 * 邮件历史记录VO
 */
public class EmailHistoryVO extends BaseBean{
    /**
     * 主题
     */
    private String title;
    /**
     * 内容
     */
    private String content;
    /**
     * 收件人id
     */
    private Long userId;
    /**
     * 收件人邮箱地址
     */
    private String email;
    /**
     * 发送时间
     */
    private String operatetime;


    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getOperatetime() {
        return operatetime;
    }

    public void setOperatetime(String operatetime) {
        this.operatetime = operatetime;
    }
}
