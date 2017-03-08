/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 * @author: zhangyun
 * date: 2016-01-16
 */
package com.beautifulchina.service.user;

import com.beautifulchina.dao.user.ForgotPasswordMapper;
import com.beautifulchina.user.bo.OrdinaryUserBO;
import com.beautifulchina.util.DateUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by Administrator on 2016/1/16.
 * 忘记密码服务
 */
@Service
public class ForgotPasswordService {
    @Autowired
    private ForgotPasswordMapper forgotPasswordMapper;

    /**
     * 根据邮箱获得用户信息
     * @param email
     * @return
     */
    public OrdinaryUserBO getUserByEmail(String email){
        return forgotPasswordMapper.getUserByEmail(email);
    }

    /**
     * 用户表更新随机码和操作时间
     * @param id
     * @param authcode
     */
    public void saveAuthcode(long id,String authcode){
        //获取当前时间
        String datetime=DateUtil.getCurrentDate();
        Map<String,Object> map=new HashMap<String, Object>();
        map.put("id",id);
        map.put("authcode",authcode);
        map.put("operatetime",datetime);
        forgotPasswordMapper.saveAuthcode(map);
    }
}
