/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 *
 * @author: pengxiao
 * date: 2016/1/18.
 */
package com.beautifulchina.product.pojo;
import com.beautifulchina.product.bo.ToursConfigBO;

/**
 * 线路配置pojo
 */
public class ToursConfig  extends ToursConfigBO{

    //配置内容英文
    private String contentEn;
    //配置内容法文
    private String contentFr;

    public String getContentEn() {
        return contentEn;
    }

    public void setContentEn(String contentEn) {
        this.contentEn = contentEn;
    }

    public String getContentFr() {
        return contentFr;
    }

    public void setContentFr(String contentFr) {
        this.contentFr = contentFr;
    }
}
