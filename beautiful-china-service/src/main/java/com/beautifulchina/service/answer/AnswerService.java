/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 *
 * @author: buhengzhang
 * date: 2016-01-18
 */

package com.beautifulchina.service.answer;

import com.beautifulchina.answer.vo.AnswerVO;
import com.beautifulchina.dao.answer.AnswerMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 回复内容service
 */
@Service
public class AnswerService {
    @Autowired
    private AnswerMapper answerMapper;
    public void insertAnswer(AnswerVO answerVO){
        answerMapper.insertAnswer(answerVO);

    }
}
