/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 * @author: zhangyun
 * date: 2016-01-16
 */
package com.beautifulchina.dao.user;

import com.beautifulchina.base.SqlMapper;
import com.beautifulchina.email.vo.EmailHistoryVO;
import com.beautifulchina.user.bo.OrdinaryUserBO;
import org.springframework.stereotype.Repository;
import java.util.Map;

/**
 * Created by Administrator on 2016/1/16.
 * 忘记密码Mapper
 */
@Repository
public interface ForgotPasswordMapper extends SqlMapper{

    /**
     * 根据邮箱获得用户信息
     * @param email
     * @return
     */
    OrdinaryUserBO getUserByEmail(String email);

    /**
     * 用户表更新随机码和操作时间
     * @param map
     */
    void saveAuthcode(Map<String,Object> map);
}
