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
 * 关于我们页面控制器
 */
@Controller
@RequestMapping(value = "about")
public class AboutController extends BaseController {

    /**
     * 支付页面
     * @return
     */
    @RequestMapping(method= RequestMethod.GET)
    public String index(){

        return "/info/about";
    }

}
