/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 *
 * @author: pengxiao
 * date: 2016/3/17.
 */
package com.beautifulchina.pay.vo;

import com.beautifulchina.base.BaseBean;


public class OrderDetailVO extends BaseBean {
    /**
     * 订单号
     */
    private String orderNo;
    /**
     *付款类型
     */
    private String type;
    /**
     * value id或则酒店id
     */
    private String valueId;
    /**
     *是否升级服务
     */
    private String upGrade;
    /**
     * 差价
     */
    private String price;
    /**
     * 总价格(单价*总人数)
     */
    private String totalPrice;

    public String getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(String totalPrice) {
        this.totalPrice = totalPrice;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getValueId() {
        return valueId;
    }

    public void setValueId(String valueId) {
        this.valueId = valueId;
    }

    public String getUpGrade() {
        return upGrade;
    }

    public void setUpGrade(String upGrade) {
        this.upGrade = upGrade;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getOrderNo() {
        return orderNo;
    }

    public void setOrderNo(String orderNo) {
        this.orderNo = orderNo;
    }
}
