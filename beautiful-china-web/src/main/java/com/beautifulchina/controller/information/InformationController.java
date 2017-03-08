/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 * @author: zhangyun
 * date: 2016-01-11
 */
package com.beautifulchina.controller.information;

import com.beautifulchina.base.BaseController;
import com.beautifulchina.order.bo.OrdersBO;
import com.beautifulchina.order.pojo.OrdersConditions;
import com.beautifulchina.order.vo.OrdersConditionsVO;
import com.beautifulchina.service.information.InformationService;
import com.beautifulchina.user.vo.OrdinaryUserVO;
import com.beautifulchina.util.MD5Util;
import com.beautifulchina.util.ParameterUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2016/1/11.
 * 个人信息页面控制器
 */
@Controller
@RequestMapping(value = "information")
public class InformationController extends BaseController {
    @Autowired
    private InformationService informationService;

    private static Logger logger = LoggerFactory.getLogger(BaseController.class);
    /**
     * 个人信息页面
     * @return
     */
    @RequestMapping(method= RequestMethod.GET)
    public String index(HttpServletRequest request,Model model){
//        long userId=Long.parseLong(request.getParameter("userId"));
        model.addAttribute("page",1);
//        model.addAttribute("userId",userId);
        return "/user/information";
    }

    /**
     * 个人订单
     * @param ordersConditionsVO
     * @param request
     * @return
     */
    @RequestMapping(value="getOrders",method= RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> getOrders(@RequestBody OrdersConditionsVO ordersConditionsVO,HttpServletRequest request){
        Map<String,Object> result = null;

        int pageNumber=ordersConditionsVO.getPageNumber();//页数
        String language=this.getLocal(request);
        long userId=0;
        try {
            userId = ordersConditionsVO.getUserId();
        }catch (NullPointerException e){
            logger.info("用户未登陆 或者登陆过期");
            return result = failResult();
        }
        //结果传入OrdersConditions对象
        OrdersConditions ordersConditions=new OrdersConditions();
        //订单记录的总条数
        int size=informationService.getCount(userId);
        int pageInteger=size/6;
        double pageDouble=(size/6.0);
        int pageAll=0;//总页数
        if(pageInteger==pageDouble){
            pageAll=pageInteger;
        }else{
            pageAll=pageInteger+1;
        }
        //如果页数为0则返回
        if(pageAll==0){
            result=successDataResult(pageAll);
            return result;
        }
        //个人订单信息
        int number=(pageNumber-1)*6;//limit限制条件
        List<OrdersBO> list=informationService.getALLOrder(userId,number,language);
        ordersConditions.setListBO(list);//每页的订单列表
        ordersConditions.setPageNumber(pageNumber);
        ordersConditions.setPageAll(pageAll);
        ordersConditions.setUserId(userId);
        result=successDataResult(ordersConditions);
        return result;
    }

    /**
     * 修改密码
     * @param ordinaryUserVO
     * @return
     */
    @RequestMapping(value="passwordChang")
    @ResponseBody
    public Map<String, Object> passwordChang(@RequestBody OrdinaryUserVO ordinaryUserVO, HttpSession session){
        Map<String, Object> result = null;
        try{
            String password=ordinaryUserVO.getPassword();
            String pwd= MD5Util.getDecryptLoginPassword(password);//解密，判断长度
            //password不为空
            //密码长度不少于6
            if(!ParameterUtil.isBlankParams(password)&&
                    pwd.length()>=6){
                informationService.passwordChang(ordinaryUserVO);
                //清空session
                session.removeAttribute("user");
                result = successResult();
            }
        }catch (Exception e){
            logger.error("Password change failed!",e);
            result=failResult();
        }
        return result;
    }

    /**
     * 验证原密码是否正确
     * @param ordinaryUserVO
     * @return
     */
    @RequestMapping(value="passwordVerify")
    @ResponseBody
    public Map<String, Object> passwordVerify(@RequestBody OrdinaryUserVO ordinaryUserVO){
        Map<String, Object> result=null;
        boolean flag=informationService.passwordVerify(ordinaryUserVO);
        if(flag){
            result=successResult();//原密码输入正确，返回"ok"
        }else{
            result=failResult();
        }
        return result;
    }

    /**
     * 验证是否已评价
     * @param request
     * @param response
     * @throws IOException
     */
    @RequestMapping(value="ratingVerify")
    public void ratingVerify(HttpServletRequest request,HttpServletResponse response) throws IOException {
        long userId=Long.parseLong(request.getParameter("userId"));
        long targetId=Long.parseLong(request.getParameter("tourId"));
        String target=informationService.ratingVerify(userId,targetId);
        if(target!=null||target!=""){
            response.getWriter().write("ok");//target有值，说明已评价
        }else{
            response.getWriter().write("fail");
        }
    }

    /**
     * 删除订单
     * @param request
     * @param response
     * @throws IOException
     */
    @RequestMapping(value="deleteOrder")
    public void deleteOrder(HttpServletRequest request,HttpServletResponse response) throws IOException {
        try{
            String orderNo=request.getParameter("orderNo");
            informationService.deleteOrder(orderNo);
            response.getWriter().write("ok");
        }catch (Exception e){
            response.getWriter().write("fail");
        }
    }

    /**
     * 取消订单
     * @param request
     * @param response
     * @throws IOException
     */
    @RequestMapping(value="cancelOrder")
    public void cancelOrder(HttpServletRequest request,HttpServletResponse response) throws IOException {
        try{
            String orderNo=request.getParameter("orderNo");
            informationService.cancelOrder(orderNo);
            response.getWriter().write("ok");
        }catch (Exception e){
            response.getWriter().write("fail");
        }
    }
}
