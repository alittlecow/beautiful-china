package com.beautifulchina.controller.information;

import com.alibaba.fastjson.JSONObject;
import com.beautifulchina.base.BaseController;
import com.beautifulchina.constants.InfoErrorCode;
import com.beautifulchina.contact.vo.ContactVO;
import com.beautifulchina.service.information.InfoService;
import com.beautifulchina.user.vo.OrdinaryUserVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 *
 * @author: buhengzhang
 * date: 2016-01-16
 */
@Controller
@RequestMapping(value = "userInfo")
public class UserInfoController extends BaseController {
    private static Logger logger = LoggerFactory.getLogger(BaseController.class);
    @Autowired
    private InfoService informationService;

    /**
     * 更改个人信息
     * @param map
     * @return
     */
    @RequestMapping(value = "changeInfo", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> changeInfo(@RequestBody Map map){
        Map<String, Object> result = null;

        //将json串转换成json对象
        JSONObject jsonObject = new JSONObject(map);
        //获取订单联系人信息vo
        OrdinaryUserVO ordinaryUserVO = jsonObject.getObject("ordinaryUserVO", OrdinaryUserVO.class);

        try{
            informationService.changeInfo(ordinaryUserVO);
            result=successResult(InfoErrorCode.SUCCESS);
        }catch (Exception e){
            logger.error("系统出错",e);
            result=failResult(InfoErrorCode.FAILED);
        }
        return result;
    }

    /**
     * 更改联系人信息
     * @param contactVO
     * @return
     */
    @RequestMapping(value = "saveContact", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> saveContact(@RequestBody ContactVO contactVO){
        Map<String, Object> result = null;
        try{
            informationService.saveContact(contactVO);
            result = successResult();
        }catch (Exception e){
            logger.error("系统出错",e);
            result=failResult(InfoErrorCode.FAILED);
        }
        return result;
    }
    @RequestMapping(value = "getUserInfo", method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> getUserInfo(@RequestParam String id,HttpSession session){
        Map<String, Object> result = null;
        int userId=Integer.parseInt(id);
        try{
            OrdinaryUserVO ordinaryUserVO=informationService.getUserInfo(userId);
            List<ContactVO> contactList =informationService.getContactByUser(userId);
            session.removeAttribute("user");
            ordinaryUserVO.setContactList(contactList);
            session.setAttribute("user",ordinaryUserVO);
            result=successDataResult(ordinaryUserVO);
        }catch (Exception e){
            logger.error("系统出错",e);
            result=failResult(InfoErrorCode.FAILED);
        }
        return result;
    }

    @RequestMapping(value = "deleteContact", method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> deleteContact(@RequestParam Integer id,HttpSession session){
        Map<String, Object> result = null;
        try{
            informationService.deleteContact(id);
            result = successResult();
        }catch (Exception e){
            logger.error("删除联系人失败",e);
            result=failResult(InfoErrorCode.FAILED);
        }
        return result;
    }
}
