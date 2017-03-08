/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 * @author: zhangyun
 * date: 2016-01-21
 */
package com.beautifulchina.dao.rating;

import com.beautifulchina.base.SqlMapper;
import com.beautifulchina.rating.vo.RatingVO;
import org.springframework.stereotype.Repository;

import java.util.Map;

/**
 * Created by Administrator on 2016/1/21.
 * 用户评价Mapper
 */
@Repository
public interface RatingMapper extends SqlMapper {
    /**
     * 保存用户评价
     * @param ratingVO
     */
    void saveRating(RatingVO ratingVO);

    /**
     * 改变用户订单的评价状态
     * @param orderNo
     */
    void ratingState(String orderNo);

    /**
     * 验证用户是否登录
     * @param map
     * @return
     */
    String uniqueId(Map<String, Object> map);
}
