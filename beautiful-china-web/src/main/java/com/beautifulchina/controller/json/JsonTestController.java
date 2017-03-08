/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 *
 * @author: chenghuanhuan
 * date: 2015-11-11
 */
package com.beautifulchina.controller.json;

import com.beautifulchina.base.BaseController;
import com.beautifulchina.user.vo.UserVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * json相关请求测试类
 */
@Controller
@RequestMapping(value = "/json")
public class JsonTestController extends BaseController {

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
