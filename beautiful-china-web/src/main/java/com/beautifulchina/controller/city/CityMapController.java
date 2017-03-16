package com.beautifulchina.controller.city;

import com.beautifulchina.base.BaseController;
import com.beautifulchina.service.cityMap.CityMapService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 *
 * @author: buhengzhang
 * date: 2016-01-16
 */
@Controller
@RequestMapping(value="geoMap")
public class CityMapController extends BaseController{
    @Autowired
    private CityMapService cityMapService;

    @RequestMapping(method = RequestMethod.GET)
    public String index() {
        return "/city/cityMap";
    }

    @RequestMapping(value = "getIdbyCItyName")
    @ResponseBody
    public int getIdbyCItyName(String name,HttpServletRequest request){
        String language = getLocal(request);
        int id=cityMapService.getIdbyCItyName(language,name);
        return id;
    }

    @RequestMapping(value = "getInfoById")
    @ResponseBody
    public Map<String,Object> getInfoById(int id,HttpServletRequest request){
        String language = getLocal(request);
        List list=cityMapService.getInfoById(language,id);
        Map<String,Object> result=null;
        result=successDataResult(list);
        return result;
    }
}
