/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 *
 * @author: buhengzhang
 * date: 2016-01-10
 */

package com.beautifulchina.service.login;

import com.beautifulchina.dao.login.LoginUserMapper;
import com.beautifulchina.user.bo.OrdinaryUserBO;
import com.beautifulchina.user.vo.OrdinaryUserVO;
import com.beautifulchina.util.MD5Util;
import com.beautifulchina.util.SecurityUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

/**
 * 用户登录服务
 */
@Service
@Transactional(rollbackFor = Exception.class)
public class LoginUserService {

    @Autowired
    private LoginUserMapper loginUserMapper;

    /**
     * 登录密码比较
     * @return
     */
    public boolean login(OrdinaryUserVO ordinaryUserVO,OrdinaryUserBO ordinaryUserBO){
        boolean ret = false;
        if(ordinaryUserBO != null){
            String password = ordinaryUserBO.getPassword();
            String psw = ordinaryUserBO.getPsw();
            String pwd = MD5Util.getDecryptLoginPassword(ordinaryUserVO.getPassword());
            //加盐处理
            String encryptPassword = SecurityUtil.getStoreLogpwd(ordinaryUserBO.getEmail(),pwd , psw);
            // 密码比较
            if(encryptPassword.equals(password)){
                ret = true;
            }
        }
        return ret;
    }
//    /**
//     * 通过nickname查找用户
//     * @return
//     */
//    @Transactional(propagation= Propagation.NOT_SUPPORTED,readOnly =true)
//    public LoginUserBO getUserByNickName(String nickName){
//        LoginUserBO loginUserBO = null;
//        LoginUserVO loginUserVO = new LoginUserVO();
//        loginUserVO.setNickName(nickName);
//        LoginUser loginUser = loginUserMapper.getUserByNickName(loginUserVO);
//        if (loginUser!=null) {
//            loginUserBO = new LoginUserBO();
//            BeanUtils.copyProperties(loginUser, loginUserBO);
//        }
//        return loginUserBO;
//    }

    /**
     * 通过email查找用户
     * @return
     */
    @Transactional(propagation= Propagation.NOT_SUPPORTED,readOnly =true)
    public OrdinaryUserBO getUserByEmail(String email){
        OrdinaryUserVO ordinaryUserVO = new OrdinaryUserVO();
        ordinaryUserVO.setEmail(email);
        OrdinaryUserBO ordinaryUserBO = loginUserMapper.getUserByEmail(ordinaryUserVO);

        return ordinaryUserBO;
    }


}
