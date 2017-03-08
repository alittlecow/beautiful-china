/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 *
 * @author: pengxiao
 * date: 2016/3/17.
 */
package com.beautifulchina.dao.pay;

import com.beautifulchina.base.SqlMapper;
import com.beautifulchina.pay.vo.OrderDetailVO;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 订单付款明细mapper
 */

@Repository
public interface OrderDetailMapper extends SqlMapper{


    /**
     * 添加订单付款明细
     * @param orderDetailVOList
     */
    public void addOrderDetail(List<OrderDetailVO> orderDetailVOList);
}
