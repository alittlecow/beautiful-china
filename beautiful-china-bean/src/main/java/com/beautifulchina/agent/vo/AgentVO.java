package com.beautifulchina.agent.vo;

import com.beautifulchina.base.BaseBean;

/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 *
 * @author: buhengzhang
 * date: 2016-01-16
 */
public class AgentVO extends BaseBean {
    /**
     * id
     */
    private Integer id ;

    /**
     * 登录id
     */
    private Integer userId;
    /**
     * 代理商名称
     */
    private String name;
    /**
     * 代理商地址
     */
    private String address;
    /**
     * 代理商姓名(姓)
     */
    private String firstName;
    /**
     * 代理商(名)
     */
    private String lastName;
    /**
     * 登录名
     */
    private String email;
    /**
     * 联系电话
     */
    private String tel;
    /**
     * 备用电话
     */
    private String tel2;
    /**
     * 代理商身份证号
     */
    private String cardNo;
    /**
     * 代理商描述
     */
    private String desc;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getTel2() {
        return tel2;
    }

    public void setTel2(String tel2) {
        this.tel2 = tel2;
    }

    public String getCardNo() {
        return cardNo;
    }

    public void setCardNo(String cardNo) {
        this.cardNo = cardNo;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }
}
