/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 *
 * @author: buhengzhang
 * date: 2016-01-18
 */

package com.beautifulchina.controller.answer;

import com.beautifulchina.answer.vo.AnswerVO;
import com.beautifulchina.base.BaseController;
import com.beautifulchina.constants.ToursdetailErrorCode;
import com.beautifulchina.service.answer.AnswerService;
import com.beautifulchina.util.DateUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Map;

/**
 * 回复内容controller
 */
@Controller
@RequestMapping(value = "answer")
public class AnswerController extends BaseController {

    private static Logger logger = LoggerFactory.getLogger(BaseController.class);
    @Autowired
    private AnswerService answerService;

    @RequestMapping(value = "insert", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> insert(@RequestBody AnswerVO answerVO) {
        Map<String, Object> result = null;
        String time = DateUtil.getCurrentDate();
        answerVO.setTime(time);
//        String type = answerVO.getType();
//        if (("N").equals(type)) {
//            type = "P";
//        } else {
//            type = "S";
//        }
        answerVO.setType("P");
        try {
            answerService.insertAnswer(answerVO);
                result = successResult(ToursdetailErrorCode.SUCCESS);
        } catch (Exception e) {
            logger.error("系统错误", e);
            result = failResult(ToursdetailErrorCode.FAILURE);
        }
        return result;
    }
}
