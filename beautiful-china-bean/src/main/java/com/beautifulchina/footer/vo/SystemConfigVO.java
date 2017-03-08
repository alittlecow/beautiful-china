/**
 * Copyright @ 2015 nanjing wanghua Information Technology Co.,Ltd.
 * All right reserved.
 *
 * @author: zhangyun
 * date: 2016-01-27
 */
package com.beautifulchina.footer.vo;

import com.beautifulchina.base.BaseBean;

/**
 * Created by Administrator on 2016/1/27.
 * 系统配置VO
 */
public class SystemConfigVO extends BaseBean {
    /**
     * 分组类型
     */
    private String groupCode;

    public String getGroupCode() {
        return groupCode;
    }

    public void setGroupCode(String groupCode) {
        this.groupCode = groupCode;
    }
}
