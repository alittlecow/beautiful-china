package com.beautifulchina.suggestions;

import com.beautifulchina.base.BaseBean;

import java.util.Date;

/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 *
 * @author: buhengzhang
 * date: 2016-01-16
 */
public class Suggestions extends BaseBean {
    /**
     * id
     */
    private int id;
    /**
     *用户id
     */
    private int userId;
    /**
     *工单号
     */
    private String disno;
    /**
     *工单类型
     */
    private String type;
    /**
     *工单状态
     */
    private String status;
    /**
     *问题描述
     */
    private String description;
    /**
     *联系电话
     */
    private String phone;
    /**
     *联系邮箱
     */
    private String email;
    /**
     *联系人姓
     */
    private String firstname;
    /**
     *联系人名
     */
    private String lastname;
    /**
     *性别
     */
    private String sex;
    /**
     *国籍
     */
    private String nationality;
    /**
     *问题记录时间
     */
    private Date recordtime;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getDisno() {
        return disno;
    }

    public void setDisno(String disno) {
        this.disno = disno;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
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

    public Date getRecordtime() {
        return recordtime;
    }

    public void setRecordtime(Date recordtime) {
        this.recordtime = recordtime;
    }
}
