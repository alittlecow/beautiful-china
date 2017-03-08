/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 *
 * @author: pengxiao
 * date: 2016/1/23.
 */
package com.beautifulchina.service.pay;

import com.beautifulchina.dao.pay.OrderDetailMapper;
import com.beautifulchina.dao.pay.OrderMapper;
import com.beautifulchina.pay.pojo.Order;
import com.beautifulchina.pay.vo.OrderDetailVO;
import com.beautifulchina.pay.vo.OrderVO;
import com.beautifulchina.pay.vo.PassengerVO;
import com.beautifulchina.util.DateUtil;
import com.beautifulchina.util.GreenWichTimeUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;


/**
 * 订单服务
 */
@Service
@Transactional(rollbackFor = Exception.class)//启动事物控制
public class OrderService {
    //用于生成6位序列号
    private static int i=0;
    private static Logger logger = LoggerFactory.getLogger(OrderService.class);

    @Autowired
    private OrderMapper orderMapper;//订单

    @Autowired
    private OrderDetailMapper orderDetailMapper;//付款详细

    /**
     * 创建一个订单并返回订单号
     * @param orderVO
     * @return orderNo
     */

    public String createOrder(OrderVO orderVO,List<PassengerVO> passengerVOList,
                              List<OrderDetailVO> orderDetailVOList){
        //下单时间
        String palceTime = GreenWichTimeUtil.getGreenWichTime();
        orderVO.setPlacedtime(palceTime);
        //订单号
        String orderNo=getSerialNum(orderVO.getUserId());
        orderVO.setOrderNo(orderNo);
        //设置旅客信息表中的订单号
        for (int i=0;i<passengerVOList.size();i++){
            passengerVOList.get(i).setOrderNo(orderNo);
        }
        //设置订单付款明细表中的订单号
        for(int i=0; i<orderDetailVOList.size();i++){
            orderDetailVOList.get(i).setOrderNo(orderNo);
        }
        Order order = new Order();
        BeanUtils.copyProperties(orderVO, order);

        //将订单信息写入订单表中
        orderMapper.createOrderTB(order);
        //将订单信息写入订单历史表中
        orderMapper.createOrderTH(order);
        //添加旅客信息
        orderMapper.addPassenger(passengerVOList);
        //将订单付款明细 添加到付款明细表中
        orderDetailMapper.addOrderDetail(orderDetailVOList);

        return orderNo;

    }

    //订单号生成
    public  String getSerialNum(Long userId){
        //获得当前时间，格式 yyyyMMddHHmmss
        String dt = DateUtil.getCurrentDate("yyyyMMddHHmmss");
        //序列号
        String serialNum = getNum();
        //订单号
        String orderNo = dt + userId + serialNum;
        return orderNo;
    }

    /**
     * 返回6位自增序列号
     */
    private static String getNum(){
        //如果i=999999,则重置
        if(i==999999){
            reset();
        }
        i++;
        String s = "000000" + String.valueOf(i);
        return s.substring(s.length() - 6);
    }

    /**
     * 重置i
     */
    public static void reset(){
        i=0;
    }

}
