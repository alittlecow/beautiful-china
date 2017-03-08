package com.beautifulchina.option.vo;

import com.beautifulchina.base.BaseBean;


/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 *
 * @author: pengxiao
 * date: 2016/3/15.
 */
public class OptionVO extends BaseBean {
    /**
     * 线路代码
     */
    private int tourId;
    /**
     * 选项值id
     */
    private Integer valueId;
    /**
     * 选项值
     */
    private String optionValue;
    /**
     * 备注
     */
    private String optionNotes;
    /**
     * 选项差价
     */
    private double optionPrice;
    /**
     * 选项id
     */
    private  Integer optionId;
    /**
     * 选项名
     */
    private String optionName;
    /**
     * 语言
     */
    private String language;

    /**
     * 供应商代码
     */
    private String deptCode;

    public int getTourId() {
        return tourId;
    }

    public void setTourId(int tourId) {
        this.tourId = tourId;
    }

    public Integer getValueId() {
        return valueId;
    }

    public void setValueId(Integer valueId) {
        this.valueId = valueId;
    }

    public String getOptionValue() {
        return optionValue;
    }

    public void setOptionValue(String optionValue) {
        this.optionValue = optionValue;
    }

    public String getOptionNotes() {
        return optionNotes;
    }

    public void setOptionNotes(String optionNotes) {
        this.optionNotes = optionNotes;
    }

    public double getOptionPrice() {
        return optionPrice;
    }

    public void setOptionPrice(double optionPrice) {
        this.optionPrice = optionPrice;
    }

    public Integer getOptionId() {
        return optionId;
    }

    public void setOptionId(Integer optionId) {
        this.optionId = optionId;
    }

    public String getOptionName() {
        return optionName;
    }

    public void setOptionName(String optionName) {
        this.optionName = optionName;
    }

    public String getLanguage() {
        return language;
    }

    public void setLanguage(String language) {
        this.language = language;
    }

    public String getDeptCode() {
        return deptCode;
    }

    public void setDeptCode(String deptCode) {
        this.deptCode = deptCode;
    }
}
