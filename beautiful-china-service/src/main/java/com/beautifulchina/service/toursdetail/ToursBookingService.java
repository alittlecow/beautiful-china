/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 *
 * @author: pengxiao
 * date: 2016/1/18.
 */
package com.beautifulchina.service.toursdetail;

import com.beautifulchina.dao.toursdetail.ToursBookingMapper;
import com.beautifulchina.product.bo.ToursBookingBO;
import com.beautifulchina.product.pojo.ToursBooking;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

/**
 * 线程预定服务
 */
@Service
public class ToursBookingService {
    private static Logger logger = LoggerFactory.getLogger(ToursBookingService.class);

    @Autowired
    private ToursBookingMapper toursBookingMapper;

    /**
     * 根据线路Id和日期，下单后减少库存
     * @param tourId
     * @param date
     */
    public void BuyOne(long tourId, Date date,int num){

        Map<String,Object> map = new HashMap<String,Object>();
        map.put("tourId",tourId);
        map.put("date",date);
        map.put("num",num);
        toursBookingMapper.BuyOne(map);
    }

    /**
     * 根据线程Id查询出团日期和票价
     *
     * @param tourId
     * @return
     */
    public List<ToursBookingBO> selectBookingInfoById(int tourId,String language) {
        Map map = new HashMap();
        map.put("tourId",tourId);
        map.put("language",language);
        List<ToursBookingBO> toursBookingBOList = new ArrayList<ToursBookingBO>();
        List<ToursBooking> toursBookingList = toursBookingMapper.selectBookingInfoById(map);
        for(ToursBooking toursBooking : toursBookingList){
            ToursBookingBO toursBookingBO = new ToursBookingBO();
            toursBookingBO.setStartCity(toursBooking.getStartCity());
            toursBookingBO.setPrice(toursBooking.getPrice());
            toursBookingBO.setEndTimes(toursBooking.getEndTimes());
            toursBookingBO.setAdvanceDays(toursBooking.getAdvanceDays());
            toursBookingBO.setRemain(toursBooking.getRemain());
            toursBookingBO.setWarning(toursBooking.getWarning());
            //现在+提前预定天数<截至日期
            if(getDateAfter(new Date(),toursBookingBO.getAdvanceDays())
                    .before(toursBookingBO.getEndTimes())  ){

                toursBookingBOList.add(toursBookingBO);
            }

        }

        return toursBookingBOList;
    }

    /**
     * 获取当日票价
     * @param tourId
     * @param curDay
     * @return
     */
    public ToursBookingBO getBookingInfo(int tourId,Date curDay){
        Map<String,Object> map = new HashMap<String,Object>();
        map.put("tourId",tourId);
        map.put("curDay",curDay);
        ToursBooking toursBooking = toursBookingMapper.getBookingInfo(map);
        ToursBookingBO toursBookingBO =new ToursBookingBO();
        toursBookingBO.setPrice(toursBooking.getPrice());
        toursBookingBO.setInventory(toursBooking.getInventory());
        return toursBookingBO;
    }

    /**
     * 日期提前day天
     *
     * @param d
     * @param day
     * @return
     */
    public static Date getDateBefore(Date d, int day) {
        Calendar now = Calendar.getInstance();
        now.setTime(d);
        now.set(Calendar.DATE, now.get(Calendar.DATE) - day);
        return now.getTime();
    }

    /**
     * 日期延后day天
     *
     * @param d
     * @param day
     * @return
     */
    public static Date getDateAfter(Date d, int day) {
        Calendar now = Calendar.getInstance();
        now.setTime(d);
        now.set(Calendar.DATE, now.get(Calendar.DATE) + day);
        return now.getTime();
    }
}



