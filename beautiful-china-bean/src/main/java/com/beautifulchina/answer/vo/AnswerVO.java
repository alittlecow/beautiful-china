/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 *
 * @author: buhengzhang
 * date: 2016-01-16
 */

package com.beautifulchina.answer.vo;

import com.beautifulchina.base.BaseBean;

/**
 * 回复实体类
 */
public class AnswerVO extends BaseBean {
    /**
     * 问题ID
     */
    private int questionId;
    /**
     *用户ID
     */
    private int userId;
    /**
     *回复人类型
     */
    private String type;
    /**
     *创建时间
     */
    private String time;
    /**
     *回复内容
     */
    private String content;

    public int getQuestionId() {
        return questionId;
    }

    public void setQuestionId(int questionId) {
        this.questionId = questionId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }
}
