/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 * @author: fengbaitong
 * date: 2016-01-12
 */
package com.beautifulchina.destination.bo;

import com.beautifulchina.destination.vo.DestinationVO;

/**
 * 目的地BO
 */
public class DestinationBO extends DestinationVO {
    /**
     * 目的地标题
     */
    private String title;

    /**
     * 目的地描述
     */
    private String desc;

    /**
     * 城市名称
     */
    private String cityName;
    /**
     * 城市id
     */
    private Integer cityId;

    /**
     * 图片1,2,3,4
     */
    private String photoOne;

    private String photoTwo;

    private String photoThree;

    private String photoFour;

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

    public String getPhotoOne() {
        return photoOne;
    }

    public void setPhotoOne(String photoOne) {
        this.photoOne = photoOne;
    }

    public String getPhotoTwo() {
        return photoTwo;
    }

    public void setPhotoTwo(String photoTwo) {
        this.photoTwo = photoTwo;
    }

    public String getPhotoThree() {
        return photoThree;
    }

    public void setPhotoThree(String photoThree) {
        this.photoThree = photoThree;
    }

    public String getPhotoFour() {
        return photoFour;
    }

    public void setPhotoFour(String photoFour) {
        this.photoFour = photoFour;
    }

    public String getCityName() {
        return cityName;
    }

    public void setCityName(String cityName) {
        this.cityName = cityName;
    }

    public Integer getCityId() {
        return cityId;
    }

    public void setCityId(Integer cityId) {
        this.cityId = cityId;
    }
}
