/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 * @author: zhangyun
 * date: 2016-01-16
 */
package com.beautifulchina.controller.user;

import com.beautifulchina.base.BaseController;
import com.beautifulchina.service.user.ResetPasswordService;
import com.beautifulchina.user.bo.OrdinaryUserBO;
import com.beautifulchina.user.vo.OrdinaryUserVO;
import com.beautifulchina.util.MD5Util;
import com.beautifulchina.util.ParameterUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

/**
 * Created by Administrator on 2016/1/16.
 * 重置密码控制器
 */
@Controller
@RequestMapping(value = "resetPassword")
public class ResetPasswordController extends BaseController{
    @Autowired
    private ResetPasswordService resetPasswordService;

    /**
     * 重置密码页面
     * @param request
     * @param model
     * @return
     * @throws ParseException
     */
    @RequestMapping(method= RequestMethod.GET)
    public String resetPassword(HttpServletRequest request,Model model) throws ParseException {
        long id=Long.parseLong(request.getParameter("id"));
        String authcode=request.getParameter("authcode");
        OrdinaryUserBO ordinaryUserBO=resetPasswordService.selectByAuthcode(id,authcode);
        //链接错误
        if(ordinaryUserBO==null){
            model.addAttribute("error",getMessage("error_100000"));
            return "error";
        }
        //计算时间差，超过24小时链接失效
        String operateTime=ordinaryUserBO.getOperatetime();
        SimpleDateFormat sdf= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date operateDate=sdf.parse(operateTime);//异常
        Date now=new Date();
        //申请链接的时间与当前申请时间转换成long型进行对比
        long operateLong=operateDate.getTime();
        long nowLong=now.getTime();
        long diff = nowLong - operateLong;
        long diffSeconds = diff/1000;
        if(diffSeconds>86400){
            model.addAttribute("error",getMessage("error_100001"));//超时
            return "error";
        }else{
            model.addAttribute("email",ordinaryUserBO.getEmail());
            return "/user/resetPassword";
        }
    }

    /**
     * 重置密码
     * @param ordinaryUserVO
     * @return
     */
    @RequestMapping(value="reset")
    @ResponseBody
    public Map<String, Object> reset(@RequestBody OrdinaryUserVO ordinaryUserVO){
        Map<String, Object> result = null;
        try{
            String password=ordinaryUserVO.getPassword();
            String pwd= MD5Util.getDecryptLoginPassword(password);//解密，判断长度
            //password不为空
            //密码长度不少于6
            if(!ParameterUtil.isBlankParams(password)&&
                    pwd.length()>=6){
                resetPasswordService.resetPasswordByEmail(ordinaryUserVO);
                result = successResult();
            }
        }catch (Exception e){
            result=failResult();
        }
        return result;
    }
}
