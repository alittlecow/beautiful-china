package com.beautifulchina.dao.review;

import com.beautifulchina.base.SqlMapper;
import com.beautifulchina.page.Page;
import com.beautifulchina.review.Review;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 *
 * @author: buhengzhang
 * date: 2016-01-16
 */
@Repository
public interface ReviewMapper extends SqlMapper {
    /**
     * 获取评论条数
     * @param tourId
     * @return
     */
    int getReview(String tourId);
    /**
     * 获取好、中、差评条数
     * @param tourId
     * @return
     */
    int getReviewCount(String tourId,int allLevel);
    /**
     * 获取总评
     * @param page
     * @return
     */
    List<Review> getReviewByPage(Page page);
    /**
     * 获取总评代理商
     * @param page
     * @return
     */
    List<Review> getReviewByPageA(Page page);
    /**
     * 获取好、中、差评论
     * @param page
     * @return
     */
    List<Review> getGoodReviewByPage(Page page);
    /**
     * 获取好、中、差评论 代理商
     * @param page
     * @return
     */
    List<Review> getGoodReviewByPageA(Page page);
}
