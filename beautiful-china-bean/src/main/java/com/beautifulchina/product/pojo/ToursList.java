/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 * @author: zhangyun
 * date: 2016-01-13
 */
package com.beautifulchina.product.pojo;

import com.beautifulchina.product.bo.ToursListBO;

/**
 * Created by Administrator on 2016/1/13.
 * 旅游线路列表
 */
public class ToursList extends ToursListBO {
    /**
     * 操作人
     */
    private String operator;

    public String getOperator() {
        return operator;
    }

    public void setOperator(String operator) {
        this.operator = operator;
    }
}
