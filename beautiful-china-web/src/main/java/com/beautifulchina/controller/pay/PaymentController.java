/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 *
 * @author: pengxiao
 * date: 2016/3/10.
 */
package com.beautifulchina.controller.pay;

import com.beautifulchina.base.BaseController;
import com.beautifulchina.email.bo.EmailTemplateBO;
import com.beautifulchina.pay.vo.OrderUser;
import com.beautifulchina.service.common.EmailHistoryService;
import com.beautifulchina.service.common.EmailTemplateService;
import com.beautifulchina.service.pay.PaymentService;
import com.beautifulchina.service.util.EmailUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

/**
 * 支付订单控制器
 */
@Controller
@RequestMapping(value = "payment")
public class PaymentController extends BaseController{
    private static Logger logger = LoggerFactory.getLogger(PaymentController.class);
    @Autowired
    private PaymentService paymentService;

    @Autowired
    private EmailHistoryService emailHistoryService;
    @Autowired
    private EmailTemplateService emailTemplateService;

    /**
     * 支付页面
     * @return
     */
   @RequestMapping(method = RequestMethod.GET)
    public String index(){
        return "pay/payment";
    }

    /**
     * 根据订单号支付订单
     * @param orderNo
     * @return
     */
    @RequestMapping(value = "pay")
    @ResponseBody
    public Map<String,Object> pay(@RequestParam String orderNo,HttpServletRequest request){
        Map<String,Object> result;
        String language = this.getLocal(request);
        try{
            paymentService.pay(orderNo);
            //选取邮件模板
            EmailTemplateBO emailTemplateBO=emailTemplateService.selectById(7,language);//注册模板id为6
            //提取主题，内容模板
            String emailTitle=emailTemplateBO.getTitle();
            String emailContent=emailTemplateBO.getContent();
            //获取联系人信息
            OrderUser orderUser = paymentService.getOrderUser(orderNo);

            //用户id
            Long userId = orderUser.getUserId();
            //联系人
            String contact = orderUser.getContact();
            //用户联系邮箱
            String email = orderUser.getEmail();
            //发送邮件，并保存邮件历史记录
            emailContent=emailContent.replaceAll("#contact#",contact);//替换#contact#
            EmailUtil.sendEmail(emailTitle, emailContent, email, "");
            emailHistoryService.saveEmailHistory(emailTitle,emailContent,userId,email);

            result = successResult();
        }
        catch (Exception e){
            result=failResult();
            logger.error("支付失败！");
        }
        return result;
    }
}
