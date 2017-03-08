/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 *
 * @author: pengxiao
 * date: 2016/3/10.
 */
package com.beautifulchina.pay.vo;

import com.beautifulchina.base.BaseBean;


public class PassengerVO extends BaseBean {
    /**
     * 订单号
     */
    private String orderNo;
    /**
     *旅客全名
     */
    private String fullName;
    /**
     * 旅客邮箱
     */
    private String email;
    /**
     *旅客性别
     */
    private String sex;
    /**
     *旅客国籍
     */
    private String nationality;
    /**
     *旅客护照号
     */
    private String passport;
    /**
     *联系电话
     */
    private String phone;
    /**
     * 旅馆类型(adults成人  children儿童)
     */
    private String type;

    /**
     *儿童类型 a(0-2)  b(2-12)
     */
    private String childType;

    public String getChildType() {
        return childType;
    }

    public void setChildType(String childType) {
        this.childType = childType;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getOrderNo() {
        return orderNo;
    }

    public void setOrderNo(String orderNo) {
        this.orderNo = orderNo;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getNationality() {
        return nationality;
    }

    public void setNationality(String nationality) {
        this.nationality = nationality;
    }

    public String getPassport() {
        return passport;
    }

    public void setPassport(String passport) {
        this.passport = passport;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }
}
