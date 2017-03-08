/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 *
 * @author: chenghuanhuan
 * date: 2016-01-06
 */
package com.beautifulchina.controller.info;

import com.beautifulchina.base.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 联系我们页面控制器
 */
@Controller
@RequestMapping(value = "contact")
public class ContactController extends BaseController {

    /**
     * 联系我们页面
     * @return
     */
    @RequestMapping(method= RequestMethod.GET)
    public String index(){

        return "/info/contact";
    }

}
