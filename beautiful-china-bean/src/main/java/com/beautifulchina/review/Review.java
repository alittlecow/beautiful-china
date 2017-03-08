package com.beautifulchina.review;

import com.beautifulchina.base.BaseBean;

import java.util.Date;

/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 *
 * @author: buhengzhang
 * date: 2016-01-16
 */
public class Review extends BaseBean {

    /**
     * 旅游路线ID
     */
    private int targetId;
    /**
     * 总评等级
     */
    private String allLevel;
    /**
     * 总评内容
     */
    private String allContent;
    /**
     * 行程安排等级
     */
    private String routingLevel;
    /**
     * 行程安排内容
     */
    private String routingContent;
    /**
     * 安排酒店满意等级
     */
    private String hotelLevel;
    /**
     * 安排酒店内容
     */
    private String hotelContent;
    /**
     * 交通等级
     */
    private String trafficLevel;
    /**
     * 交通内容
     */
    private String trafficContent;
    /**
     * 总评条数
     */
    private int allCount;
    /**
     * 创建时间
     */
    private Date time;
    /**
     * 中评条数
     */
    private int midCount;
    /**
     * 好评条数
     */
    private int goodCount;
    /**
     * 差评条数
     */
    private int badCount;

    /**
     * 昵称
     */
    private String nickname;

    public int getAllCount() {
        return allCount;
    }

    public void setAllCount(int allCount) {
        this.allCount = allCount;
    }

    public int getMidCount() {
        return midCount;
    }

    public void setMidCount(int midCount) {
        this.midCount = midCount;
    }

    public int getGoodCount() {
        return goodCount;
    }

    public void setGoodCount(int goodCount) {
        this.goodCount = goodCount;
    }

    public int getBadCount() {
        return badCount;
    }

    public void setBadCount(int badCount) {
        this.badCount = badCount;
    }


    public int getTargetId() {
        return targetId;
    }

    public void setTargetId(int targetId) {
        this.targetId = targetId;
    }

    public String getAllLevel() {
        if ("1".equals(allLevel)) {
            return "good";
        } else if ("2".equals(allLevel)) {
            return "middle";
        } else {
            return "bad";
        }
    }

    public void setAllLevel(String allLevel) {
        this.allLevel = allLevel;
    }

    public String getAllContent() {
        return allContent;
    }

    public void setAllContent(String allContent) {
        this.allContent = allContent;
    }

    public String getRoutingLevel() {
        if ("1".equals(routingLevel)) {
            return "good";
        } else if ("2".equals(routingLevel)) {
            return "middle";
        } else {
            return "bad";
        }
    }

    public void setRoutingLevel(String routingLevel) {
        this.routingLevel = routingLevel;
    }

    public String getRoutingContent() {
        return routingContent;
    }

    public void setRoutingContent(String routingContent) {
        this.routingContent = routingContent;
    }

    public String getHotelLevel() {
        if ("1".equals(hotelLevel)) {
            return "good";
        } else if ("2".equals(hotelLevel)) {
            return "middle";
        } else {
            return "bad";
        }
    }

    public void setHotelLevel(String hotelLevel) {
        this.hotelLevel = hotelLevel;
    }

    public String getHotelContent() {
        return hotelContent;
    }

    public void setHotelContent(String hotelContent) {
        this.hotelContent = hotelContent;
    }

    public String getTrafficLevel() {
        if ("1".equals(trafficLevel)) {
            return "good";
        } else if ("2".equals(trafficLevel)) {
            return "middle";
        } else {
            return "bad";
        }
    }

    public void setTrafficLevel(String trafficLevel) {
        this.trafficLevel = trafficLevel;
    }

    public String getTrafficContent() {
        return trafficContent;
    }

    public void setTrafficContent(String trafficContent) {
        this.trafficContent = trafficContent;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public String getNickname() {

        return "***"+nickname.substring(nickname.length()-2,nickname.length());
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }
}
