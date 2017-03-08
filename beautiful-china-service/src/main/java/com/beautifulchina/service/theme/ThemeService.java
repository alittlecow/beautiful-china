/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 *
 * @author: fengbaitong
 * date: 2016-01-09
 */
package com.beautifulchina.service.theme;

import com.beautifulchina.dao.theme.ThemeMapper;
import com.beautifulchina.service.main.MainService;
import com.beautifulchina.theme.bo.ThemeBO;
import com.beautifulchina.tour.bo.TourBO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

/**
 * 主题服务，用于查询主题的相关信息
 */
@Service
public class ThemeService {
    private static Logger logger = LoggerFactory.getLogger(ThemeService.class);
    /**
     * 使用@Autowired注解标注destinationMapper变量，
     * DestinationMapper，Spring就会自动注入DestinationMapper
     */
    @Autowired
    private ThemeMapper themeMapper;//注入dao

    /**
     * 根据cookie里语言的类型,获取目的地标题为英文或法文
     * @param language
     * @return
     */
    @Transactional(propagation= Propagation.NOT_SUPPORTED,readOnly =true)
    public List<ThemeBO> getThemes(String language) {
        List<ThemeBO> themes = new ArrayList<ThemeBO>();
        themes=themeMapper.getThemes(language);
        return themes;
    }


    /**
     * 根据id获取主题相关信息
     * @param id
     * @param language
     * @return
     */
    @Transactional(propagation= Propagation.NOT_SUPPORTED,readOnly =true)
    public ThemeBO getTheme(String id,String language){
        ThemeBO theme=null;
        theme=themeMapper.getThemeById(id,language);

        return theme;
    }

    /**
     * 根据主题id获取所属线路的信息
     * @param themeId
     * @param language
     * @return
     */
    @Transactional(propagation= Propagation.NOT_SUPPORTED,readOnly =true)
    public List<TourBO> getAllToursByThemeId(String themeId,String language,Integer page){
        List<TourBO> list=null;
        String day3=MainService.getDate(3);
        try{
            list=themeMapper.getAllToursByThemeId(themeId, language, day3,page);
        }catch (Exception e){
            logger.error("getAllToursByThemeId()+获取指定主题的线路信息错误",e);
            e.printStackTrace();
        }
        return list;
    }

    @Transactional(propagation= Propagation.NOT_SUPPORTED,readOnly =true)
    public Integer getAllToursNo(String themeId){
        Integer total=0;
        try{
            total=themeMapper.getAllToursNo(themeId);
        }catch (Exception e){
            logger.error("getAllToursNo()+获取指定主题的线路总条数错误",e);
            e.printStackTrace();
        }
        return total;
    }
}
