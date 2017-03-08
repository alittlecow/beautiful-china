/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 * @author: zhangyun
 * date: 2016-01-08
 */
package com.beautifulchina.user.vo;

import com.beautifulchina.base.BaseBean;
import com.beautifulchina.contact.vo.ContactVO;

import java.util.List;

/**
 * Created by Administrator on 2016/1/08.
 * 普通用户VO
 */
public class OrdinaryUserVO extends BaseBean {
    /**
     * id
     */
    private Long id;
    /**
     * userId
     */
    private Long userId;
    /**
     * 昵称
     */
    private String nickname;
    /**
     * 代理商名称
     */
    private String agentName;
    /**
     * 邮箱
     */
    private String email;
    /**
     * 密码
     */
    private String password;
    /**
     * 随机码
     */
    private String authcode;
    /**
     * 操作时间
     */
    private String operatetime;
    /**
     * 盐值
     */
    private String psw;
    /**
     * 注册时间
     */
    private String regtime;
    /**
     * 姓
     */
    private String firstName;
    /**
     * 名
     */
    private String lastName;
    /**
     * 类型 Y:代理商 N:普通用户
     */
    private String type;
    /**
     * 性别
     */
    private String sex;
    /**
     * 护照号
     */
    private String passport;
    /**
     * 地址
     */
    private String address;
    /**
     * telephone1
     */
    private String telephone1;
    /**
     * telephone2
     */
    private String telephone2;
    /**
     * 代理商身份证件号
     */
    private String cardNo;
    /**
     * 描述
     */
    private String description;
    /**
     * 语言
     */
    private String language;

    /**
     * 联系人
     */
    private List<ContactVO> contactList;


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getAuthcode() {
        return authcode;
    }

    public void setAuthcode(String authcode) {
        this.authcode = authcode;
    }

    public String getOperatetime() {
        return operatetime;
    }

    public void setOperatetime(String operatetime) {
        this.operatetime = operatetime;
    }

    public String getPsw() {
        return psw;
    }

    public void setPsw(String psw) {
        this.psw = psw;
    }

    public String getRegtime() {
        return regtime;
    }

    public void setRegtime(String regtime) {
        this.regtime = regtime;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
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

    public String getPassport() {
        return passport;
    }

    public void setPassport(String passport) {
        this.passport = passport;
    }

    public List<ContactVO> getContactList() {
        return contactList;
    }

    public void setContactList(List<ContactVO> contactList) {
        this.contactList = contactList;
    }

    public String getAgentName() {
        return agentName;
    }

    public void setAgentName(String agentName) {
        this.agentName = agentName;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getTelephone1() {
        return telephone1;
    }

    public void setTelephone1(String telephone1) {
        this.telephone1 = telephone1;
    }

    public String getTelephone2() {
        return telephone2;
    }

    public void setTelephone2(String telephone2) {
        this.telephone2 = telephone2;
    }

    public String getCardNo() {
        return cardNo;
    }

    public void setCardNo(String cardNo) {
        this.cardNo = cardNo;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getLanguage() {
        return language;
    }

    public void setLanguage(String language) {
        this.language = language;
    }
}