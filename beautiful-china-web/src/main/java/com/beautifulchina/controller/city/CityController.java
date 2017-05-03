/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 *
 * @author: pengxiao
 * date: 2016/4/7.
 */
package com.beautifulchina.controller.city;

import com.beautifulchina.base.BaseController;
import com.beautifulchina.city.CityBO;
import com.beautifulchina.dao.city.CityMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

/**
 * 城市详情控制器
 */
@Controller
@RequestMapping(value = "city")
public class CityController extends BaseController {

    @Autowired
    private CityMapper cityMapper;

    /**
     * 城市详情
     * @return
     */
    @RequestMapping(method= RequestMethod.GET)
    public String index(){

        return "/city/city";
    }

    /**
     * 根据城市id和语言获取城市详情
     * @param request
     * @param id
     * @return
     */

    @RequestMapping(value = "detail")
    public String getCityDetail(HttpServletRequest request,int id){
        String language = getLocal(request);
        Map map = new HashMap();
        map.put("language",language);
        map.put("id", id);
        CityBO cityBO = cityMapper.getCityDetail(map);
        localeSupport.localeContent(cityBO,language);
        request.setAttribute("city", cityBO);
        return "forward:/city";
    }

}
