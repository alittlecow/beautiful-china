/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 * @author: pengxiao
 * date: 2016/1/18.
 */
package com.beautifulchina.dao.toursdetail;

import com.beautifulchina.base.SqlMapper;
import com.beautifulchina.product.pojo.ToursBooking;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * 线路预定Mapper
 */

@Repository
public interface ToursBookingMapper extends SqlMapper{

    /**
     * 出团信息查询
     * @return
     */
    List<ToursBooking> selectBookingInfoById(Map map);

    /**
     * 查询当日价格
     * @param map
     * @return
     */
    ToursBooking getBookingInfo(Map<String,Object> map);
    /**
     * 购买一个团购  库存减一
     * @param map
     */

    void BuyOne(Map map );
}
