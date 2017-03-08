/**
 * Created by pengxiao on 2016/1/15.
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 */
package com.beautifulchina.product.vo;

import com.beautifulchina.base.BaseBean;

import java.util.Date;

/**
 * 线路预定信息VO
 */
public class ToursBookingVO extends BaseBean {

    //当日价格
    private double price;
    //提前预定天数
    private int advanceDays;
    //出发城市
    private String startCity;
    //截至日期
    private Date endTimes;
    //剩余数量
    private int remain;
    //库存预警值
    private int warning;
    //库存数量
    private int inventory;

    public int getInventory() {
        return inventory;
    }

    public void setInventory(int inventory) {
        this.inventory = inventory;
    }

    public int getRemain() {
        return remain;
    }

    public void setRemain(int remain) {
        this.remain = remain;
    }

    public int getWarning() {
        return warning;
    }

    public void setWarning(int warning) {
        this.warning = warning;
    }

    public Date getEndTimes() {
        return endTimes;
    }

    public void setEndTimes(Date endTimes) {
        this.endTimes = endTimes;
    }

    public String getStartCity() {
        return startCity;
    }

    public void setStartCity(String startCity) {
        this.startCity = startCity;
    }


    public int getAdvanceDays() {
        return advanceDays;
    }

    public void setAdvanceDays(int advanceDays) {
        this.advanceDays = advanceDays;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }


}
