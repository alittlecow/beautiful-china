/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 * @author: zhangyun
 * date: 2016-01-28
 */
package com.beautifulchina.email.vo;

import com.beautifulchina.base.BaseBean;

/**
 * Created by Administrator on 2016/1/28.
 * 邮件模板VO
 */
public class EmailTemplateVO extends BaseBean{
    /**
     * 模板id
     */
    private Long id;
    /**
     * 模板名称
     */
    private String name;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
