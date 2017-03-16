/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 *
 * @author: pengxiao
 * date: 2016/1/18.
 */
package com.beautifulchina.service.toursdetail;

import com.beautifulchina.dao.toursdetail.ToursImageMapper;
import com.beautifulchina.product.bo.ToursImageBO;
import com.beautifulchina.product.pojo.ToursImage;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

/**
 * 线路图片服务
 */
@Service
public class ToursImageService {
    private static Logger logger = LoggerFactory.getLogger(ToursImageService.class);

    @Autowired
    private ToursImageMapper toursImageMapper;

    /**
     * 根据线路id查询图片
     *
     * @param tourId
     * @return
     */
    public List<ToursImageBO> selectTourImageById(int tourId) {
        List<ToursImage> ToursImageList = toursImageMapper.selectTourImageById(tourId);
        //用于存储业务对象的BO列表
        List<ToursImageBO> toursImageBOList = new ArrayList<ToursImageBO>();
        for (ToursImage toursImage : ToursImageList) {
            ToursImageBO toursImageBO = new ToursImageBO();
            //图片路径
            toursImageBO.setImageUrl(toursImage.getImageUrl());
            String Url = toursImage.getImageUrl();
//            String[] str = Url.split("\\/");
//            //图片 "."之前的路径
//            String prefix = "";
//            //图片的格式
//            String suffix = str[str.length - 1];
//            for (int i = 0; i < str.length - 1; i++) {
//                prefix += str[i] + "/";
//            }
            //大图片路径
            toursImageBO.setImageLarge(Url);
            //中等图片路径
            toursImageBO.setImageMedium(Url);
            //小图片路径
            toursImageBO.setImageSmall(Url);
            toursImageBO.setOrders(toursImage.getOrders());
            toursImageBOList.add(toursImageBO);
        }
        return toursImageBOList;
    }
}
