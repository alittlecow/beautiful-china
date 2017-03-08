/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 *
 * @author: buhengzhang
 * date: 2016-01-14
 */

package com.beautifulchina.destinationday.vo;

import com.beautifulchina.base.BaseBean;

import java.util.List;


/**
 * 目的地的实体类
 */
public class DestinationDayVO extends BaseBean {

    private int cstId;
    /**
     * 国家名字
     */
    private String nameEN;
    /**
     * 旅游天数
     */
    private int day;
    /**
     * 创建时间
     */
    private String createTime;
    /**
     * 城市数组
     */
    private List<String> citylist;

    private String language;

    public String getLanguage() {
        return language;
    }

    public void setLanguage(String language) {
        this.language = language;
    }

    public int getCstId() {
        return cstId;
    }

    public void setCstId(int cstId) {
        this.cstId = cstId;
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

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    public List<String> getCitylist() {
        return citylist;
    }

    public void setCitylist(List<String> citylist) {
        this.citylist = citylist;
    }
}
