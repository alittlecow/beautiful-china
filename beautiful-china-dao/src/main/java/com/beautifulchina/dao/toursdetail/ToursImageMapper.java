/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 * @author: pengxiao
 * date: 2016/1/18.
 */
package com.beautifulchina.dao.toursdetail;
import com.beautifulchina.base.SqlMapper;
import com.beautifulchina.product.pojo.ToursImage;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ToursImageMapper extends SqlMapper{
    /**
     * 根据线路id查找线路图片
     * @param tourId
     * @return
     */
    List<ToursImage> selectTourImageById(int tourId);
}
