/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 *
 * @author: buhengzhang
 * date: 2016-01-14
 */

package com.beautifulchina.customline.vo;

import com.beautifulchina.base.BaseBean;

import java.util.List;

/**
 * 路线和目的地综合的类（接收表单数据）
 */
public class CustomlineVO extends BaseBean {

    private int id;
    /**
     * 人名
     */
    private String name;
    /**
     * 性别
     */
    private String sex;
    /**
     * 邮箱
     */
    private String email;
    /**
     * 电话
     */
    private String phone;
    /**
     * 人数
     */
    private int person;
    /**
     * 抵达时间
     */
    private String arrivalTime;
    /**
     * 酒店等级
     */
    private int hotelLevel;
    /**
     * 其他需求
     */
    private String otherRequirement;
    /**
     * 创建时间
     */
    private String createTime;
    /**
     * 国家名字
     */
    private String nameEN;
    /**
     * 旅游天数
     */
    private int day;
    /**
     * 城市数组
     */
    private List<String> citylist;

    /**
     * 验证码
     */
    private String code;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getNameEN() {
        return nameEN;
    }

    public void setNameEN(String nameEN) {
        this.nameEN = nameEN;
    }

    public int getDay() {
        return day;
    }

    public void setDay(int day) {
        this.day = day;
    }


    public List<String> getCitylist() {
        return citylist;
    }

    public void setCitylist(List<String> citylist) {
        this.citylist = citylist;
    }


    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getOtherRequirement() {
        return otherRequirement;
    }

    public void setOtherRequirement(String otherRequirement) {
        this.otherRequirement = otherRequirement;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public int getPerson() {
        return person;
    }

    public void setPerson(int person) {
        this.person = person;
    }

    public String getArrivalTime() {
        return arrivalTime;
    }

    public void setArrivalTime(String arrivalTime) {
        this.arrivalTime = arrivalTime;
    }

    public int getHotelLevel() {
        return hotelLevel;
    }

    public void setHotelLevel(int hotelLevel) {
        this.hotelLevel = hotelLevel;
    }
}
