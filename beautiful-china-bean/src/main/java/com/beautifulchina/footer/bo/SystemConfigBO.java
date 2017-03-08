/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 *
 * @author: zhangyun
 * date: 2016-01-27
 */
package com.beautifulchina.footer.bo;

import com.beautifulchina.footer.vo.SystemConfigVO;

/**
 * Created by Administrator on 2016/1/27.
 * 系统配置BO
 */
public class SystemConfigBO extends SystemConfigVO{
    /**
     * id
     */
    private Long id;
    /**
     * 名
     */
    private String name;
    /**
     * 值
     */
    private String value;

    /**
     * 英文名
     */
    private String nameEn;
    /**
     * 法语名
     */
    private String nameFr;
    /**
     * 英文值
     */
    private String valueEn;
    /**
     * 法语值
     */
    private String valueFr;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getNameEn() {
        return nameEn;
    }

    public void setNameEn(String nameEn) {
        this.nameEn = nameEn;
    }

    public String getNameFr() {
        return nameFr;
    }

    public void setNameFr(String nameFr) {
        this.nameFr = nameFr;
    }

    public String getValueEn() {
        return valueEn;
    }

    public void setValueEn(String valueEn) {
        this.valueEn = valueEn;
    }

    public String getValueFr() {
        return valueFr;
    }

    public void setValueFr(String valueFr) {
        this.valueFr = valueFr;
    }
}
