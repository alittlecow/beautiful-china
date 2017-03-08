/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 *
 * @author: buhengzhang
 * date: 2016-01-10
 */
package com.beautifulchina.controller.user;

import com.beautifulchina.base.BaseController;
import com.beautifulchina.constants.LoginErrorCode;
import com.beautifulchina.service.login.LoginUserService;
import com.beautifulchina.user.bo.OrdinaryUserBO;
import com.beautifulchina.user.vo.OrdinaryUserVO;
import com.beautifulchina.util.ParameterUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.Map;

/**
 * 登陆控制器
 */
@Controller
@RequestMapping(value = "login")
public class LoginController extends BaseController {

    private static Logger logger = LoggerFactory.getLogger(BaseController.class);

    /**
     * 登陆界面
     *
     * @return
     */
    @RequestMapping(method = RequestMethod.GET)
    public String index() {
        return "/user/login";
    }

    @Autowired
    private LoginUserService loginUserService;

//    /**
//     * nickname登陆判断
//     *
//     * @return
//     */
//    @RequestMapping(value = "loginuser", method = RequestMethod.POST)
//    @ResponseBody
//    public Map<String, Object> login(@RequestBody LoginUserVO loginUserVO, HttpSession session) {
//        Map<String, Object> result = null;
//        try {
//            //验证用户名是否存在
//            LoginUserBO loginUserBO = loginUserService.getUserByNickName(loginUserVO.getNickName());
//            if (loginUserBO != null) {
//                //验证状态是否允许登陆
//                if(loginUserBO.getStatus().equals("S")){
//                    result = failResult(LoginErrorCode.FAILURE);
//                    return result;
//                }
//                //验证昵称和密码是否符合
//                boolean istrue = loginUserService.login(loginUserVO, loginUserBO);
//                if (istrue) {
//                    loginUserBO.setPassword(null);
//                    session.setAttribute("user", loginUserBO);
//                    result = successResult();
//                } else {
//                    result = failResult(LoginErrorCode.FAILURE);
//                }
//            } else {
//                result = failResult(LoginErrorCode.FAILURE);
//            }
//        } catch (Exception e) {
//            logger.error("昵称登陆错误", e);
//            result = failResult();
//        }
//        return result;
//    }

    /**
     * email登陆判断
     *
     * @return
     */
    @RequestMapping(value = "loginByEmail", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> loginByEmail(@RequestBody OrdinaryUserVO ordinaryUserVO, HttpSession session) {
        Map<String, Object> result = null;
        String email = ordinaryUserVO.getEmail();
        boolean flag = checkEmail(email);
        if (!flag) {
            result = failResult(LoginErrorCode.FORMATFAILURE);
            return result;
        }
        try {
            //验证邮箱是否存在,状态是否允许登陆
            OrdinaryUserBO ordinaryUserBO = loginUserService.getUserByEmail(ordinaryUserVO.getEmail());
            if (ordinaryUserBO != null && ordinaryUserBO.getStatus().equals("N")) {
                //验证邮箱和密码是否符合
                boolean istrue = loginUserService.login(ordinaryUserVO, ordinaryUserBO);
                if (istrue){
                    ordinaryUserBO.setPassword(null);
                    session.setAttribute("user", ordinaryUserBO);
                    result = successDataResult(ordinaryUserBO);
                } else {
                    result = failResult(LoginErrorCode.EMAILFAILURE);
                }
            } else {
                result = failResult(LoginErrorCode.EMAILFAILURE);
            }
        } catch (Exception e) {
            logger.error("邮箱登陆错误", e);
            result = failResult();

        }

        return result;
    }


    @RequestMapping(value = "quitLogin", method = RequestMethod.GET)
    public String quitLogin(HttpSession session){
        session.removeAttribute("user");
        return "redirect:/login";
    }
    /**
     * 验证邮箱格式是否正确
     *
     * @param email
     * @return
     */
    public boolean checkEmail(String email) {
        try {
            boolean flag = ParameterUtil.isEmail(email);
        } catch (Exception e) {
            logger.error("邮箱登陆错误", e);
            return false;
        }
        return true;
    }
}
