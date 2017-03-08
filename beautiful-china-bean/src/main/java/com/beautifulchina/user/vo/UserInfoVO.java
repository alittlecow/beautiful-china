package com.beautifulchina.user.vo;

import com.beautifulchina.base.BaseBean;

/**
 * Created by ZHF on 2016/4/7.
 */
public class UserInfoVO extends BaseBean {

    /**
     * id
     */
    private Integer id;
    /**
     * 登录id
     */
    private long userId;
    /**
     * 昵称
     */
    private String nickname;
    /**
     * 姓名(姓)
     */
    private String firstName;
    /**
     * 姓名(名)
     */
    private String lastName;
    /**
     * 邮箱
     */
    private String email;
    /**
     * 性别
     */
    private String sex;
    /**
     * 国籍
     */
    private String nationality;
    /**
     * 地址
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

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public long getUserId() {
        return userId;
    }

    public void setUserId(long userId) {
        this.userId = userId;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
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
}
