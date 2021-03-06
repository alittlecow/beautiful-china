/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 *
 * @author: chenghuanhuan
 * date: 2015-11-02
 */
package com.beautifulchina.mongo.dao.usercenter.impl;

import com.beautifulchina.mongo.dao.base.impl.BaseMongoDaoImpl;
import com.beautifulchina.mongo.dao.usercenter.UserMongoDao;
import com.beautifulchina.user.bo.UserBO;
import org.springframework.stereotype.Repository;

/**
 * 测试
 */
@Repository
public class UserMongoDaoImpl extends BaseMongoDaoImpl implements UserMongoDao<UserBO>{
    public void insertTest(UserBO userBO) {
        this.save(userBO);
    }
}
