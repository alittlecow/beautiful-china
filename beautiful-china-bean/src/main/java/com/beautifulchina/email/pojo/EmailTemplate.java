/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 * @author: zhangyun
 * date: 2016-01-28
 */
package com.beautifulchina.email.pojo;

import com.beautifulchina.email.bo.EmailTemplateBO;

/**
 * Created by Administrator on 2016/1/28.
 * 邮件模板
 */
public class EmailTemplate extends EmailTemplateBO{
    /**
     * 模板建立时间
     */
    private String operatetime;
    /**
     * 操作人ID
     */
    private Integer passId;

    public String getOperatetime() {
        return operatetime;
    }

    public void setOperatetime(String operatetime) {
        this.operatetime = operatetime;
    }

    public Integer getPassId() {
        return passId;
    }

    public void setPassId(Integer passId) {
        this.passId = passId;
    }
}
