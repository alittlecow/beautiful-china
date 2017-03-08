/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 * @author: zhangyun
 * date: 2016-01-28
 */
package com.beautifulchina.email.bo;

import com.beautifulchina.email.vo.EmailTemplateVO;

/**
 * Created by Administrator on 2016/1/28.
 * 邮件模板BO
 */
public class EmailTemplateBO extends EmailTemplateVO {
    /**
     * 主题（英文）
     */
    private String title;
    /**
     * 内容（英文）
     */
    private String content;

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}
