/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 *
 * @author: fengbaitong
 * date: 2016-01-06
 */
package com.beautifulchina.controller.common;

import com.beautifulchina.base.BaseController;
import com.beautifulchina.city.CityVO;
import com.beautifulchina.destination.bo.DestinationBO;
import com.beautifulchina.service.destination.DestinationService;
import com.beautifulchina.tour.bo.TourBO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 目的地控制器
 */
@Controller
@RequestMapping(value = "destination")
public class DestinationController extends BaseController {

    @Autowired
    private DestinationService destinationService;

    /**
     * 目的地页面
     * @return
     */
    @RequestMapping(method= RequestMethod.GET)
    public String index(){

        return "/destination/destination";
    }

    /**
     * 获取目的地城市列表
     * @param request
     * @return
     */
    @RequestMapping(value = "list")
    @ResponseBody
    public List<CityVO> listDestination(HttpServletRequest request){
        String language = getLocal(request);
        List<CityVO> list = destinationService.getCitys(language);
        return list;
    }

    /**
     * 展示目的地城市的详细内容
     * @param request
     * @return
     */
    @RequestMapping(value = "detail")
    public String detail(HttpServletRequest request){
        String cityId = request.getParameter("id");
        String language = getLocal(request);
        DestinationBO destinationBO = destinationService.getDestination(cityId, language);

        //本主题包含线路的总条数,用于分页
        Integer total=destinationService.getAllToursNo(cityId);
        request.setAttribute("total",total);

        request.setAttribute("destination",destinationBO);
        return "forward:/destination";
    }

    /**
     * 根据城市id获取所属线路
     * @param request
     * @return
     */
    @RequestMapping(value = "getToursByCityId")
    @ResponseBody
    public List<TourBO> getToursByCityId(HttpServletRequest request){
        String cityId = request.getParameter("id");
        String page =request.getParameter("page");
        if(page==null&&page==""){
            page="1";
        }
        //mod by fengchangtong begin 页数开始数不正确
        //Integer itemBegin=1+9*(Integer.parseInt(page)-1);
        Integer itemBegin=9*(Integer.parseInt(page)-1);
        //mod by fengchangtong end 页数开始数不正确
        String language = getLocal(request);
        List<TourBO> list = destinationService.getAllToursByCityId(cityId, language, itemBegin);
        return list;
    }



}
