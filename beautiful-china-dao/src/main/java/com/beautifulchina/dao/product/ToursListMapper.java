/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 *
 * @author: zhangyun
 * date: 2016-01-13
 */
package com.beautifulchina.dao.product;

import com.beautifulchina.base.SqlMapper;
import com.beautifulchina.product.bo.ToursListBO;
import org.springframework.stereotype.Repository;
import java.util.List;
import java.util.Map;

/**
 * 线路列表Mapper
 * Created by Administrator on 2016/1/13.
 */
@Repository
public interface ToursListMapper extends SqlMapper {
    /**
     * 查询旅游线路列表
     * @param map
     * @return
     */
    List<ToursListBO> getToursByCondition(Map<String, Object> map);

    /**
     * 旅游线路总条数
     * @param map
     * @return
     */
    int getCount(Map<String, Object> map);
}
