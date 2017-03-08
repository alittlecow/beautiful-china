/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 *
 * @author: buhengzhang
 * date: 2016-01-16
 */

package com.beautifulchina.service.question;

import com.beautifulchina.answer.bo.AnswerBO;
import com.beautifulchina.dao.question.QuestionMapper;
import com.beautifulchina.page.Page;
import com.beautifulchina.questions.bo.QuestionBO;
import com.beautifulchina.questions.vo.QuestionVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 问题表单service
 */
@Service
public class QuestionService {

    @Autowired
    private QuestionMapper questionMapper;

    public int getAllQuestions(String tourId){
        int count= questionMapper.getAllQuestions(tourId);
        return count;
    }

    public List<QuestionBO> getQuestionsByPage(Page page){
        List<QuestionBO> list = questionMapper.getQuestionsByPage(page);
        return list;
    }

    public void insertQuestion(QuestionVO questionVO){
        questionMapper.insertQuestion(questionVO);
    }

    /**
     * 根据问题id获取回答信息
     * @param id
     * @return
     */
    public List<AnswerBO> getAnswerById(Integer id){
        List<AnswerBO> list=questionMapper.getAnswerById(id);
        return list;
    }
}
