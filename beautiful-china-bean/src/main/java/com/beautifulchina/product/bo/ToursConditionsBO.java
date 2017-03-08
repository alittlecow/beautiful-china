/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 *
 * @author: zhangyun
 * date: 2016/2/2
 */
package com.beautifulchina.product.bo;

import com.beautifulchina.product.vo.ToursConditionsVO;

import java.util.List;

/**
 * Created by zhangyun on 2016/2/2.
 * 查询ToursList条件BO
 */

public class ToursConditionsBO extends ToursConditionsVO{
    /**
     * ToursListBO对象集合
     */
    private List<ToursListBO> listBO;
    /**
     * 总页数
     */
    private int pageAll;

    public List<ToursListBO> getListBO() {
        return listBO;
    }

    public void setListBO(List<ToursListBO> listBO) {
        this.listBO = listBO;
    }

    public int getPageAll() {
        return pageAll;
    }

    public void setPageAll(int pageAll) {
        this.pageAll = pageAll;
    }
}
