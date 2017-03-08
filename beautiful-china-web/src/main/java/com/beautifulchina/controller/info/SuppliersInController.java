package com.beautifulchina.controller.info;

import com.beautifulchina.base.BaseController;
import com.beautifulchina.email.bo.EmailTemplateBO;
import com.beautifulchina.service.common.EmailHistoryService;
import com.beautifulchina.service.common.EmailTemplateService;
import com.beautifulchina.footer.bo.SystemConfigBO;
import com.beautifulchina.service.supplier.SupplierService;
import com.beautifulchina.service.util.EmailUtil;
import com.beautifulchina.supplier.Supplier;
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
import java.util.Date;
import java.util.Locale;
import java.util.Map;

/**
 * 商家入驻申请
 */
@Controller
@RequestMapping(value = "suppliersin")
public class SuppliersInController extends BaseController {
    private static Logger logger = LoggerFactory.getLogger(BaseController.class);
    @Autowired
    private SupplierService supplierService;
    @Autowired
    private EmailHistoryService emailHistoryService;
    @Autowired
    private EmailTemplateService emailTemplateService;

    @RequestMapping(method = RequestMethod.GET)
    public String index() {

        return "/info/suppliersin";
    }

    /**
     * 插入商家信息
     *
     * @param supplier
     * @return
     */
    @RequestMapping(value = "insertSupplier")
    @ResponseBody
    public Map<String, Object> insertSupplier(@RequestBody Supplier supplier, HttpServletRequest request) {
        String language = getLocal(request);
        supplier.setRegtime(new Date());
        supplier.setStatus("W");
        supplier.setLanguage(language);
        Map<String, Object> result = null;
        String supplierEmail = supplier.getSupplierEmail();
        String supplierName=supplier.getSupplierName();
        logger.info("======================================================"+supplierName);
        try {
            supplierService.insertSupplier(supplier);
            //申请成功，发送邮件
            //选取邮件模板
            EmailTemplateBO emailTemplateBO = emailTemplateService.selectById(4, language);//注册模板id为3
            //提取主题，内容模板
            String emailTitle = emailTemplateBO.getTitle();
            String emailContent = emailTemplateBO.getContent();
            //获取自增id
            long deptId = supplier.getId();
            //发送邮件，并保存邮件历史记录
            emailContent = emailContent.replaceAll("#supplierName#", supplierName);//替换#supplierName#
            EmailUtil.sendEmail(emailTitle, emailContent, supplierEmail, "");
            emailHistoryService.saveEmailHistory(emailTitle, emailContent, deptId, supplierEmail);
            result = successResult();

        } catch (Exception e) {
            logger.error("系统错误", e);
            result = failResult();
        }
        return result;
    }

    /**
     * 验证code是否重复
     *
     * @param supplier
     * @return
     */
    @RequestMapping(value = "uniqueCode")
    @ResponseBody
    public Map<String, Object> uniqueCode(@RequestBody Supplier supplier) {
        Map<String, Object> result = null;
        String deptCode = supplier.getDeptCode();
        int count = supplierService.uniqueCode(deptCode);
        if (count > 0) {
            result = successResult();//返回"ok",说明用户名已存在
        } else {
            result = failResult();
        }
        return result;
    }

    /**
     * 验证邮箱是否重复
     *
     * @param supplier
     * @return
     */
    @RequestMapping(value = "uniqueEmail")
    @ResponseBody
    public Map<String, Object> uniqueEmail(@RequestBody Supplier supplier) {
        Map<String, Object> result = null;
        String email = supplier.getSupplierEmail();
        int count = supplierService.uniqueEmail(email);
        if (count > 0) {
            result = successResult();//返回"ok",说明用户名已存在
        } else {
            result = failResult();
        }
        return result;
    }

    /**
     * 获取用户注册协议
     *
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
        String agreement = null;
        SystemConfigBO systemConfigBO = supplierService.getAgreement(groupCode, language);

        agreement = systemConfigBO.getValue();

        result = successDataResult(agreement);
        return result;
    }
}
