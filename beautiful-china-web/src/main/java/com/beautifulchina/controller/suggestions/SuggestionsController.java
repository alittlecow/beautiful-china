package com.beautifulchina.controller.suggestions;

import com.beautifulchina.base.BaseController;
import com.beautifulchina.email.bo.EmailTemplateBO;
import com.beautifulchina.service.common.EmailHistoryService;
import com.beautifulchina.service.common.EmailTemplateService;
import com.beautifulchina.service.suggestions.SuggestionsService;
import com.beautifulchina.service.util.EmailUtil;
import com.beautifulchina.suggestions.Suggestions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.Map;

/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 *
 * @author: buhengzhang
 * date: 2016-01-16
 */
@Controller
@RequestMapping(value = "suggestions")
public class SuggestionsController  extends BaseController {
    private static Logger logger = LoggerFactory.getLogger(BaseController.class);
    @Autowired
    private SuggestionsService suggestionsService;
    @Autowired
    private EmailHistoryService emailHistoryService;
    @Autowired
    private EmailTemplateService emailTemplateService;

    @RequestMapping(value = "insertSuggestions")
    @ResponseBody
    public Map<String, Object> insertSuggestions(@RequestBody Suggestions suggestions,HttpServletRequest request){
        suggestions.setRecordtime(new Date());
        String language = this.getLocal(request);
        suggestions.setStatus("YX");
        Map<String, Object> result = null;
        try {
            suggestionsService.insertSuggestions(suggestions);
            new MitiSay(suggestions,language).start();
            result=successResult();
            return result;
        }catch (Exception e){
            result=failResult();
            return result;
        }
    }

    /**
     * 创建线程发送邮件
     */
    class MitiSay extends Thread {
        private Suggestions suggestions;
        private String language;
        public MitiSay(Suggestions suggestions,String language) {
            this.language=language;
            this.suggestions=suggestions;
        }

        public void run() {
            String nickName = suggestions.getFirstname()+" "+suggestions.getLastname();
            String email = suggestions.getEmail();
            long userId = suggestions.getUserId();
            //申请成功，发送邮件
            //选取邮件模板
            EmailTemplateBO emailTemplateBO = emailTemplateService.selectById(1, language);//注册模板id为1
            //提取主题，内容模板
            String emailTitle = emailTemplateBO.getTitle();
            String emailContent = emailTemplateBO.getContent();
            //发送邮件，并保存邮件历史记录
            emailContent = emailContent.replaceAll("#supplierName#", nickName);//替换#supplierName#
            EmailUtil.sendEmail(emailTitle, emailContent, email, "");
            emailHistoryService.saveEmailHistory(emailTitle, emailContent, userId, email);
        }
    }
}
