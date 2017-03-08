/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 *
 * @author: zhangyun
 * date: 2016/2/2
 */
package com.beautifulchina.product.vo;

import com.beautifulchina.base.BaseBean;
import com.beautifulchina.product.bo.ToursListBO;

import java.util.List;

/**
 * Created by zhangyun on 2016/2/2.
 * 查询ToursList条件VO
 */

public class ToursConditionsVO extends BaseBean{
    /**
     * 页数
     */
    private Integer pageNumber;
    /**
     * 最小价格
     */
    private Double priceMin;
    /**
     * 最大价格
     */
    private Double priceMax;
    /**
     * 最小天数
     */
    private Integer dayMin;
    /**
     * 最大天数
     */
    private Integer dayMax;
    /**
     * 搜索内容
     */
    private String search;


    public Integer getPageNumber() {
        return pageNumber;
    }

    public void setPageNumber(Integer pageNumber) {
        this.pageNumber = pageNumber;
    }

    public Double getPriceMin() {
        return priceMin;
    }

    public void setPriceMin(Double priceMin) {
        this.priceMin = priceMin;
    }

    public Double getPriceMax() {
        return priceMax;
    }

    public void setPriceMax(Double priceMax) {
        this.priceMax = priceMax;
    }

    public Integer getDayMin() {
        return dayMin;
    }

    public void setDayMin(Integer dayMin) {
        this.dayMin = dayMin;
    }

    public Integer getDayMax() {
        return dayMax;
    }

    public void setDayMax(Integer dayMax) {
        this.dayMax = dayMax;
    }

    public String getSearch() {
        return search;
    }

    public void setSearch(String search) {
        this.search = search;
    }

}
