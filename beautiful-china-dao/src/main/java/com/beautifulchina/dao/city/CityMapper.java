/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 *
 * @author: buhengzhang
 * date: 2016-01-16
 */

package com.beautifulchina.dao.city;

import com.beautifulchina.base.SqlMapper;
import com.beautifulchina.city.CityBO;
import com.beautifulchina.city.CityVO;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;


/**
 * 获取城市列表Mapper
 */
@Repository
public interface CityMapper  extends SqlMapper {

    /**
     * 获取城市列表
     * @return
     */
    List<CityVO> getAllCity(String language);
    /**
     * 获取首页展示城市列表
     */
    List<CityVO> getIndexCity(Map map);
    /**
     * 城市详情
     */
    CityBO getCityDetail(Map map);
}
