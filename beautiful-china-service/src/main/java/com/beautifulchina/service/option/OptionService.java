package com.beautifulchina.service.option;

import com.beautifulchina.dao.option.OptionMapper;
import com.beautifulchina.option.bo.OptionBO;
import com.beautifulchina.option.pojo.Option;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
 * 线路选择service
 */
@Service
public class OptionService {
    private static Logger logger = LoggerFactory.getLogger(OptionService.class);

    @Autowired
    private OptionMapper optionMapper;

    /**
     * 根据线路id和语言类型获取所有线路选择
     * @param map(tourId,language)
     * @return
     */
    public List<OptionBO> getAllOption(Map map){
        return optionMapper.getAllOption(map);
    }
}
