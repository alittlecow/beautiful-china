/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 *
 * @author: buhengzhang
 * date: 2016-01-14
 */

package com.beautifulchina.dao.customline;

import com.beautifulchina.base.SqlMapper;
import com.beautifulchina.customline.vo.CustomlineVO;
import org.springframework.stereotype.Repository;

/**
 * 路线相关信息mapper
 */
@Repository
public interface CustomlineMapper extends SqlMapper {
    /**
     * 将路线相关信息插入数据库
     * @param customlineVO
     * @return
     */
    int insertCustomline(CustomlineVO customlineVO);
}
