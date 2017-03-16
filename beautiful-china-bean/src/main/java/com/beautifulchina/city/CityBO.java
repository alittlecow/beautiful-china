/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 *
 * @author: pengxiao
 * date: 2016/4/7.
 */
package com.beautifulchina.city;


import core.annotation.Locale;

public class CityBO extends CityVO {
    /**
     * 城市描述
     */
    @Locale
    private String desc;
    /**
     * 城市图片1
     */
    private String photoOne;
    /**
     * 城市图片2
     */
    private String photoTwo;
    /**
     * 城市图片3
     */
    private String photoThree;
    /**
     * 城市图片4
     */
    private String photoFour;

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
}
