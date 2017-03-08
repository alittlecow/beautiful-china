/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 *
 * @author: pengxiao
 * date: 2016/3/12.
 */
package com.beautifulchina.dao.pay;

import com.beautifulchina.base.SqlMapper;
import com.beautifulchina.pay.vo.OrderUser;
import org.springframework.stereotype.Repository;

/**
 * 支付mapper
 */
@Repository
public interface PaymentMapper extends SqlMapper {

    /**
     * 支付一个订单
     * @param orderNo
     */
    public boolean pay(String orderNo);
    /**
     * 获取订单联系人信息
     */
    public OrderUser getOrderUser(String orderNo);

}
