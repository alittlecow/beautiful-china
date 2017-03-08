/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 *
 * @author: pengxiao
 * date: 2016/1/18.
 */
package com.beautifulchina.service.toursdetail;

import com.beautifulchina.dao.toursdetail.ToursDetailMapper;
import com.beautifulchina.product.bo.ToursDetailBO;
import com.beautifulchina.product.pojo.ToursDetail;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

/**
 * 线路详情服务
 */
@Service
public class ToursDetailService {

    private static Logger logger = LoggerFactory.getLogger(ToursDetailService.class);

    @Autowired
    private ToursDetailMapper toursDetailMapper; //注入dao



    /**
     * 根据线路tour code查找线路详情
     */

    public List<ToursDetailBO> selectByTourCode(int tourId, String language) {

        List<ToursDetailBO> toursDetailBOList = new ArrayList<ToursDetailBO>();
        List<ToursDetail> toursDetailList = toursDetailMapper.selectByTourCode(tourId);

        for (ToursDetail toursDetail : toursDetailList) {
            ToursDetailBO toursDetailBO = new ToursDetailBO();
            //行程第几天
            toursDetailBO.setDay(toursDetail.getDay());
            // 根据前端语言类型查询对应的字段
            if ("fr".equals(language)) {
                //法文
                toursDetailBO.setTitle(toursDetail.getTitleFr());
                toursDetailBO.setContent(toursDetail.getContentFr());
                toursDetailBO.setDestination(toursDetail.getDestinationFr());
                toursDetailBO.setHotel(toursDetail.getHotelFr());
                toursDetailBO.setMeals(toursDetail.getMealsFr());
                toursDetailBO.setTransport(toursDetail.getTransportFr());
            } else {
                //英文
                toursDetailBO.setTitle(toursDetail.getTitleEn());
                toursDetailBO.setContent(toursDetail.getContentEn());
                toursDetailBO.setDestination(toursDetail.getDestinationEn());
                toursDetailBO.setHotel(toursDetail.getHotelEn());
                toursDetailBO.setMeals(toursDetail.getMealsEn());
                toursDetailBO.setTransport(toursDetail.getTransportEn());
            }
            toursDetailBOList.add(toursDetailBO);
        }
        return toursDetailBOList;
    }
}
