/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 * @author: zhuhoufeng
 * date: 2016-04-14
 */
package com.beautifulchina.language;


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
