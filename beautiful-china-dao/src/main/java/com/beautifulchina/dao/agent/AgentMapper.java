package com.beautifulchina.dao.agent;

import com.beautifulchina.base.SqlMapper;
import com.beautifulchina.user.vo.OrdinaryUserVO;
import org.springframework.stereotype.Repository;

/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 *
 * @author: buhengzhang
 * date: 2016-01-16
 */
@Repository
public interface AgentMapper extends SqlMapper {

    //插入商家登陆信息
    void insertAgentLogin(OrdinaryUserVO ordinaryUserVO);
    //获取商家ID
    int getAgentUserId(String email);
    //插入商家信息
    void insertAgent(OrdinaryUserVO ordinaryUserVO);
    /**
     * 验证邮箱是否重复
     * @param email
     * @return
     */
    int uniqueEmail(String email);
}
