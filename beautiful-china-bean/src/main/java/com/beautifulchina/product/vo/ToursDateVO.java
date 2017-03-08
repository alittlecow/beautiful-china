/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 * @author: zhangyun
 * date: 2016-01-15
 */
package com.beautifulchina.product.vo;

import com.beautifulchina.base.BaseBean;

/**
 * Created by Administrator on 2016/1/15.
 * 旅游时间VO
 */
public class ToursDateVO extends BaseBean {
    /**
     * id
     */
    private Long trdId;
    /**
     * 线路id
     */
    private Long tourId;
    /**
     * 线路代码
     */
    private String tourCode;
    /**
     * 时间
     */
    private String trdTime;
    /**
     * 当日价格
     */
    private Double trdPrice;
    /**
     * 库存总数
     */
    private Integer trdInventory;
    /**
     * 已售数量
     */
    private Integer trdSales;
    /**
     * 已提交，未支付的数量
     */
    private Integer trdPending;
    /**
     * 剩余库存
     */
    private Integer trdRemain;
    /**
     * 库存预警值
     */
    private Integer trdWarn;


    public Long getTrdId() {
        return trdId;
    }

    public void setTrdId(Long trdId) {
        this.trdId = trdId;
    }

    public String getTourCode() {
        return tourCode;
    }

    public void setTourCode(String tourCode) {
        this.tourCode = tourCode;
    }

    public String getTrdTime() {
        return trdTime;
    }

    public void setTrdTime(String trdTime) {
        this.trdTime = trdTime;
    }

    public Double getTrdPrice() {
        return trdPrice;
    }

    public void setTrdPrice(Double trdPrice) {
        this.trdPrice = trdPrice;
    }

    public Integer getTrdInventory() {
        return trdInventory;
    }

    public void setTrdInventory(Integer trdInventory) {
        this.trdInventory = trdInventory;
    }

    public Integer getTrdSales() {
        return trdSales;
    }

    public void setTrdSales(Integer trdSales) {
        this.trdSales = trdSales;
    }

    public Integer getTrdPending() {
        return trdPending;
    }

    public void setTrdPending(Integer trdPending) {
        this.trdPending = trdPending;
    }

    public Integer getTrdRemain() {
        return trdRemain;
    }

    public void setTrdRemain(Integer trdRemain) {
        this.trdRemain = trdRemain;
    }

    public Integer getTrdWarn() {
        return trdWarn;
    }

    public void setTrdWarn(Integer trdWarn) {
        this.trdWarn = trdWarn;
    }

    public Long getTourId() {
        return tourId;
    }

    public void setTourId(Long tourId) {
        this.tourId = tourId;
    }
}
