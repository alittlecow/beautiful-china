/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 * @author: chenghuanhuan
 * date: 2015-10-22
 */
package com.beautifulchina.controller.user;

import com.beautifulchina.base.BaseController;
import com.beautifulchina.constants.UserErrorCode;
import com.beautifulchina.exception.CommonException;
import com.beautifulchina.exception.RedisException;
import com.beautifulchina.exception.UserCenterException;
import com.beautifulchina.manager.RedisManager;
import com.beautifulchina.service.ip.IPService;
import com.beautifulchina.user.bo.UserBO;
import com.beautifulchina.service.user.UserService;
import com.beautifulchina.user.vo.UserVO;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.i18n.CookieLocaleResolver;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.util.*;

/**
 * Created by chenghuanhuan on 15/10/13.
 */
@Controller
@RequestMapping(value = "/first")
public class FirstController extends BaseController {

    @Autowired
    private UserService userService;
    @Autowired
    private RedisManager redisManager;
    @Autowired
    private IPService ipService;

    @RequestMapping(value = "test")
    public String first(HttpServletRequest request,Model model){

        UserBO user = new UserBO();
        String userId = UUID.randomUUID().toString().replaceAll("-", "");
        user.setUserId(userId);
        user.setUserName("白虎神皇xdp");
        user.setUserBirthday(new Date());
        user.setUserSalary(10000D);
        userService.addUser(user);

        UserBO user1 = userService.getUserById(userId);
        System.out.println(user1);
        System.out.println("-------------test-------------------");
        model.addAttribute("errorMessage", getMessage("test.404"));
        return "test";
    }

    /**
     * json字符串的返回
     * @return
     */
    @RequestMapping(value = "json")
    @ResponseBody
    public UserBO jsonTest(){
        UserBO user = new UserBO();
        String userId = UUID.randomUUID().toString().replaceAll("-", "");
        user.setUserId(userId);
        user.setUserName("白虎神皇xdp");
        user.setUserBirthday(new Date());
        user.setUserSalary(10000D);

        return user;
    }

    /**
     * 参数自动匹配
     * @param userId
     * @param userName
     * @param salary
     * @return
     * http://localhost:8080/first/autoMatch?userId=fff&userName=sfdsf&salary=10.11&birthday=2014-12-12%20%2010:10:12
     */
    @RequestMapping(value = "autoMatch")
    @ResponseBody
    public UserBO  autoMatch(String userId,String userName,Double salary,Date birthday){
        UserBO user = new UserBO();
        user.setUserId(userId);
        user.setUserName(userName);
        user.setUserSalary(salary);
        user.setUserBirthday(birthday);
        return user;
    }

    /**
     * 自动装箱
     * @param userVO
     * @return
     * http://localhost:8080/first/autoCover?userId=fff&userName=sfdsf&userSalary=10.11&userBirthday=2014-12-12%20%2010:10:12
     */
    @RequestMapping(value = "autoCover")
    @ResponseBody
    public UserBO  autoCover(@Valid UserVO userVO){
        UserBO userBO = new UserBO();
        BeanUtils.copyProperties(userVO, userBO);
        return userBO;
    }

    /**
     * 使用map向前台传参
     * @param map
     * @return
     */
    @RequestMapping("/showMap")
    public String showMap(Map<String,Object> map){
        UserBO user = new UserBO();
        String userId = UUID.randomUUID().toString().replaceAll("-", "");
        user.setUserId(userId);
        user.setUserName("白虎神皇xdp");
        user.setUserBirthday(new Date());
        user.setUserSalary(10000D);
        map.put("user", user);
        return "test";
    }

    /**
     * 使用RequestParam绑定参数
     * @param id
     * @param name
     * @return
     */
    @RequestMapping(value="/param")
    public String testRequestParam(@RequestParam(value="id") Integer id,
                                   @RequestParam(value="name")String name){
        System.out.println(id + " " + name);
        return "/test";
    }

    /**
     * 全局的异常处理
     * @return
     */
    @RequestMapping("/error")
    public String error(){
        int i = 5/0;
        return "hello";
    }

    @RequestMapping("/error1")
    public String error1(HttpServletRequest request) throws UserCenterException {
        try {
            int i = 5/0;
        }catch (Exception e){
            throw new UserCenterException(getMessageToMap(UserErrorCode.SYSTEM_ERROR));
        }

        return "hello";
    }

    @RequestMapping("/globaltest")
    public String globalTest(HttpServletRequest request,HttpServletResponse response){
        Object objectType = request.getParameter("langType");
        String langType = null;
        if (objectType != null) {
            langType = (String)objectType;
        }
        if ("zh".equals(langType)) {
            Locale locale = new Locale("zh", "CN");
            new CookieLocaleResolver().setLocale(request, response, locale);
        } else if ("fr".equals(langType)) {
            Locale locale = new Locale("fr", "FR");
            new CookieLocaleResolver().setLocale(request, response, locale);
        } else {
            new CookieLocaleResolver().setLocale(request, response, new Locale("en", "US"));
        }
        return "globaltest";
    }

    @RequestMapping("/mongosave")
    @ResponseBody
    public UserBO mongoSave(HttpServletRequest request,HttpServletResponse response){
        UserBO user = new UserBO();
        String userId = UUID.randomUUID().toString().replaceAll("-", "");
        user.setUserId(userId);
        user.setUserName("白虎神皇xdp");
        user.setUserBirthday(new Date());
        user.setUserSalary(10000D);
        userService.saveUserToMongodb(user);
        return user;

    }

    @RequestMapping("/redistest")
    public String redisTest(HttpServletRequest request,HttpServletResponse response) throws RedisException {
        long l = redisManager.hset("test","a","b");
        String s =redisManager.hget("test", "a");
        System.out.println("----------redistest------" + s + "-----------------");
        return "hello";

    }

    @RequestMapping("/ip/{ipAddress}")
    public ResponseEntity<Map<String, String>> ipTest(@PathVariable String ipAddress, HttpServletRequest request,HttpServletResponse response) throws RedisException {
        Map<String, String> map = new HashMap<String, String>();
        try {
            String date = ipService.getTimeZone(ipAddress,new Date(),null);
            Date date2 = ipService.getTimeZoneDate(ipAddress,new Date(),null);
            map.put("date1",date);
            map.put("date2",date2.toString());
        } catch (CommonException e) {
            e.printStackTrace();
        }
        return new ResponseEntity<Map<String, String>>(map, HttpStatus.OK);

    }

    @RequestMapping("/rollBackTest")
    public String rollBackTest(HttpServletRequest request,HttpServletResponse response) throws RedisException {
       userService.rollBackTest();
        return "/test";

    }
}
