package com.beautifulchina.service.supplier;

import com.beautifulchina.dao.language.LanguageMapper;
import com.beautifulchina.dao.supplier.SupplierMapper;
import com.beautifulchina.footer.bo.SystemConfigBO;
import com.beautifulchina.language.Language;
import com.beautifulchina.supplier.Supplier;
import com.beautifulchina.util.MD5Util;
import com.beautifulchina.util.SecurityUtil;
import com.beautifulchina.util.UUIDUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.Map;

/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 *
 * @author: buhengzhang
 * date: 2016-01-16
 */

/**
 * 商家入驻申请Service
 */
@Service
@Transactional(rollbackFor = Exception.class)
public class SupplierService {
    @Autowired
    private SupplierMapper supplierMapper;
    @Autowired
    private LanguageMapper languageMapper;
    //插入商家信息
    public void insertSupplier(Supplier supplier) {
        supplier=this.setPassword(supplier);
        String uuid=UUIDUtil.getUUID();
        Language language = new Language();
        language.setUuid(uuid);
        language.setType(supplier.getLanguage());
        language.setContent(supplier.getSupplierName());
        supplier.setSupplierName(uuid);
        languageMapper.insertLanguage(language);
        supplierMapper.insertSupplier(supplier);
    }
    private Supplier setPassword(Supplier supplier){
        String pwd = MD5Util.getDecryptLoginPassword(supplier.getPassword());
        String psw = SecurityUtil.getNewPsw();
        // 密码采用加盐处理
        String encryptPassword = SecurityUtil.getStoreLogpwd(supplier.getSupplierEmail(),pwd , psw);
        supplier.setPassword(encryptPassword);
        supplier.setPsw(psw);
        return supplier;
    }

    /**
     * 验证code是否重复
     * @param deptCode
     * @return
     */
    public int uniqueCode(String deptCode){
        return supplierMapper.uniqueCode(deptCode);
    }

    /**
     * 验证邮箱是否重复
     * @param email
     * @return
     */
    public int uniqueEmail(String email){
        return supplierMapper.uniqueEmail(email);
    }
    //获取用户注册协议
    public SystemConfigBO getAgreement(String groupCode,String language){
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("groupCode",groupCode);
        map.put("language",language);
        SystemConfigBO systemConfigBO=supplierMapper.getAgreement(map);
        return systemConfigBO;
    }

}
