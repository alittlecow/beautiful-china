/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 * @author: zhangyun
 * date: 2016-01-25
 */
package com.beautifulchina.order.bo;

import com.beautifulchina.order.vo.OrdersVO;

/**
 * Created by Administrator on 2016/1/25.
 * 订单BO
 */
public class OrdersBO extends OrdersVO {
    /**
     * 订单号
     */
    private String orderNo;
    /**
     * 线路图片
     */
    private String imageUrl;
    /**
     * 线路名称
     */
    private String title;
    /**
     * 出团时间
     */
    private String departure;
    /**
     * 订单总额
     */
    private Double total;
    /**
     * 订单状态
     */
    private  String state;
    /**
     * 评价状态
     */
    private  String evaState;
    /**
     * 下单时间
     */
    private String placedtime;
    /**
     * 联系人
     */
    private String contact;
    /**
     * 联系电话
     */
    private String tel;
    /**
     * 供应商代码
     */
    private String deptId;
    /**
     * 联系邮箱
     */
    private String email;
    /**
     * 线路id
     */
    private Integer tourId;

    public String getEvaState() {
        return evaState;
    }

    public void setEvaState(String evaState) {
        this.evaState = evaState;
    }

    public String getOrderNo() {
        return orderNo;
    }

    public void setOrderNo(String orderNo) {
        this.orderNo = orderNo;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDeparture() {
        return departure;
    }

    public void setDeparture(String departure) {
        this.departure = departure;
    }

    public Double getTotal() {
        return total;
    }

    public void setTotal(Double total) {
        this.total = total;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getPlacedtime() {
        return placedtime;
    }

    public void setPlacedtime(String placedtime) {
        this.placedtime = placedtime;
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getDeptId() {
        return deptId;
    }

    public void setDeptId(String deptId) {
        this.deptId = deptId;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Integer getTourId() {
        return tourId;
    }

    public void setTourId(Integer tourId) {
        this.tourId = tourId;
    }
}
