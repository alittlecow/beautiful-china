/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 * @author: pengxiao
 * date: 2016/1/18.
 */
package com.beautifulchina.dao.toursdetail;
import com.beautifulchina.base.SqlMapper;
import com.beautifulchina.product.pojo.ToursDetail;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * 线路详情Mapper
 */

@Repository
public interface ToursDetailMapper extends SqlMapper{
    /**
     * 根据线路tour_id 查找线路详情
     * @param tourId
     * @return
     */
    List<ToursDetail> selectByTourCode(int tourId);


}
