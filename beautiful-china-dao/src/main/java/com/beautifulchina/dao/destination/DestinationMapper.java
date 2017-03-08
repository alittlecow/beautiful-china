/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 * @author: fengbaitong
 * date: 2016-01-10
 */
package com.beautifulchina.dao.destination;

import com.beautifulchina.base.SqlMapper;
import com.beautifulchina.city.CityVO;
import com.beautifulchina.destination.bo.DestinationBO;
import com.beautifulchina.tour.bo.TourBO;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * 目的地Mapper
 */
@Repository
public interface DestinationMapper extends SqlMapper {

    /**
     * 获取目的地城市列表
     * @return
     */
    List<CityVO> getCity(String language);


    /**
     * 获取目的地英文信息
     * @return
     */
    DestinationBO getDestinationByCityId(Map<String,String> map);

//    /**
//     * 获取目的地法文信息
//     * @return
//     */
//    DestinationBO getDestinationFrByCityId(String id);

    /**
     * 根据城市id获取9条线路列表
     * @return
     */
    List<TourBO> getAllToursByCityId(@Param(value="cityId")String cityId,
                                      @Param(value="language")String language,
                                      @Param(value="day3")String day3,
                                      @Param(value="page")Integer page);

    /**
     * 根据城市id获取全部线路条数
     * @param cityId
     * @return
     */
    Integer getAllToursNo(@Param(value="cityId")String cityId);


}
