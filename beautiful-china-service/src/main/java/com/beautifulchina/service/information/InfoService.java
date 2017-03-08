package com.beautifulchina.service.information;

import com.beautifulchina.contact.vo.ContactVO;
import com.beautifulchina.dao.information.InfoMapper;
import com.beautifulchina.user.vo.OrdinaryUserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 *
 * @author: buhengzhang
 * date: 2016-01-16
 */
@Service
@Transactional(rollbackFor = Exception.class)
public class InfoService {

    @Autowired
    private InfoMapper informationMapper;

    public void changeInfo(OrdinaryUserVO ordinaryUserVO) {
        informationMapper.changeInfo(ordinaryUserVO);
    }

    public OrdinaryUserVO getUserInfo(int id) {
        OrdinaryUserVO ordinaryUserVO = informationMapper.getUserInfo(id);
        return ordinaryUserVO;
    }

    @Transactional(propagation= Propagation.NOT_SUPPORTED,readOnly =true)
    public List<ContactVO> getContactByUser(Integer id){
        List<ContactVO> list = informationMapper.getContactByUser(id);
        if(list.size()>0){
            return list;
        }
        return null;
    }

    public void saveContact(ContactVO contactVO){
        if(contactVO.getId()!=null){
            informationMapper.updateContact(contactVO);
        }else{
            informationMapper.saveContact(contactVO);
        }

    }


    public void deleteContact(Integer id){
        informationMapper.deleteContact(id);
    }
}
