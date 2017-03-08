/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 * @author: zhangyun
 * date: 2016-01-13
 */
package com.beautifulchina.product.bo;


import com.beautifulchina.product.vo.ToursListVO;

/**
 * Created by Administrator on 2016/1/13.
 * 旅游线路列表BO
 */
public class ToursListBO extends ToursListVO {
    /**
     * 线路代码
     */
    private String code;
    /**
     * 线路所属供应商代码
     */
    private String deptCode;
    /**
     * 所属分类id
     */
    private Integer categoryId;
    /**
     * 出发城市
     */
    private Integer startcity;
    /**
     * 结束城市
     */
    private Integer endcity;
    /**
     * 线路描述英文
     */
    private String descEn;
    /**
     * 线路描述法语
     */
    private String descFr;
    /**
     * 重要提示英文
     */
    private String importantEn;
    /**
     * 重要提示法语
     */
    private String importantFr;
    /**
     * 旅途提示英文
     */
    private String triphintEn;
    /**
     * 旅途提示法语
     */
    private String triphintFr;
    /**
     * 条款英文
     */
    private String termEn;
    /**
     * 条款法语
     */
    private String termFr;
    /**
     * 客户推荐度
     */
    private Integer rating;
    /**
     * 状态(N:正常,S:停用)
     */
    private String status;
    /**
     * 线路图片地址
     */
    private String imageUrl;
    /**
     * 当日价格
     */
    private Double trdPrice;


    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getDeptCode() {
        return deptCode;
    }

    public void setDeptCode(String deptCode) {
        this.deptCode = deptCode;
    }

    public Integer getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Integer categoryId) {
        this.categoryId = categoryId;
    }

    public Integer getStartcity() {
        return startcity;
    }

    public void setStartcity(Integer startcity) {
        this.startcity = startcity;
    }

    public Integer getEndcity() {
        return endcity;
    }

    public void setEndcity(Integer endcity) {
        this.endcity = endcity;
    }

    public String getDescEn() {
        return descEn;
    }

    public void setDescEn(String descEn) {
        this.descEn = descEn;
    }

    public String getDescFr() {
        return descFr;
    }

    public void setDescFr(String descFr) {
        this.descFr = descFr;
    }

    public String getImportantEn() {
        return importantEn;
    }

    public void setImportantEn(String importantEn) {
        this.importantEn = importantEn;
    }

    public String getImportantFr() {
        return importantFr;
    }

    public void setImportantFr(String importantFr) {
        this.importantFr = importantFr;
    }

    public String getTriphintEn() {
        return triphintEn;
    }

    public void setTriphintEn(String triphintEn) {
        this.triphintEn = triphintEn;
    }

    public String getTriphintFr() {
        return triphintFr;
    }

    public void setTriphintFr(String triphintFr) {
        this.triphintFr = triphintFr;
    }

    public String getTermEn() {
        return termEn;
    }

    public void setTermEn(String termEn) {
        this.termEn = termEn;
    }

    public String getTermFr() {
        return termFr;
    }

    public void setTermFr(String termFr) {
        this.termFr = termFr;
    }

    public Integer getRating() {
        return rating;
    }

    public void setRating(Integer rating) {
        this.rating = rating;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public Double getTrdPrice() {
        return trdPrice;
    }

    public void setTrdPrice(Double trdPrice) {
        this.trdPrice = trdPrice;
    }
}
