/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 *
 * @author: chenghuanhuan
 * date: 2016-01-06
 */
package com.beautifulchina.controller.pay;

import com.beautifulchina.base.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 支付完成页面控制器
 */
@Controller
@RequestMapping(value = "confirmation")
public class ConfirmationController extends BaseController {

    /**
     * 支付完成页面
     * @return
     */
    @RequestMapping(method= RequestMethod.GET)
    public String index(){

        return "/pay/confirmation";
    }

}
