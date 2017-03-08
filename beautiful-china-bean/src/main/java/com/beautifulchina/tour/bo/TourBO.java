/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 * @author: fengbaitong
 * date: 2016-01-12
 */
package com.beautifulchina.tour.bo;


import com.beautifulchina.base.BaseBean;

import java.math.BigDecimal;

/**
 * 旅游线路表
 */
public class TourBO  extends BaseBean{
    /**
     * 目的地标题
     */
    private String title;

    /**
     * 目的地描述
     */
    private String desc;

    /**
     * 图片地址
     */
    private String image;

    /**
     * 3天后最近日期的价格
     */
    private BigDecimal price;

    /**
     * 旅游线路id
     */
    private Integer tourId;

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public Integer getTourId() {
        return tourId;
    }

    public void setTourId(Integer tourId) {
        this.tourId = tourId;
    }
}
