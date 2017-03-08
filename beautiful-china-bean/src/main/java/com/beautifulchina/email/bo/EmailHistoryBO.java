/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 * @author: zhangyun
 * date: 2016-01-16
 */
package com.beautifulchina.email.bo;


import com.beautifulchina.email.vo.EmailHistoryVO;

/**
 * Created by Administrator on 2016/1/16.
 * 邮件历史记录BO
 */
public class EmailHistoryBO extends EmailHistoryVO {
    /**
     * 邮件历史记录id
     */
    private Long id;
    /**
     * 邮件类型NEWORDER:新订单INVOICE:发票
     */
    private String type;
    /**
     * 关联单号如果是订单就指订单号，也可以是其他单号
     */
    private String orderno;


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getOrderno() {
        return orderno;
    }

    public void setOrderno(String orderno) {
        this.orderno = orderno;
    }
}
