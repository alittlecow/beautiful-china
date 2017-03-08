package com.beautifulchina.service.Agent;

import com.beautifulchina.dao.agent.AgentMapper;
import com.beautifulchina.user.vo.OrdinaryUserVO;
import com.beautifulchina.util.MD5Util;
import com.beautifulchina.util.SecurityUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 *
 * @author: buhengzhang
 * date: 2016-01-16
 */
@Service
public class AgentService {
    @Autowired
    private AgentMapper agentMapper;
    //插入商家登陆信息
    public void insertAgentLogin(OrdinaryUserVO ordinaryUserVO){
        ordinaryUserVO=this.setPassword(ordinaryUserVO);
        agentMapper.insertAgentLogin(ordinaryUserVO);
    }
    //获取商家Id
    public int getAgentUserId(String email){
        int id=agentMapper.getAgentUserId(email);
        return id;
    }
    //插入商家信息
    public void insertAgent(OrdinaryUserVO ordinaryUserVO) {
        agentMapper.insertAgent(ordinaryUserVO);
    }
    private OrdinaryUserVO setPassword(OrdinaryUserVO ordinaryUserVO){
        String pwd = MD5Util.getDecryptLoginPassword(ordinaryUserVO.getPassword());
        String psw = SecurityUtil.getNewPsw();
        // 密码采用加盐处理
        String encryptPassword = SecurityUtil.getStoreLogpwd(ordinaryUserVO.getEmail(),pwd , psw);
        ordinaryUserVO.setPassword(encryptPassword);
        ordinaryUserVO.setPsw(psw);
        return ordinaryUserVO;
    }

    /**
     * 验证邮箱是否重复
     * @param email
     * @return
     */
    public int uniqueEmail(String email){
        return agentMapper.uniqueEmail(email);
    }
}
