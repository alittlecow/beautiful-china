/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 *
 * @author: buhengzhang
 * date: 2016-01-18
 */

package com.beautifulchina.dao.answer;

import com.beautifulchina.answer.vo.AnswerVO;
import com.beautifulchina.base.SqlMapper;
import org.springframework.stereotype.Repository;

/**
 * toursdetail回复内容
 */
@Repository
public interface AnswerMapper extends SqlMapper {
    /**
     * 插入回答
     * @return
     */
    int insertAnswer(AnswerVO answerVO);
}
