/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 *
 * @author: pengxiao
 * date: 2016/4/11.
 */
package com.beautifulchina.service.pay;

import com.beautifulchina.contact.vo.ContactVO;
import com.beautifulchina.dao.pay.ContactMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 联系人服务
 */
@Service
public class ContactService {

    @Autowired
    private ContactMapper contactMapper;//联系人mapper


    /**
     * 获取指定用联系人信息
     * @param id
     * @return
     */
    public List<ContactVO> getAllContact(Long id){
        return contactMapper.getAllContact(id);
    }
}
