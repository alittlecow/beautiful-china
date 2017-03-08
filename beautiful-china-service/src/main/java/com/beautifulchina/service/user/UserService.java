/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 * @author: chenghuanhuan
 * date: 2015-10-22
 */
package com.beautifulchina.service.user;

import com.beautifulchina.mongo.dao.usercenter.impl.UserMongoDaoImpl;
import com.beautifulchina.user.bo.UserBO;
import com.beautifulchina.dao.user.UserMapper;
import com.beautifulchina.pojo.user.User;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.UUID;

/**
 * 用户服务
 */
@Service
public class UserService {

    private static Logger logger = LoggerFactory.getLogger(UserService.class);
    /**
     * 使用@Autowired注解标注userMapper变量，
     * 当需要使用UserMapper时，Spring就会自动注入UserMapper
     */
    @Autowired
    private UserMapper userMapper;//注入dao
    @Autowired
    private UserMongoDaoImpl userMongoDao;
    public void addUser(UserBO userBO) {
        logger.trace("Hello World! this is addUser method!");
        logger.debug("How are you today?");
        logger.info("I am fine.");
        logger.warn("I love programming.");
        logger.error("I am programming.");
        userMapper.insert(userBO);
    }

    /**
     * 通过用户编号获取用户信息
     * @param userId
     * @return
     */
    public UserBO getUserById(String userId) {

        User user = userMapper.selectByPrimaryKey(userId);
        UserBO userBO = new UserBO();
        BeanUtils.copyProperties(user, userBO);
        return userBO;
    }

    public void saveUserToMongodb(UserBO userBO){

        userMongoDao.save(userBO);
    }

    /**
     * 事务处理测试
     * 关于事务的注解
     常用如下
     1、如果有事务, 那么加入事务, 没有的话新建一个(默认情况下),也就是当我们要开启事务的时候才用，即有数据库有增删改操作
     @Transactional(rollbackFor=Exception.class,propagation = Propagation.REQUIRED)
     2、容器不为这个方法开启事务，一般只读的情况下用这个，可以省略
     @Transactional(propagation=Propagation.NOT_SUPPORTED,readOnly =true)
     3、如果其他bean调用这个方法,在其他bean中声明事务,那就用事务.如果其他bean没有声明事务,那就不用事务.
     @Transactional(propagation=Propagation.SUPPORTS)
     这个注解一般用于被注解的方法是供另一个service方法调用时会用到，一般很少使用
     其他注解属性几乎用不到，如果用会出现问题，除极个别特殊业务场景再议论
     详情请参考
     http://www.cnblogs.com/younggun/archive/2013/07/16/3193800.html
     */
   @Transactional(rollbackFor=Exception.class,propagation = Propagation.REQUIRED)
   public void rollBackTest(){
       UserBO user = new UserBO();
       String userId = UUID.randomUUID().toString().replaceAll("-", "");
       user.setUserId(userId);
       user.setUserName("ssdfsfsdf1");
       user.setUserBirthday(new Date());
       user.setUserSalary(10000D);
       this.addUser2(user);
       int i = 5/0;

       UserBO user2 = new UserBO();
       String userId2 = UUID.randomUUID().toString().replaceAll("-", "");
       user2.setUserId(userId2);
       user2.setUserName("ssdfsfsdfsdf2");
       user2.setUserBirthday(new Date());
       user2.setUserSalary(10000D);
       userMapper.insert(user2);

   }

    public void addUser2(UserBO userBO) {

        userMapper.insert(userBO);

        UserBO user3 = new UserBO();
        String userId3 = UUID.randomUUID().toString().replaceAll("-", "");
        user3.setUserId(userId3);
        user3.setUserName("ssdfsfsdfsdf3");
        user3.setUserBirthday(new Date());
        user3.setUserSalary(10000D);
        addUser3(user3);
    }
    public void addUser3(UserBO userBO) {

        userMapper.insert(userBO);
    }
}
