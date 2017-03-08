/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 * @author: zhangyun
 * date: 2016-01-08
 */
package com.beautifulchina.dao.user;

import com.beautifulchina.base.SqlMapper;
import com.beautifulchina.user.bo.OrdinaryUserBO;
import com.beautifulchina.user.vo.OrdinaryUserVO;
import com.beautifulchina.user.vo.UserInfoVO;
import org.springframework.stereotype.Repository;

/**
 * Created by Administrator on 2016/1/08.
 * 普通用户Mapper
 */
@Repository
public interface RegisterMapper extends SqlMapper {
    /**
     * 注册
     * @param ordinaryUserVO
     */
    int register(OrdinaryUserVO ordinaryUserVO);

    /**
     * 保存用户信息
     * @param userInfoVO
     */
    void saveUserInfo(UserInfoVO userInfoVO);

    /**
     * 根据已注册的用户名邮箱查询用户ID
     * @param email
     * @return
     */
    long selectId(String email);

    /**
     * 验证用户名是否已存在
     * @param nickname
     * @return
     */
    OrdinaryUserBO uniqueUsername(String nickname);

    /**
     * 验证邮箱是否已注册
     * @param email
     * @return
     */
    int uniqueEmail(String email);
}
