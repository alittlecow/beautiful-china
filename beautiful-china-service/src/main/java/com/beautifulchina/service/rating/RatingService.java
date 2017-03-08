/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 * @author: zhangyun
 * date: 2016-01-21
 */
package com.beautifulchina.service.rating;

import com.beautifulchina.dao.rating.RatingMapper;
import com.beautifulchina.rating.vo.RatingVO;
import com.beautifulchina.util.DateUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by Administrator on 2016/1/21.
 * 用户评价服务
 */
@Service
public class RatingService {
    @Autowired
    private RatingMapper ratingMapper;

    /**
     * 保存用户评价
     * 改变用户订单的评价状态
     * @param ratingVO
     */
    public void saveRating(RatingVO ratingVO){
        //获取当前时间
        String datetime= DateUtil.getCurrentDate();
        ratingVO.setRatingTime(datetime);
        ratingMapper.saveRating(ratingVO);
        String orderNo=ratingVO.getOrderNo();
        ratingMapper.ratingState(orderNo);
    }

    /**
     * 验证用户是否登录
     * @param userId
     * @return
     */
    public String uniqueId(long userId){
        Map<String,Object> map=new HashMap<String, Object>();
        map.put("userId",userId);
        return ratingMapper.uniqueId(map);
    }
}
