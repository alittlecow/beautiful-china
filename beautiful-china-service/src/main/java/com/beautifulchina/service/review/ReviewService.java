package com.beautifulchina.service.review;

import com.beautifulchina.dao.review.ReviewMapper;
import com.beautifulchina.page.Page;
import com.beautifulchina.review.Review;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 *
 * @author: buhengzhang
 * date: 2016-01-16
 */
@Service
public class ReviewService {
    @Autowired
    private ReviewMapper reviewMapper;

    //获取评论条数
    public int getReview(String tourId) {
        int count = reviewMapper.getReview(tourId);
        return count;
    }
    //获取好、中、差评条数
    public int getReviewCount(String tourId,int allLevel) {
        int count = reviewMapper.getReviewCount(tourId, allLevel);
        return count;
    }
    //获取总评
    public List<Review> getReviewByPage(Page page) {
        List<Review> list=new ArrayList<Review>();
        List<Review> list1 = reviewMapper.getReviewByPage(page);
        List<Review> list2 = reviewMapper.getReviewByPageA(page);
        list1.addAll(list2);
        list=list1;
        return list;
    }
    //获取好、中、差评论
    public List<Review> getGoodReviewByPage(Page page) {
        List<Review> list=new ArrayList<Review>();
        List<Review> list1 = reviewMapper.getGoodReviewByPage(page);
        List<Review> list2 = reviewMapper.getGoodReviewByPageA(page);
        list1.addAll(list2);
        list=list1;
        return list;
    }
}
