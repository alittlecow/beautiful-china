/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 *
 * @author: zhangyun
 * date: 2016-01-08
 */
package com.beautifulchina.controller.user;

import com.beautifulchina.base.BaseController;
import com.beautifulchina.dao.login.LoginUserMapper;
import com.beautifulchina.email.bo.EmailTemplateBO;
import com.beautifulchina.service.common.EmailHistoryService;
import com.beautifulchina.service.common.EmailTemplateService;
import com.beautifulchina.service.user.RegisterService;
import com.beautifulchina.service.util.EmailUtil;
import com.beautifulchina.user.bo.OrdinaryUserBO;
import com.beautifulchina.user.vo.OrdinaryUserVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

/**
 * Created by Administrator on 2016/1/08.
 * 注册控制器
 */
@Controller
@RequestMapping(value = "register")
public class RegisterController extends BaseController {
    @Autowired
    private RegisterService registerService;
    @Autowired
    private EmailHistoryService emailHistoryService;
    @Autowired
    private EmailTemplateService emailTemplateService;

    @Autowired
    private LoginUserMapper loginUserMapper;

    private static Logger logger = LoggerFactory.getLogger(BaseController.class);

    /**
     * 注册页面
     * @return
     */
    @RequestMapping(method = RequestMethod.GET)
    public String index(String type, HttpServletRequest request) {
        request.setAttribute("type", type);
        return "/user/register";
    }

    /**
     * 普通用户注册
     * @param ordinaryUserVO
     * @return
     */
    @RequestMapping(value = "save")
    @ResponseBody
    public Map<String, Object> save(@RequestBody OrdinaryUserVO ordinaryUserVO, HttpServletRequest request) {
        Map<String, Object> result = null;
        String language = this.getLocal(request);
        ordinaryUserVO.setLanguage(language);
        OrdinaryUserBO ordinaryUserBO = loginUserMapper.getUserByEmail(ordinaryUserVO);

        try {
            registerService.register(ordinaryUserVO);
            new MitiSay(ordinaryUserVO).start();
            result = successResult();
        } catch (Exception e) {
            logger.error("注册用户失败!", e);
            result = failResult();
        }
        return result;
    }

    /**
     * 验证用户名是否已存在
     * @param ordinaryUserVO
     * @return
     */
    @RequestMapping(value = "uniqueUsername")
    @ResponseBody
    public Map<String, Object> uniqueUsername(@RequestBody OrdinaryUserVO ordinaryUserVO) {
        Map<String, Object> result = null;
        String nickname = ordinaryUserVO.getNickname();
        OrdinaryUserBO ordinaryUserBO = registerService.uniqueUsername(nickname);
        if (ordinaryUserBO != null) {
            result = successResult();//返回"ok",说明用户名已存在
        } else {
            result = failResult();
        }
        return result;
    }

    /**
     * 验证邮箱是否已注册
     * @param ordinaryUserVO
     * @return
     */
    @RequestMapping(value = "uniqueEmail")
    @ResponseBody
    public Map<String, Object> uniqueEmail(@RequestBody OrdinaryUserVO ordinaryUserVO) {
        Map<String, Object> result = null;
        String email = ordinaryUserVO.getEmail();
        int ordinaryUserBO = registerService.uniqueEmail(email);
        if (ordinaryUserBO != 0) {
            result = successResult();//返回"ok",说明邮箱已注册
        } else {
            result = failResult();
        }
        return result;
    }
    /**
     * 创建线程发送邮件
     */
    class MitiSay extends Thread {
        private OrdinaryUserVO ordinaryUserVO;
        public MitiSay(OrdinaryUserVO ordinaryUserVO) {
            this.ordinaryUserVO=ordinaryUserVO;
        }

        public void run() {
            String language=ordinaryUserVO.getLanguage();
            String nickName = ordinaryUserVO.getNickname();
            String email = ordinaryUserVO.getEmail();
            long userId = registerService.getUserId(ordinaryUserVO);
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
