/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 *
 * @author: fengbaitong
 * date: 2016-01-09
 */
package com.beautifulchina.service.destination;

import com.beautifulchina.city.CityVO;
import com.beautifulchina.dao.destination.DestinationMapper;
import com.beautifulchina.destination.bo.DestinationBO;
import com.beautifulchina.service.main.MainService;
import com.beautifulchina.tour.bo.TourBO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 目的地服务，用于查询目的地的相关信息
 */
@Service
public class DestinationService {
    private static Logger logger = LoggerFactory.getLogger(DestinationService.class);
    /**
     * 使用@Autowired注解标注destinationMapper变量，
     * DestinationMapper，Spring就会自动注入DestinationMapper
     */
    @Autowired
    private DestinationMapper destinationMapper;//注入dao

    /**
     * 根据cookie里语言的类型,获取目的地城市为英文或法文
     * @param language
     * @return
     */
    @Transactional(propagation= Propagation.NOT_SUPPORTED,readOnly =true)
    public List<CityVO> getCitys(String language) {
        List<CityVO> list=null;
        try {
                list = destinationMapper.getCity(language);
        }catch (Exception e){
             logger.error("destinationMapper.getCityEn() OR destinationMapper.getCityFr()",e);
             e.printStackTrace();
        }
        return list;
    }

    /**
     * 根据id获取目的地相关信息
     * @param id
     * @param language
     * @return
     */
    @Transactional(propagation= Propagation.NOT_SUPPORTED,readOnly =true)
    public DestinationBO getDestination(String id,String language){
        DestinationBO destinationBO=null;
        Map<String,String> map=new HashMap<String, String>();
        map.put("id",id);
        map.put("language",language);
        try {
            destinationBO =  destinationMapper.getDestinationByCityId(map);
        }catch (Exception e){
            logger.error("getDestination()+获取目的地信息错误",e);
            e.printStackTrace();
        }
        return destinationBO;
    }

    /**
     * 根据cityId获取所属线路的信息
     * @param cityId
     * @param language
     * @return
     */
    @Transactional(propagation= Propagation.NOT_SUPPORTED,readOnly =true)
    public List<TourBO> getAllToursByCityId(String cityId,String language,Integer page){
        List<TourBO> list=null;
        String day3= MainService.getDate(3);
        try{
            list=destinationMapper.getAllToursByCityId(cityId, language, day3, page);
        }catch (Exception e){
            logger.error("getAllToursByCityId()+获取指定城市的线路信息错误",e);
            e.printStackTrace();
        }
        return list;
    }

    @Transactional(propagation= Propagation.NOT_SUPPORTED,readOnly =true)
    public Integer getAllToursNo(String cityId){
        Integer total=0;
        try{
            total=destinationMapper.getAllToursNo(cityId);
        }catch (Exception e){
            logger.error("getAllToursNo()+获取指定城市的线路总条数错误",e);
            e.printStackTrace();
        }
        return total;
    }




}
