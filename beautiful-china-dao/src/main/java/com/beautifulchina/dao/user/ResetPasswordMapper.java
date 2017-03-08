/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 * @author: zhangyun
 * date: 2016-01-16
 */
package com.beautifulchina.dao.user;

import com.beautifulchina.base.SqlMapper;
import com.beautifulchina.user.bo.OrdinaryUserBO;
import com.beautifulchina.user.vo.OrdinaryUserVO;
import org.springframework.stereotype.Repository;

import java.util.Map;

/**
 * Created by Administrator on 2016/1/16.
 * 重置密码Mapper
 */
@Repository
public interface ResetPasswordMapper extends SqlMapper {
    /**
     * 根据邮件提示的参数id和随机码查询是否存在该邮件
     * @param map
     * @return
     */
    OrdinaryUserBO selectByAuthcode(Map<String,Object> map);

    /**
     * 根据id重置密码
     * @param ordinaryUserVO
     */
    void resetPasswordByEmail(OrdinaryUserVO ordinaryUserVO);
}
