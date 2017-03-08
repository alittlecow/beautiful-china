/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 * @author: zhangyun
 * date: 2016-01-16
 */
package com.beautifulchina.controller.user;

import com.beautifulchina.base.BaseController;
import com.beautifulchina.email.bo.EmailTemplateBO;
import com.beautifulchina.handle.PropertyHandler;
import com.beautifulchina.service.common.EmailHistoryService;
import com.beautifulchina.service.common.EmailTemplateService;
import com.beautifulchina.service.user.ForgotPasswordService;
import com.beautifulchina.service.util.EmailUtil;
import com.beautifulchina.user.bo.OrdinaryUserBO;
import com.beautifulchina.user.vo.OrdinaryUserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.*;

/**
 * Created by Administrator on 2016/1/16.
 * 忘记密码控制器
 */
@Controller
@RequestMapping(value = "forget")
public class ForgotPasswordController extends BaseController {
    @Autowired
    private ForgotPasswordService forgotPasswordService;
    @Autowired
    private EmailTemplateService emailTemplateService;
    @Autowired
    private EmailHistoryService emailHistoryService;
    /**
     * 忘记密码页面
     */
    @RequestMapping(method= RequestMethod.GET)
    public String index(){

        return "/user/forgotPassword";
    }

    /**
     * 发送重置密码链接
     * @param ordinaryUserVO
     * @return
     */
    @RequestMapping(value="sendEmail")
    @ResponseBody
    public Map<String, Object> sendEmail(@RequestBody OrdinaryUserVO ordinaryUserVO,HttpServletRequest request){
        Map<String, Object> result=null;
        String email=ordinaryUserVO.getEmail();//邮箱地址
        //根据邮箱获得用户信息
        OrdinaryUserBO ordinaryUserBO=forgotPasswordService.getUserByEmail(email);
        //生成20位的随机码
        List<String> list=new ArrayList<String>();
        for(int i=0;i<=9;i++){
            list.add(String.valueOf(i));
        }
        for(char i='a';i<='z';i++){
            list.add(String.valueOf(i));
        }
        for(char i='A';i<='Z';i++){
            list.add(String.valueOf(i));
        }
        String authcode="";
        Random rd=new Random();
        for(int i=0;i<20;i++){
            int t=rd.nextInt(61);
            String s=list.get(t);
            authcode=authcode+s;
        }
        //选取邮件模板
        String language=this.getLocal(request);
        EmailTemplateBO emailTemplateBO=emailTemplateService.selectById(2,language);//重置密码模板id为2
        //提取主题，内容模板
        String title=emailTemplateBO.getTitle();
        String content=emailTemplateBO.getContent();
        String domain= PropertyHandler.getProperty("beautifulChina.localhost.domain");//域名
        content=content.replaceAll("#domain#",domain);//替换域名
        content=content.replaceAll("#id#",String.valueOf(ordinaryUserBO.getId()));//替换用户ID
        content=content.replaceAll("#authcode#",authcode);//替换随机码
        //发送邮件，并保存邮件历史记录
        EmailUtil.sendEmail(title, content, email, "");
        long userId=ordinaryUserBO.getId();
        emailHistoryService.saveEmailHistory(title,content,userId,email);
        //用户表更新随机码和操作时间
        forgotPasswordService.saveAuthcode(userId,authcode);
        result=successResult();
        return result;
    }
}
