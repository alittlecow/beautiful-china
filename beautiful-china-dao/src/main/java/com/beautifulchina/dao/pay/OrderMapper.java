/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 *
 * @author: pengxiao
 * date: 2016/1/23.
 */
package com.beautifulchina.dao.pay;


import com.beautifulchina.base.SqlMapper;
import com.beautifulchina.pay.pojo.Order;
import com.beautifulchina.pay.vo.PassengerVO;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 订单mapper
 */

@Repository
public interface OrderMapper extends SqlMapper{

    /**
     * 创建一个订单到订单表中
     * @param order
     * @return
     */
    public boolean createOrderTB(Order order);

    /**
     * 创建一个订单到订单历史表中
     * @param order
     * @return
     */
    public boolean createOrderTH(Order order);

    /**
     * 添加旅客信息
     * @param passengerVOList
     */
    public void addPassenger(List<PassengerVO> passengerVOList);
}
