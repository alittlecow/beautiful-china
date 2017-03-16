/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 * @author: zhuhoufeng
 * date: 2016-04-14
 */
package com.beautifulchina.language;


import java.util.Date;

/**
 *
 * 多语言数据字典类
 */
public class Language {
    /**
     * 标识码
     */
    private String uuid;
    /**
     * 语言类型
     */
    private String type;
    /**
     * 内容
     */
    private String content;

    private Date operatorAt;

    private String  operateBy;

    public Date getOperatorAt() {
        return operatorAt;
    }

    public void setOperatorAt(Date operatorAt) {
        this.operatorAt = operatorAt;
    }

    public String getOperateBy() {
        return operateBy;
    }

    public void setOperateBy(String operateBy) {
        this.operateBy = operateBy;
    }

    public String getUuid() {
        return uuid;
    }

    public void setUuid(String uuid) {
        this.uuid = uuid;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    @Override
    public String toString() {
        return "Language{" +
                "uuid='" + uuid + '\'' +
                ", type='" + type + '\'' +
                ", content='" + content + '\'' +
                '}';
    }
}
