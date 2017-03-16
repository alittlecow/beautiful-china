/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 *
 * @author: fengbaitong
 * date: 2016-01-12
 */
package com.beautifulchina.city;

import com.beautifulchina.base.BaseBean;
import core.annotation.Locale;

/**
 * 城市类
 */
public class CityVO extends BaseBean {

    /**
     * 城市id
     */
    private Integer id;

    /**
     * 城市名
     */
    @Locale
    private String name;

    /**
     * 城市图片（首页展示）
     */
    private String image;

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
