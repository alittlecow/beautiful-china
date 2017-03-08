/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 *
 * @author: buhengzhang
 * date: 2016-01-16
 */

package com.beautifulchina.dao.question;

import com.beautifulchina.answer.bo.AnswerBO;
import com.beautifulchina.page.Page;
import com.beautifulchina.questions.bo.QuestionBO;
import com.beautifulchina.base.SqlMapper;
import com.beautifulchina.questions.vo.QuestionVO;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * toursdetail界面问题表单
 */
@Repository
public interface QuestionMapper extends SqlMapper {

    /**
     * 插入问题
     *
     * @return
     */
    int insertQuestion(QuestionVO questionVO);

    /**
     * 全部问题
     *
     * @return
     */
    int getAllQuestions(String tourId);

    /**
     * 每页问题
     *
     * @return
     */
    List<QuestionBO> getQuestionsByPage(Page page);

    /**
     * 根据问题id获取回答信息
     *
     * @param id
     * @return
     */
    List<AnswerBO> getAnswerById(@Param(value = "id") Integer id);
}
