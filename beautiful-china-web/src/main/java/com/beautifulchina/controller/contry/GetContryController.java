package com.beautifulchina.controller.contry;

import com.beautifulchina.base.BaseController;
import com.beautifulchina.country.Country;
import com.beautifulchina.service.contry.GetCountryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
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
@RequestMapping(value = "GetContry")
public class GetContryController extends BaseController {

    @Autowired
    private GetCountryService getCountryService;

    @RequestMapping(value = "getCountry")
    @ResponseBody
    public Map<String, Object> getCountry(HttpServletRequest request){
        Map<String, Object> result = null;
        List<Country> list = getCountryService.getCountry();
        result=successDataResult(list);
        return result;
    }

    @RequestMapping(value = "getProv")
    @ResponseBody
    public Map<String, Object> getProv(String code,HttpServletRequest request){
        Map<String, Object> result = null;
        List<Country> list = getCountryService.getProv(code);
        result=successDataResult(list);
        return result;
    }
}
