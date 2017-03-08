/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 *
 * @author: buhengzhang
 * date: 2016-01-16
 */

package com.beautifulchina.questions.vo;

import com.beautifulchina.answer.bo.AnswerBO;
import com.beautifulchina.base.BaseBean;

import java.util.Date;
import java.util.List;

/**
 * 问题实体类
 */
public class QuestionVO extends BaseBean {
    /**
     * 问题ID
     */
    private int id;
    /**
     * 线路ID
     */
    private int tourId;
    /**
     * 问题内容
     */
    private String content;
    /**
     * 问题状态
     */
    private String status;
    /**
     * 用户ID
     */
    private int userId;
    /**
     * 创建时间
     */
    private Date time;
    /**
     * 回复人类型
     */
    private String type;
    /**
     * 回答内容
     */
    private String answer;
    /**
     * 回答内容列
     */
    private List<AnswerBO> answerList;

    public List<AnswerBO> getAnswerList() {
        return answerList;
    }

    public void setAnswerList(List<AnswerBO> answerList) {
        this.answerList = answerList;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }

    public int getTourId() {
        return tourId;
    }

    public void setTourId(int tourId) {
        this.tourId = tourId;
    }
}
