package com.beautifulchina.service.cityMap;

import com.beautifulchina.cityMap.CityMap;
import com.beautifulchina.dao.cityMap.CityMapMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 *
 * @author: buhengzhang
 * date: 2016-01-16
 */
@Service
public class CityMapService {
    @Autowired
    private CityMapMapper cityMapMapper;

    public int getIdbyCItyName(String language,String name){
        int id=cityMapMapper.getIdbyCItyName(language,name);
        return id;
    }

    public List getInfoById(String language,int id){
        List list=new ArrayList();
        List<CityMap> list1 = cityMapMapper.getInfoById(language,id);
        List<CityMap> list2 = cityMapMapper.getSightsInfoById(language,id);
        List<CityMap> list3 = cityMapMapper.getHotelInfoById(language,id);
        list.add(list1);
        list.add(list2);
        list.add(list3);
        return list;
    }
}
