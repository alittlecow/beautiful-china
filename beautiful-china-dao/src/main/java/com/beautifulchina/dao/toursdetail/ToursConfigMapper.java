/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 * @author: pengxiao
 * date: 2016/1/18.
 */
package com.beautifulchina.dao.toursdetail;

import com.beautifulchina.base.SqlMapper;
import com.beautifulchina.product.pojo.ToursConfig;
import org.springframework.stereotype.Repository;

import java.util.List;


/**
 * 线路配置Mapper
 */
@Repository
public interface ToursConfigMapper extends SqlMapper {

    /**
     * 根据线路id查找线路配置
     * @param tourId
     * @return
     */
    List<ToursConfig> selectTourConfigById(int tourId);
}

