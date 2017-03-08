package com.beautifulchina.dao.information;

import com.beautifulchina.base.SqlMapper;
import com.beautifulchina.contact.vo.ContactVO;
import com.beautifulchina.user.vo.OrdinaryUserVO;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 *
 * @author: buhengzhang
 * date: 2016-01-16
 */
@Repository
public interface InfoMapper extends SqlMapper {

    /**
     * 更改个人信息
     * @param ordinaryUserVO
     */
    void changeInfo(OrdinaryUserVO ordinaryUserVO);

    OrdinaryUserVO getUserInfo(int id);

    void saveContactInfo(List<ContactVO> list);

    /**
     * 根据用户id查找联系人
     * @param userId
     * @return
     */
    List<ContactVO> getContactByUser(Integer userId);

    /**
     * 新增联系人
     * @param contactVO
     */
    void saveContact(ContactVO contactVO);

    /**
     * 修改联系人
     * @param contactVO
     */
    void updateContact(ContactVO contactVO);

    /**
     * 删除联系人
     * @param Id
     */
    void deleteContact(Integer Id);
}
