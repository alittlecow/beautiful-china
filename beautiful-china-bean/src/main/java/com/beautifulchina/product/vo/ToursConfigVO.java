/**
 * Created by pengxiao on 2016/1/14.
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 */
package com.beautifulchina.product.vo;

import com.beautifulchina.base.BaseBean;

/**
 * 线路配置VO
 */
public class ToursConfigVO extends BaseBean {
    //线路id
    private int tourId;
    //配置名称
    private String name;

    //配置内容
    private String content;

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getTourId() {
        return tourId;
    }

    public void setTourId(int tourId) {
        this.tourId = tourId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
