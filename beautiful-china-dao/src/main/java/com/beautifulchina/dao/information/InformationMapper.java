/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 * @author: zhangyun
 * date: 2016-01-11
 */
package com.beautifulchina.dao.information;

import com.beautifulchina.base.SqlMapper;
import com.beautifulchina.order.bo.OrdersBO;
import com.beautifulchina.user.bo.OrdinaryUserBO;
import com.beautifulchina.user.vo.OrdinaryUserVO;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2016/1/11.
 * 个人信息Mapper
 */
@Repository
public interface InformationMapper extends SqlMapper {
    /**
     * 修改密码
     * @param ordinaryUserVO
     */
    void passwordChang(OrdinaryUserVO ordinaryUserVO);

    /**
     * 验证原密码是否正确
     * @param userId
     * @return
     */
    OrdinaryUserBO passwordVerify(Long userId);

    /**
     * 查询当前用户的订单
     * @param map
     * @return
     */
    List<OrdersBO> getALLOrder(Map<String, Object> map);

    /**
     * 查询订单数量
     * @param map
     * @return
     */
    int getCount(Map<String, Object> map);

    /**
     * 验证是否已评价
     * @param map
     * @return
     */
    String ratingVerify(Map<String, Object> map);

    /**
     * 删除订单
     * @param map
     */
    void deleteOrder(Map<String, Object> map);
    /**
     * 取消订单
     * @param map
     */
    void cancelOrder(Map<String, Object> map);
}
