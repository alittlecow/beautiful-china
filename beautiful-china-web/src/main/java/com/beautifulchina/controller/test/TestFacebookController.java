package com.beautifulchina.controller.test;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 *
 * @author: buhengzhang
 * date: 2016-01-16
 */
@Controller
@RequestMapping("facebook")
public class TestFacebookController {
    @RequestMapping(method = RequestMethod.GET)
    public String index() {
        return "/test/testfacebook";
    }
}
