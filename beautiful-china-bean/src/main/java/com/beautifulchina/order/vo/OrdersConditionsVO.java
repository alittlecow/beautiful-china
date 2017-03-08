/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 *
 * @author: zhangyun
 * date: 2016/2/3
 */
package com.beautifulchina.order.vo;

import com.beautifulchina.base.BaseBean;

/**
 * Created by zhangyun on 2016/2/3.
 * 查询orderList的条件VO
 */

public class OrdersConditionsVO extends BaseBean{
    /**
     * 页数
     */
    private Integer pageNumber;
    /**
     * 用户id
     */
    private Long userId;

    public Integer getPageNumber() {
        return pageNumber;
    }

    public void setPageNumber(Integer pageNumber) {
        this.pageNumber = pageNumber;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }
}
