/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 * @author: zhangyun
 * date: 2016-01-21
 */
package com.beautifulchina.rating.vo;

import com.beautifulchina.base.BaseBean;

/**
 * Created by Administrator on 2016/1/21.
 * 用户评价VO
 */
public class RatingVO extends BaseBean {
    /**
     * 对象 T:线路
     */
    private String target;
    /**
     * 评价对象id，当对线路评价是为tour表的id
     */
    private Integer targetId;
    /**
     * 用户id
     */
    private Integer userId;
    /**
     * 总体满意程度 1:满意 2：一般 3：不满意
     */
    private Integer allLevel;
    /**
     * 总体评价内容
     */
    private String allContent;
    /**
     * 行程安排满意程度 1:满意 2：一般 3：不满意
     */
    private Integer routingLevel;
    /**
     * 行程安排评价内容
     */
    private String routingContent;
    /**
     * 住宿餐饮满意程度 1:满意 2：一般 3：不满意
     */
    private Integer hotelLevel;
    /**
     * 住宿餐饮评价内容
     */
    private String hotelContent;
    /**
     * 交通满意程度 1:满意 2：一般 3：不满意
     */
    private Integer trafficLevel;
    /**
     * 交通评价内容
     */
    private String trafficContent;
    /**
     * 是否有图片 0:没有 1:有
     */
    private Integer picture;
    /**
     * 评价时间
     */
    private String ratingTime;
    /**
     * 评价来源 P:电脑
     */
    private String source;
    /**
     * 订单号
     */
    private String orderNo;


    public String getOrderNo() {
        return orderNo;
    }

    public void setOrderNo(String orderNo) {
        this.orderNo = orderNo;
    }

    public String getTarget() {
        return target;
    }

    public void setTarget(String target) {
        this.target = target;
    }

    public Integer getTargetId() {
        return targetId;
    }

    public void setTargetId(Integer targetId) {
        this.targetId = targetId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getAllLevel() {
        return allLevel;
    }

    public void setAllLevel(Integer allLevel) {
        this.allLevel = allLevel;
    }

    public String getAllContent() {
        return allContent;
    }

    public void setAllContent(String allContent) {
        this.allContent = allContent;
    }

    public Integer getRoutingLevel() {
        return routingLevel;
    }

    public void setRoutingLevel(Integer routingLevel) {
        this.routingLevel = routingLevel;
    }

    public String getRoutingContent() {
        return routingContent;
    }

    public void setRoutingContent(String routingContent) {
        this.routingContent = routingContent;
    }

    public Integer getHotelLevel() {
        return hotelLevel;
    }

    public void setHotelLevel(Integer hotelLevel) {
        this.hotelLevel = hotelLevel;
    }

    public String getHotelContent() {
        return hotelContent;
    }

    public void setHotelContent(String hotelContent) {
        this.hotelContent = hotelContent;
    }

    public Integer getTrafficLevel() {
        return trafficLevel;
    }

    public void setTrafficLevel(Integer trafficLevel) {
        this.trafficLevel = trafficLevel;
    }

    public String getTrafficContent() {
        return trafficContent;
    }

    public void setTrafficContent(String trafficContent) {
        this.trafficContent = trafficContent;
    }

    public Integer getPicture() {
        return picture;
    }

    public void setPicture(Integer picture) {
        this.picture = picture;
    }

    public String getRatingTime() {
        return ratingTime;
    }

    public void setRatingTime(String ratingTime) {
        this.ratingTime = ratingTime;
    }

    public String getSource() {
        return source;
    }

    public void setSource(String source) {
        this.source = source;
    }
}
