package com.beautifulchina.contact.vo;

import com.beautifulchina.base.BaseBean;

/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 *
 * @author: buhengzhang
 * date: 2016-01-16
 */
public class ContactVO extends BaseBean {
    /**
     * id
     */
    private Integer id ;
    /**
     * 登录id
     */
    private Integer userId;
    /**
     * 联系人姓名(姓)
     */
    private String firstName;
    /**
     * 联系人姓名(名)
     */
    private String lastName;
    /**
     * 性别
     */
    private String sex;
    /**
     * 国籍
     */
    private String nationality;
    /**
     * 邮箱
     */
    private String email;
    /**
     * 联系地址
     */
    private String address;
    /**
     * 护照号
     */
    private String passport;
    /**
     * 联系电话
     */
    private String tel;
    /**
     * 人员类型 children儿童 adult成人
     */
    private String type;

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

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPassport() {
        return passport;
    }

    public void setPassport(String passport) {
        this.passport = passport;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }
}
