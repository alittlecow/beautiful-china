/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 *
 * @author: chenghuanhuan
 * date: 2015-11-11
 */
package com.beautifulchina.controller.json;

import com.beautifulchina.base.BaseController;
import com.beautifulchina.dao.language.LanguageMapper;
import com.beautifulchina.language.Language;
import com.beautifulchina.user.vo.UserVO;
import org.apache.commons.lang.time.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.*;

/**
 * json相关请求测试类
 */
@Controller
@RequestMapping(value = "/json")
public class JsonTestController extends BaseController {
    @Autowired
    private LanguageMapper languageMapper;


    public static void main(String[] args) {

        try {
            insertTourDate();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void insertTourDate() throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.jdbc.Driver");
        String url = "jdbc:mysql://139.199.63.230:3306/beautiful?useUnicode=true&characterEncoding=UTF-8&zeroDateTimeBehavior=convertToNull";
        String user = "root";
        String password = "a6P7yGnpw4Z9";
        Connection connection = DriverManager.getConnection(url, user, password);
        String insertSql = "INSERT INTO tm_tourdate(tour_id,trd_time,trd_price,trd_inventory,trd_sales,trd_pending,trd_remain,trd_warn) " +
                "VALUES(1,?,39854,100,0,0,100,10)";
        PreparedStatement preparedStatement = connection.prepareStatement(insertSql);
        Date day = new Date();
        for (int i = 0; i < 365; i++) {
            preparedStatement.setObject(1, day);
            day = DateUtils.addDays(day, 1);
            System.out.println("日期:"+day +"  数量:"+i);
            preparedStatement.addBatch();
        }
        preparedStatement.executeBatch();

    }

    /**
     * 简单对象转换实例
     *
     * @param userVO
     */
    @RequestMapping(value = "getJSON1")
    @ResponseBody
    public Map<String, Object> getJSON1(@RequestBody UserVO userVO) {
        System.out.println("------getJSON1---start----");
        System.out.println(userVO.getUserId());
        System.out.println(userVO.getUserName());
        System.out.println("------getJSON1---end----");
        Map<String, Object> result = successResult();
        return result;
    }

    @RequestMapping(value = "insertData")
    public Map<String, Object> testInsert() {
        int count = 300;
        for (int i = 0; i < count; i++) {
            List<Language> languageList = new ArrayList<Language>();
            String uuid = UUID.randomUUID().toString().replace("-", "");
            Language language;
            List<String> languages = Arrays.asList(new String[]{"en", "fr", "zh"});
            for (int j = 0; j < languages.size(); j++) {
                language = new Language();
                language.setUuid(uuid);
                String num = "00" + i;
                language.setContent("待使用uuid" + num.substring(num.length() - 3));
                language.setType(languages.get(j));
                language.setOperatorAt(new Date());
                language.setOperateBy("root");
                languageList.add(language);
            }
            languageMapper.insertLanguageItem(languageList);
            System.out.println("....count=" + i);

        }
        Map<String, Object> result = successResult();
        return result;
    }

    /**
     * ArrayList实例
     *
     * @param list
     */
    @RequestMapping(value = "getJSON2")
    @ResponseBody
    public Map<String, Object> getJSON2(@RequestBody ArrayList<String> list) {
        System.out.println("------getJSON2---start----");
        for (int i = 0; i < list.size(); i++) {
            System.out.println(list.get(i));
        }
        System.out.println(list);
        System.out.println("------getJSON2---end----");
        Map<String, Object> result = successResult();
        return result;
    }

    /**
     * list+map实例
     *
     * @param list
     */
    @RequestMapping(value = "getJSON3")
    @ResponseBody
    public Map<String, Object> getJSON3(@RequestBody List<Map> list) {
        System.out.println("------getJSON3---start----");
        for (int i = 0; i < list.size(); i++) {
            Map map = list.get(i);
            System.out.println(map.get("userId") + " " + map.get("userName"));
        }
        System.out.println("------getJSON3---end----");
        Map<String, Object> result = successResult();
        return result;
    }

    /**
     * map实例
     *
     * @param map
     */
    @RequestMapping(value = "getJSON4")
    @ResponseBody
    public Map<String, Object> getJSON4(@RequestBody Map map) {
        System.out.println("------getJSON4---start----");
        System.out.println(map.get("username"));
        List<Map> workList = (List) map.get("work");
        for (int i = 0; i < workList.size(); i++) {
            Map eachAddressMap = workList.get(i);
            System.out.println("address=" + eachAddressMap.get("address"));
        }
        Map schoolMap = (Map) map.get("school");
        System.out.println(schoolMap.get("name"));
        System.out.println(schoolMap.get("address"));
        System.out.println("------getJSON4---end----");
        Map<String, Object> result = successResult();
        return result;
    }

    /**
     * ArrayList+object实例
     *
     * @param list
     */
    @RequestMapping(value = "getJSON5")
    @ResponseBody
    public Map<String, Object> getJSON5(@RequestBody ArrayList<UserVO> list) {
        System.out.println("------getJSON2---start----");
        for (int i = 0; i < list.size(); i++) {
            System.out.println(list.get(i));
        }
        System.out.println(list);
        System.out.println("------getJSON2---end----");
        Map<String, Object> result = successResult();
        return result;
    }
}
