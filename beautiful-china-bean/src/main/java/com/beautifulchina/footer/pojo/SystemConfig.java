/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 *
 * @author: zhangyun
 * date: 2016-01-27
 */
package com.beautifulchina.footer.pojo;

import com.beautifulchina.footer.bo.SystemConfigBO;

/**
 * Created by Administrator on 2016/1/27.
 * 系统配置
 */
public class SystemConfig extends SystemConfigBO{
    /**
     * 操作时间
     */
    private String operateTime;
    /**
     * 操作人
     */
    private String operator;

    public String getOperateTime() {
        return operateTime;
    }

    public void setOperateTime(String operateTime) {
        this.operateTime = operateTime;
    }

    public String getOperator() {
        return operator;
    }

    public void setOperator(String operator) {
        this.operator = operator;
    }
}
