/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 * @author: zhangyun
 * date: 2016-01-13
 */
package com.beautifulchina.service.product;

import com.beautifulchina.dao.product.ToursListMapper;
import com.beautifulchina.product.bo.ToursListBO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2016/1/13.
 * 线路列表服务
 */
@Service
public class ToursListService {
    @Autowired
    private ToursListMapper toursListMapper;

    /**
     * 查询旅游线路列表
     * @param search
     * @param language
     * @param priceMin
     * @param priceMax
     * @param dayMin
     * @param dayMax
     * @return
     */
    public List<ToursListBO> getToursByCondition(String search,String language,double priceMin,double priceMax,int dayMin,int dayMax,int number){
        Map<String,Object> map=new HashMap<String, Object>();
        //模糊查询
        map.put("search","%"+search+"%");
        map.put("language",language);
        //按价格查询
        map.put("priceMin",priceMin);
        map.put("priceMax",priceMax);
        //按天数查询
        map.put("dayMin",dayMin);
        map.put("dayMax",dayMax);
        //修改图片路径
        map.put("number",number);
        List<ToursListBO> ListBO=toursListMapper.getToursByCondition(map);
        try{
            for(ToursListBO toursListBO:ListBO){
                String Url=toursListBO.getImageUrl();
                String[] str = Url.split("\\/");
                //图片名之前的路径
                String prefix = "";
                //图片的格式
                String suffix = str[str.length - 1];
                for (int i = 0; i < str.length - 1; i++) {
                    prefix += str[i] + "/";
                }
                //中等图片路径
                toursListBO.setImageUrl(prefix + "medium_" + suffix);
            }
        }catch (Exception e){
        }
        return ListBO;
    }
    public int getCount(String search,String language,double priceMin,double priceMax,int dayMin,int dayMax){
        Map<String,Object> map=new HashMap<String, Object>();
        //模糊查询
        map.put("search","%"+search+"%");
        map.put("language",language);
        //按价格查询
        map.put("priceMin",priceMin);
        map.put("priceMax",priceMax);
        //按天数查询
        map.put("dayMin",dayMin);
        map.put("dayMax",dayMax);
        int count=toursListMapper.getCount(map);
        return count;
    }
}
