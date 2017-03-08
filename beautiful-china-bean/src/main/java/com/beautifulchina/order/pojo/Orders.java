/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 * @author: zhangyun
 * date: 2016-01-25
 */
package com.beautifulchina.order.pojo;

import com.beautifulchina.order.bo.OrdersBO;

/**
 * Created by Administrator on 2016/1/25.
 * 订单
 */
public class Orders extends OrdersBO {
    /**
     * 所获积分
     */
    private Integer point;
    /**
     * 总差价
     */
    private Double gross;
    /**
     * 净额
     */
    private Double net;
    /**
     * 税额
     */
    private Double tax;
    /**
     * 成人数
     */
    private Integer adults;
    /**
     * 儿童数量
     */
    private Integer children;
    /**
     * 房间数量
     */
    private  Integer room;

    public Integer getPoint() {
        return point;
    }

    public void setPoint(Integer point) {
        this.point = point;
    }

    public Double getGross() {
        return gross;
    }

    public void setGross(Double gross) {
        this.gross = gross;
    }

    public Double getNet() {
        return net;
    }

    public void setNet(Double net) {
        this.net = net;
    }

    public Double getTax() {
        return tax;
    }

    public void setTax(Double tax) {
        this.tax = tax;
    }

    public Integer getAdults() {
        return adults;
    }

    public void setAdults(Integer adults) {
        this.adults = adults;
    }

    public Integer getChildren() {
        return children;
    }

    public void setChildren(Integer children) {
        this.children = children;
    }

    public Integer getRoom() {
        return room;
    }

    public void setRoom(Integer room) {
        this.room = room;
    }
}
