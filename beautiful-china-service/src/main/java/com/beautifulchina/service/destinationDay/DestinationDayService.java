/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 *
 * @author: buhengzhang
 * date: 2016-01-14
 */

package com.beautifulchina.service.destinationday;

import com.beautifulchina.dao.destinationday.DestinarionDayMapper;
import com.beautifulchina.destinationday.vo.DestinationDayVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DestinationDayService {

    @Autowired
    private DestinarionDayMapper destinarionDayMapper;

    /**
     * 插入目的地相关信息
     * @param destinationDayVO
     * @return
     */
    public void insertDestinationDay(DestinationDayVO destinationDayVO,String language){
        destinationDayVO.setLanguage(language);
        destinarionDayMapper.insertDestinationDay(destinationDayVO);
    }
}
