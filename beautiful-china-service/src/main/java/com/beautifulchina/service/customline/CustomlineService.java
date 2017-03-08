/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 *
 * @author: buhengzhang
 * date: 2016-01-14
 */

package com.beautifulchina.service.customline;

import com.beautifulchina.customline.vo.CustomlineVO;
import com.beautifulchina.dao.customline.CustomlineMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CustomlineService {

    @Autowired
    private CustomlineMapper customlineMapper;

    /**
     * 插入路线相关信息
     * @param customlineVO
     * @return
     */
    public void insertCustomline(CustomlineVO customlineVO){
        customlineMapper.insertCustomline(customlineVO);
    }
}
