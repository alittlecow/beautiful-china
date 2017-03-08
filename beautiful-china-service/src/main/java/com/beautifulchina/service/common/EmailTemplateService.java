/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 * @author: zhangyun
 * date: 2016-01-28
 */
package com.beautifulchina.service.common;

import com.beautifulchina.dao.common.EmailTemplateMapper;
import com.beautifulchina.email.bo.EmailTemplateBO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by Administrator on 2016/1/28.
 * 邮件模板Service
 */
@Service
public class EmailTemplateService {
    @Autowired
    private EmailTemplateMapper emailTemplateMapper;

    /**
     * 根据id查询邮件模板
     * @param id
     * @return
     */
    public EmailTemplateBO selectById(int id,String language){
        //查询出模板
        Map<String,Object> map=new HashMap<String, Object>();
        map.put("id",id);
        map.put("language",language);
        return emailTemplateMapper.selectById(map);
    }
}
