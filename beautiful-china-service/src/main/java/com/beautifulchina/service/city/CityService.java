package com.beautifulchina.service.city;

import com.beautifulchina.city.CityBO;
import com.beautifulchina.city.CityVO;
import com.beautifulchina.dao.city.CityMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 *
 * @author: buhengzhang
 * date: 2016-01-16
 */
@Service
public class CityService {

    @Autowired
    private CityMapper cityMapper;

    /**
     * 获取城市列表Service
     *
     * @param language
     * @return
     */
    public List<CityVO> getAllcity(String language) {

        return cityMapper.getAllCity(language);
    }
    /**
     * 城市详情
     */
    CityBO getCityDetail(Map map){
        return cityMapper.getCityDetail(map);
    }


}
