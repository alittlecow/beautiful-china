/**
 * Created by pengxiao on 2016/1/10.
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 */

package com.beautifulchina.product.vo;


import com.beautifulchina.base.BaseBean;

/**
 * 线路详情vo
 */
public class ToursDetailVO extends BaseBean {
    private int tourId;//详情id  关联tour表

    private String tourCode;//线路代码   关联tour表

    private int day; //第几天

    private String title;//标题

    private String content;//行程描述

    private String destination;//目的地

    private String meals;//餐饮安排

    private String transport;//交通安排

    private String hotel;//酒店安排

    public String getDestination() {
        return destination;
    }

    public void setDestination(String destination) {
        this.destination = destination;
    }

    public String getMeals() {
        return meals;
    }

    public void setMeals(String meals) {
        this.meals = meals;
    }

    public String getTransport() {
        return transport;
    }

    public void setTransport(String transport) {
        this.transport = transport;
    }

    public String getHotel() {
        return hotel;
    }

    public void setHotel(String hotel) {
        this.hotel = hotel;
    }

    public int getTourId() {
        return tourId;
    }

    public void setTourId(int tourId) {
        this.tourId = tourId;
    }

    public String getTourCode() {
        return tourCode;
    }

    public void setTourCode(String tourCode) {
        this.tourCode = tourCode;
    }

    public int getDay() {
        return day;
    }

    public void setDay(int day) {
        this.day = day;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }
}
