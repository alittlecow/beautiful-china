/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 * @author: zhangyun
 * date: 2016-01-28
 */
package com.beautifulchina.dao.common;

import com.beautifulchina.base.SqlMapper;
import com.beautifulchina.email.bo.EmailTemplateBO;
import org.springframework.stereotype.Repository;

import java.util.Map;

/**
 * Created by Administrator on 2016/1/28.
 * 邮件模板Mapper
 */
@Repository
public interface EmailTemplateMapper extends SqlMapper {
    /**
     * 根据id查询邮件模板
     * @param map
     * @return
     */
    EmailTemplateBO selectById(Map<String,Object> map);
}
