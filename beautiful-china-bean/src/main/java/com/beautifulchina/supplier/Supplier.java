package com.beautifulchina.supplier;

import com.beautifulchina.base.BaseBean;

import java.util.Date;

/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 *
 * @author: buhengzhang
 * date: 2016-01-16
 */
public class Supplier extends BaseBean {
    /**
     * ID
     */
    private int id;
    /**
     * 供应商代码
     */
    private String deptCode;

    /**
     * 供应商名称
     */
    private String supplierName;
    /**
     * 供应商英文
     */
    private String supplierNameEn;
    /**
     * 供应商法文
     */
    private String supplierNameFr;
    /**
     * 供应商地址
     */
    private String supplierAddress;
    /**
     * 供应商电话
     */
    private String telephone;
    /**
     * 电话2
     */
    private String telephone2;
    /**
     * 法人
     */
    private String legalPeople;
    /**
     * 许可证
     */
    private String license;
    /**
     * 联系人
     */
    private String contact;
    /**
     * 邮箱
     */
    private String supplierEmail;
    /**
     * 网址
     */
    private String website;
    /**
     * 描述
     */
    private String description;
    /**
     * 注册时间
     */
    private Date regtime;

    /**
     * 状态
     */
    private String status;

    /**
     *申请密码
     */
    private String password;

    /**
     * 申请语言
     */
    private String language;
    /**
     * 盐值
     */
    private String psw;

    public String getDeptCode() {
        return deptCode;
    }

    public void setDeptCode(String deptCode) {
        this.deptCode = deptCode;
    }

    public String getSupplierName() {
        return supplierName;
    }

    public void setSupplierName(String supplierName) {
        this.supplierName = supplierName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getLanguage() {
        return language;
    }

    public void setLanguage(String language) {
        this.language = language;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getSupplierNameEn() {
        return supplierNameEn;
    }

    public void setSupplierNameEn(String supplierNameEn) {
        this.supplierNameEn = supplierNameEn;
    }

    public String getSupplierNameFr() {
        return supplierNameFr;
    }

    public void setSupplierNameFr(String supplierNameFr) {
        this.supplierNameFr = supplierNameFr;
    }

    public String getSupplierAddress() {
        return supplierAddress;
    }

    public void setSupplierAddress(String supplierAddress) {
        this.supplierAddress = supplierAddress;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public String getTelephone2() {
        return telephone2;
    }

    public void setTelephone2(String telephone2) {
        this.telephone2 = telephone2;
    }

    public String getLegalPeople() {
        return legalPeople;
    }

    public void setLegalPeople(String legalPeople) {
        this.legalPeople = legalPeople;
    }

    public String getLicense() {
        return license;
    }

    public void setLicense(String license) {
        this.license = license;
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public String getSupplierEmail() {
        return supplierEmail;
    }

    public void setSupplierEmail(String supplierEmail) {
        this.supplierEmail = supplierEmail;
    }

    public String getWebsite() {
        return website;
    }

    public void setWebsite(String website) {
        this.website = website;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getRegtime() {
        return regtime;
    }

    public void setRegtime(Date regtime) {
        this.regtime = regtime;
    }

    public String getPsw() {
        return psw;
    }

    public void setPsw(String psw) {
        this.psw = psw;
    }
}
