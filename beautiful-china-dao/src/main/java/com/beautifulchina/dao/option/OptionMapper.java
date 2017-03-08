package com.beautifulchina.dao.option;

import com.beautifulchina.base.SqlMapper;
import com.beautifulchina.option.bo.OptionBO;
import com.beautifulchina.option.pojo.Option;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 *
 * @author: pengxiao
 * date: 2016/3/15.
 */

/**
 * 线路选项mapper
 */
@Repository
public interface OptionMapper extends SqlMapper {
    /**
     * 根据线路id和语言类型获取所有线路选择
     * @param map(tourId,language)
     * @return
     */
    List<OptionBO> getAllOption(Map map);
}
