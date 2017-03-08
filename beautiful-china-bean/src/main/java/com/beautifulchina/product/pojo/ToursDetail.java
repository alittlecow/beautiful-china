/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 * @author: pengxiao
 * date: 2016/1/18.
 */

package com.beautifulchina.product.pojo;

import com.beautifulchina.product.bo.ToursDetailBO;


/**
 * 旅游线路详情pojo
 */

public class ToursDetail extends ToursDetailBO {
    //标题英文
    private String titleEn;
    //标题法文
    private String titleFr;
    //行程描述英文
    private String contentEn;
    //行程描述法文
    private String contentFr;

    private String destinationEn;//目的地英文

    private String destinationFr;//目的地法文

    private String mealsEn;//餐饮安排英文

    private String mealsFr;//餐饮安排法文

    private String transportEn;//交通安排英文

    private String transportFr;//交通安排法文

    private String hotelEn;//酒店安排英文

    private String hotelFr;//酒店安排法文

    public String getDestinationEn() {
        return destinationEn;
    }

    public void setDestinationEn(String destinationEn) {
        this.destinationEn = destinationEn;
    }

    public String getDestinationFr() {
        return destinationFr;
    }

    public void setDestinationFr(String destinationFr) {
        this.destinationFr = destinationFr;
    }

    public String getMealsEn() {
        return mealsEn;
    }

    public void setMealsEn(String mealsEn) {
        this.mealsEn = mealsEn;
    }

    public String getMealsFr() {
        return mealsFr;
    }

    public void setMealsFr(String mealsFr) {
        this.mealsFr = mealsFr;
    }

    public String getTransportEn() {
        return transportEn;
    }

    public void setTransportEn(String transportEn) {
        this.transportEn = transportEn;
    }

    public String getTransportFr() {
        return transportFr;
    }

    public void setTransportFr(String transportFr) {
        this.transportFr = transportFr;
    }

    public String getHotelEn() {
        return hotelEn;
    }

    public void setHotelEn(String hotelEn) {
        this.hotelEn = hotelEn;
    }

    public String getHotelFr() {
        return hotelFr;
    }

    public void setHotelFr(String hotelFr) {
        this.hotelFr = hotelFr;
    }

    public String getTitleEn() {
        return titleEn;
    }

    public void setTitleEn(String titleEn) {
        this.titleEn = titleEn;
    }

    public String getTitleFr() {
        return titleFr;
    }

    public void setTitleFr(String titleFr) {
        this.titleFr = titleFr;
    }

    public String getContentEn() {
        return contentEn;
    }

    public void setContentEn(String contentEn) {
        this.contentEn = contentEn;
    }

    public String getContentFr() {
        return contentFr;
    }

    public void setContentFr(String contentFr) {
        this.contentFr = contentFr;
    }
}
