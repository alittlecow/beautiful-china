/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 * @author: pengxiao
 * date: 2016/1/18.
 */
package com.beautifulchina.product.bo;

import com.beautifulchina.product.vo.ToursConfigVO;

/**
 * 线路配置BO
 */
public class ToursConfigBO extends ToursConfigVO{
    private String type;

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }
}
