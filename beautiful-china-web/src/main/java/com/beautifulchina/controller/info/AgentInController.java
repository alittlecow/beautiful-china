package com.beautifulchina.controller.info;

import com.beautifulchina.base.BaseController;
import com.beautifulchina.email.bo.EmailTemplateBO;
import com.beautifulchina.footer.bo.SystemConfigBO;
import com.beautifulchina.service.Agent.AgentService;
import com.beautifulchina.service.common.EmailHistoryService;
import com.beautifulchina.service.common.EmailTemplateService;
import com.beautifulchina.service.supplier.SupplierService;
import com.beautifulchina.service.util.EmailUtil;
import com.beautifulchina.supplier.Supplier;
import com.beautifulchina.user.vo.OrdinaryUserVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.support.RequestContext;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.Map;

/**
 * 代理商加盟申请
 */
@Controller
@RequestMapping(value = "agentin")
public class AgentInController extends BaseController{
    private static Logger logger = LoggerFactory.getLogger(BaseController.class);
    @Autowired
    private AgentService agentService;
    @Autowired
    private SupplierService supplierService;
    @Autowired
    private EmailHistoryService emailHistoryService;
    @Autowired
    private EmailTemplateService emailTemplateService;

    @RequestMapping(method= RequestMethod.GET)
    public String index(){

        return "/info/agentin";
    }

    /**
     * 插入代理商信息
     * @param ordinaryUserVO
     * @return
     */
    @RequestMapping(value = "insertAgent")
    @ResponseBody
    public Map<String, Object> insertSupplier(@RequestBody OrdinaryUserVO ordinaryUserVO,HttpServletRequest request) {
        String language =  getLocal(request);
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
        java.util.Date date=new java.util.Date();
        String str=sdf.format(date);
        ordinaryUserVO.setRegtime(str);
        ordinaryUserVO.setType("Y");
        Map<String, Object> result = null;
        try {
            agentService.insertAgentLogin(ordinaryUserVO);
            long deptId=agentService.getAgentUserId(ordinaryUserVO.getEmail());
            ordinaryUserVO.setUserId(deptId);
            ordinaryUserVO.setLanguage(language);
            agentService.insertAgent(ordinaryUserVO);
            new MitiSay(ordinaryUserVO).start();
            result = successResult();

        } catch (Exception e) {
            logger.error("系统错误", e);
            result = failResult();
        }
        return result;
    }

    /**
     * 验证邮箱是否重复
     * @param ordinaryUserVO
     * @return
     */
    @RequestMapping(value = "uniqueEmail")
    @ResponseBody
    public Map<String, Object> uniqueEmail(@RequestBody OrdinaryUserVO ordinaryUserVO){
        Map<String, Object> result=null;
        String email=ordinaryUserVO.getEmail();
        int count=agentService.uniqueEmail(email);
        if(count>0){
            result = successResult();//返回"ok",说明用户名已存在
        }else{
            result = failResult();
        }
        return result;
    }

    /**
     * 获取用户注册协议
     * @return
     */
    @RequestMapping(value = "getAgreement")
    @ResponseBody
    public Map<String, Object> getAgreement(String groupCode, HttpServletRequest request) {
        Map<String, Object> result = null;
        //获取当地请求语言类型
        RequestContext requestContext = new RequestContext(request);
        Locale locale = requestContext.getLocale();
        String language = locale.getLanguage();
        String agreement=null;
        SystemConfigBO systemConfigBO=supplierService.getAgreement(groupCode, language);
        agreement = systemConfigBO.getValue();
        result = successDataResult(agreement);
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
            String agentName = ordinaryUserVO.getAgentName();
            String agentEmail=ordinaryUserVO.getEmail();
            long deptId=ordinaryUserVO.getUserId();
            EmailTemplateBO emailTemplateBO=emailTemplateService.selectById(4,language);//注册模板id为3
            //提取主题，内容模板
            String emailTitle=emailTemplateBO.getTitle();
            String emailContent=emailTemplateBO.getContent();
            //发送邮件，并保存邮件历史记录
            emailContent=emailContent.replaceAll("#supplierName#",agentName);//替换#supplierName#
            EmailUtil.sendEmail(emailTitle, emailContent, agentEmail, "");
            emailHistoryService.saveEmailHistory(emailTitle,emailContent,deptId,agentEmail);
        }
    }
}
