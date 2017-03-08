/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 * @author: zhangyun
 * date: 2016-01-08
 */
package com.beautifulchina.user.bo;

import com.beautifulchina.user.vo.OrdinaryUserVO;
import java.util.Date;

/**
 * Created by Administrator on 2016/1/08.
 * 普通用户BO
 */
public class OrdinaryUserBO extends OrdinaryUserVO {
    /**
     * 状态(N:正常,S:停用)
     */
    private String status;
    /**
     * 冻结时间
     */
    private Date locktime;
    /**
     * 冻结原因
     */
    private String lockreson;
    /**
     * 最后登录ip
     */
    private String ip;

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Date getLocktime() {
        return locktime;
    }

    public void setLocktime(Date locktime) {
        this.locktime = locktime;
    }

    public String getLockreson() {
        return lockreson;
    }

    public void setLockreson(String lockreson) {
        this.lockreson = lockreson;
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }
}