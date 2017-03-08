package com.beautifulchina.dao.supplier;

import com.beautifulchina.base.SqlMapper;
import com.beautifulchina.footer.bo.SystemConfigBO;
import com.beautifulchina.supplier.Supplier;
import org.springframework.stereotype.Repository;

import java.util.Map;

/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 *
 * @author: buhengzhang
 * date: 2016-01-16
 */

/**
 * 商家入驻申请Mapper
 */
@Repository
public interface SupplierMapper  extends SqlMapper {
    //插入商家信息
    void insertSupplier(Supplier supplier);
    //获取用户注册协议
    SystemConfigBO getAgreement(Map map);

    /**
     * 验证code是否重复
     * @param deptCode
     * @return
     */
    int uniqueCode(String deptCode);

    /**
     * 验证邮箱是否重复
     * @param email
     * @return
     */
    int uniqueEmail(String email);
}
