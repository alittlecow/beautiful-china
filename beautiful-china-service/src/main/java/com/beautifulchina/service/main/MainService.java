/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 *
 * @author: fengbaitong
 * date: 2016-01-09
 */
package com.beautifulchina.service.main;

import com.beautifulchina.city.CityVO;
import com.beautifulchina.dao.city.CityMapper;
import com.beautifulchina.dao.index.IndexMapper;
import com.beautifulchina.dao.theme.ThemeMapper;
import com.beautifulchina.dao.tour.TourMapper;
import com.beautifulchina.index.bo.IndexBO;
import com.beautifulchina.theme.vo.ThemeVO;
import com.beautifulchina.tour.bo.TourBO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.text.SimpleDateFormat;
import java.util.*;

/**
 * IP地址服务，用于查询IP的相关信息
 */
@Service
public class MainService {

    private Logger logger = LoggerFactory.getLogger(MainService.class);

    @Autowired
    private IndexMapper indexMapper;//注入dao
    @Autowired
    private TourMapper tourMapper;//注入dao
    @Autowired
    private ThemeMapper themeMapper;//注入dao
    @Autowired
    private CityMapper cityMapper;
    /**
     * 获取首页展示城市信息
     * @param language
     * @return
     */
    public List<CityVO> getIndexCity(String language) {
        Map map = new HashMap();
        map.put("language",language);
        List<CityVO> list = null;
        list = cityMapper.getIndexCity(map);
        return list;
    }

    /**
     * 首页四张图片的查询
     * @return
     */
    public List<IndexBO> getBanner(){
        return indexMapper.getBanner();
    }
    /**
     *获取要显示的线路信息
     * @param language
     * @return
     */
    @Transactional(propagation= Propagation.NOT_SUPPORTED,readOnly =true)
    public List<TourBO> getTour(String language) {
        List<TourBO> list=null;
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("day3","");
        map.put("language",language);
        try{

            list = tourMapper.getTour(map);
        }catch(Exception e){
            logger.error("获取旅游线路信息错误",e);
            e.printStackTrace();
        }

        return list;
    }

    @Transactional(propagation= Propagation.NOT_SUPPORTED,readOnly =true)
    public List<TourBO> getTourFirst(String language) {
        List<TourBO> list=null;

        Map<String, Object> map = new HashMap<String, Object>();
        map.put("day3","");
        map.put("language",language);
        try{
            list = tourMapper.getTourIndex(map);
        }catch(Exception e){
            logger.error("获取旅游线路信息错误",e);
            e.printStackTrace();
        }

        return list;
    }

    /**
     *获取要显示的主题信息
     * @param language
     * @return
     */
    @Transactional(propagation= Propagation.NOT_SUPPORTED,readOnly =true)
    public List<ThemeVO> getTheme(String language) {
        List<ThemeVO> list=new ArrayList<ThemeVO>();
        try{
            list = themeMapper.getTheme(language);
        }catch(Exception e){
            logger.error("getTheme()+获取旅游主题信息错误",e);
            e.printStackTrace();
        }

        return list;
    }

    /**
     * 获取几天后的日期
     * @param afterDays
     * @return
     */
    public static String getDate(Integer afterDays){
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        Calendar cal= Calendar.getInstance();
        //当前时间
        Date date = new Date();
        cal.setTime(date);
        //后三天
        cal.add(Calendar.DATE, afterDays);
        date = cal.getTime();
        String theDate = df.format(date);
        return theDate;
    }
}
