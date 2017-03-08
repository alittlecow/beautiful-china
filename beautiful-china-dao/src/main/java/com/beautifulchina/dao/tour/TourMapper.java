/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 * @author: fengbaitong
 * date: 2016-01-10
 */
package com.beautifulchina.dao.tour;

import com.beautifulchina.base.SqlMapper;
import com.beautifulchina.tour.bo.TourBO;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;


/**
 * 主页面Mapper
 */
@Repository
public interface TourMapper extends SqlMapper {

    /**
     * 获取旅游线路英文相关信息
     * @return
     */
    List<TourBO> getTour(Map map);


    /**
     * 获取旅游线路相关信息
     * @return
     */
    List<TourBO> getTourIndex(Map map);

}
