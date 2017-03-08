/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 *
 * @author: fengbaitong
 * date: 2016-01-06
 */
package com.beautifulchina.controller.common;

import com.beautifulchina.base.BaseController;
import com.beautifulchina.service.theme.ThemeService;
import com.beautifulchina.theme.bo.ThemeBO;
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
@RequestMapping(value = "theme")
public class ThemeController extends BaseController {

    @Autowired
    private ThemeService themeService;

    /**
     * 目的地页面
     * @return
     */
    @RequestMapping(method= RequestMethod.GET)
    public String index(){

        return "/theme/theme";
    }

    /**
     * 获取主题标题列表
     * @param request
     * @return
     */
    @RequestMapping(value = "list")
    @ResponseBody
    public List<ThemeBO> listTheme(HttpServletRequest request){
        String language = getLocal(request);
        List<ThemeBO> list = themeService.getThemes(language);
        return list;
    }

    /**
     * 展示主题的详细内容
     * @param request
     * @return
     */
    @RequestMapping(value = "detail")
    public String detail(HttpServletRequest request){
        String themeId = request.getParameter("id");
        String language = getLocal(request);
        ThemeBO theme = themeService.getTheme(themeId, language);
        //本主题包含线路的总条数,用于分页
        Integer total=themeService.getAllToursNo(themeId);

        request.setAttribute("theme",theme);
        request.setAttribute("total",total);
        return "forward:/theme";
    }

    /**
     * 根据主题id获取所属线路
     * @param request
     * @return
     */
    @RequestMapping(value = "getToursByThemeId")
    @ResponseBody
    public List<TourBO> getToursByThemeId(HttpServletRequest request){
        String themeId = request.getParameter("id");
        String page =request.getParameter("page");
        if(page==null&&page==""){
            page="1";
        }
        //mod by fengchangtong begin 页数开始数不正确
        //Integer itemBegin=1+9*(Integer.parseInt(page)-1);
        Integer itemBegin=9*(Integer.parseInt(page)-1);
        //mod by fengchangtong end 页数开始数不正确
        String language = getLocal(request);
        List<TourBO> list = themeService.getAllToursByThemeId(themeId, language,itemBegin);
        return list;
    }

}
