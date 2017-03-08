/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 *
 * @author: chenghuanhuan
 * date: 2016-01-06
 */

package com.beautifulchina.dao.login;

import com.beautifulchina.base.SqlMapper;
import com.beautifulchina.contact.vo.ContactVO;
import com.beautifulchina.user.bo.OrdinaryUserBO;
import com.beautifulchina.user.vo.OrdinaryUserVO;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 登录用户Mapper
 */
@Repository
public interface LoginUserMapper extends SqlMapper {
//
//    /**
//     * 通过nickname查找用户
//     * @return
//     */
//
//    LoginUser getUserByNickName(LoginUserVO loginUserVO);

    /**
     * 通过email查找用户
     * @return
     */
    OrdinaryUserBO getUserByEmail(OrdinaryUserVO ordinaryUserVO);


}
