/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 *
 * @author: zhangyun
 * date: 2016/2/3
 */
package com.beautifulchina.order.bo;

import com.beautifulchina.order.vo.OrdersConditionsVO;

import java.util.List;

/**
 * Created by zhangyun on 2016/2/3.
 * 查询orderList的条件BO
 */

public class OrdersConditionsBO extends OrdersConditionsVO {
    /**
     * ToursListBO对象集合
     */
    private List<OrdersBO> listBO;
    /**
     * 总页数
     */
    private int pageAll;

    public List<OrdersBO> getListBO() {
        return listBO;
    }

    public void setListBO(List<OrdersBO> listBO) {
        this.listBO = listBO;
    }

    public int getPageAll() {
        return pageAll;
    }

    public void setPageAll(int pageAll) {
        this.pageAll = pageAll;
    }
}
