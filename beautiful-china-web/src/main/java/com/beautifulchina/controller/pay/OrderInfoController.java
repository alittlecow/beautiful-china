/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 *
 * @author: chenghuanhuan
 * date: 2016-01-06
 */
package com.beautifulchina.controller.pay;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.beautifulchina.base.BaseController;
import com.beautifulchina.contact.vo.ContactVO;
import com.beautifulchina.email.bo.EmailTemplateBO;
import com.beautifulchina.pay.bo.OrderDetailBO;
import com.beautifulchina.pay.vo.OrderDetailVO;
import com.beautifulchina.pay.vo.OrderVO;
import com.beautifulchina.pay.vo.PassengerVO;
import com.beautifulchina.service.common.EmailHistoryService;
import com.beautifulchina.service.common.EmailTemplateService;
import com.beautifulchina.service.pay.ContactService;
import com.beautifulchina.service.pay.OrderService;
import com.beautifulchina.service.toursdetail.ToursBookingService;
import com.beautifulchina.service.util.EmailUtil;
import com.beautifulchina.user.bo.OrdinaryUserBO;
import com.beautifulchina.util.ParameterUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.*;

/**
 * 订单信息页面控制器
 */
@Controller
@RequestMapping(value = "orderInfo")
public class OrderInfoController extends BaseController {

    private static Logger logger = LoggerFactory.getLogger(OrderInfoController.class);

    @Autowired
    private OrderService orderService;

    @Autowired
    private ToursBookingService toursBookingService;

    @Autowired
    private EmailHistoryService emailHistoryService;
    @Autowired
    private EmailTemplateService emailTemplateService;

    @Autowired
    private ContactService contactService;//联系人服务

    /**
     * 订单页面
     *
     * @return
     */
    @RequestMapping(method = {RequestMethod.POST, RequestMethod.GET})
    public String index(HttpSession session,Model model,HttpServletRequest request) {
        try {
            OrdinaryUserBO user = (OrdinaryUserBO)session.getAttribute("user");
            List<ContactVO> contactVOList = contactService.getAllContact(user.getId());
            //用户存在常用联系人
            if(contactVOList.size() != 0){
                model.addAttribute("contactVOList",contactVOList);
            }

        }catch (Exception e){
            logger.info("用户未登陆，或者登陆过期");
        }


        return "/pay/orderInfo";
    }


    /**
     * 创建一个订单
     *
     * @param map
     * @param date
     */
    @RequestMapping(value = "create", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> createOrder(@RequestBody Map map, Date date, HttpServletRequest request) {
        //获取语言
        String language = this.getLocal(request);
        //将json串转换成json对象
        JSONObject jsonObject = new JSONObject(map);
        //获取订单联系人信息vo
        OrderVO orderVO = jsonObject.getObject("orderVO", OrderVO.class);
        List<PassengerVO> passengerVOList = new ArrayList<PassengerVO>();
        //获取全部旅客信息
        JSONArray passengersJSON = jsonObject.getJSONArray("passengerVOList");
        for (int i = 0; i < passengersJSON.size(); i++) {
            PassengerVO p = passengersJSON.getObject(i, PassengerVO.class);
            passengerVOList.add(p);
        }
        //获取全部订单付款明细
        List<OrderDetailVO> orderDetailVOList = new ArrayList<OrderDetailVO>();
        JSONArray orderDetailsJSON = jsonObject.getJSONArray("orderDetailVOList");
        for(int i=0; i< orderDetailsJSON.size();i++){
            OrderDetailVO Od=orderDetailsJSON.getObject(i,OrderDetailVO.class);
            orderDetailVOList.add(Od);
        }
        orderVO.setState("N");
        //返回结果信息
        Map<String, Object> result;
        /*参数校验
        *电话格式正确
        *邮箱格式正确
        *联系人不为空
        */
        if (ParameterUtil.isEmpty(orderVO.getContact()) && ParameterUtil.isEmail(orderVO.getEmail())) {
            result = failResult();
        } else {
            try {
                String orderNo = orderService.createOrder(orderVO, passengerVOList,orderDetailVOList);
                //库存减一
                //下单总人数
                int num = orderVO.getAdults() + orderVO.getChildren();
                toursBookingService.BuyOne(orderVO.getTourId(), date, num);
                //下单成功后发送邮件
                //选取邮件模板
                EmailTemplateBO emailTemplateBO = emailTemplateService.selectById(6, language);//注册模板id为5
                //提取主题，内容模板
                String emailTitle = emailTemplateBO.getTitle();
                String emailContent = emailTemplateBO.getContent();
                //用户id、
                Long userId = orderVO.getUserId();
                //联系人
                String contact = orderVO.getContact();
                //用户联系邮箱
                String email = orderVO.getEmail();
                //发送邮件，并保存邮件历史记录
                emailContent = emailContent.replaceAll("#contact#", contact);//替换#contact#
                EmailUtil.sendEmail(emailTitle, emailContent, email, "");
                emailHistoryService.saveEmailHistory(emailTitle, emailContent, userId, email);
                result = successDataResult(orderNo);
            } catch (Exception e) {
                logger.error("创建订单失败！", e);
                result = failResult();
            }
        }
        return result;
    }


}
