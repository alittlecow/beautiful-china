/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 *
 * @author: buhengzhang
 * date: 2016-01-17
 */

package com.beautifulchina.controller.question;

import com.beautifulchina.base.BaseController;
import com.beautifulchina.constants.ToursdetailErrorCode;
import com.beautifulchina.questions.vo.QuestionVO;
import com.beautifulchina.service.question.QuestionService;
import com.beautifulchina.util.DateUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

/**
 * 问题表单controller
 */
@Controller
@RequestMapping(value = "question")
public class QuestionController extends BaseController {

    private static Logger logger = LoggerFactory.getLogger(BaseController.class);
    @Autowired
    private QuestionService questionService;

    /**
     * 插入问题
     * @param questionVO
     * @return
     */
    @RequestMapping(value = "insert", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> insert(@RequestBody QuestionVO questionVO) {
        questionVO.setTime(new Date());
        Map<String, Object> result = null;
        try {
            questionService.insertQuestion(questionVO);
                result = successResult(ToursdetailErrorCode.SUCCESS);
        } catch (Exception e) {
            logger.error("系统错误", e);
            result = failResult(ToursdetailErrorCode.FAILURE);
        }
        return result;
    }
}
