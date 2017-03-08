/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 * @author: zhangyun
 * date: 2016-01-24
 */
package com.beautifulchina.order.vo;

import com.beautifulchina.base.BaseBean;

/**
 * Created by Administrator on 2016/1/24.
 * 订单VO
 */
public class OrdersVO extends BaseBean {
    /**
     * 购买者id
     */
    private Integer userId;

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }
}
