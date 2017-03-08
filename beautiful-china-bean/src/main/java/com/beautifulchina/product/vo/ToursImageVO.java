/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 *
 * @author: zhangyun
 * date: 2016-01-15
 */
package com.beautifulchina.product.vo;

import com.beautifulchina.base.BaseBean;

/**
 * Created by Administrator on 2016/1/15.
 * 线路图片VO
 */

public class ToursImageVO extends BaseBean {
    /**
     * 线路图片地址
     */
    private String imageUrl;
    /**
     * 大图片
     */
    private String imageLarge;
    /**
     * 中等图片
     */
    private String imageMedium;
    /**
     * 小图片
     */
    private  String imageSmall;
    /**
     * id
     */
    private Long tourId;
    /**
     * 图片顺序
     */
    private Integer orders;
    /**
     * 1主缩略图 0不是
     */
    private Integer thumbnail;


    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public String getImageLarge() {
        return imageLarge;
    }

    public void setImageLarge(String imageLarge) {
        this.imageLarge = imageLarge;
    }

    public String getImageMedium() {
        return imageMedium;
    }

    public void setImageMedium(String imageMedium) {
        this.imageMedium = imageMedium;
    }

    public String getImageSmall() {
        return imageSmall;
    }

    public void setImageSmall(String imageSmall) {
        this.imageSmall = imageSmall;
    }

    public Long getTourId() {
        return tourId;
    }

    public void setTourId(Long tourId) {
        this.tourId = tourId;
    }

    public Integer getOrders() {
        return orders;
    }

    public void setOrders(Integer orders) {
        this.orders = orders;
    }

    public Integer getThumbnail() {
        return thumbnail;
    }

    public void setThumbnail(Integer thumbnail) {
        this.thumbnail = thumbnail;
    }
}
