/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 * @author: zhangyun
 * date: 2016-01-16
 */
package com.beautifulchina.service.user;

import com.beautifulchina.dao.user.ResetPasswordMapper;
import com.beautifulchina.user.bo.OrdinaryUserBO;
import com.beautifulchina.user.vo.OrdinaryUserVO;
import com.beautifulchina.util.MD5Util;
import com.beautifulchina.util.SecurityUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by Administrator on 2016/1/16.
 * 重置密码服务
 */
@Service
public class ResetPasswordService {
    @Autowired
    private ResetPasswordMapper resetPasswordMapper;

    /**
     * 根据邮件提示的参数id和随机码查询是否存在该邮件
     * @param id
     * @param authcode
     * @return
     */
    public OrdinaryUserBO selectByAuthcode(long id,String authcode){
        Map<String,Object> map=new HashMap<String, Object>();
        map.put("id",id);
        map.put("authcode",authcode);
        return resetPasswordMapper.selectByAuthcode(map);
    }

    /**
     * 根据id重置密码
     * @param ordinaryUserVO
     */
    public void resetPasswordByEmail(OrdinaryUserVO ordinaryUserVO){
        ordinaryUserVO = this.setPassword(ordinaryUserVO);
        resetPasswordMapper.resetPasswordByEmail(ordinaryUserVO);
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
}
