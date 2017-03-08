/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 *
 * @author: pengxiao
 * date: 2016/4/11.
 */
package com.beautifulchina.dao.pay;

import com.beautifulchina.base.SqlMapper;
import com.beautifulchina.contact.vo.ContactVO;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 联系人信息mapper
 */
@Repository
public interface ContactMapper extends SqlMapper{

    /**
     * 获取所有联系人信息
     * @return
     * @param id 用户id
     */
    List<ContactVO> getAllContact(Long id);
}
