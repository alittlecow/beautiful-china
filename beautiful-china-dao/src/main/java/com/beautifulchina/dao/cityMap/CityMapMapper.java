package com.beautifulchina.dao.cityMap;

import com.beautifulchina.base.SqlMapper;
import com.beautifulchina.cityMap.CityMap;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 *
 * @author: buhengzhang
 * date: 2016-01-16
 */
@Repository
public interface CityMapMapper  extends SqlMapper {
    int getIdbyCItyName( @Param(value="language")String language,@Param(value="name")String name);
    List<CityMap> getInfoById(@Param(value="language")String language, @Param(value="id")int id);
    List<CityMap> getSightsInfoById(@Param(value="language")String language,@Param(value="id")int id);
    List<CityMap> getHotelInfoById(@Param(value="language")String language,@Param(value="id")int id);
}
