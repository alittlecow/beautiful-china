/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 * @author: zhangyun
 * date: 2016-01-13
 */
package com.beautifulchina.product.vo;

import com.beautifulchina.base.BaseBean;

/**
 * Created by Administrator on 2016/1/13.
 * 旅游线路列表VO
 */
public class ToursListVO extends BaseBean {
    /**
     * id
     */
    private Long id;
    /**
     * 线路名称
     */
    private String title;
    /**
     * 天数
     */
    private Integer days;
    /**
     * 操作时间
     */
    private String operateTime;
    /**
     * 副标题名称
     */
    private String subtitle;
    /**
     * 提前预定天数
     */
    private Integer advancedays;


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Integer getDays() {
        return days;
    }

    public void setDays(Integer days) {
        this.days = days;
    }

    public String getOperateTime() {
        return operateTime;
    }

    public void setOperateTime(String operateTime) {
        this.operateTime = operateTime;
    }

    public String getSubtitle() {
        return subtitle;
    }

    public void setSubtitle(String subtitle) {
        this.subtitle = subtitle;
    }

    public Integer getAdvancedays() {
        return advancedays;
    }

    public void setAdvancedays(Integer advancedays) {
        this.advancedays = advancedays;
    }
}
