/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 *
 * @author: pengxiao
 * date: 2016/1/23.
 */
package com.beautifulchina.pay.vo;

import com.beautifulchina.base.BaseBean;

import java.util.Date;


public class OrderVO extends BaseBean {
    /**
     * 订单号
     */
    private String orderNo;
    /**
     * 购买者id
     */
    private Long userId;
    /**
     * 联系人
     */
    private String contact;
    /**
     * 联系电话
     */
    private String tel;
    /**
     * 供应商id
     */
    private int deptId;
    /**
     * 联系邮箱
     */
    private String email;
    /**
     * 线路id
     */
    private Long tourId;
    /**
     * 成人数
     */
    private int adults;
    /**
     * 儿童数量
     */
    private int children;
    /**
     * 房间数量
     */
    private  int room;
    /**
     * 出团时间
     */
    private Date departure;
    /**
     * 订单总额
     */
    private  double total;
    /**
     * 订单状态
     N：待付款
     P:付款成功
     SS:供应商确认
     SC:供应商取消,订单关闭
     TS:退单完成，订单关闭
     MP:订单修改,支付未完成
     "
     */
    private  String state;
    /**
     * 下单时间
     */
    private String placedtime;
    /**
     * 所获积分
     */
    private int point;
    /**
     * 总差价
     */
    private double gross;
    /**
     * 净额
     */
    private double net;
    /**
     * 税额
     */
    private double tax;

    public String getOrderNo() {
        return orderNo;
    }

    public void setOrderNo(String orderNo) {
        this.orderNo = orderNo;
    }

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

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public int getDeptId() {
        return deptId;
    }

    public void setDeptId(int deptId) {
        this.deptId = deptId;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Long getTourId() {
        return tourId;
    }

    public void setTourId(Long tourId) {
        this.tourId = tourId;
    }

    public int getAdults() {
        return adults;
    }

    public void setAdults(int adults) {
        this.adults = adults;
    }

    public int getChildren() {
        return children;
    }

    public void setChildren(int children) {
        this.children = children;
    }

    public int getRoom() {
        return room;
    }

    public void setRoom(int room) {
        this.room = room;
    }

    public Date getDeparture() {
        return departure;
    }

    public void setDeparture(Date departure) {
        this.departure = departure;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
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

    public int getPoint() {
        return point;
    }

    public void setPoint(int point) {
        this.point = point;
    }

    public double getGross() {
        return gross;
    }

    public void setGross(double gross) {
        this.gross = gross;
    }

    public double getNet() {
        return net;
    }

    public void setNet(double net) {
        this.net = net;
    }

    public double getTax() {
        return tax;
    }

    public void setTax(double tax) {
        this.tax = tax;
    }
}
