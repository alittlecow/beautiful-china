/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 *
 * @author: pengxiao
 * date: 2016/3/12.
 */
package com.beautifulchina.service.pay;

import com.beautifulchina.dao.pay.PaymentMapper;
import com.beautifulchina.pay.vo.OrderUser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 订单支付service
 */
@Service
public class PaymentService {
    private static Logger logger = LoggerFactory.getLogger(PaymentService.class);

    @Autowired
    private PaymentMapper paymentMapper;

    /**
     * 根据订单号支付一个订单
     * @param orderNo
     */
    public void pay(String orderNo){

        paymentMapper.pay(orderNo);

        return;
    }
    /**
     * 获取订单联系人信息
     */
    public OrderUser getOrderUser(String orderNo){

        return paymentMapper.getOrderUser(orderNo);
    }
}
