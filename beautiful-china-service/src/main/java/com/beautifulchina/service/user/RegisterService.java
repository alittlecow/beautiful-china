/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 *
 * @author: zhangyun
 * date: 2016-01-08
 */
package com.beautifulchina.service.user;

import com.beautifulchina.dao.user.RegisterMapper;
import com.beautifulchina.user.bo.OrdinaryUserBO;
import com.beautifulchina.user.vo.OrdinaryUserVO;
import com.beautifulchina.user.vo.UserInfoVO;
import com.beautifulchina.util.DateUtil;
import com.beautifulchina.util.MD5Util;
import com.beautifulchina.util.SecurityUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by Administrator on 2016/1/08.
 * 普通用户服务
 */
@Service
@Transactional(rollbackFor = Exception.class)
public class RegisterService {
    @Autowired
    private RegisterMapper registerMapper;//注入dao
    /**
     * 普通用户注册
     * 根据已注册的用户名邮箱查询用户ID
     * @param ordinaryUserVO
     */
    public long register(OrdinaryUserVO ordinaryUserVO) {
        String nickname = ordinaryUserVO.getNickname();
//        String type = ordinaryUserVO.getType();
        ordinaryUserVO = this.setPassword(ordinaryUserVO);
        String regTime = DateUtil.getCurrentDate();
        ordinaryUserVO.setRegtime(regTime);
       registerMapper.register(ordinaryUserVO);
//        long userId = registerMapper.selectId(ordinaryUserVO.getEmail());
        long userId = ordinaryUserVO.getId();
        UserInfoVO userInfo = new UserInfoVO();
        userInfo.setEmail(ordinaryUserVO.getEmail());
        userInfo.setNickname(nickname);
        userInfo.setUserId(userId);
        registerMapper.saveUserInfo(userInfo);
        return userId;
    }

    public long getUserId(OrdinaryUserVO ordinaryUserVO){
        long userId = registerMapper.selectId(ordinaryUserVO.getEmail());
        return userId;
    }
    private OrdinaryUserVO setPassword(OrdinaryUserVO ordinaryUserVO) {
        String pwd = MD5Util.getDecryptLoginPassword(ordinaryUserVO.getPassword());
        String psw = SecurityUtil.getNewPsw();
        // 密码采用加盐处理
        String encryptPassword = SecurityUtil.getStoreLogpwd(ordinaryUserVO.getEmail(), pwd, psw);
        ordinaryUserVO.setPassword(encryptPassword);
        ordinaryUserVO.setPsw(psw);
        return ordinaryUserVO;
    }

    /**
     * 验证用户名是否已存在
     * @param nickname
     * @return
     */
    public OrdinaryUserBO uniqueUsername(String nickname) {
        return registerMapper.uniqueUsername(nickname);
    }

    /**
     * 验证邮箱是否已注册
     * @param email
     * @return
     */
    public int uniqueEmail(String email) {
        return registerMapper.uniqueEmail(email);
    }

}