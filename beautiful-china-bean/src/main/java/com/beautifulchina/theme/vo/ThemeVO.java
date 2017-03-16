/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 * @author: fengbaitong
 * date: 2016-01-12
 */
package com.beautifulchina.theme.vo;


import com.beautifulchina.base.BaseBean;
import core.annotation.Locale;

/**
 * 主页要显示的主题
 */
public class ThemeVO extends BaseBean {
    /**
     * 主题id
     */

    private String id;

    /**
     * 主题图片
     */
    private String image;

    /**
     * 目的地标题
     */
    @Locale
    private String title;
    /**
     * 主题描述
     */
    @Locale
    private String desc;

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

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }
}
