/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 * @author: zhangyun
 * date: 2016-01-21
 */
package com.beautifulchina.controller.rating;

import com.beautifulchina.base.BaseController;
import com.beautifulchina.rating.vo.RatingVO;
import com.beautifulchina.service.rating.RatingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;

/**
 * Created by Administrator on 2016/1/21.
 * 用户评价控制器
 */
@Controller
@RequestMapping(value = "rating")
public class RatingController extends BaseController {
    @Autowired
    private RatingService ratingService;

    /**
     * 评价页面
     * @return
     */
    @RequestMapping(method= RequestMethod.GET)
    public String index(HttpServletRequest request,Model model){
        String orderNo=request.getParameter("orderNo");
        String userId=request.getParameter("userId");
        String tourId=request.getParameter("tourId");
        model.addAttribute("userId",userId);
        model.addAttribute("orderNo",orderNo);
        model.addAttribute("tourId",tourId);
        return "/rating/rating";
    }

    /**
     * 添加评价信息
     * @param ratingVO
     * @return
     */
    @RequestMapping(value = "save")
    @ResponseBody
    public Map<String,Object> save(@RequestBody RatingVO ratingVO){
        Map<String,Object> result=null;
        try {
            ratingService.saveRating(ratingVO);
            result=successResult();
        }catch(Exception e){
        }
        return result;
    }

    /**
     * 验证用户是否登录
     * @param request
     * @return
     */
    @RequestMapping(value = "uniqueId")
    public void uniqueId(HttpServletRequest request,HttpServletResponse response) throws IOException {
        long userId=Long.parseLong(request.getParameter("userId"));
        String nickname=ratingService.uniqueId(userId);
        if(nickname!=""&&nickname!=null){
            response.getWriter().write("ok");//nickname有值，说明已经登录
        }else{
            response.getWriter().write("fail");
        }
    }
}
