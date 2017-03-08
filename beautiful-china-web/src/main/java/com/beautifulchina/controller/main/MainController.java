/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 *
 * @author: chenghuanhuan
 * date: 2016-01-12
 */
package com.beautifulchina.controller.main;

import com.beautifulchina.base.BaseController;
import com.beautifulchina.city.CityVO;
import com.beautifulchina.index.bo.IndexBO;
import com.beautifulchina.service.main.MainService;
import com.beautifulchina.theme.vo.ThemeVO;
import com.beautifulchina.tour.bo.TourBO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.i18n.CookieLocaleResolver;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Locale;

/**
 * 主页面控制器
 */
@Controller
@RequestMapping(value = "/")
public class MainController extends BaseController {

    @Autowired
    private MainService mainService;

    /**
     * 返回主页面,初始化数据
     * @param request
     * @return
     */
    @RequestMapping
    public String index(HttpServletRequest request){
        String language = getLocal(request);
        List<IndexBO> bannerList = mainService.getBanner();//首页四张图片的查询
        List<TourBO> tourList = mainService.getTour(language);//获取6条旅游线路图片,价格,标题等信息
        List<ThemeVO> themeList =  mainService.getTheme(language);
        List<TourBO> tourListFirst = mainService.getTourFirst(language);//获取3条旅游线路图片,价格,标题等信息
        List<CityVO> indexCityVOList = mainService.getIndexCity(language);//获取6个城市展示，图片，名称
        request.setAttribute("bannerList",bannerList);
        request.setAttribute("tourList", tourList);
        request.setAttribute("themeList", themeList);
        request.setAttribute("tourListFirst", tourListFirst);
        request.setAttribute("indexCityVOList", indexCityVOList);
        return "index";
    }

    /**
     * 设置语言的类型
     * @param request
     * @param response
     * @return
     */
    @RequestMapping("setLanguage")
    public String setLanguage(HttpServletRequest request,HttpServletResponse response){
        Object objectType = request.getParameter("langType");
        String langType = null;
        if (objectType != null) {
            langType = (String)objectType;
        }
        if ("zh".equals(langType)) {
            Locale locale = new Locale("zh", "CN");
            new CookieLocaleResolver().setLocale(request, response, locale);
        } else if ("fr".equals(langType)) {
            Locale locale = new Locale("fr", "FR");
            new CookieLocaleResolver().setLocale(request, response, locale);
        } else {
            new CookieLocaleResolver().setLocale(request, response, new Locale("en", "US"));
        }
        return "index";
    }

}
