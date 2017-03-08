/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 *
 * @author: zhangyun
 * date: 2016-01-13
 */
package com.beautifulchina.controller.product;

import com.beautifulchina.base.BaseController;
import com.beautifulchina.product.bo.ToursListBO;
import com.beautifulchina.product.pojo.ToursConditions;
import com.beautifulchina.product.vo.ToursConditionsVO;
import com.beautifulchina.service.product.ToursListService;
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
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2016/1/13.
 * 线路列表控制器
 */
@Controller
@RequestMapping(value = "toursList",method = RequestMethod.POST)
public class ToursListController extends BaseController {
    @Autowired
    private ToursListService toursListService;

    /**
     * 线路列表页面
     * @return
     */
    @RequestMapping(method= RequestMethod.GET)
    public String index(HttpServletRequest request,Model model){
        String search=null;
        try{
            search=request.getParameter("search");
        }catch(Exception e){
        }
        if(!"".equals(search)){
            model.addAttribute("searchOne",search);
        }
        model.addAttribute("page",1);
        return "/product/tourslist";
    }

    /**
     * 按条件查询线路
     * @param toursConditionsVO
     * @param request
     * @return
     */
    @RequestMapping(value="getTours",method= RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> getTours(@RequestBody ToursConditionsVO toursConditionsVO,HttpServletRequest request){
        Map<String,Object> result = null;
        int pageNumber=toursConditionsVO.getPageNumber();//页数
        //按条件查询
        String search=null;
        double priceMin=0;
        double priceMax=0;
        int dayMin=0;
        int dayMax=0;
        try {
            search=toursConditionsVO.getSearch();
        }catch(Exception e){
        }
        try{
            priceMin=toursConditionsVO.getPriceMin();
            priceMax=toursConditionsVO.getPriceMax();
        }catch(Exception e){
        }
        try{
            dayMin=toursConditionsVO.getDayMin();
            dayMax=toursConditionsVO.getDayMax();
        }catch(Exception e){
        }
        //获取语言种类
        String language=this.getLocal(request);
        //结果传入ToursConditions对象
        ToursConditions toursConditions=new ToursConditions();
        //获取旅游线路的条数
        int size=toursListService.getCount(search,language,priceMin,priceMax,dayMin,dayMax);
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
        //按条件查询线路
        int number=(pageNumber-1)*6;//limit限制条件
        List<ToursListBO> list=toursListService.getToursByCondition(search,language,priceMin,priceMax,dayMin,dayMax,number);
        toursConditions.setListBO(list);//每页的线路列表
        //将查询条件传到前台
        toursConditions.setPageNumber(pageNumber);
        toursConditions.setPageAll(pageAll);
        toursConditions.setSearch(search);
        toursConditions.setPriceMin(priceMin);
        toursConditions.setPriceMax(priceMax);
        toursConditions.setDayMin(dayMin);
        toursConditions.setDayMax(dayMax);
        result=successDataResult(toursConditions);
        return result;
    }
}
