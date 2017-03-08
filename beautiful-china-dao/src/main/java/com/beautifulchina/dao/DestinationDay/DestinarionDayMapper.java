/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 *
 * @author: buhengzhang
 * date: 2016-01-14
 */

package com.beautifulchina.dao.destinationday;

import com.beautifulchina.base.SqlMapper;
import com.beautifulchina.destinationday.vo.DestinationDayVO;
import org.springframework.stereotype.Repository;

/**
 * 目的地相关信息mapper
 */
@Repository
public interface DestinarionDayMapper extends SqlMapper {
    /**
     * 将目的地相关信息插入数据库(法文)
     * @param destinationDayVO
     * @return
     */
    int insertDestinationDay(DestinationDayVO destinationDayVO);

}
